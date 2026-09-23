import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Конвейер найма водителей (панель диспетчера) и обучение (водитель).

/// Анкеты кандидатов; null — все этапы.
final applicationsProvider = FutureProvider.autoDispose
    .family<List<DriverApplication>, ApplicationStatus?>(
      (ref, status) =>
          ref.watch(apiClientProvider).hiring.applications(status: status),
    );

/// Чек-лист проверки кандидата.
final applicationChecksProvider = FutureProvider.autoDispose
    .family<List<ApplicationCheck>, int>(
      (ref, applicationId) =>
          ref.watch(apiClientProvider).hiring.checks(applicationId),
    );

/// Журнал инцидентов.
final incidentsProvider = FutureProvider.autoDispose<List<Incident>>(
  (ref) => ref.watch(apiClientProvider).hiring.incidents(driverId: null),
);

/// Расчёты водителям.
final payoutsProvider = FutureProvider.autoDispose<List<PayoutPeriod>>(
  (ref) => ref.watch(apiClientProvider).hiring.payouts(driverId: null),
);

/// Сдал ли вошедший водитель обучение.
final myTrainingPassedProvider = FutureProvider.autoDispose<bool>(
  (ref) => ref.watch(apiClientProvider).training.myTrainingPassed(),
);

/// Мои попытки теста.
final myTrainingResultsProvider =
    FutureProvider.autoDispose<List<TrainingResult>>(
      (ref) => ref.watch(apiClientProvider).training.myResults(),
    );
