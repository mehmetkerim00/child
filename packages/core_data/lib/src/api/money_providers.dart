import 'package:child_client/child_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Деньги: баланс семьи, приём наличных, подтверждения.
///
/// Все суммы приходят в тенге (целые числа) — перевод в манаты делает
/// только интерфейс.

/// Баланс и история операций семьи (для родителя).
final myBalanceProvider = FutureProvider.autoDispose<BalanceView>(
  (ref) => ref.watch(apiClientProvider).routes.myBalance(),
);

/// Семьи из «круга» водителя — кому он может принять наличные.
final driverFamiliesProvider = FutureProvider.autoDispose<List<Family>>(
  (ref) => ref.watch(apiClientProvider).rides.myFamilies(),
);

/// Пополнения, которые принял водитель.
final driverTopUpsProvider = FutureProvider.autoDispose<List<CashTopUp>>(
  (ref) => ref.watch(apiClientProvider).rides.myCashTopUps(),
);

/// Пополнения, ожидающие подтверждения диспетчером.
final pendingTopUpsProvider = FutureProvider.autoDispose<List<CashTopUp>>(
  (ref) => ref.watch(apiClientProvider).directory.pendingTopUps(),
);

/// Перевод тенге в манаты для показа: 3500 → «35,00».
String formatTenge(int tenge) {
  final sign = tenge < 0 ? '-' : '';
  final abs = tenge.abs();
  final manat = abs ~/ 100;
  final coins = abs % 100;
  return '$sign$manat,${coins.toString().padLeft(2, '0')}';
}
