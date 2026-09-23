import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Ссылки доступа учреждений (панель диспетчера).
final institutionAccessesProvider = FutureProvider.autoDispose
    .family<List<InstitutionAccess>, int>((ref, institutionId) {
      return ref
          .watch(apiClientProvider)
          .institutionAdmin
          .accesses(institutionId);
    });
