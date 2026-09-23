import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

/// Выдача ссылки учреждению.
///
/// Воспитателю не нужен аккаунт: он открывает ссылку на своём телефоне.
/// Токен показывается один раз — в базе хранится только его хэш.
Future<void> showInstitutionAccessDialog(
  BuildContext context,
  WidgetRef ref,
  Institution institution,
  String serverUrl,
) async {
  final l10n = context.l10n;
  final issuedTo = TextEditingController();

  final issue = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('${l10n.institutionAccessTitle}: ${institution.name}'),
      content: SizedBox(
        width: 420,
        child: TextField(
          controller: issuedTo,
          decoration: InputDecoration(
            labelText: l10n.institutionAccessIssuedTo,
            border: const OutlineInputBorder(),
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
          child: Text(l10n.institutionAccessIssue),
        ),
      ],
    ),
  );

  if (issue != true || issuedTo.text.trim().isEmpty) return;

  final token = await ref
      .read(apiClientProvider)
      .institutionAdmin
      .issueAccess(
        institutionId: institution.id!,
        issuedTo: issuedTo.text.trim(),
      );

  // Ссылка ведёт на веб-сервер, а не на API: воспитатель открывает её
  // в браузере телефона.
  final link =
      '${serverUrl.replaceFirst(RegExp(r':\d+/?$'), ':8182')}'
      '/sadik?t=$token';

  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.institutionAccessTitle),
      content: SizedBox(
        width: 480,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(link, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: ChildSpacing.m),
            Text(l10n.institutionAccessCopy),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: link));
            if (context.mounted) Navigator.of(context).pop();
          },
          child: const Text('Копировать'),
        ),
      ],
    ),
  );
}
