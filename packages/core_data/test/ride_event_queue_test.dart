import 'package:core_data/core_data.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// Отправка, которая умеет «терять связь» — так проверяется офлайн-очередь.
class _FakeSender implements RideEventSender {
  bool online = true;
  final accepted = <RideEventSubmission>[];
  RideFlowError? rejectWith;

  @override
  Future<void> send(int rideId, RideEventSubmission submission) async {
    if (!online) throw Exception('нет связи');
    final reject = rejectWith;
    if (reject != null) {
      throw RideFlowException(
        reason: reject,
        currentStatus: RideStatus.scheduled,
      );
    }
    accepted.add(submission);
  }
}

void main() {
  late QueueDatabase db;
  late _FakeSender sender;
  late RideEventQueue queue;

  setUp(() {
    db = QueueDatabase.forTesting(NativeDatabase.memory());
    sender = _FakeSender();
    queue = RideEventQueue(database: db, sender: sender);
  });

  tearDown(() => db.close());

  test('онлайн событие уходит сразу и очередь пуста', () async {
    final delivered = await queue.submit(
      rideId: 7,
      type: RideEventType.enRoute,
    );

    expect(delivered, isTrue);
    expect(sender.accepted, hasLength(1));
    expect(await db.pending(), isEmpty);
  });

  test('без связи события копятся и уходят потом по порядку', () async {
    sender.online = false;

    await queue.submit(rideId: 7, type: RideEventType.enRoute);
    await queue.submit(
      rideId: 7,
      type: RideEventType.pickedUp,
      codeWord: 'ýyldyz',
    );

    expect(sender.accepted, isEmpty);
    expect(await db.pending(), hasLength(2));

    // Связь вернулась.
    sender.online = true;
    final synced = await queue.sync();

    expect(synced, isTrue);
    expect(await db.pending(), isEmpty);
    expect(
      sender.accepted.map((e) => e.type).toList(),
      [RideEventType.enRoute, RideEventType.pickedUp],
      reason: 'порядок этапов сохраняется',
    );
  });

  test('время события — момент нажатия, а не отправки', () async {
    sender.online = false;
    final before = DateTime.now().toUtc();
    await queue.submit(rideId: 7, type: RideEventType.enRoute);
    final after = DateTime.now().toUtc();

    sender.online = true;
    await queue.sync();

    final sentAt = sender.accepted.single.at;
    expect(
      sentAt.isBefore(before.subtract(const Duration(seconds: 1))),
      isFalse,
    );
    expect(sentAt.isAfter(after.add(const Duration(seconds: 1))), isFalse);
  });

  test('отказ сервера по существу убирает событие из очереди', () async {
    sender.rejectWith = RideFlowError.wrongCodeWord;

    await expectLater(
      queue.submit(rideId: 7, type: RideEventType.pickedUp, codeWord: 'не то'),
      throwsA(isA<RideFlowException>()),
    );

    // Повторять такое событие бессмысленно — очередь не должна зависнуть.
    expect(await db.pending(), isEmpty);
  });

  test('счётчик ожидающих событий виден приложению', () async {
    sender.online = false;
    expect(await queue.watchPendingCount().first, 0);

    await queue.submit(rideId: 7, type: RideEventType.enRoute);
    expect(await queue.watchPendingCount().first, 1);
  });
}
