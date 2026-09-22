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

/// Место водителя в «круге семьи».
enum CircleRank implements _i1.SerializableModel {
  primary,
  backup1,
  backup2;

  static CircleRank fromJson(String name) {
    switch (name) {
      case 'primary':
        return CircleRank.primary;
      case 'backup1':
        return CircleRank.backup1;
      case 'backup2':
        return CircleRank.backup2;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "CircleRank"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
