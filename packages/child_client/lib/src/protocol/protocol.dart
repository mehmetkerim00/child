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
import 'account_role.dart' as _i2;
import 'auth_exception.dart' as _i3;
import 'auth_failure.dart' as _i4;
import 'auth_result.dart' as _i5;
import 'auth_token.dart' as _i6;
import 'child.dart' as _i7;
import 'circle_rank.dart' as _i8;
import 'dispatcher_account.dart' as _i9;
import 'driver.dart' as _i10;
import 'family.dart' as _i11;
import 'family_circle.dart' as _i12;
import 'health/server_health.dart' as _i13;
import 'institution.dart' as _i14;
import 'institution_type.dart' as _i15;
import 'ledger_entry.dart' as _i16;
import 'ledger_entry_type.dart' as _i17;
import 'notification_channel.dart' as _i18;
import 'notification_outbox.dart' as _i19;
import 'notification_status.dart' as _i20;
import 'otp_code.dart' as _i21;
import 'parent.dart' as _i22;
import 'parent_role.dart' as _i23;
import 'ride.dart' as _i24;
import 'ride_event.dart' as _i25;
import 'ride_event_type.dart' as _i26;
import 'ride_status.dart' as _i27;
import 'route_direction.dart' as _i28;
import 'route_template.dart' as _i29;
import 'sms_level.dart' as _i30;
import 'vetting_status.dart' as _i31;
import 'package:child_client/src/protocol/family.dart' as _i32;
import 'package:child_client/src/protocol/parent.dart' as _i33;
import 'package:child_client/src/protocol/child.dart' as _i34;
import 'package:child_client/src/protocol/driver.dart' as _i35;
import 'package:child_client/src/protocol/institution.dart' as _i36;
import 'package:child_client/src/protocol/family_circle.dart' as _i37;
export 'account_role.dart';
export 'auth_exception.dart';
export 'auth_failure.dart';
export 'auth_result.dart';
export 'auth_token.dart';
export 'child.dart';
export 'circle_rank.dart';
export 'dispatcher_account.dart';
export 'driver.dart';
export 'family.dart';
export 'family_circle.dart';
export 'health/server_health.dart';
export 'institution.dart';
export 'institution_type.dart';
export 'ledger_entry.dart';
export 'ledger_entry_type.dart';
export 'notification_channel.dart';
export 'notification_outbox.dart';
export 'notification_status.dart';
export 'otp_code.dart';
export 'parent.dart';
export 'parent_role.dart';
export 'ride.dart';
export 'ride_event.dart';
export 'ride_event_type.dart';
export 'ride_status.dart';
export 'route_direction.dart';
export 'route_template.dart';
export 'sms_level.dart';
export 'vetting_status.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AccountRole) {
      return _i2.AccountRole.fromJson(data) as T;
    }
    if (t == _i3.AuthException) {
      return _i3.AuthException.fromJson(data) as T;
    }
    if (t == _i4.AuthFailureReason) {
      return _i4.AuthFailureReason.fromJson(data) as T;
    }
    if (t == _i5.AuthResult) {
      return _i5.AuthResult.fromJson(data) as T;
    }
    if (t == _i6.AuthToken) {
      return _i6.AuthToken.fromJson(data) as T;
    }
    if (t == _i7.Child) {
      return _i7.Child.fromJson(data) as T;
    }
    if (t == _i8.CircleRank) {
      return _i8.CircleRank.fromJson(data) as T;
    }
    if (t == _i9.DispatcherAccount) {
      return _i9.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i10.Driver) {
      return _i10.Driver.fromJson(data) as T;
    }
    if (t == _i11.Family) {
      return _i11.Family.fromJson(data) as T;
    }
    if (t == _i12.FamilyCircle) {
      return _i12.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i13.ServerHealth) {
      return _i13.ServerHealth.fromJson(data) as T;
    }
    if (t == _i14.Institution) {
      return _i14.Institution.fromJson(data) as T;
    }
    if (t == _i15.InstitutionType) {
      return _i15.InstitutionType.fromJson(data) as T;
    }
    if (t == _i16.LedgerEntry) {
      return _i16.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i17.LedgerEntryType) {
      return _i17.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i18.NotificationChannel) {
      return _i18.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i19.NotificationOutbox) {
      return _i19.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i20.NotificationStatus) {
      return _i20.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i21.OtpCode) {
      return _i21.OtpCode.fromJson(data) as T;
    }
    if (t == _i22.Parent) {
      return _i22.Parent.fromJson(data) as T;
    }
    if (t == _i23.ParentRole) {
      return _i23.ParentRole.fromJson(data) as T;
    }
    if (t == _i24.Ride) {
      return _i24.Ride.fromJson(data) as T;
    }
    if (t == _i25.RideEvent) {
      return _i25.RideEvent.fromJson(data) as T;
    }
    if (t == _i26.RideEventType) {
      return _i26.RideEventType.fromJson(data) as T;
    }
    if (t == _i27.RideStatus) {
      return _i27.RideStatus.fromJson(data) as T;
    }
    if (t == _i28.RouteDirection) {
      return _i28.RouteDirection.fromJson(data) as T;
    }
    if (t == _i29.RouteTemplate) {
      return _i29.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i30.SmsLevel) {
      return _i30.SmsLevel.fromJson(data) as T;
    }
    if (t == _i31.VettingStatus) {
      return _i31.VettingStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AccountRole?>()) {
      return (data != null ? _i2.AccountRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AuthException?>()) {
      return (data != null ? _i3.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AuthFailureReason?>()) {
      return (data != null ? _i4.AuthFailureReason.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthResult?>()) {
      return (data != null ? _i5.AuthResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthToken?>()) {
      return (data != null ? _i6.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Child?>()) {
      return (data != null ? _i7.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CircleRank?>()) {
      return (data != null ? _i8.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DispatcherAccount?>()) {
      return (data != null ? _i9.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Driver?>()) {
      return (data != null ? _i10.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Family?>()) {
      return (data != null ? _i11.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.FamilyCircle?>()) {
      return (data != null ? _i12.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ServerHealth?>()) {
      return (data != null ? _i13.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Institution?>()) {
      return (data != null ? _i14.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.InstitutionType?>()) {
      return (data != null ? _i15.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.LedgerEntry?>()) {
      return (data != null ? _i16.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.LedgerEntryType?>()) {
      return (data != null ? _i17.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.NotificationChannel?>()) {
      return (data != null ? _i18.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i19.NotificationOutbox?>()) {
      return (data != null ? _i19.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.NotificationStatus?>()) {
      return (data != null ? _i20.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.OtpCode?>()) {
      return (data != null ? _i21.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Parent?>()) {
      return (data != null ? _i22.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ParentRole?>()) {
      return (data != null ? _i23.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Ride?>()) {
      return (data != null ? _i24.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.RideEvent?>()) {
      return (data != null ? _i25.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.RideEventType?>()) {
      return (data != null ? _i26.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RideStatus?>()) {
      return (data != null ? _i27.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.RouteDirection?>()) {
      return (data != null ? _i28.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.RouteTemplate?>()) {
      return (data != null ? _i29.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.SmsLevel?>()) {
      return (data != null ? _i30.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.VettingStatus?>()) {
      return (data != null ? _i31.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i32.Family>) {
      return (data as List).map((e) => deserialize<_i32.Family>(e)).toList()
          as T;
    }
    if (t == List<_i33.Parent>) {
      return (data as List).map((e) => deserialize<_i33.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i34.Child>) {
      return (data as List).map((e) => deserialize<_i34.Child>(e)).toList()
          as T;
    }
    if (t == List<_i35.Driver>) {
      return (data as List).map((e) => deserialize<_i35.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i36.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i36.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i37.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i37.FamilyCircle>(e))
              .toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AccountRole => 'AccountRole',
      _i3.AuthException => 'AuthException',
      _i4.AuthFailureReason => 'AuthFailureReason',
      _i5.AuthResult => 'AuthResult',
      _i6.AuthToken => 'AuthToken',
      _i7.Child => 'Child',
      _i8.CircleRank => 'CircleRank',
      _i9.DispatcherAccount => 'DispatcherAccount',
      _i10.Driver => 'Driver',
      _i11.Family => 'Family',
      _i12.FamilyCircle => 'FamilyCircle',
      _i13.ServerHealth => 'ServerHealth',
      _i14.Institution => 'Institution',
      _i15.InstitutionType => 'InstitutionType',
      _i16.LedgerEntry => 'LedgerEntry',
      _i17.LedgerEntryType => 'LedgerEntryType',
      _i18.NotificationChannel => 'NotificationChannel',
      _i19.NotificationOutbox => 'NotificationOutbox',
      _i20.NotificationStatus => 'NotificationStatus',
      _i21.OtpCode => 'OtpCode',
      _i22.Parent => 'Parent',
      _i23.ParentRole => 'ParentRole',
      _i24.Ride => 'Ride',
      _i25.RideEvent => 'RideEvent',
      _i26.RideEventType => 'RideEventType',
      _i27.RideStatus => 'RideStatus',
      _i28.RouteDirection => 'RouteDirection',
      _i29.RouteTemplate => 'RouteTemplate',
      _i30.SmsLevel => 'SmsLevel',
      _i31.VettingStatus => 'VettingStatus',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('child.', '');
    }

    switch (data) {
      case _i2.AccountRole():
        return 'AccountRole';
      case _i3.AuthException():
        return 'AuthException';
      case _i4.AuthFailureReason():
        return 'AuthFailureReason';
      case _i5.AuthResult():
        return 'AuthResult';
      case _i6.AuthToken():
        return 'AuthToken';
      case _i7.Child():
        return 'Child';
      case _i8.CircleRank():
        return 'CircleRank';
      case _i9.DispatcherAccount():
        return 'DispatcherAccount';
      case _i10.Driver():
        return 'Driver';
      case _i11.Family():
        return 'Family';
      case _i12.FamilyCircle():
        return 'FamilyCircle';
      case _i13.ServerHealth():
        return 'ServerHealth';
      case _i14.Institution():
        return 'Institution';
      case _i15.InstitutionType():
        return 'InstitutionType';
      case _i16.LedgerEntry():
        return 'LedgerEntry';
      case _i17.LedgerEntryType():
        return 'LedgerEntryType';
      case _i18.NotificationChannel():
        return 'NotificationChannel';
      case _i19.NotificationOutbox():
        return 'NotificationOutbox';
      case _i20.NotificationStatus():
        return 'NotificationStatus';
      case _i21.OtpCode():
        return 'OtpCode';
      case _i22.Parent():
        return 'Parent';
      case _i23.ParentRole():
        return 'ParentRole';
      case _i24.Ride():
        return 'Ride';
      case _i25.RideEvent():
        return 'RideEvent';
      case _i26.RideEventType():
        return 'RideEventType';
      case _i27.RideStatus():
        return 'RideStatus';
      case _i28.RouteDirection():
        return 'RouteDirection';
      case _i29.RouteTemplate():
        return 'RouteTemplate';
      case _i30.SmsLevel():
        return 'SmsLevel';
      case _i31.VettingStatus():
        return 'VettingStatus';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AccountRole') {
      return deserialize<_i2.AccountRole>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i3.AuthException>(data['data']);
    }
    if (dataClassName == 'AuthFailureReason') {
      return deserialize<_i4.AuthFailureReason>(data['data']);
    }
    if (dataClassName == 'AuthResult') {
      return deserialize<_i5.AuthResult>(data['data']);
    }
    if (dataClassName == 'AuthToken') {
      return deserialize<_i6.AuthToken>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i7.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i8.CircleRank>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i9.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i10.Driver>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i11.Family>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i12.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i13.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i14.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i15.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i16.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i17.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i18.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i19.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i20.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i21.OtpCode>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i22.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i23.ParentRole>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i24.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i25.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i26.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i27.RideStatus>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i28.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i29.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i30.SmsLevel>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i31.VettingStatus>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
