import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Приём наличных: семья, сумма и подпись родителя.
///
/// Сумма вводится в манатах, на сервер уходит в тенге целым числом —
/// дробной арифметики в деньгах у нас нет.
Future<void> showCashTopUpDialog(
  BuildContext context,
  WidgetRef ref,
  List<Family> families,
) async {
  if (families.isEmpty) return;

  var familyId = families.first.id!;
  final amount = TextEditingController();
  final signatureKey = GlobalKey<SignaturePadState>();
  var hasSignature = false;
  final l10n = context.l10n;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text(l10n.driverCashAccept),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<int>(
                  initialValue: familyId,
                  decoration: InputDecoration(
                    labelText: l10n.driverCashFamily,
                    border: const OutlineInputBorder(),
                  ),
                  items: [
                    for (final family in families)
                      DropdownMenuItem(
                        value: family.id,
                        child: Text(family.name),
                      ),
                  ],
                  onChanged: (value) =>
                      setState(() => familyId = value ?? familyId),
                ),
                const SizedBox(height: ChildSpacing.m),
                TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: l10n.driverCashAmount,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: ChildSpacing.m),
                Text(l10n.driverCashSignature),
                const SizedBox(height: ChildSpacing.s),
                SignaturePad(
                  key: signatureKey,
                  height: 140,
                  onChanged: (value) => setState(() => hasSignature = value),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.save),
          ),
        ],
      ),
    ),
  );

  if (confirmed != true) return;

  // Манаты в тенге: «35» → 3500. Дробную часть не принимаем.
  final manat = int.tryParse(amount.text.trim());
  if (manat == null || manat <= 0) return;

  await ref
      .read(apiClientProvider)
      .rides
      .recordCashTopUp(
        familyId: familyId,
        amountTenge: manat * 100,
        hasSignature: hasSignature,
      );
}
