import 'package:core_domain/core_domain.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../widgets/server_status_section.dart';
import '../widgets/status_column.dart';

/// «Доска дня» диспетчера: колонки по статусам + красная колонка проблем.
/// Пока без данных — поездки появятся в S2, автообновление по WebSocket — S4.
class TodayBoardScreen extends StatelessWidget {
  const TodayBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Колонки основного пути (без «запланирована» — она в проблемах, пока
    // водитель не подтвердил) + колонка исключений.
    final columns = RideStatus.happyPath.where(
      (s) => s != RideStatus.scheduled,
    );
    return ListView(
      padding: const EdgeInsets.all(ChildSpacing.m),
      children: [
        StubNotice(text: l10n.stubNotice('S1–S2')),
        const SizedBox(height: ChildSpacing.m),
        const ServerStatusSection(),
        const SizedBox(height: ChildSpacing.l),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              StatusColumn(
                title:
                    '${l10n.rideStatus(RideStatus.scheduled)} · ${l10n.rideStatus(RideStatus.delayed)}',
                emptyText: l10n.dispatcherBoardEmpty,
                isProblem: true,
              ),
              for (final status in columns)
                StatusColumn(
                  title: l10n.rideStatus(status),
                  emptyText: l10n.dispatcherBoardEmpty,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
