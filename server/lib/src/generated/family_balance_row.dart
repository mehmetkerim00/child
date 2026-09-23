/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

/// Баланс одной семьи для панели владельца.
abstract class FamilyBalanceRow
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FamilyBalanceRow._({
    required this.familyId,
    required this.familyName,
    required this.balanceTenge,
    required this.inDebt,
  });

  factory FamilyBalanceRow({
    required int familyId,
    required String familyName,
    required int balanceTenge,
    required bool inDebt,
  }) = _FamilyBalanceRowImpl;

  factory FamilyBalanceRow.fromJson(Map<String, dynamic> jsonSerialization) {
    return FamilyBalanceRow(
      familyId: jsonSerialization['familyId'] as int,
      familyName: jsonSerialization['familyName'] as String,
      balanceTenge: jsonSerialization['balanceTenge'] as int,
      inDebt: _i1.BoolJsonExtension.fromJson(jsonSerialization['inDebt']),
    );
  }

  int familyId;

  String familyName;

  int balanceTenge;

  /// Долг: баланс ушёл в минус — поездки уже сделаны, деньги не внесены.
  bool inDebt;

  /// Returns a shallow copy of this [FamilyBalanceRow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FamilyBalanceRow copyWith({
    int? familyId,
    String? familyName,
    int? balanceTenge,
    bool? inDebt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FamilyBalanceRow',
      'familyId': familyId,
      'familyName': familyName,
      'balanceTenge': balanceTenge,
      'inDebt': inDebt,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FamilyBalanceRow',
      'familyId': familyId,
      'familyName': familyName,
      'balanceTenge': balanceTenge,
      'inDebt': inDebt,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FamilyBalanceRowImpl extends FamilyBalanceRow {
  _FamilyBalanceRowImpl({
    required int familyId,
    required String familyName,
    required int balanceTenge,
    required bool inDebt,
  }) : super._(
         familyId: familyId,
         familyName: familyName,
         balanceTenge: balanceTenge,
         inDebt: inDebt,
       );

  /// Returns a shallow copy of this [FamilyBalanceRow]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FamilyBalanceRow copyWith({
    int? familyId,
    String? familyName,
    int? balanceTenge,
    bool? inDebt,
  }) {
    return FamilyBalanceRow(
      familyId: familyId ?? this.familyId,
      familyName: familyName ?? this.familyName,
      balanceTenge: balanceTenge ?? this.balanceTenge,
      inDebt: inDebt ?? this.inDebt,
    );
  }
}
