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

/// Итог нагрузочного прогона со стороны сервера.
abstract class LoadResult implements _i1.SerializableModel {
  LoadResult._({required this.handedOver});

  factory LoadResult({required int handedOver}) = _LoadResultImpl;

  factory LoadResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoadResult(handedOver: jsonSerialization['handedOver'] as int);
  }

  /// Сколько засеянных поездок дошли до статуса «передан».
  int handedOver;

  /// Returns a shallow copy of this [LoadResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LoadResult copyWith({int? handedOver});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LoadResult',
      'handedOver': handedOver,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LoadResultImpl extends LoadResult {
  _LoadResultImpl({required int handedOver}) : super._(handedOver: handedOver);

  /// Returns a shallow copy of this [LoadResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LoadResult copyWith({int? handedOver}) {
    return LoadResult(handedOver: handedOver ?? this.handedOver);
  }
}
