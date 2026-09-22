import 'package:flutter/material.dart';

import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

/// Главная кнопка этапа поездки у водителя: на всю ширину, не ниже 64dp.
class BigActionButton extends StatelessWidget {
  const BigActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: ChildSizes.driverActionMinHeight,
        minWidth: double.infinity,
      ),
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: icon == null ? null : Icon(icon, size: 32),
        label: Text(label, style: ChildTypography.driverAction),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: ChildSpacing.m, horizontal: ChildSpacing.l),
        ),
      ),
    );
  }
}
