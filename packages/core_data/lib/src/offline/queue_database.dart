import 'package:drift/drift.dart';

import 'queue_connection_native.dart'
    if (dart.library.js_interop) 'queue_connection_web.dart';

part 'queue_database.g.dart';

/// События поездки, которые ещё не приняты сервером.
///
/// Водитель работает на улице, где связь пропадает: каждое нажатие
/// сначала ложится сюда, и только потом уходит на сервер.
class PendingEvents extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Идентификатор события: с ним сервер не запишет одно и то же дважды.
  TextColumn get clientEventId => text().unique()();

  IntColumn get rideId => integer()();

  /// В пуле этап относится к конкретному ребёнку.
  IntColumn get childId => integer().nullable()();

  /// Имя значения RideEventType.
  TextColumn get type => text()();

  /// Когда водитель нажал кнопку (UTC).
  DateTimeColumn get at => dateTime()();

  RealColumn get lat => real().nullable()();
  RealColumn get lng => real().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get codeWord => text().nullable()();
  TextColumn get institutionCode => text().nullable()();
  BoolColumn get hasSignature => boolean().withDefault(const Constant(false))();

  /// Сколько раз пытались отправить и чем закончилась последняя попытка.
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
}

/// Локальная база очереди событий.
@DriftDatabase(tables: [PendingEvents])
class QueueDatabase extends _$QueueDatabase {
  QueueDatabase() : super(openQueueConnection());

  /// Для тестов: очередь в памяти.
  QueueDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      // v2: в очередь добавился ребёнок (пулинг).
      if (from < 2) await m.addColumn(pendingEvents, pendingEvents.childId);
    },
  );

  /// События в порядке появления — отправляем строго по очереди,
  /// иначе сервер отклонит этап, пришедший раньше предыдущего.
  Future<List<PendingEvent>> pending() => (select(
    pendingEvents,
  )..orderBy([(e) => OrderingTerm(expression: e.id)])).get();

  /// Сколько событий ждёт отправки — показываем водителю.
  Stream<int> watchPendingCount() => pendingEvents.count().watchSingle();

  Future<void> enqueue(PendingEventsCompanion event) =>
      into(pendingEvents).insert(event);

  Future<void> remove(int id) =>
      (delete(pendingEvents)..where((e) => e.id.equals(id))).go();

  /// Отметить неудачную попытку: счётчик и текст ошибки показываем
  /// водителю, если очередь не уходит.
  Future<void> markFailed(int id, int attempts, String error) =>
      (update(pendingEvents)..where((e) => e.id.equals(id))).write(
        PendingEventsCompanion(
          attempts: Value(attempts),
          lastError: Value(error),
        ),
      );
}
