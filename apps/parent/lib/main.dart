import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Параметры сборки: --dart-define=FLAVOR=dev|prod, --dart-define=SERVER_URL=...
void main() {
  runApp(const ProviderScope(child: App()));
}
