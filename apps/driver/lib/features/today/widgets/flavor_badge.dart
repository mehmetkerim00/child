import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Метка среды в AppBar — только для dev-сборок.
class FlavorBadge extends ConsumerWidget {
  const FlavorBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(appConfigProvider).flavor;
    if (flavor == Flavor.prod) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ChildSpacing.s),
      child: Chip(label: Text(context.l10n.flavorBadge(flavor.name))),
    );
  }
}
