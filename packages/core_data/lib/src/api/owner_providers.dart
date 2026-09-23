import 'package:child_client/child_client.dart';
import 'package:core_domain/core_domain.dart' show AshgabatTime;
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import 'providers.dart';

/// Период отчёта. Запись, а не класс: у записей есть равенство по
/// значению, и Riverpod не пересчитывает отчёт на каждой перерисовке.
typedef ReportPeriod = ({DateTime from, DateTime to});

/// Период «последние N дней» по ашхабадскому календарю.
ReportPeriod lastDays(int days) {
  final today = AshgabatTime.today();
  return (from: AshgabatTime.addDays(today, -(days - 1)), to: today);
}

/// Отчёт владельцу за период.
final ownerReportProvider = FutureProvider.autoDispose
    .family<OwnerReport, ReportPeriod>(
      (ref, period) => ref
          .watch(apiClientProvider)
          .owner
          .report(fromDate: period.from, toDate: period.to),
    );

/// Балансы всех семей: должники сверху.
final familyBalancesProvider =
    FutureProvider.autoDispose<List<FamilyBalanceRow>>(
      (ref) => ref.watch(apiClientProvider).owner.familyBalances(),
    );
