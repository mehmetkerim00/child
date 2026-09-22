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
import 'dispatcher_task.dart' as _i10;
import 'dispatcher_task_kind.dart' as _i11;
import 'driver.dart' as _i12;
import 'family.dart' as _i13;
import 'family_circle.dart' as _i14;
import 'health/server_health.dart' as _i15;
import 'institution.dart' as _i16;
import 'institution_type.dart' as _i17;
import 'ledger_entry.dart' as _i18;
import 'ledger_entry_type.dart' as _i19;
import 'notification_channel.dart' as _i20;
import 'notification_outbox.dart' as _i21;
import 'notification_status.dart' as _i22;
import 'otp_code.dart' as _i23;
import 'parent.dart' as _i24;
import 'parent_role.dart' as _i25;
import 'ride.dart' as _i26;
import 'ride_event.dart' as _i27;
import 'ride_event_submission.dart' as _i28;
import 'ride_event_type.dart' as _i29;
import 'ride_flow_error.dart' as _i30;
import 'ride_flow_exception.dart' as _i31;
import 'ride_location.dart' as _i32;
import 'ride_location_point.dart' as _i33;
import 'ride_status.dart' as _i34;
import 'ride_view.dart' as _i35;
import 'route_direction.dart' as _i36;
import 'route_template.dart' as _i37;
import 'sms_level.dart' as _i38;
import 'tracking_state.dart' as _i39;
import 'vetting_status.dart' as _i40;
import 'package:child_client/src/protocol/family.dart' as _i41;
import 'package:child_client/src/protocol/parent.dart' as _i42;
import 'package:child_client/src/protocol/child.dart' as _i43;
import 'package:child_client/src/protocol/driver.dart' as _i44;
import 'package:child_client/src/protocol/institution.dart' as _i45;
import 'package:child_client/src/protocol/family_circle.dart' as _i46;
import 'package:child_client/src/protocol/route_template.dart' as _i47;
import 'package:child_client/src/protocol/ride_view.dart' as _i48;
import 'package:child_client/src/protocol/ride_event.dart' as _i49;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i50;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i51;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i52;
import 'package:child_client/src/protocol/ride_location.dart' as _i53;
export 'account_role.dart';
export 'auth_exception.dart';
export 'auth_failure.dart';
export 'auth_result.dart';
export 'auth_token.dart';
export 'child.dart';
export 'circle_rank.dart';
export 'dispatcher_account.dart';
export 'dispatcher_task.dart';
export 'dispatcher_task_kind.dart';
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
export 'ride_event_submission.dart';
export 'ride_event_type.dart';
export 'ride_flow_error.dart';
export 'ride_flow_exception.dart';
export 'ride_location.dart';
export 'ride_location_point.dart';
export 'ride_status.dart';
export 'ride_view.dart';
export 'route_direction.dart';
export 'route_template.dart';
export 'sms_level.dart';
export 'tracking_state.dart';
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
    if (t == _i10.DispatcherTask) {
      return _i10.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i11.DispatcherTaskKind) {
      return _i11.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i12.Driver) {
      return _i12.Driver.fromJson(data) as T;
    }
    if (t == _i13.Family) {
      return _i13.Family.fromJson(data) as T;
    }
    if (t == _i14.FamilyCircle) {
      return _i14.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i15.ServerHealth) {
      return _i15.ServerHealth.fromJson(data) as T;
    }
    if (t == _i16.Institution) {
      return _i16.Institution.fromJson(data) as T;
    }
    if (t == _i17.InstitutionType) {
      return _i17.InstitutionType.fromJson(data) as T;
    }
    if (t == _i18.LedgerEntry) {
      return _i18.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i19.LedgerEntryType) {
      return _i19.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i20.NotificationChannel) {
      return _i20.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i21.NotificationOutbox) {
      return _i21.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i22.NotificationStatus) {
      return _i22.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i23.OtpCode) {
      return _i23.OtpCode.fromJson(data) as T;
    }
    if (t == _i24.Parent) {
      return _i24.Parent.fromJson(data) as T;
    }
    if (t == _i25.ParentRole) {
      return _i25.ParentRole.fromJson(data) as T;
    }
    if (t == _i26.Ride) {
      return _i26.Ride.fromJson(data) as T;
    }
    if (t == _i27.RideEvent) {
      return _i27.RideEvent.fromJson(data) as T;
    }
    if (t == _i28.RideEventSubmission) {
      return _i28.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i29.RideEventType) {
      return _i29.RideEventType.fromJson(data) as T;
    }
    if (t == _i30.RideFlowError) {
      return _i30.RideFlowError.fromJson(data) as T;
    }
    if (t == _i31.RideFlowException) {
      return _i31.RideFlowException.fromJson(data) as T;
    }
    if (t == _i32.RideLocation) {
      return _i32.RideLocation.fromJson(data) as T;
    }
    if (t == _i33.RideLocationPoint) {
      return _i33.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i34.RideStatus) {
      return _i34.RideStatus.fromJson(data) as T;
    }
    if (t == _i35.RideView) {
      return _i35.RideView.fromJson(data) as T;
    }
    if (t == _i36.RouteDirection) {
      return _i36.RouteDirection.fromJson(data) as T;
    }
    if (t == _i37.RouteTemplate) {
      return _i37.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i38.SmsLevel) {
      return _i38.SmsLevel.fromJson(data) as T;
    }
    if (t == _i39.TrackingState) {
      return _i39.TrackingState.fromJson(data) as T;
    }
    if (t == _i40.VettingStatus) {
      return _i40.VettingStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i10.DispatcherTask?>()) {
      return (data != null ? _i10.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DispatcherTaskKind?>()) {
      return (data != null ? _i11.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.Driver?>()) {
      return (data != null ? _i12.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Family?>()) {
      return (data != null ? _i13.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.FamilyCircle?>()) {
      return (data != null ? _i14.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ServerHealth?>()) {
      return (data != null ? _i15.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Institution?>()) {
      return (data != null ? _i16.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.InstitutionType?>()) {
      return (data != null ? _i17.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.LedgerEntry?>()) {
      return (data != null ? _i18.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.LedgerEntryType?>()) {
      return (data != null ? _i19.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.NotificationChannel?>()) {
      return (data != null ? _i20.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.NotificationOutbox?>()) {
      return (data != null ? _i21.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.NotificationStatus?>()) {
      return (data != null ? _i22.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.OtpCode?>()) {
      return (data != null ? _i23.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Parent?>()) {
      return (data != null ? _i24.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ParentRole?>()) {
      return (data != null ? _i25.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Ride?>()) {
      return (data != null ? _i26.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RideEvent?>()) {
      return (data != null ? _i27.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.RideEventSubmission?>()) {
      return (data != null ? _i28.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.RideEventType?>()) {
      return (data != null ? _i29.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.RideFlowError?>()) {
      return (data != null ? _i30.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.RideFlowException?>()) {
      return (data != null ? _i31.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.RideLocation?>()) {
      return (data != null ? _i32.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.RideLocationPoint?>()) {
      return (data != null ? _i33.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.RideStatus?>()) {
      return (data != null ? _i34.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.RideView?>()) {
      return (data != null ? _i35.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.RouteDirection?>()) {
      return (data != null ? _i36.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.RouteTemplate?>()) {
      return (data != null ? _i37.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.SmsLevel?>()) {
      return (data != null ? _i38.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.TrackingState?>()) {
      return (data != null ? _i39.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.VettingStatus?>()) {
      return (data != null ? _i40.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i41.Family>) {
      return (data as List).map((e) => deserialize<_i41.Family>(e)).toList()
          as T;
    }
    if (t == List<_i42.Parent>) {
      return (data as List).map((e) => deserialize<_i42.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i43.Child>) {
      return (data as List).map((e) => deserialize<_i43.Child>(e)).toList()
          as T;
    }
    if (t == List<_i44.Driver>) {
      return (data as List).map((e) => deserialize<_i44.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i45.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i45.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i46.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i46.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i47.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i47.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.RideView>) {
      return (data as List).map((e) => deserialize<_i48.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i49.RideEvent>) {
      return (data as List).map((e) => deserialize<_i49.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i50.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i50.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i51.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i52.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i53.RideLocation>(e))
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
      _i10.DispatcherTask => 'DispatcherTask',
      _i11.DispatcherTaskKind => 'DispatcherTaskKind',
      _i12.Driver => 'Driver',
      _i13.Family => 'Family',
      _i14.FamilyCircle => 'FamilyCircle',
      _i15.ServerHealth => 'ServerHealth',
      _i16.Institution => 'Institution',
      _i17.InstitutionType => 'InstitutionType',
      _i18.LedgerEntry => 'LedgerEntry',
      _i19.LedgerEntryType => 'LedgerEntryType',
      _i20.NotificationChannel => 'NotificationChannel',
      _i21.NotificationOutbox => 'NotificationOutbox',
      _i22.NotificationStatus => 'NotificationStatus',
      _i23.OtpCode => 'OtpCode',
      _i24.Parent => 'Parent',
      _i25.ParentRole => 'ParentRole',
      _i26.Ride => 'Ride',
      _i27.RideEvent => 'RideEvent',
      _i28.RideEventSubmission => 'RideEventSubmission',
      _i29.RideEventType => 'RideEventType',
      _i30.RideFlowError => 'RideFlowError',
      _i31.RideFlowException => 'RideFlowException',
      _i32.RideLocation => 'RideLocation',
      _i33.RideLocationPoint => 'RideLocationPoint',
      _i34.RideStatus => 'RideStatus',
      _i35.RideView => 'RideView',
      _i36.RouteDirection => 'RouteDirection',
      _i37.RouteTemplate => 'RouteTemplate',
      _i38.SmsLevel => 'SmsLevel',
      _i39.TrackingState => 'TrackingState',
      _i40.VettingStatus => 'VettingStatus',
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
      case _i10.DispatcherTask():
        return 'DispatcherTask';
      case _i11.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i12.Driver():
        return 'Driver';
      case _i13.Family():
        return 'Family';
      case _i14.FamilyCircle():
        return 'FamilyCircle';
      case _i15.ServerHealth():
        return 'ServerHealth';
      case _i16.Institution():
        return 'Institution';
      case _i17.InstitutionType():
        return 'InstitutionType';
      case _i18.LedgerEntry():
        return 'LedgerEntry';
      case _i19.LedgerEntryType():
        return 'LedgerEntryType';
      case _i20.NotificationChannel():
        return 'NotificationChannel';
      case _i21.NotificationOutbox():
        return 'NotificationOutbox';
      case _i22.NotificationStatus():
        return 'NotificationStatus';
      case _i23.OtpCode():
        return 'OtpCode';
      case _i24.Parent():
        return 'Parent';
      case _i25.ParentRole():
        return 'ParentRole';
      case _i26.Ride():
        return 'Ride';
      case _i27.RideEvent():
        return 'RideEvent';
      case _i28.RideEventSubmission():
        return 'RideEventSubmission';
      case _i29.RideEventType():
        return 'RideEventType';
      case _i30.RideFlowError():
        return 'RideFlowError';
      case _i31.RideFlowException():
        return 'RideFlowException';
      case _i32.RideLocation():
        return 'RideLocation';
      case _i33.RideLocationPoint():
        return 'RideLocationPoint';
      case _i34.RideStatus():
        return 'RideStatus';
      case _i35.RideView():
        return 'RideView';
      case _i36.RouteDirection():
        return 'RouteDirection';
      case _i37.RouteTemplate():
        return 'RouteTemplate';
      case _i38.SmsLevel():
        return 'SmsLevel';
      case _i39.TrackingState():
        return 'TrackingState';
      case _i40.VettingStatus():
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
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i10.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i11.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i12.Driver>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i13.Family>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i14.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i15.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i16.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i17.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i18.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i19.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i20.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i21.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i22.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i23.OtpCode>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i24.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i25.ParentRole>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i26.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i27.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i28.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i29.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i30.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i31.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i32.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i33.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i34.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i35.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i36.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i37.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i38.SmsLevel>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i39.TrackingState>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i40.VettingStatus>(data['data']);
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
