import 'package:child_client/child_client.dart';
import 'package:drift/drift.dart';

import 'queue_database.dart';

/// Куда очередь отправляет события. За интерфейсом — обычный вызов
/// сервера; в тестах он подменяется, чтобы проверить работу без связи.
abstract interface class RideEventSender {
  Future<void> send(int rideId, RideEventSubmission submission);
}

/// Отправка через клиент Serverpod.
class ServerRideEventSender implements RideEventSender {
  const ServerRideEventSender(this._client);

  final Client _client;

  @override
  Future<void> send(int rideId, RideEventSubmission submission) =>
      _client.rides.submitEvent(rideId, submission);
}

/// Очередь событий поездки: сначала на устройство, потом на сервер.
///
/// Водитель работает на улице, где связь пропадает. Нажатие кнопки не
/// должно зависеть от сети: событие ложится в локальную базу и уходит
/// на сервер, когда связь появится (MVP_PLAN §6).
class RideEventQueue {
  RideEventQueue({
    required QueueDatabase database,
    required RideEventSender sender,
  }) : _db = database,
       _sender = sender;

  final QueueDatabase _db;
  final RideEventSender _sender;
  static const _uuid = Uuid();

  bool _syncing = false;

  /// Сколько событий ждёт отправки — для индикатора «N событий ждут».
  Stream<int> watchPendingCount() => _db.watchPendingCount();

  /// Записывает событие в очередь и сразу пробует отправить.
  ///
  /// Возвращает true, если сервер принял событие прямо сейчас.
  Future<bool> submit({
    required int rideId,
    required RideEventType type,
    String? note,
    String? codeWord,
    String? institutionCode,
    bool hasSignature = false,
    double? lat,
    double? lng,
  }) async {
    await _db.enqueue(
      PendingEventsCompanion.insert(
        clientEventId: _uuid.v4(),
        rideId: rideId,
        type: type.name,
        // Время нажатия кнопки, а не время доставки на сервер.
        at: DateTime.now().toUtc(),
        note: Value(note),
        codeWord: Value(codeWord),
        institutionCode: Value(institutionCode),
        hasSignature: Value(hasSignature),
        lat: Value(lat),
        lng: Value(lng),
      ),
    );
    return sync();
  }

  /// Отправляет накопленные события по порядку.
  ///
  /// Порядок важен: сервер проверяет последовательность этапов и отклонит
  /// «Передал», пришедшее раньше «Забрал».
  Future<bool> sync() async {
    if (_syncing) return false;
    _syncing = true;
    try {
      for (final event in await _db.pending()) {
        try {
          await _sender.send(
            event.rideId,
            RideEventSubmission(
              clientEventId: event.clientEventId,
              type: RideEventType.values.byName(event.type),
              at: event.at,
              lat: event.lat,
              lng: event.lng,
              note: event.note,
              codeWord: event.codeWord,
              institutionCode: event.institutionCode,
              hasSignature: event.hasSignature,
            ),
          );
          await _db.remove(event.id);
        } on RideFlowException {
          // Сервер отказал по существу (не тот этап, неверный код) —
          // повторять бессмысленно, событие убираем из очереди.
          await _db.remove(event.id);
          rethrow;
        } catch (error) {
          // Нет связи: оставляем событие в очереди и пробуем позже.
          await _db.markFailed(event.id, event.attempts + 1, error.toString());
          return false;
        }
      }
      return true;
    } finally {
      _syncing = false;
    }
  }

  /// Очистить очередь — используется при выходе из аккаунта.
  Future<void> clear() async {
    for (final event in await _db.pending()) {
      await _db.remove(event.id);
    }
  }
}
