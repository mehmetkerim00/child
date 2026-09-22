import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Карточка «Связь с сервером» — проверка, что вся цепочка
/// приложение → Serverpod → PostgreSQL поднята.
class ServerStatusSection extends ConsumerWidget {
  const ServerStatusSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final health = ref.watch(serverHealthProvider);
    final (status, message) = switch (health) {
      AsyncData(:final value) => (ServerStatus.ok, l10n.serverOk(value.serverVersion)),
      AsyncError() => (ServerStatus.unavailable, l10n.serverUnavailable),
      _ => (ServerStatus.checking, l10n.serverChecking),
    };
    return ServerStatusCard(
      title: l10n.serverStatusTitle,
      status: status,
      message: message,
      retryLabel: l10n.retry,
      onRetry: () => ref.invalidate(serverHealthProvider),
    );
  }
}
