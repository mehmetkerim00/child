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

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'institution_child_row.dart' as _i2;
import 'package:child_client/src/protocol/protocol.dart' as _i3;

/// Список детей учреждения на сегодня — то, что видит воспитатель.
abstract class InstitutionDayView implements _i1.SerializableModel {
  InstitutionDayView._({
    required this.institutionName,
    required this.date,
    required this.arrivals,
    required this.departures,
  });

  factory InstitutionDayView({
    required String institutionName,
    required DateTime date,
    required List<_i2.InstitutionChildRow> arrivals,
    required List<_i2.InstitutionChildRow> departures,
  }) = _InstitutionDayViewImpl;

  factory InstitutionDayView.fromJson(Map<String, dynamic> jsonSerialization) {
    return InstitutionDayView(
      institutionName: jsonSerialization['institutionName'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      arrivals: _i3.Protocol().deserialize<List<_i2.InstitutionChildRow>>(
        jsonSerialization['arrivals'],
      ),
      departures: _i3.Protocol().deserialize<List<_i2.InstitutionChildRow>>(
        jsonSerialization['departures'],
      ),
    );
  }

  String institutionName;

  /// Местная дата (Ашхабад).
  DateTime date;

  List<_i2.InstitutionChildRow> arrivals;

  List<_i2.InstitutionChildRow> departures;

  /// Returns a shallow copy of this [InstitutionDayView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InstitutionDayView copyWith({
    String? institutionName,
    DateTime? date,
    List<_i2.InstitutionChildRow>? arrivals,
    List<_i2.InstitutionChildRow>? departures,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InstitutionDayView',
      'institutionName': institutionName,
      'date': date.toJson(),
      'arrivals': arrivals.toJson(valueToJson: (v) => v.toJson()),
      'departures': departures.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InstitutionDayViewImpl extends InstitutionDayView {
  _InstitutionDayViewImpl({
    required String institutionName,
    required DateTime date,
    required List<_i2.InstitutionChildRow> arrivals,
    required List<_i2.InstitutionChildRow> departures,
  }) : super._(
         institutionName: institutionName,
         date: date,
         arrivals: arrivals,
         departures: departures,
       );

  /// Returns a shallow copy of this [InstitutionDayView]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InstitutionDayView copyWith({
    String? institutionName,
    DateTime? date,
    List<_i2.InstitutionChildRow>? arrivals,
    List<_i2.InstitutionChildRow>? departures,
  }) {
    return InstitutionDayView(
      institutionName: institutionName ?? this.institutionName,
      date: date ?? this.date,
      arrivals: arrivals ?? this.arrivals.map((e0) => e0.copyWith()).toList(),
      departures:
          departures ?? this.departures.map((e0) => e0.copyWith()).toList(),
    );
  }
}
