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
import 'load_driver.dart' as _i2;
import 'package:child_client/src/protocol/protocol.dart' as _i3;

/// Сиды нагрузочного прогона.
///
/// Живут только в режиме development и убираются командой cleanupLoad:
/// мусор от нагрузки не должен оседать в базе разработки.
abstract class LoadFixture implements _i1.SerializableModel {
  LoadFixture._({
    required this.drivers,
    required this.institutionCode,
    required this.rides,
  });

  factory LoadFixture({
    required List<_i2.LoadDriver> drivers,
    required String institutionCode,
    required int rides,
  }) = _LoadFixtureImpl;

  factory LoadFixture.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoadFixture(
      drivers: _i3.Protocol().deserialize<List<_i2.LoadDriver>>(
        jsonSerialization['drivers'],
      ),
      institutionCode: jsonSerialization['institutionCode'] as String,
      rides: jsonSerialization['rides'] as int,
    );
  }

  List<_i2.LoadDriver> drivers;

  /// Код учреждения для события «Передал».
  String institutionCode;

  /// Сколько всего поездок засеяно.
  int rides;

  /// Returns a shallow copy of this [LoadFixture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LoadFixture copyWith({
    List<_i2.LoadDriver>? drivers,
    String? institutionCode,
    int? rides,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LoadFixture',
      'drivers': drivers.toJson(valueToJson: (v) => v.toJson()),
      'institutionCode': institutionCode,
      'rides': rides,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LoadFixtureImpl extends LoadFixture {
  _LoadFixtureImpl({
    required List<_i2.LoadDriver> drivers,
    required String institutionCode,
    required int rides,
  }) : super._(
         drivers: drivers,
         institutionCode: institutionCode,
         rides: rides,
       );

  /// Returns a shallow copy of this [LoadFixture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LoadFixture copyWith({
    List<_i2.LoadDriver>? drivers,
    String? institutionCode,
    int? rides,
  }) {
    return LoadFixture(
      drivers: drivers ?? this.drivers.map((e0) => e0.copyWith()).toList(),
      institutionCode: institutionCode ?? this.institutionCode,
      rides: rides ?? this.rides,
    );
  }
}
