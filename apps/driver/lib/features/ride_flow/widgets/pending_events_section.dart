import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// «N событий ждут отправки» — водитель видит, что связь пропала,
/// и что нажатия не потерялись.
class PendingEventsSection extends ConsumerWidget {
  const PendingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final pending = ref.watch(pendingEventCountProvider).valueOrNull ?? 0;

    return PendingEventsBadge(
      isPending: pending > 0,
      text: pending > 0 ? l10n.pendingEvents(pending) : l10n.allEventsSent,
      retryLabel: l10n.retrySync,
      onRetry: () async {
        await ref.read(rideEventQueueProvider).sync();
        ref.invalidate(driverTodayRidesProvider);
      },
    );
  }
}
