import 'package:drift/drift.dart';

/// Офлайн-очередь нужна только водительскому приложению (Android).
/// В вебе панель диспетчера работает онлайн, поэтому очередь не открываем.
QueryExecutor openQueueConnection() {
  throw UnsupportedError('Офлайн-очередь доступна только на устройстве');
}
