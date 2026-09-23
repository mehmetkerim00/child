import 'package:core_data/core_data.dart' hide RideStatus;
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;

import '../../crud/widgets/enum_labels.dart';

/// Обязательные проверки: без них сервер не даст нанять кандидата.
const requiredCheckKinds = [
  CheckKind.passport,
  CheckKind.drivingLicense,
  CheckKind.carDocuments,
  CheckKind.criminalRecord,
  CheckKind.interview,
  CheckKind.childSeatDemo,
];

/// Кандидат с раскрывающимся чек-листом.
///
/// Чек-лист — не формальность: это единственное место, где видно, что
/// человека действительно проверили, прежде чем доверить ему ребёнка.
class ApplicationCard extends ConsumerWidget {
  const ApplicationCard({super.key, required this.application});

  final DriverApplication application;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final hired = application.status == ApplicationStatus.hired;
    final rejected = application.status == ApplicationStatus.rejected;

    return Card(
      margin: const EdgeInsets.only(bottom: ChildSpacing.s),
      child: ExpansionTile(
        leading: Icon(
          hired
              ? Icons.verified_user
              : rejected
              ? Icons.person_off
              : Icons.assignment_ind,
          color: hired
              ? ChildColors.success
              : rejected
              ? ChildColors.danger
              : ChildColors.primary,
        ),
        title: Text(application.fullName),
        subtitle: Text(
          [
            l10n.applicationStatus(application.status),
            application.phone,
            '${application.carModel} ${application.carPlate}',
            if (application.isFemale) l10n.fieldIsFemaleDriver,
            if (application.hasChildSeat) l10n.checkChildSeat,
          ].join(' · '),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          ChildSpacing.m,
          0,
          ChildSpacing.m,
          ChildSpacing.m,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(application.experienceWithChildren),
          ),
          if (application.rejectedReason != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${l10n.hiringRejectReason}: ${application.rejectedReason}',
                style: const TextStyle(color: ChildColors.danger),
              ),
            ),
          const SizedBox(height: ChildSpacing.s),
          if (!hired && !rejected) _Checklist(applicationId: application.id!),
          if (!hired && !rejected)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => _reject(context, ref),
                  child: Text(l10n.hiringReject),
                ),
                const SizedBox(width: ChildSpacing.s),
                FilledButton(
                  onPressed: () => _hire(context, ref),
                  child: Text(l10n.hiringHire),
                ),
              ],
            ),
        ],
      ),
    );
  }

  /// Наём: сервер откажет, если чек-лист не закрыт — показываем причину.
  Future<void> _hire(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(apiClientProvider).hiring.hire(application.id!);
      ref
        ..invalidate(applicationsProvider)
        ..invalidate(driversProvider);
    } catch (error) {
      messenger.showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  /// Отказ всегда с причиной: кандидат может прийти снова.
  Future<void> _reject(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final controller = TextEditingController();
    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.hiringReject),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: l10n.hiringRejectReason,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    if (reason == null || reason.isEmpty) return;

    await ref
        .read(apiClientProvider)
        .hiring
        .setStatus(
          applicationId: application.id!,
          status: ApplicationStatus.rejected,
          rejectedReason: reason,
        );
    ref.invalidate(applicationsProvider);
  }
}

/// Чек-лист проверок кандидата: переключатели по каждому пункту.
class _Checklist extends ConsumerWidget {
  const _Checklist({required this.applicationId});

  final int applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final checks = ref.watch(applicationChecksProvider(applicationId));
    final passed = {
      for (final check in checks.valueOrNull ?? const <ApplicationCheck>[])
        if (check.passed) check.kind,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.hiringChecklist,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        for (final kind in requiredCheckKinds)
          CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            value: passed.contains(kind),
            title: Text(l10n.checkKind(kind)),
            onChanged: (value) async {
              await ref
                  .read(apiClientProvider)
                  .hiring
                  .setCheck(
                    applicationId: applicationId,
                    kind: kind,
                    passed: value ?? false,
                  );
              ref.invalidate(applicationChecksProvider(applicationId));
            },
          ),
      ],
    );
  }
}
