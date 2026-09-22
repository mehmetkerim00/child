import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

/// Файл очереди на устройстве водителя.
QueryExecutor openQueueConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    return NativeDatabase.createInBackground(
      File('${dir.path}/ride_events_queue.sqlite'),
    );
  });
}
