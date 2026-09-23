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

/// Готовые фразы: быстрее и понятнее свободного текста.
///
/// Водитель за рулём и родитель на работе не будут набирать длинные
/// сообщения — кнопка надёжнее.
enum QuickPhrase implements _i1.SerializableModel {
  comingOut,
  delayFiveMinutes,
  childIsSick,
  waitingAtEntrance,
  arrivedCallChild,
  allGood
  ;

  static QuickPhrase fromJson(String name) {
    switch (name) {
      case 'comingOut':
        return QuickPhrase.comingOut;
      case 'delayFiveMinutes':
        return QuickPhrase.delayFiveMinutes;
      case 'childIsSick':
        return QuickPhrase.childIsSick;
      case 'waitingAtEntrance':
        return QuickPhrase.waitingAtEntrance;
      case 'arrivedCallChild':
        return QuickPhrase.arrivedCallChild;
      case 'allGood':
        return QuickPhrase.allGood;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "QuickPhrase"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
