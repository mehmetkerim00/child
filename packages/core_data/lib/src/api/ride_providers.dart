import 'package:child_client/child_client.dart';
import 'package:core_domain/core_domain.dart' as domain;
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Маршруты и поездки: у каждой роли свой набор данных.

// --- Родитель ---------------------------------------------------------------

/// Маршруты детей семьи, включая заявки на активации.
final myRoutesProvider = FutureProvider.autoDispose<List<RouteTemplate>>(
  (ref) => ref.watch(apiClientProvider).routes.myRoutes(),
);

/// Поездки детей на сегодня и завтра.
final myUpcomingRidesProvider = FutureProvider.autoDispose<List<RideView>>(
  (ref) => ref.watch(apiClientProvider).routes.myUpcomingRides(),
);

/// События поездки ребёнка — лента для родителя.
final rideEventsProvider = FutureProvider.autoDispose
    .family<List<RideEvent>, int>((ref, rideId) {
      return ref.watch(apiClientProvider).routes.rideEvents(rideId);
    });

/// Пройденный путь поездки — линия на карте у родителя.
final rideTrackProvider = FutureProvider.autoDispose
    .family<List<RideLocation>, int>((ref, rideId) {
      return ref.watch(apiClientProvider).routes.rideTrack(rideId);
    });

/// Положение машины в реальном времени (WebSocket).
final rideLocationStreamProvider = StreamProvider.autoDispose
    .family<RideLocation, int>((ref, rideId) {
      return ref.watch(apiClientProvider).routes.watchRideLocation(rideId);
    });

/// Учреждения для выбора в заявке на маршрут.
final parentInstitutionsProvider =
    FutureProvider.autoDispose<List<Institution>>(
      (ref) => ref.watch(apiClientProvider).routes.institutions(),
    );

// --- Водитель ---------------------------------------------------------------

/// Поездки водителя на сегодня.
final driverTodayRidesProvider = FutureProvider.autoDispose<List<RideView>>(
  (ref) => ref.watch(apiClientProvider).rides.today(),
);

/// Поездки водителя на завтра — экран подтверждения.
final driverTomorrowRidesProvider = FutureProvider.autoDispose<List<RideView>>(
  (ref) => ref.watch(apiClientProvider).rides.tomorrow(),
);

/// Лента уведомлений семьи: что и когда отправляли.
final myNotificationsProvider =
    FutureProvider.autoDispose<List<NotificationOutbox>>(
      (ref) => ref.watch(apiClientProvider).routes.myNotifications(),
    );

// --- Диспетчер --------------------------------------------------------------

/// Открытые задачи диспетчера: то, что требует звонка.
final openTasksProvider = FutureProvider.autoDispose<List<DispatcherTask>>(
  (ref) => ref.watch(apiClientProvider).directory.openTasks(),
);

/// Очередь уведомлений: что ушло, что ждёт, что не доставлено.
final outboxProvider = FutureProvider.autoDispose<List<NotificationOutbox>>(
  (ref) => ref.watch(apiClientProvider).directory.notifications(),
);

/// Все шаблоны маршрутов.
final allRoutesProvider = FutureProvider.autoDispose<List<RouteTemplate>>(
  (ref) => ref.watch(apiClientProvider).directory.routes(),
);

/// Заявки, ожидающие активации.
final pendingRoutesProvider = FutureProvider.autoDispose<List<RouteTemplate>>(
  (ref) => ref.watch(apiClientProvider).directory.pendingRoutes(),
);

/// Поездки на сегодня для доски дня.
final todayRidesProvider = FutureProvider.autoDispose<List<RideView>>(
  (ref) => ref.watch(apiClientProvider).directory.ridesForDate(),
);

/// Статус поездки в терминах бизнес-логики (core_domain).
///
/// На сервере и в core_domain это два разных перечисления с одинаковыми
/// именами вариантов: протокол генерируется Serverpod, а правила переходов
/// живут в core_domain.
extension RideStatusDomain on Ride {
  domain.RideStatus get domainStatus =>
      domain.RideStatus.values.byName(status.name);
}
