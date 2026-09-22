import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// SMS-консоль: диспетчер пишет семье или водителю вручную.
///
/// Нужна, когда автоматика не справилась: уведомление не дошло, и остаётся
/// написать или позвонить самому.
Future<void> showSmsConsoleDialog(BuildContext context, WidgetRef ref) async {
  final phone = TextEditingController();
  final body = TextEditingController();
  final l10n = context.l10n;

  final send = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.smsConsoleTitle),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: l10n.fieldPhone,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: ChildSpacing.m),
            TextField(
              controller: body,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: l10n.smsConsoleBody,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.smsConsoleSend),
        ),
      ],
    ),
  );

  if (send != true || phone.text.trim().isEmpty || body.text.trim().isEmpty) {
    return;
  }

  await ref
      .read(apiClientProvider)
      .directory
      .sendManualSms(phone: phone.text.trim(), body: body.text.trim());
  ref.invalidate(outboxProvider);

  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.smsConsoleSent)));
  }
}
