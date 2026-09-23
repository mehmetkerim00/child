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
import 'chat_message.dart' as _i9;
import 'chat_thread.dart' as _i10;
import 'child.dart' as _i11;
import 'circle_rank.dart' as _i12;
import 'dispatcher_account.dart' as _i13;
import 'dispatcher_task.dart' as _i14;
import 'dispatcher_task_kind.dart' as _i15;
import 'driver.dart' as _i16;
import 'family.dart' as _i17;
import 'family_circle.dart' as _i18;
import 'health/server_health.dart' as _i19;
import 'institution.dart' as _i20;
import 'institution_access.dart' as _i21;
import 'institution_child_row.dart' as _i22;
import 'institution_day_view.dart' as _i23;
import 'institution_type.dart' as _i24;
import 'ledger_entry.dart' as _i25;
import 'ledger_entry_type.dart' as _i26;
import 'notification_channel.dart' as _i27;
import 'notification_outbox.dart' as _i28;
import 'notification_status.dart' as _i29;
import 'otp_code.dart' as _i30;
import 'parent.dart' as _i31;
import 'parent_role.dart' as _i32;
import 'pool_candidate.dart' as _i33;
import 'pool_capacity.dart' as _i34;
import 'quick_phrase.dart' as _i35;
import 'ride.dart' as _i36;
import 'ride_event.dart' as _i37;
import 'ride_event_submission.dart' as _i38;
import 'ride_event_type.dart' as _i39;
import 'ride_flow_error.dart' as _i40;
import 'ride_flow_exception.dart' as _i41;
import 'ride_location.dart' as _i42;
import 'ride_location_point.dart' as _i43;
import 'ride_seat.dart' as _i44;
import 'ride_status.dart' as _i45;
import 'ride_view.dart' as _i46;
import 'route_direction.dart' as _i47;
import 'route_template.dart' as _i48;
import 'sms_level.dart' as _i49;
import 'tracking_state.dart' as _i50;
import 'vetting_status.dart' as _i51;
import 'package:child_client/src/protocol/chat_message.dart' as _i52;
import 'package:child_client/src/protocol/family.dart' as _i53;
import 'package:child_client/src/protocol/parent.dart' as _i54;
import 'package:child_client/src/protocol/child.dart' as _i55;
import 'package:child_client/src/protocol/driver.dart' as _i56;
import 'package:child_client/src/protocol/institution.dart' as _i57;
import 'package:child_client/src/protocol/family_circle.dart' as _i58;
import 'package:child_client/src/protocol/route_template.dart' as _i59;
import 'package:child_client/src/protocol/ride_view.dart' as _i60;
import 'package:child_client/src/protocol/ride_event.dart' as _i61;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i62;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i63;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i64;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i65;
import 'package:child_client/src/protocol/ride_seat.dart' as _i66;
import 'package:child_client/src/protocol/institution_access.dart' as _i67;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i68;
import 'package:child_client/src/protocol/ride_location.dart' as _i69;
export 'account_role.dart';
export 'auth_exception.dart';
export 'auth_failure.dart';
export 'auth_result.dart';
export 'auth_token.dart';
export 'balance_view.dart';
export 'cash_top_up.dart';
export 'chat_message.dart';
export 'chat_thread.dart';
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
export 'institution_access.dart';
export 'institution_child_row.dart';
export 'institution_day_view.dart';
export 'institution_type.dart';
export 'ledger_entry.dart';
export 'ledger_entry_type.dart';
export 'notification_channel.dart';
export 'notification_outbox.dart';
export 'notification_status.dart';
export 'otp_code.dart';
export 'parent.dart';
export 'parent_role.dart';
export 'pool_candidate.dart';
export 'pool_capacity.dart';
export 'quick_phrase.dart';
export 'ride.dart';
export 'ride_event.dart';
export 'ride_event_submission.dart';
export 'ride_event_type.dart';
export 'ride_flow_error.dart';
export 'ride_flow_exception.dart';
export 'ride_location.dart';
export 'ride_location_point.dart';
export 'ride_seat.dart';
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
    if (t == _i9.ChatMessage) {
      return _i9.ChatMessage.fromJson(data) as T;
    }
    if (t == _i10.ChatThread) {
      return _i10.ChatThread.fromJson(data) as T;
    }
    if (t == _i11.Child) {
      return _i11.Child.fromJson(data) as T;
    }
    if (t == _i12.CircleRank) {
      return _i12.CircleRank.fromJson(data) as T;
    }
    if (t == _i13.DispatcherAccount) {
      return _i13.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i14.DispatcherTask) {
      return _i14.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i15.DispatcherTaskKind) {
      return _i15.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i16.Driver) {
      return _i16.Driver.fromJson(data) as T;
    }
    if (t == _i17.Family) {
      return _i17.Family.fromJson(data) as T;
    }
    if (t == _i18.FamilyCircle) {
      return _i18.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i19.ServerHealth) {
      return _i19.ServerHealth.fromJson(data) as T;
    }
    if (t == _i20.Institution) {
      return _i20.Institution.fromJson(data) as T;
    }
    if (t == _i21.InstitutionAccess) {
      return _i21.InstitutionAccess.fromJson(data) as T;
    }
    if (t == _i22.InstitutionChildRow) {
      return _i22.InstitutionChildRow.fromJson(data) as T;
    }
    if (t == _i23.InstitutionDayView) {
      return _i23.InstitutionDayView.fromJson(data) as T;
    }
    if (t == _i24.InstitutionType) {
      return _i24.InstitutionType.fromJson(data) as T;
    }
    if (t == _i25.LedgerEntry) {
      return _i25.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i26.LedgerEntryType) {
      return _i26.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i27.NotificationChannel) {
      return _i27.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i28.NotificationOutbox) {
      return _i28.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i29.NotificationStatus) {
      return _i29.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i30.OtpCode) {
      return _i30.OtpCode.fromJson(data) as T;
    }
    if (t == _i31.Parent) {
      return _i31.Parent.fromJson(data) as T;
    }
    if (t == _i32.ParentRole) {
      return _i32.ParentRole.fromJson(data) as T;
    }
    if (t == _i33.PoolCandidate) {
      return _i33.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i34.PoolCapacity) {
      return _i34.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i35.QuickPhrase) {
      return _i35.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i36.Ride) {
      return _i36.Ride.fromJson(data) as T;
    }
    if (t == _i37.RideEvent) {
      return _i37.RideEvent.fromJson(data) as T;
    }
    if (t == _i38.RideEventSubmission) {
      return _i38.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i39.RideEventType) {
      return _i39.RideEventType.fromJson(data) as T;
    }
    if (t == _i40.RideFlowError) {
      return _i40.RideFlowError.fromJson(data) as T;
    }
    if (t == _i41.RideFlowException) {
      return _i41.RideFlowException.fromJson(data) as T;
    }
    if (t == _i42.RideLocation) {
      return _i42.RideLocation.fromJson(data) as T;
    }
    if (t == _i43.RideLocationPoint) {
      return _i43.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i44.RideSeat) {
      return _i44.RideSeat.fromJson(data) as T;
    }
    if (t == _i45.RideStatus) {
      return _i45.RideStatus.fromJson(data) as T;
    }
    if (t == _i46.RideView) {
      return _i46.RideView.fromJson(data) as T;
    }
    if (t == _i47.RouteDirection) {
      return _i47.RouteDirection.fromJson(data) as T;
    }
    if (t == _i48.RouteTemplate) {
      return _i48.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i49.SmsLevel) {
      return _i49.SmsLevel.fromJson(data) as T;
    }
    if (t == _i50.TrackingState) {
      return _i50.TrackingState.fromJson(data) as T;
    }
    if (t == _i51.VettingStatus) {
      return _i51.VettingStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i9.ChatMessage?>()) {
      return (data != null ? _i9.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ChatThread?>()) {
      return (data != null ? _i10.ChatThread.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Child?>()) {
      return (data != null ? _i11.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.CircleRank?>()) {
      return (data != null ? _i12.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.DispatcherAccount?>()) {
      return (data != null ? _i13.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DispatcherTask?>()) {
      return (data != null ? _i14.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.DispatcherTaskKind?>()) {
      return (data != null ? _i15.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.Driver?>()) {
      return (data != null ? _i16.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Family?>()) {
      return (data != null ? _i17.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.FamilyCircle?>()) {
      return (data != null ? _i18.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.ServerHealth?>()) {
      return (data != null ? _i19.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Institution?>()) {
      return (data != null ? _i20.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.InstitutionAccess?>()) {
      return (data != null ? _i21.InstitutionAccess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.InstitutionChildRow?>()) {
      return (data != null ? _i22.InstitutionChildRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.InstitutionDayView?>()) {
      return (data != null ? _i23.InstitutionDayView.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.InstitutionType?>()) {
      return (data != null ? _i24.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.LedgerEntry?>()) {
      return (data != null ? _i25.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.LedgerEntryType?>()) {
      return (data != null ? _i26.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.NotificationChannel?>()) {
      return (data != null ? _i27.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.NotificationOutbox?>()) {
      return (data != null ? _i28.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.NotificationStatus?>()) {
      return (data != null ? _i29.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.OtpCode?>()) {
      return (data != null ? _i30.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Parent?>()) {
      return (data != null ? _i31.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ParentRole?>()) {
      return (data != null ? _i32.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.PoolCandidate?>()) {
      return (data != null ? _i33.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PoolCapacity?>()) {
      return (data != null ? _i34.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.QuickPhrase?>()) {
      return (data != null ? _i35.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.Ride?>()) {
      return (data != null ? _i36.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.RideEvent?>()) {
      return (data != null ? _i37.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.RideEventSubmission?>()) {
      return (data != null ? _i38.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.RideEventType?>()) {
      return (data != null ? _i39.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.RideFlowError?>()) {
      return (data != null ? _i40.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.RideFlowException?>()) {
      return (data != null ? _i41.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.RideLocation?>()) {
      return (data != null ? _i42.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.RideLocationPoint?>()) {
      return (data != null ? _i43.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.RideSeat?>()) {
      return (data != null ? _i44.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.RideStatus?>()) {
      return (data != null ? _i45.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.RideView?>()) {
      return (data != null ? _i46.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.RouteDirection?>()) {
      return (data != null ? _i47.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.RouteTemplate?>()) {
      return (data != null ? _i48.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.SmsLevel?>()) {
      return (data != null ? _i49.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.TrackingState?>()) {
      return (data != null ? _i50.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.VettingStatus?>()) {
      return (data != null ? _i51.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i25.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i25.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i22.InstitutionChildRow>) {
      return (data as List)
              .map((e) => deserialize<_i22.InstitutionChildRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i44.RideSeat>) {
      return (data as List).map((e) => deserialize<_i44.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i44.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i44.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i52.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i52.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.Family>) {
      return (data as List).map((e) => deserialize<_i53.Family>(e)).toList()
          as T;
    }
    if (t == List<_i54.Parent>) {
      return (data as List).map((e) => deserialize<_i54.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i55.Child>) {
      return (data as List).map((e) => deserialize<_i55.Child>(e)).toList()
          as T;
    }
    if (t == List<_i56.Driver>) {
      return (data as List).map((e) => deserialize<_i56.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i57.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i57.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i58.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i58.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i59.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.RideView>) {
      return (data as List).map((e) => deserialize<_i60.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i61.RideEvent>) {
      return (data as List).map((e) => deserialize<_i61.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i62.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i62.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i63.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i63.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i64.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i65.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i65.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i66.RideSeat>) {
      return (data as List).map((e) => deserialize<_i66.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i67.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i67.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i68.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i69.RideLocation>(e))
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
      _i9.ChatMessage => 'ChatMessage',
      _i10.ChatThread => 'ChatThread',
      _i11.Child => 'Child',
      _i12.CircleRank => 'CircleRank',
      _i13.DispatcherAccount => 'DispatcherAccount',
      _i14.DispatcherTask => 'DispatcherTask',
      _i15.DispatcherTaskKind => 'DispatcherTaskKind',
      _i16.Driver => 'Driver',
      _i17.Family => 'Family',
      _i18.FamilyCircle => 'FamilyCircle',
      _i19.ServerHealth => 'ServerHealth',
      _i20.Institution => 'Institution',
      _i21.InstitutionAccess => 'InstitutionAccess',
      _i22.InstitutionChildRow => 'InstitutionChildRow',
      _i23.InstitutionDayView => 'InstitutionDayView',
      _i24.InstitutionType => 'InstitutionType',
      _i25.LedgerEntry => 'LedgerEntry',
      _i26.LedgerEntryType => 'LedgerEntryType',
      _i27.NotificationChannel => 'NotificationChannel',
      _i28.NotificationOutbox => 'NotificationOutbox',
      _i29.NotificationStatus => 'NotificationStatus',
      _i30.OtpCode => 'OtpCode',
      _i31.Parent => 'Parent',
      _i32.ParentRole => 'ParentRole',
      _i33.PoolCandidate => 'PoolCandidate',
      _i34.PoolCapacity => 'PoolCapacity',
      _i35.QuickPhrase => 'QuickPhrase',
      _i36.Ride => 'Ride',
      _i37.RideEvent => 'RideEvent',
      _i38.RideEventSubmission => 'RideEventSubmission',
      _i39.RideEventType => 'RideEventType',
      _i40.RideFlowError => 'RideFlowError',
      _i41.RideFlowException => 'RideFlowException',
      _i42.RideLocation => 'RideLocation',
      _i43.RideLocationPoint => 'RideLocationPoint',
      _i44.RideSeat => 'RideSeat',
      _i45.RideStatus => 'RideStatus',
      _i46.RideView => 'RideView',
      _i47.RouteDirection => 'RouteDirection',
      _i48.RouteTemplate => 'RouteTemplate',
      _i49.SmsLevel => 'SmsLevel',
      _i50.TrackingState => 'TrackingState',
      _i51.VettingStatus => 'VettingStatus',
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
      case _i9.ChatMessage():
        return 'ChatMessage';
      case _i10.ChatThread():
        return 'ChatThread';
      case _i11.Child():
        return 'Child';
      case _i12.CircleRank():
        return 'CircleRank';
      case _i13.DispatcherAccount():
        return 'DispatcherAccount';
      case _i14.DispatcherTask():
        return 'DispatcherTask';
      case _i15.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i16.Driver():
        return 'Driver';
      case _i17.Family():
        return 'Family';
      case _i18.FamilyCircle():
        return 'FamilyCircle';
      case _i19.ServerHealth():
        return 'ServerHealth';
      case _i20.Institution():
        return 'Institution';
      case _i21.InstitutionAccess():
        return 'InstitutionAccess';
      case _i22.InstitutionChildRow():
        return 'InstitutionChildRow';
      case _i23.InstitutionDayView():
        return 'InstitutionDayView';
      case _i24.InstitutionType():
        return 'InstitutionType';
      case _i25.LedgerEntry():
        return 'LedgerEntry';
      case _i26.LedgerEntryType():
        return 'LedgerEntryType';
      case _i27.NotificationChannel():
        return 'NotificationChannel';
      case _i28.NotificationOutbox():
        return 'NotificationOutbox';
      case _i29.NotificationStatus():
        return 'NotificationStatus';
      case _i30.OtpCode():
        return 'OtpCode';
      case _i31.Parent():
        return 'Parent';
      case _i32.ParentRole():
        return 'ParentRole';
      case _i33.PoolCandidate():
        return 'PoolCandidate';
      case _i34.PoolCapacity():
        return 'PoolCapacity';
      case _i35.QuickPhrase():
        return 'QuickPhrase';
      case _i36.Ride():
        return 'Ride';
      case _i37.RideEvent():
        return 'RideEvent';
      case _i38.RideEventSubmission():
        return 'RideEventSubmission';
      case _i39.RideEventType():
        return 'RideEventType';
      case _i40.RideFlowError():
        return 'RideFlowError';
      case _i41.RideFlowException():
        return 'RideFlowException';
      case _i42.RideLocation():
        return 'RideLocation';
      case _i43.RideLocationPoint():
        return 'RideLocationPoint';
      case _i44.RideSeat():
        return 'RideSeat';
      case _i45.RideStatus():
        return 'RideStatus';
      case _i46.RideView():
        return 'RideView';
      case _i47.RouteDirection():
        return 'RouteDirection';
      case _i48.RouteTemplate():
        return 'RouteTemplate';
      case _i49.SmsLevel():
        return 'SmsLevel';
      case _i50.TrackingState():
        return 'TrackingState';
      case _i51.VettingStatus():
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
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i9.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatThread') {
      return deserialize<_i10.ChatThread>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i11.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i12.CircleRank>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i13.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i14.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i15.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i16.Driver>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i17.Family>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i18.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i19.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i20.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionAccess') {
      return deserialize<_i21.InstitutionAccess>(data['data']);
    }
    if (dataClassName == 'InstitutionChildRow') {
      return deserialize<_i22.InstitutionChildRow>(data['data']);
    }
    if (dataClassName == 'InstitutionDayView') {
      return deserialize<_i23.InstitutionDayView>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i24.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i25.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i26.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i27.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i28.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i29.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i30.OtpCode>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i31.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i32.ParentRole>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i33.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i34.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i35.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i36.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i37.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i38.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i39.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i40.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i41.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i42.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i43.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i44.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i45.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i46.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i47.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i48.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i49.SmsLevel>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i50.TrackingState>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i51.VettingStatus>(data['data']);
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
