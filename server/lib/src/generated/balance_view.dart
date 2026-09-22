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
import 'ledger_entry.dart' as _i2;
import 'package:child_server/src/generated/protocol.dart' as _i3;

/// Баланс семьи для экрана родителя. Все суммы — в тенге.
abstract class BalanceView
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  BalanceView._({
    required this.balanceTenge,
    required this.pendingTopUpTenge,
    required this.ridePriceTenge,
    required this.lowBalance,
    required this.entries,
  });

  factory BalanceView({
    required int balanceTenge,
    required int pendingTopUpTenge,
    required int ridePriceTenge,
    required bool lowBalance,
    required List<_i2.LedgerEntry> entries,
  }) = _BalanceViewImpl;

  factory BalanceView.fromJson(Map<String, dynamic> jsonSerialization) {
    return BalanceView(
      balanceTenge: jsonSerialization['balanceTenge'] as int,
      pendingTopUpTenge: jsonSerialization['pendingTopUpTenge'] as int,
      ridePriceTenge: jsonSerialization['ridePriceTenge'] as int,
      lowBalance: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['lowBalance'],
      ),
      entries: _i3.Protocol().deserialize<List<_i2.LedgerEntry>>(
        jsonSerialization['entries'],
      ),
    );
  }

  /// Подтверждённый остаток.
  int balanceTenge;

  /// Наличные, принятые водителем, но ещё не подтверждённые диспетчером.
  int pendingTopUpTenge;

  /// Цена одной поездки по активным маршрутам семьи.
  int ridePriceTenge;

  /// Денег меньше чем на три поездки — пора пополнять (MVP_PLAN §7).
  bool lowBalance;

  List<_i2.LedgerEntry> entries;

  /// Returns a shallow copy of this [BalanceView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BalanceView copyWith({
    int? balanceTenge,
    int? pendingTopUpTenge,
    int? ridePriceTenge,
    bool? lowBalance,
    List<_i2.LedgerEntry>? entries,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BalanceView',
      'balanceTenge': balanceTenge,
      'pendingTopUpTenge': pendingTopUpTenge,
      'ridePriceTenge': ridePriceTenge,
      'lowBalance': lowBalance,
      'entries': entries.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BalanceView',
      'balanceTenge': balanceTenge,
      'pendingTopUpTenge': pendingTopUpTenge,
      'ridePriceTenge': ridePriceTenge,
      'lowBalance': lowBalance,
      'entries': entries.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BalanceViewImpl extends BalanceView {
  _BalanceViewImpl({
    required int balanceTenge,
    required int pendingTopUpTenge,
    required int ridePriceTenge,
    required bool lowBalance,
    required List<_i2.LedgerEntry> entries,
  }) : super._(
         balanceTenge: balanceTenge,
         pendingTopUpTenge: pendingTopUpTenge,
         ridePriceTenge: ridePriceTenge,
         lowBalance: lowBalance,
         entries: entries,
       );

  /// Returns a shallow copy of this [BalanceView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BalanceView copyWith({
    int? balanceTenge,
    int? pendingTopUpTenge,
    int? ridePriceTenge,
    bool? lowBalance,
    List<_i2.LedgerEntry>? entries,
  }) {
    return BalanceView(
      balanceTenge: balanceTenge ?? this.balanceTenge,
      pendingTopUpTenge: pendingTopUpTenge ?? this.pendingTopUpTenge,
      ridePriceTenge: ridePriceTenge ?? this.ridePriceTenge,
      lowBalance: lowBalance ?? this.lowBalance,
      entries: entries ?? this.entries.map((e0) => e0.copyWith()).toList(),
    );
  }
}
