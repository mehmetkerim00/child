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
import 'sms_level.dart' as _i2;

/// Семья — владелец баланса и подписки на маршруты.
abstract class Family implements _i1.SerializableModel {
  Family._({
    this.id,
    required this.name,
    required this.ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) : locale = locale ?? 'ru',
       smsLevel = smsLevel ?? _i2.SmsLevel.all,
       createdAt = createdAt ?? DateTime.now();

  factory Family({
    int? id,
    required String name,
    required String ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) = _FamilyImpl;

  factory Family.fromJson(Map<String, dynamic> jsonSerialization) {
    return Family(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      ownerPhone: jsonSerialization['ownerPhone'] as String,
      locale: jsonSerialization['locale'] as String?,
      smsLevel: jsonSerialization['smsLevel'] == null
          ? null
          : _i2.SmsLevel.fromJson((jsonSerialization['smsLevel'] as String)),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Фамилия/название семьи для списков диспетчера.
  String name;

  /// Телефон родителя-владельца в формате +993XXXXXXXX.
  String ownerPhone;

  /// Язык интерфейса и SMS: ru или tk.
  String locale;

  _i2.SmsLevel smsLevel;

  DateTime createdAt;

  /// Returns a shallow copy of this [Family]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Family copyWith({
    int? id,
    String? name,
    String? ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Family',
      if (id != null) 'id': id,
      'name': name,
      'ownerPhone': ownerPhone,
      'locale': locale,
      'smsLevel': smsLevel.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FamilyImpl extends Family {
  _FamilyImpl({
    int? id,
    required String name,
    required String ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) : super._(
         id: id,
         name: name,
         ownerPhone: ownerPhone,
         locale: locale,
         smsLevel: smsLevel,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Family]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Family copyWith({
    Object? id = _Undefined,
    String? name,
    String? ownerPhone,
    String? locale,
    _i2.SmsLevel? smsLevel,
    DateTime? createdAt,
  }) {
    return Family(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      locale: locale ?? this.locale,
      smsLevel: smsLevel ?? this.smsLevel,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
