import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Справочники диспетчера. Каждый список перечитывается после правок
/// через `ref.invalidate(...)`.
final familiesProvider = FutureProvider.autoDispose<List<Family>>(
  (ref) => ref.watch(apiClientProvider).directory.families(),
);

final driversProvider = FutureProvider.autoDispose<List<Driver>>(
  (ref) => ref.watch(apiClientProvider).directory.drivers(),
);

final institutionsProvider = FutureProvider.autoDispose<List<Institution>>(
  (ref) => ref.watch(apiClientProvider).directory.institutions(),
);

/// Дети: все или только одной семьи.
final childrenProvider = FutureProvider.autoDispose.family<List<Child>, int?>((
  ref,
  familyId,
) {
  return ref.watch(apiClientProvider).directory.children(familyId: familyId);
});

/// Данные вошедшего родителя.
final myChildrenProvider = FutureProvider.autoDispose<List<Child>>(
  (ref) => ref.watch(apiClientProvider).profile.myChildren(),
);

final myDriversProvider = FutureProvider.autoDispose<List<Driver>>(
  (ref) => ref.watch(apiClientProvider).profile.myDrivers(),
);

/// Профиль вошедшего водителя.
final myDriverProfileProvider = FutureProvider.autoDispose<Driver?>(
  (ref) => ref.watch(apiClientProvider).profile.myDriverProfile(),
);
