import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Форма заявки на регулярный маршрут.
///
/// Родитель задаёт ребёнка, дни недели, время и адреса. Водителя и цену
/// назначает диспетчер при активации, поэтому здесь их нет.
Future<RouteTemplate?> showRouteRequestDialog(
  BuildContext context,
  WidgetRef ref,
  List<Child> children,
) async {
  if (children.isEmpty) return null;
  final institutions = await ref
      .read(parentInstitutionsProvider.future)
      .catchError((_) => <Institution>[]);
  if (!context.mounted) return null;

  var childId = children.first.id!;
  var direction = RouteDirection.toInstitution;
  final weekdays = <int>{1, 2, 3, 4, 5};
  var pickupTime = const TimeOfDay(hour: 7, minute: 30);
  int? institutionId = institutions.isEmpty ? null : institutions.first.id;
  final fromAddress = TextEditingController();

  return showDialog<RouteTemplate>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(l10n.parentRequestRoute),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<int>(
                    initialValue: childId,
                    decoration: InputDecoration(
                      labelText: l10n.routeChild,
                      border: const OutlineInputBorder(),
                    ),
                    items: [
                      for (final child in children)
                        DropdownMenuItem(
                          value: child.id,
                          child: Text(child.name),
                        ),
                    ],
                    onChanged: (value) =>
                        setState(() => childId = value ?? childId),
                  ),
                  const SizedBox(height: ChildSpacing.m),
                  DropdownButtonFormField<RouteDirection>(
                    initialValue: direction,
                    decoration: InputDecoration(
                      labelText: l10n.routeDirection,
                      border: const OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: RouteDirection.toInstitution,
                        child: Text(l10n.directionToInstitution),
                      ),
                      DropdownMenuItem(
                        value: RouteDirection.toHome,
                        child: Text(l10n.directionToHome),
                      ),
                    ],
                    onChanged: (value) =>
                        setState(() => direction = value ?? direction),
                  ),
                  const SizedBox(height: ChildSpacing.m),
                  Text(l10n.routeWeekdays),
                  Wrap(
                    spacing: ChildSpacing.xs,
                    children: [
                      for (var day = 1; day <= 7; day++)
                        FilterChip(
                          label: Text(l10n.weekdayShort(day)),
                          selected: weekdays.contains(day),
                          onSelected: (selected) => setState(() {
                            selected ? weekdays.add(day) : weekdays.remove(day);
                          }),
                        ),
                    ],
                  ),
                  const SizedBox(height: ChildSpacing.m),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.schedule),
                    title: Text(l10n.routePickupTime),
                    subtitle: Text(_formatTime(pickupTime)),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: pickupTime,
                      );
                      if (picked != null) setState(() => pickupTime = picked);
                    },
                  ),
                  TextField(
                    controller: fromAddress,
                    decoration: InputDecoration(
                      labelText: l10n.routeFrom,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: ChildSpacing.m),
                  if (institutions.isNotEmpty)
                    DropdownButtonFormField<int>(
                      initialValue: institutionId,
                      decoration: InputDecoration(
                        labelText: l10n.routeTo,
                        border: const OutlineInputBorder(),
                      ),
                      items: [
                        for (final institution in institutions)
                          DropdownMenuItem(
                            value: institution.id,
                            child: Text(institution.name),
                          ),
                      ],
                      onChanged: (value) =>
                          setState(() => institutionId = value),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: weekdays.isEmpty || fromAddress.text.trim().isEmpty
                  ? null
                  : () => Navigator.of(context).pop(
                      RouteTemplate(
                        childId: childId,
                        weekdays: weekdays.toList()..sort(),
                        pickupTime: _formatTime(pickupTime),
                        fromAddress: fromAddress.text.trim(),
                        toInstitutionId: institutionId,
                        toAddress: institutions
                            .where((i) => i.id == institutionId)
                            .map((i) => i.address)
                            .firstOrNull,
                        direction: direction,
                        pricePerRideTenge: 0,
                        active: false,
                      ),
                    ),
              child: Text(l10n.save),
            ),
          ],
        );
      },
    ),
  );
}

String _formatTime(TimeOfDay time) =>
    '${time.hour.toString().padLeft(2, '0')}:'
    '${time.minute.toString().padLeft(2, '0')}';
