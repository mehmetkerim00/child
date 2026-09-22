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
import 'balance_view.dart' as _i7;
import 'cash_top_up.dart' as _i8;
import 'child.dart' as _i9;
import 'circle_rank.dart' as _i10;
import 'dispatcher_account.dart' as _i11;
import 'dispatcher_task.dart' as _i12;
import 'dispatcher_task_kind.dart' as _i13;
import 'driver.dart' as _i14;
import 'family.dart' as _i15;
import 'family_circle.dart' as _i16;
import 'health/server_health.dart' as _i17;
import 'institution.dart' as _i18;
import 'institution_type.dart' as _i19;
import 'ledger_entry.dart' as _i20;
import 'ledger_entry_type.dart' as _i21;
import 'notification_channel.dart' as _i22;
import 'notification_outbox.dart' as _i23;
import 'notification_status.dart' as _i24;
import 'otp_code.dart' as _i25;
import 'parent.dart' as _i26;
import 'parent_role.dart' as _i27;
import 'ride.dart' as _i28;
import 'ride_event.dart' as _i29;
import 'ride_event_submission.dart' as _i30;
import 'ride_event_type.dart' as _i31;
import 'ride_flow_error.dart' as _i32;
import 'ride_flow_exception.dart' as _i33;
import 'ride_location.dart' as _i34;
import 'ride_location_point.dart' as _i35;
import 'ride_status.dart' as _i36;
import 'ride_view.dart' as _i37;
import 'route_direction.dart' as _i38;
import 'route_template.dart' as _i39;
import 'sms_level.dart' as _i40;
import 'tracking_state.dart' as _i41;
import 'vetting_status.dart' as _i42;
import 'package:child_client/src/protocol/family.dart' as _i43;
import 'package:child_client/src/protocol/parent.dart' as _i44;
import 'package:child_client/src/protocol/child.dart' as _i45;
import 'package:child_client/src/protocol/driver.dart' as _i46;
import 'package:child_client/src/protocol/institution.dart' as _i47;
import 'package:child_client/src/protocol/family_circle.dart' as _i48;
import 'package:child_client/src/protocol/route_template.dart' as _i49;
import 'package:child_client/src/protocol/ride_view.dart' as _i50;
import 'package:child_client/src/protocol/ride_event.dart' as _i51;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i52;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i53;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i54;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i55;
import 'package:child_client/src/protocol/ride_location.dart' as _i56;
export 'account_role.dart';
export 'auth_exception.dart';
export 'auth_failure.dart';
export 'auth_result.dart';
export 'auth_token.dart';
export 'balance_view.dart';
export 'cash_top_up.dart';
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
    if (t == _i7.BalanceView) {
      return _i7.BalanceView.fromJson(data) as T;
    }
    if (t == _i8.CashTopUp) {
      return _i8.CashTopUp.fromJson(data) as T;
    }
    if (t == _i9.Child) {
      return _i9.Child.fromJson(data) as T;
    }
    if (t == _i10.CircleRank) {
      return _i10.CircleRank.fromJson(data) as T;
    }
    if (t == _i11.DispatcherAccount) {
      return _i11.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i12.DispatcherTask) {
      return _i12.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i13.DispatcherTaskKind) {
      return _i13.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i14.Driver) {
      return _i14.Driver.fromJson(data) as T;
    }
    if (t == _i15.Family) {
      return _i15.Family.fromJson(data) as T;
    }
    if (t == _i16.FamilyCircle) {
      return _i16.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i17.ServerHealth) {
      return _i17.ServerHealth.fromJson(data) as T;
    }
    if (t == _i18.Institution) {
      return _i18.Institution.fromJson(data) as T;
    }
    if (t == _i19.InstitutionType) {
      return _i19.InstitutionType.fromJson(data) as T;
    }
    if (t == _i20.LedgerEntry) {
      return _i20.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i21.LedgerEntryType) {
      return _i21.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i22.NotificationChannel) {
      return _i22.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i23.NotificationOutbox) {
      return _i23.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i24.NotificationStatus) {
      return _i24.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i25.OtpCode) {
      return _i25.OtpCode.fromJson(data) as T;
    }
    if (t == _i26.Parent) {
      return _i26.Parent.fromJson(data) as T;
    }
    if (t == _i27.ParentRole) {
      return _i27.ParentRole.fromJson(data) as T;
    }
    if (t == _i28.Ride) {
      return _i28.Ride.fromJson(data) as T;
    }
    if (t == _i29.RideEvent) {
      return _i29.RideEvent.fromJson(data) as T;
    }
    if (t == _i30.RideEventSubmission) {
      return _i30.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i31.RideEventType) {
      return _i31.RideEventType.fromJson(data) as T;
    }
    if (t == _i32.RideFlowError) {
      return _i32.RideFlowError.fromJson(data) as T;
    }
    if (t == _i33.RideFlowException) {
      return _i33.RideFlowException.fromJson(data) as T;
    }
    if (t == _i34.RideLocation) {
      return _i34.RideLocation.fromJson(data) as T;
    }
    if (t == _i35.RideLocationPoint) {
      return _i35.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i36.RideStatus) {
      return _i36.RideStatus.fromJson(data) as T;
    }
    if (t == _i37.RideView) {
      return _i37.RideView.fromJson(data) as T;
    }
    if (t == _i38.RouteDirection) {
      return _i38.RouteDirection.fromJson(data) as T;
    }
    if (t == _i39.RouteTemplate) {
      return _i39.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i40.SmsLevel) {
      return _i40.SmsLevel.fromJson(data) as T;
    }
    if (t == _i41.TrackingState) {
      return _i41.TrackingState.fromJson(data) as T;
    }
    if (t == _i42.VettingStatus) {
      return _i42.VettingStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i7.BalanceView?>()) {
      return (data != null ? _i7.BalanceView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CashTopUp?>()) {
      return (data != null ? _i8.CashTopUp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Child?>()) {
      return (data != null ? _i9.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CircleRank?>()) {
      return (data != null ? _i10.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DispatcherAccount?>()) {
      return (data != null ? _i11.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DispatcherTask?>()) {
      return (data != null ? _i12.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.DispatcherTaskKind?>()) {
      return (data != null ? _i13.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.Driver?>()) {
      return (data != null ? _i14.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Family?>()) {
      return (data != null ? _i15.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.FamilyCircle?>()) {
      return (data != null ? _i16.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ServerHealth?>()) {
      return (data != null ? _i17.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Institution?>()) {
      return (data != null ? _i18.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.InstitutionType?>()) {
      return (data != null ? _i19.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.LedgerEntry?>()) {
      return (data != null ? _i20.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.LedgerEntryType?>()) {
      return (data != null ? _i21.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.NotificationChannel?>()) {
      return (data != null ? _i22.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.NotificationOutbox?>()) {
      return (data != null ? _i23.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.NotificationStatus?>()) {
      return (data != null ? _i24.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.OtpCode?>()) {
      return (data != null ? _i25.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Parent?>()) {
      return (data != null ? _i26.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.ParentRole?>()) {
      return (data != null ? _i27.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Ride?>()) {
      return (data != null ? _i28.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.RideEvent?>()) {
      return (data != null ? _i29.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.RideEventSubmission?>()) {
      return (data != null ? _i30.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.RideEventType?>()) {
      return (data != null ? _i31.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.RideFlowError?>()) {
      return (data != null ? _i32.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.RideFlowException?>()) {
      return (data != null ? _i33.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.RideLocation?>()) {
      return (data != null ? _i34.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.RideLocationPoint?>()) {
      return (data != null ? _i35.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.RideStatus?>()) {
      return (data != null ? _i36.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.RideView?>()) {
      return (data != null ? _i37.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.RouteDirection?>()) {
      return (data != null ? _i38.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.RouteTemplate?>()) {
      return (data != null ? _i39.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.SmsLevel?>()) {
      return (data != null ? _i40.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.TrackingState?>()) {
      return (data != null ? _i41.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.VettingStatus?>()) {
      return (data != null ? _i42.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i20.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i20.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i43.Family>) {
      return (data as List).map((e) => deserialize<_i43.Family>(e)).toList()
          as T;
    }
    if (t == List<_i44.Parent>) {
      return (data as List).map((e) => deserialize<_i44.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i45.Child>) {
      return (data as List).map((e) => deserialize<_i45.Child>(e)).toList()
          as T;
    }
    if (t == List<_i46.Driver>) {
      return (data as List).map((e) => deserialize<_i46.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i47.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i47.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i48.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i49.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i50.RideView>) {
      return (data as List).map((e) => deserialize<_i50.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i51.RideEvent>) {
      return (data as List).map((e) => deserialize<_i51.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i52.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i52.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i53.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i54.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i54.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i55.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i55.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i56.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i56.RideLocation>(e))
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
      _i7.BalanceView => 'BalanceView',
      _i8.CashTopUp => 'CashTopUp',
      _i9.Child => 'Child',
      _i10.CircleRank => 'CircleRank',
      _i11.DispatcherAccount => 'DispatcherAccount',
      _i12.DispatcherTask => 'DispatcherTask',
      _i13.DispatcherTaskKind => 'DispatcherTaskKind',
      _i14.Driver => 'Driver',
      _i15.Family => 'Family',
      _i16.FamilyCircle => 'FamilyCircle',
      _i17.ServerHealth => 'ServerHealth',
      _i18.Institution => 'Institution',
      _i19.InstitutionType => 'InstitutionType',
      _i20.LedgerEntry => 'LedgerEntry',
      _i21.LedgerEntryType => 'LedgerEntryType',
      _i22.NotificationChannel => 'NotificationChannel',
      _i23.NotificationOutbox => 'NotificationOutbox',
      _i24.NotificationStatus => 'NotificationStatus',
      _i25.OtpCode => 'OtpCode',
      _i26.Parent => 'Parent',
      _i27.ParentRole => 'ParentRole',
      _i28.Ride => 'Ride',
      _i29.RideEvent => 'RideEvent',
      _i30.RideEventSubmission => 'RideEventSubmission',
      _i31.RideEventType => 'RideEventType',
      _i32.RideFlowError => 'RideFlowError',
      _i33.RideFlowException => 'RideFlowException',
      _i34.RideLocation => 'RideLocation',
      _i35.RideLocationPoint => 'RideLocationPoint',
      _i36.RideStatus => 'RideStatus',
      _i37.RideView => 'RideView',
      _i38.RouteDirection => 'RouteDirection',
      _i39.RouteTemplate => 'RouteTemplate',
      _i40.SmsLevel => 'SmsLevel',
      _i41.TrackingState => 'TrackingState',
      _i42.VettingStatus => 'VettingStatus',
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
      case _i7.BalanceView():
        return 'BalanceView';
      case _i8.CashTopUp():
        return 'CashTopUp';
      case _i9.Child():
        return 'Child';
      case _i10.CircleRank():
        return 'CircleRank';
      case _i11.DispatcherAccount():
        return 'DispatcherAccount';
      case _i12.DispatcherTask():
        return 'DispatcherTask';
      case _i13.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i14.Driver():
        return 'Driver';
      case _i15.Family():
        return 'Family';
      case _i16.FamilyCircle():
        return 'FamilyCircle';
      case _i17.ServerHealth():
        return 'ServerHealth';
      case _i18.Institution():
        return 'Institution';
      case _i19.InstitutionType():
        return 'InstitutionType';
      case _i20.LedgerEntry():
        return 'LedgerEntry';
      case _i21.LedgerEntryType():
        return 'LedgerEntryType';
      case _i22.NotificationChannel():
        return 'NotificationChannel';
      case _i23.NotificationOutbox():
        return 'NotificationOutbox';
      case _i24.NotificationStatus():
        return 'NotificationStatus';
      case _i25.OtpCode():
        return 'OtpCode';
      case _i26.Parent():
        return 'Parent';
      case _i27.ParentRole():
        return 'ParentRole';
      case _i28.Ride():
        return 'Ride';
      case _i29.RideEvent():
        return 'RideEvent';
      case _i30.RideEventSubmission():
        return 'RideEventSubmission';
      case _i31.RideEventType():
        return 'RideEventType';
      case _i32.RideFlowError():
        return 'RideFlowError';
      case _i33.RideFlowException():
        return 'RideFlowException';
      case _i34.RideLocation():
        return 'RideLocation';
      case _i35.RideLocationPoint():
        return 'RideLocationPoint';
      case _i36.RideStatus():
        return 'RideStatus';
      case _i37.RideView():
        return 'RideView';
      case _i38.RouteDirection():
        return 'RouteDirection';
      case _i39.RouteTemplate():
        return 'RouteTemplate';
      case _i40.SmsLevel():
        return 'SmsLevel';
      case _i41.TrackingState():
        return 'TrackingState';
      case _i42.VettingStatus():
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
    if (dataClassName == 'BalanceView') {
      return deserialize<_i7.BalanceView>(data['data']);
    }
    if (dataClassName == 'CashTopUp') {
      return deserialize<_i8.CashTopUp>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i9.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i10.CircleRank>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i11.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i12.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i13.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i14.Driver>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i15.Family>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i16.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i17.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i18.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i19.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i20.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i21.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i22.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i23.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i24.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i25.OtpCode>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i26.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i27.ParentRole>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i28.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i29.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i30.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i31.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i32.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i33.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i34.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i35.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i36.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i37.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i38.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i39.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i40.SmsLevel>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i41.TrackingState>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i42.VettingStatus>(data['data']);
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
