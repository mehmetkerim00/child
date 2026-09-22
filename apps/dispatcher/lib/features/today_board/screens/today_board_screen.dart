import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../widgets/server_status_section.dart';
import '../widgets/status_column.dart';

/// «Доска дня» диспетчера: поездки по колонкам статусов.
///
/// Первая колонка — красная: неподтверждённые и сорванные поездки,
/// их видно раньше, чем о проблеме узнает родитель (MVP_PLAN §7).
class TodayBoardScreen extends ConsumerWidget {
  const TodayBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final rides = ref.watch(todayRidesProvider);
    final list = rides.valueOrNull ?? const <RideView>[];

    // Проблемы: ещё не подтверждено водителем или поездка сорвалась.
    bool isProblem(RideView view) {
      final status = view.ride.domainStatus;
      return status == RideStatus.scheduled ||
          status == RideStatus.delayed ||
          status == RideStatus.cancelledNoDriver ||
          status == RideStatus.cancelledByFamily;
    }

    final columns = RideStatus.happyPath.where(
      (s) => s != RideStatus.scheduled,
    );

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(todayRidesProvider),
      child: ListView(
        padding: const EdgeInsets.all(ChildSpacing.m),
        children: [
          StubNotice(text: l10n.stubNotice('S3–S4')),
          const SizedBox(height: ChildSpacing.m),
          const ServerStatusSection(),
          const SizedBox(height: ChildSpacing.l),
          if (rides.isLoading)
            const Center(child: CircularProgressIndicator())
          else
            SizedBox(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  StatusColumn(
                    title: l10n.dispatcherProblems,
                    emptyText: l10n.dispatcherBoardEmpty,
                    isProblem: true,
                    rides: list.where(isProblem).toList(),
                  ),
                  for (final status in columns)
                    StatusColumn(
                      title: l10n.rideStatus(status),
                      emptyText: l10n.dispatcherBoardEmpty,
                      rides: list
                          .where((view) => view.ride.domainStatus == status)
                          .toList(),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
