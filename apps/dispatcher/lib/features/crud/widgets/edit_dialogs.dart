import 'package:core_data/core_data.dart';
import 'package:core_l10n/core_l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'enum_labels.dart';

/// Диалог создания и правки записи справочника.
///
/// Возвращает изменённый объект или null, если диспетчер отменил ввод.
Future<T?> showEditDialog<T>({
  required BuildContext context,
  required String title,
  required List<Widget> Function(void Function() rebuild) fields,
  required T Function() build,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        final l10n = context.l10n;
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: fields(() => setState(() {})),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(build()),
              child: Text(l10n.save),
            ),
          ],
        );
      },
    ),
  );
}

/// Текстовое поле формы с единым отступом.
class FormField extends StatelessWidget {
  const FormField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChildSpacing.m),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

/// Выпадающий список значений перечисления.
class EnumField<T> extends StatelessWidget {
  const EnumField({
    super.key,
    required this.label,
    required this.value,
    required this.values,
    required this.labelOf,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> values;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: ChildSpacing.m),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: [
          for (final item in values)
            DropdownMenuItem(value: item, child: Text(labelOf(item))),
        ],
        onChanged: (selected) {
          if (selected != null) onChanged(selected);
        },
      ),
    );
  }
}

/// Диалог правки семьи.
Future<Family?> editFamilyDialog(BuildContext context, Family? initial) {
  final name = TextEditingController(text: initial?.name ?? '');
  final phone = TextEditingController(text: initial?.ownerPhone ?? '');
  var smsLevel = initial?.smsLevel ?? SmsLevel.all;
  // Язык семьи — это язык её SMS и push, а не только приложения:
  // без него туркменская семья получала бы русские уведомления.
  var locale = initial?.locale ?? 'ru';
  final l10n = context.l10n;

  return showEditDialog<Family>(
    context: context,
    title: initial == null ? l10n.add : l10n.edit,
    fields: (rebuild) => [
      FormField(controller: name, label: l10n.fieldFamilyName),
      FormField(
        controller: phone,
        label: l10n.fieldPhone,
        keyboardType: TextInputType.phone,
      ),
      EnumField<String>(
        label: l10n.language,
        value: locale,
        values: const ['ru', 'tk', 'en'],
        labelOf: l10n.familyLanguage,
        onChanged: (value) {
          locale = value;
          rebuild();
        },
      ),
      EnumField<SmsLevel>(
        label: l10n.fieldSmsLevel,
        value: smsLevel,
        values: SmsLevel.values,
        labelOf: l10n.smsLevelLabel,
        onChanged: (value) {
          smsLevel = value;
          rebuild();
        },
      ),
    ],
    build: () => Family(
      id: initial?.id,
      name: name.text.trim(),
      ownerPhone: phone.text.trim(),
      locale: locale,
      smsLevel: smsLevel,
      createdAt: initial?.createdAt ?? DateTime.now().toUtc(),
    ),
  );
}

/// Диалог правки ребёнка.
Future<Child?> editChildDialog(
  BuildContext context,
  Child? initial,
  List<Family> families,
) {
  final name = TextEditingController(text: initial?.name ?? '');
  final codeWord = TextEditingController(text: initial?.codeWord ?? '');
  final birthYear = TextEditingController(
    text: initial?.birthYear?.toString() ?? '',
  );
  var familyId = initial?.familyId ?? families.first.id!;
  var needsSeat = initial?.needsChildSeat ?? false;
  final l10n = context.l10n;

  return showEditDialog<Child>(
    context: context,
    title: initial == null ? l10n.add : l10n.edit,
    fields: (rebuild) => [
      EnumField<int>(
        label: l10n.fieldFamily,
        value: familyId,
        values: [for (final family in families) family.id!],
        labelOf: (id) => families.firstWhere((family) => family.id == id).name,
        onChanged: (value) {
          familyId = value;
          rebuild();
        },
      ),
      FormField(controller: name, label: l10n.fieldName),
      FormField(
        controller: birthYear,
        label: l10n.fieldBirthYear,
        keyboardType: TextInputType.number,
      ),
      FormField(controller: codeWord, label: l10n.fieldCodeWord),
      CheckboxListTile(
        value: needsSeat,
        title: Text(l10n.fieldNeedsChildSeat),
        onChanged: (value) {
          needsSeat = value ?? false;
          rebuild();
        },
      ),
    ],
    build: () => Child(
      id: initial?.id,
      familyId: familyId,
      name: name.text.trim(),
      birthYear: int.tryParse(birthYear.text.trim()),
      codeWord: codeWord.text.trim(),
      needsChildSeat: needsSeat,
      photoUrl: initial?.photoUrl,
      createdAt: initial?.createdAt ?? DateTime.now().toUtc(),
    ),
  );
}

/// Диалог правки водителя.
Future<Driver?> editDriverDialog(BuildContext context, Driver? initial) {
  final name = TextEditingController(text: initial?.name ?? '');
  final phone = TextEditingController(text: initial?.phone ?? '');
  final carModel = TextEditingController(text: initial?.carModel ?? '');
  final carPlate = TextEditingController(text: initial?.carPlate ?? '');
  final experience = TextEditingController(text: initial?.experienceNote ?? '');
  var vetting = initial?.vettingStatus ?? VettingStatus.pending;
  var isFemale = initial?.isFemale ?? false;
  final l10n = context.l10n;

  return showEditDialog<Driver>(
    context: context,
    title: initial == null ? l10n.add : l10n.edit,
    fields: (rebuild) => [
      FormField(controller: name, label: l10n.fieldName),
      FormField(
        controller: phone,
        label: l10n.fieldPhone,
        keyboardType: TextInputType.phone,
      ),
      FormField(controller: carModel, label: l10n.fieldCarModel),
      FormField(controller: carPlate, label: l10n.fieldCarPlate),
      FormField(controller: experience, label: l10n.fieldExperience),
      EnumField<VettingStatus>(
        label: l10n.fieldType,
        value: vetting,
        values: VettingStatus.values,
        labelOf: l10n.vettingStatus,
        onChanged: (value) {
          vetting = value;
          rebuild();
        },
      ),
      CheckboxListTile(
        value: isFemale,
        title: Text(l10n.fieldIsFemaleDriver),
        onChanged: (value) {
          isFemale = value ?? false;
          rebuild();
        },
      ),
    ],
    build: () => Driver(
      id: initial?.id,
      phone: phone.text.trim(),
      name: name.text.trim(),
      carModel: carModel.text.trim(),
      carPlate: carPlate.text.trim(),
      experienceNote: experience.text.trim().isEmpty
          ? null
          : experience.text.trim(),
      vettingStatus: vetting,
      isFemale: isFemale,
      photoUrl: initial?.photoUrl,
      active: initial?.active ?? true,
      createdAt: initial?.createdAt ?? DateTime.now().toUtc(),
    ),
  );
}

/// Диалог правки учреждения.
Future<Institution?> editInstitutionDialog(
  BuildContext context,
  Institution? initial,
) {
  final name = TextEditingController(text: initial?.name ?? '');
  final address = TextEditingController(text: initial?.address ?? '');
  final code = TextEditingController(text: initial?.handoverCode ?? '');
  final phone = TextEditingController(text: initial?.contactPhone ?? '');
  var type = initial?.type ?? InstitutionType.school;
  final l10n = context.l10n;

  return showEditDialog<Institution>(
    context: context,
    title: initial == null ? l10n.add : l10n.edit,
    fields: (rebuild) => [
      EnumField<InstitutionType>(
        label: l10n.fieldType,
        value: type,
        values: InstitutionType.values,
        labelOf: l10n.institutionType,
        onChanged: (value) {
          type = value;
          rebuild();
        },
      ),
      FormField(controller: name, label: l10n.fieldName),
      FormField(controller: address, label: l10n.fieldAddress),
      FormField(controller: code, label: l10n.fieldHandoverCode),
      FormField(
        controller: phone,
        label: l10n.fieldPhone,
        keyboardType: TextInputType.phone,
      ),
    ],
    build: () => Institution(
      id: initial?.id,
      type: type,
      name: name.text.trim(),
      address: address.text.trim(),
      lat: initial?.lat,
      lng: initial?.lng,
      contactPhone: phone.text.trim().isEmpty ? null : phone.text.trim(),
      handoverCode: code.text.trim(),
      createdAt: initial?.createdAt ?? DateTime.now().toUtc(),
    ),
  );
}
