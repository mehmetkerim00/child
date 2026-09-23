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
import 'application_check.dart' as _i3;
import 'application_status.dart' as _i4;
import 'auth_exception.dart' as _i5;
import 'auth_failure.dart' as _i6;
import 'auth_result.dart' as _i7;
import 'auth_token.dart' as _i8;
import 'balance_view.dart' as _i9;
import 'cash_top_up.dart' as _i10;
import 'chat_message.dart' as _i11;
import 'chat_thread.dart' as _i12;
import 'check_kind.dart' as _i13;
import 'child.dart' as _i14;
import 'circle_rank.dart' as _i15;
import 'day_stats.dart' as _i16;
import 'dispatcher_account.dart' as _i17;
import 'dispatcher_task.dart' as _i18;
import 'dispatcher_task_kind.dart' as _i19;
import 'driver.dart' as _i20;
import 'driver_application.dart' as _i21;
import 'driver_load.dart' as _i22;
import 'family.dart' as _i23;
import 'family_balance_row.dart' as _i24;
import 'family_circle.dart' as _i25;
import 'health/server_health.dart' as _i26;
import 'incident.dart' as _i27;
import 'incident_severity.dart' as _i28;
import 'institution.dart' as _i29;
import 'institution_access.dart' as _i30;
import 'institution_child_row.dart' as _i31;
import 'institution_day_view.dart' as _i32;
import 'institution_type.dart' as _i33;
import 'ledger_entry.dart' as _i34;
import 'ledger_entry_type.dart' as _i35;
import 'load_driver.dart' as _i36;
import 'load_fixture.dart' as _i37;
import 'load_result.dart' as _i38;
import 'notification_channel.dart' as _i39;
import 'notification_outbox.dart' as _i40;
import 'notification_status.dart' as _i41;
import 'otp_code.dart' as _i42;
import 'owner_account.dart' as _i43;
import 'owner_report.dart' as _i44;
import 'parent.dart' as _i45;
import 'parent_role.dart' as _i46;
import 'payout_period.dart' as _i47;
import 'pool_candidate.dart' as _i48;
import 'pool_capacity.dart' as _i49;
import 'quick_phrase.dart' as _i50;
import 'rate_limit_hit.dart' as _i51;
import 'report_export.dart' as _i52;
import 'ride.dart' as _i53;
import 'ride_event.dart' as _i54;
import 'ride_event_submission.dart' as _i55;
import 'ride_event_type.dart' as _i56;
import 'ride_flow_error.dart' as _i57;
import 'ride_flow_exception.dart' as _i58;
import 'ride_location.dart' as _i59;
import 'ride_location_point.dart' as _i60;
import 'ride_seat.dart' as _i61;
import 'ride_status.dart' as _i62;
import 'ride_view.dart' as _i63;
import 'route_direction.dart' as _i64;
import 'route_economics.dart' as _i65;
import 'route_template.dart' as _i66;
import 'sms_level.dart' as _i67;
import 'system_health.dart' as _i68;
import 'tracking_state.dart' as _i69;
import 'training_result.dart' as _i70;
import 'vetting_status.dart' as _i71;
import 'package:child_client/src/protocol/chat_message.dart' as _i72;
import 'package:child_client/src/protocol/family.dart' as _i73;
import 'package:child_client/src/protocol/parent.dart' as _i74;
import 'package:child_client/src/protocol/child.dart' as _i75;
import 'package:child_client/src/protocol/driver.dart' as _i76;
import 'package:child_client/src/protocol/institution.dart' as _i77;
import 'package:child_client/src/protocol/family_circle.dart' as _i78;
import 'package:child_client/src/protocol/route_template.dart' as _i79;
import 'package:child_client/src/protocol/ride_view.dart' as _i80;
import 'package:child_client/src/protocol/ride_event.dart' as _i81;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i82;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i83;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i84;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i85;
import 'package:child_client/src/protocol/ride_seat.dart' as _i86;
import 'package:child_client/src/protocol/driver_application.dart' as _i87;
import 'package:child_client/src/protocol/application_check.dart' as _i88;
import 'package:child_client/src/protocol/payout_period.dart' as _i89;
import 'package:child_client/src/protocol/incident.dart' as _i90;
import 'package:child_client/src/protocol/training_result.dart' as _i91;
import 'package:child_client/src/protocol/institution_access.dart' as _i92;
import 'package:child_client/src/protocol/family_balance_row.dart' as _i93;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i94;
import 'package:child_client/src/protocol/ride_location.dart' as _i95;
export 'account_role.dart';
export 'application_check.dart';
export 'application_status.dart';
export 'auth_exception.dart';
export 'auth_failure.dart';
export 'auth_result.dart';
export 'auth_token.dart';
export 'balance_view.dart';
export 'cash_top_up.dart';
export 'chat_message.dart';
export 'chat_thread.dart';
export 'check_kind.dart';
export 'child.dart';
export 'circle_rank.dart';
export 'day_stats.dart';
export 'dispatcher_account.dart';
export 'dispatcher_task.dart';
export 'dispatcher_task_kind.dart';
export 'driver.dart';
export 'driver_application.dart';
export 'driver_load.dart';
export 'family.dart';
export 'family_balance_row.dart';
export 'family_circle.dart';
export 'health/server_health.dart';
export 'incident.dart';
export 'incident_severity.dart';
export 'institution.dart';
export 'institution_access.dart';
export 'institution_child_row.dart';
export 'institution_day_view.dart';
export 'institution_type.dart';
export 'ledger_entry.dart';
export 'ledger_entry_type.dart';
export 'load_driver.dart';
export 'load_fixture.dart';
export 'load_result.dart';
export 'notification_channel.dart';
export 'notification_outbox.dart';
export 'notification_status.dart';
export 'otp_code.dart';
export 'owner_account.dart';
export 'owner_report.dart';
export 'parent.dart';
export 'parent_role.dart';
export 'payout_period.dart';
export 'pool_candidate.dart';
export 'pool_capacity.dart';
export 'quick_phrase.dart';
export 'rate_limit_hit.dart';
export 'report_export.dart';
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
export 'route_economics.dart';
export 'route_template.dart';
export 'sms_level.dart';
export 'system_health.dart';
export 'tracking_state.dart';
export 'training_result.dart';
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
    if (t == _i3.ApplicationCheck) {
      return _i3.ApplicationCheck.fromJson(data) as T;
    }
    if (t == _i4.ApplicationStatus) {
      return _i4.ApplicationStatus.fromJson(data) as T;
    }
    if (t == _i5.AuthException) {
      return _i5.AuthException.fromJson(data) as T;
    }
    if (t == _i6.AuthFailureReason) {
      return _i6.AuthFailureReason.fromJson(data) as T;
    }
    if (t == _i7.AuthResult) {
      return _i7.AuthResult.fromJson(data) as T;
    }
    if (t == _i8.AuthToken) {
      return _i8.AuthToken.fromJson(data) as T;
    }
    if (t == _i9.BalanceView) {
      return _i9.BalanceView.fromJson(data) as T;
    }
    if (t == _i10.CashTopUp) {
      return _i10.CashTopUp.fromJson(data) as T;
    }
    if (t == _i11.ChatMessage) {
      return _i11.ChatMessage.fromJson(data) as T;
    }
    if (t == _i12.ChatThread) {
      return _i12.ChatThread.fromJson(data) as T;
    }
    if (t == _i13.CheckKind) {
      return _i13.CheckKind.fromJson(data) as T;
    }
    if (t == _i14.Child) {
      return _i14.Child.fromJson(data) as T;
    }
    if (t == _i15.CircleRank) {
      return _i15.CircleRank.fromJson(data) as T;
    }
    if (t == _i16.DayStats) {
      return _i16.DayStats.fromJson(data) as T;
    }
    if (t == _i17.DispatcherAccount) {
      return _i17.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i18.DispatcherTask) {
      return _i18.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i19.DispatcherTaskKind) {
      return _i19.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i20.Driver) {
      return _i20.Driver.fromJson(data) as T;
    }
    if (t == _i21.DriverApplication) {
      return _i21.DriverApplication.fromJson(data) as T;
    }
    if (t == _i22.DriverLoad) {
      return _i22.DriverLoad.fromJson(data) as T;
    }
    if (t == _i23.Family) {
      return _i23.Family.fromJson(data) as T;
    }
    if (t == _i24.FamilyBalanceRow) {
      return _i24.FamilyBalanceRow.fromJson(data) as T;
    }
    if (t == _i25.FamilyCircle) {
      return _i25.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i26.ServerHealth) {
      return _i26.ServerHealth.fromJson(data) as T;
    }
    if (t == _i27.Incident) {
      return _i27.Incident.fromJson(data) as T;
    }
    if (t == _i28.IncidentSeverity) {
      return _i28.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i29.Institution) {
      return _i29.Institution.fromJson(data) as T;
    }
    if (t == _i30.InstitutionAccess) {
      return _i30.InstitutionAccess.fromJson(data) as T;
    }
    if (t == _i31.InstitutionChildRow) {
      return _i31.InstitutionChildRow.fromJson(data) as T;
    }
    if (t == _i32.InstitutionDayView) {
      return _i32.InstitutionDayView.fromJson(data) as T;
    }
    if (t == _i33.InstitutionType) {
      return _i33.InstitutionType.fromJson(data) as T;
    }
    if (t == _i34.LedgerEntry) {
      return _i34.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i35.LedgerEntryType) {
      return _i35.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i36.LoadDriver) {
      return _i36.LoadDriver.fromJson(data) as T;
    }
    if (t == _i37.LoadFixture) {
      return _i37.LoadFixture.fromJson(data) as T;
    }
    if (t == _i38.LoadResult) {
      return _i38.LoadResult.fromJson(data) as T;
    }
    if (t == _i39.NotificationChannel) {
      return _i39.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i40.NotificationOutbox) {
      return _i40.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i41.NotificationStatus) {
      return _i41.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i42.OtpCode) {
      return _i42.OtpCode.fromJson(data) as T;
    }
    if (t == _i43.OwnerAccount) {
      return _i43.OwnerAccount.fromJson(data) as T;
    }
    if (t == _i44.OwnerReport) {
      return _i44.OwnerReport.fromJson(data) as T;
    }
    if (t == _i45.Parent) {
      return _i45.Parent.fromJson(data) as T;
    }
    if (t == _i46.ParentRole) {
      return _i46.ParentRole.fromJson(data) as T;
    }
    if (t == _i47.PayoutPeriod) {
      return _i47.PayoutPeriod.fromJson(data) as T;
    }
    if (t == _i48.PoolCandidate) {
      return _i48.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i49.PoolCapacity) {
      return _i49.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i50.QuickPhrase) {
      return _i50.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i51.RateLimitHit) {
      return _i51.RateLimitHit.fromJson(data) as T;
    }
    if (t == _i52.ReportExport) {
      return _i52.ReportExport.fromJson(data) as T;
    }
    if (t == _i53.Ride) {
      return _i53.Ride.fromJson(data) as T;
    }
    if (t == _i54.RideEvent) {
      return _i54.RideEvent.fromJson(data) as T;
    }
    if (t == _i55.RideEventSubmission) {
      return _i55.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i56.RideEventType) {
      return _i56.RideEventType.fromJson(data) as T;
    }
    if (t == _i57.RideFlowError) {
      return _i57.RideFlowError.fromJson(data) as T;
    }
    if (t == _i58.RideFlowException) {
      return _i58.RideFlowException.fromJson(data) as T;
    }
    if (t == _i59.RideLocation) {
      return _i59.RideLocation.fromJson(data) as T;
    }
    if (t == _i60.RideLocationPoint) {
      return _i60.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i61.RideSeat) {
      return _i61.RideSeat.fromJson(data) as T;
    }
    if (t == _i62.RideStatus) {
      return _i62.RideStatus.fromJson(data) as T;
    }
    if (t == _i63.RideView) {
      return _i63.RideView.fromJson(data) as T;
    }
    if (t == _i64.RouteDirection) {
      return _i64.RouteDirection.fromJson(data) as T;
    }
    if (t == _i65.RouteEconomics) {
      return _i65.RouteEconomics.fromJson(data) as T;
    }
    if (t == _i66.RouteTemplate) {
      return _i66.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i67.SmsLevel) {
      return _i67.SmsLevel.fromJson(data) as T;
    }
    if (t == _i68.SystemHealth) {
      return _i68.SystemHealth.fromJson(data) as T;
    }
    if (t == _i69.TrackingState) {
      return _i69.TrackingState.fromJson(data) as T;
    }
    if (t == _i70.TrainingResult) {
      return _i70.TrainingResult.fromJson(data) as T;
    }
    if (t == _i71.VettingStatus) {
      return _i71.VettingStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AccountRole?>()) {
      return (data != null ? _i2.AccountRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ApplicationCheck?>()) {
      return (data != null ? _i3.ApplicationCheck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ApplicationStatus?>()) {
      return (data != null ? _i4.ApplicationStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthException?>()) {
      return (data != null ? _i5.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthFailureReason?>()) {
      return (data != null ? _i6.AuthFailureReason.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AuthResult?>()) {
      return (data != null ? _i7.AuthResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AuthToken?>()) {
      return (data != null ? _i8.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.BalanceView?>()) {
      return (data != null ? _i9.BalanceView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CashTopUp?>()) {
      return (data != null ? _i10.CashTopUp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ChatMessage?>()) {
      return (data != null ? _i11.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ChatThread?>()) {
      return (data != null ? _i12.ChatThread.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.CheckKind?>()) {
      return (data != null ? _i13.CheckKind.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Child?>()) {
      return (data != null ? _i14.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.CircleRank?>()) {
      return (data != null ? _i15.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DayStats?>()) {
      return (data != null ? _i16.DayStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.DispatcherAccount?>()) {
      return (data != null ? _i17.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DispatcherTask?>()) {
      return (data != null ? _i18.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DispatcherTaskKind?>()) {
      return (data != null ? _i19.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.Driver?>()) {
      return (data != null ? _i20.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.DriverApplication?>()) {
      return (data != null ? _i21.DriverApplication.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.DriverLoad?>()) {
      return (data != null ? _i22.DriverLoad.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Family?>()) {
      return (data != null ? _i23.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.FamilyBalanceRow?>()) {
      return (data != null ? _i24.FamilyBalanceRow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.FamilyCircle?>()) {
      return (data != null ? _i25.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.ServerHealth?>()) {
      return (data != null ? _i26.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.Incident?>()) {
      return (data != null ? _i27.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.IncidentSeverity?>()) {
      return (data != null ? _i28.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.Institution?>()) {
      return (data != null ? _i29.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.InstitutionAccess?>()) {
      return (data != null ? _i30.InstitutionAccess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.InstitutionChildRow?>()) {
      return (data != null ? _i31.InstitutionChildRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i32.InstitutionDayView?>()) {
      return (data != null ? _i32.InstitutionDayView.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.InstitutionType?>()) {
      return (data != null ? _i33.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.LedgerEntry?>()) {
      return (data != null ? _i34.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.LedgerEntryType?>()) {
      return (data != null ? _i35.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.LoadDriver?>()) {
      return (data != null ? _i36.LoadDriver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.LoadFixture?>()) {
      return (data != null ? _i37.LoadFixture.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.LoadResult?>()) {
      return (data != null ? _i38.LoadResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.NotificationChannel?>()) {
      return (data != null ? _i39.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.NotificationOutbox?>()) {
      return (data != null ? _i40.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.NotificationStatus?>()) {
      return (data != null ? _i41.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.OtpCode?>()) {
      return (data != null ? _i42.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.OwnerAccount?>()) {
      return (data != null ? _i43.OwnerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.OwnerReport?>()) {
      return (data != null ? _i44.OwnerReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.Parent?>()) {
      return (data != null ? _i45.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.ParentRole?>()) {
      return (data != null ? _i46.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.PayoutPeriod?>()) {
      return (data != null ? _i47.PayoutPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.PoolCandidate?>()) {
      return (data != null ? _i48.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.PoolCapacity?>()) {
      return (data != null ? _i49.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.QuickPhrase?>()) {
      return (data != null ? _i50.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.RateLimitHit?>()) {
      return (data != null ? _i51.RateLimitHit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.ReportExport?>()) {
      return (data != null ? _i52.ReportExport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.Ride?>()) {
      return (data != null ? _i53.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.RideEvent?>()) {
      return (data != null ? _i54.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.RideEventSubmission?>()) {
      return (data != null ? _i55.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.RideEventType?>()) {
      return (data != null ? _i56.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.RideFlowError?>()) {
      return (data != null ? _i57.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.RideFlowException?>()) {
      return (data != null ? _i58.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.RideLocation?>()) {
      return (data != null ? _i59.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.RideLocationPoint?>()) {
      return (data != null ? _i60.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.RideSeat?>()) {
      return (data != null ? _i61.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.RideStatus?>()) {
      return (data != null ? _i62.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.RideView?>()) {
      return (data != null ? _i63.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.RouteDirection?>()) {
      return (data != null ? _i64.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.RouteEconomics?>()) {
      return (data != null ? _i65.RouteEconomics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.RouteTemplate?>()) {
      return (data != null ? _i66.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.SmsLevel?>()) {
      return (data != null ? _i67.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i68.SystemHealth?>()) {
      return (data != null ? _i68.SystemHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.TrackingState?>()) {
      return (data != null ? _i69.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.TrainingResult?>()) {
      return (data != null ? _i70.TrainingResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.VettingStatus?>()) {
      return (data != null ? _i71.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i34.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i34.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i31.InstitutionChildRow>) {
      return (data as List)
              .map((e) => deserialize<_i31.InstitutionChildRow>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i36.LoadDriver>) {
      return (data as List).map((e) => deserialize<_i36.LoadDriver>(e)).toList()
          as T;
    }
    if (t == List<_i16.DayStats>) {
      return (data as List).map((e) => deserialize<_i16.DayStats>(e)).toList()
          as T;
    }
    if (t == List<_i22.DriverLoad>) {
      return (data as List).map((e) => deserialize<_i22.DriverLoad>(e)).toList()
          as T;
    }
    if (t == List<_i65.RouteEconomics>) {
      return (data as List)
              .map((e) => deserialize<_i65.RouteEconomics>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.RideSeat>) {
      return (data as List).map((e) => deserialize<_i61.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i61.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i61.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i72.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i72.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i73.Family>) {
      return (data as List).map((e) => deserialize<_i73.Family>(e)).toList()
          as T;
    }
    if (t == List<_i74.Parent>) {
      return (data as List).map((e) => deserialize<_i74.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i75.Child>) {
      return (data as List).map((e) => deserialize<_i75.Child>(e)).toList()
          as T;
    }
    if (t == List<_i76.Driver>) {
      return (data as List).map((e) => deserialize<_i76.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i77.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i77.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i78.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i78.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i79.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i79.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i80.RideView>) {
      return (data as List).map((e) => deserialize<_i80.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i81.RideEvent>) {
      return (data as List).map((e) => deserialize<_i81.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i82.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i82.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i83.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i83.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i84.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i84.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i85.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i85.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i86.RideSeat>) {
      return (data as List).map((e) => deserialize<_i86.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i87.DriverApplication>) {
      return (data as List)
              .map((e) => deserialize<_i87.DriverApplication>(e))
              .toList()
          as T;
    }
    if (t == List<_i88.ApplicationCheck>) {
      return (data as List)
              .map((e) => deserialize<_i88.ApplicationCheck>(e))
              .toList()
          as T;
    }
    if (t == List<_i89.PayoutPeriod>) {
      return (data as List)
              .map((e) => deserialize<_i89.PayoutPeriod>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.Incident>) {
      return (data as List).map((e) => deserialize<_i90.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i91.TrainingResult>) {
      return (data as List)
              .map((e) => deserialize<_i91.TrainingResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i92.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i92.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i93.FamilyBalanceRow>) {
      return (data as List)
              .map((e) => deserialize<_i93.FamilyBalanceRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i94.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i94.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i95.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i95.RideLocation>(e))
              .toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AccountRole => 'AccountRole',
      _i3.ApplicationCheck => 'ApplicationCheck',
      _i4.ApplicationStatus => 'ApplicationStatus',
      _i5.AuthException => 'AuthException',
      _i6.AuthFailureReason => 'AuthFailureReason',
      _i7.AuthResult => 'AuthResult',
      _i8.AuthToken => 'AuthToken',
      _i9.BalanceView => 'BalanceView',
      _i10.CashTopUp => 'CashTopUp',
      _i11.ChatMessage => 'ChatMessage',
      _i12.ChatThread => 'ChatThread',
      _i13.CheckKind => 'CheckKind',
      _i14.Child => 'Child',
      _i15.CircleRank => 'CircleRank',
      _i16.DayStats => 'DayStats',
      _i17.DispatcherAccount => 'DispatcherAccount',
      _i18.DispatcherTask => 'DispatcherTask',
      _i19.DispatcherTaskKind => 'DispatcherTaskKind',
      _i20.Driver => 'Driver',
      _i21.DriverApplication => 'DriverApplication',
      _i22.DriverLoad => 'DriverLoad',
      _i23.Family => 'Family',
      _i24.FamilyBalanceRow => 'FamilyBalanceRow',
      _i25.FamilyCircle => 'FamilyCircle',
      _i26.ServerHealth => 'ServerHealth',
      _i27.Incident => 'Incident',
      _i28.IncidentSeverity => 'IncidentSeverity',
      _i29.Institution => 'Institution',
      _i30.InstitutionAccess => 'InstitutionAccess',
      _i31.InstitutionChildRow => 'InstitutionChildRow',
      _i32.InstitutionDayView => 'InstitutionDayView',
      _i33.InstitutionType => 'InstitutionType',
      _i34.LedgerEntry => 'LedgerEntry',
      _i35.LedgerEntryType => 'LedgerEntryType',
      _i36.LoadDriver => 'LoadDriver',
      _i37.LoadFixture => 'LoadFixture',
      _i38.LoadResult => 'LoadResult',
      _i39.NotificationChannel => 'NotificationChannel',
      _i40.NotificationOutbox => 'NotificationOutbox',
      _i41.NotificationStatus => 'NotificationStatus',
      _i42.OtpCode => 'OtpCode',
      _i43.OwnerAccount => 'OwnerAccount',
      _i44.OwnerReport => 'OwnerReport',
      _i45.Parent => 'Parent',
      _i46.ParentRole => 'ParentRole',
      _i47.PayoutPeriod => 'PayoutPeriod',
      _i48.PoolCandidate => 'PoolCandidate',
      _i49.PoolCapacity => 'PoolCapacity',
      _i50.QuickPhrase => 'QuickPhrase',
      _i51.RateLimitHit => 'RateLimitHit',
      _i52.ReportExport => 'ReportExport',
      _i53.Ride => 'Ride',
      _i54.RideEvent => 'RideEvent',
      _i55.RideEventSubmission => 'RideEventSubmission',
      _i56.RideEventType => 'RideEventType',
      _i57.RideFlowError => 'RideFlowError',
      _i58.RideFlowException => 'RideFlowException',
      _i59.RideLocation => 'RideLocation',
      _i60.RideLocationPoint => 'RideLocationPoint',
      _i61.RideSeat => 'RideSeat',
      _i62.RideStatus => 'RideStatus',
      _i63.RideView => 'RideView',
      _i64.RouteDirection => 'RouteDirection',
      _i65.RouteEconomics => 'RouteEconomics',
      _i66.RouteTemplate => 'RouteTemplate',
      _i67.SmsLevel => 'SmsLevel',
      _i68.SystemHealth => 'SystemHealth',
      _i69.TrackingState => 'TrackingState',
      _i70.TrainingResult => 'TrainingResult',
      _i71.VettingStatus => 'VettingStatus',
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
      case _i3.ApplicationCheck():
        return 'ApplicationCheck';
      case _i4.ApplicationStatus():
        return 'ApplicationStatus';
      case _i5.AuthException():
        return 'AuthException';
      case _i6.AuthFailureReason():
        return 'AuthFailureReason';
      case _i7.AuthResult():
        return 'AuthResult';
      case _i8.AuthToken():
        return 'AuthToken';
      case _i9.BalanceView():
        return 'BalanceView';
      case _i10.CashTopUp():
        return 'CashTopUp';
      case _i11.ChatMessage():
        return 'ChatMessage';
      case _i12.ChatThread():
        return 'ChatThread';
      case _i13.CheckKind():
        return 'CheckKind';
      case _i14.Child():
        return 'Child';
      case _i15.CircleRank():
        return 'CircleRank';
      case _i16.DayStats():
        return 'DayStats';
      case _i17.DispatcherAccount():
        return 'DispatcherAccount';
      case _i18.DispatcherTask():
        return 'DispatcherTask';
      case _i19.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i20.Driver():
        return 'Driver';
      case _i21.DriverApplication():
        return 'DriverApplication';
      case _i22.DriverLoad():
        return 'DriverLoad';
      case _i23.Family():
        return 'Family';
      case _i24.FamilyBalanceRow():
        return 'FamilyBalanceRow';
      case _i25.FamilyCircle():
        return 'FamilyCircle';
      case _i26.ServerHealth():
        return 'ServerHealth';
      case _i27.Incident():
        return 'Incident';
      case _i28.IncidentSeverity():
        return 'IncidentSeverity';
      case _i29.Institution():
        return 'Institution';
      case _i30.InstitutionAccess():
        return 'InstitutionAccess';
      case _i31.InstitutionChildRow():
        return 'InstitutionChildRow';
      case _i32.InstitutionDayView():
        return 'InstitutionDayView';
      case _i33.InstitutionType():
        return 'InstitutionType';
      case _i34.LedgerEntry():
        return 'LedgerEntry';
      case _i35.LedgerEntryType():
        return 'LedgerEntryType';
      case _i36.LoadDriver():
        return 'LoadDriver';
      case _i37.LoadFixture():
        return 'LoadFixture';
      case _i38.LoadResult():
        return 'LoadResult';
      case _i39.NotificationChannel():
        return 'NotificationChannel';
      case _i40.NotificationOutbox():
        return 'NotificationOutbox';
      case _i41.NotificationStatus():
        return 'NotificationStatus';
      case _i42.OtpCode():
        return 'OtpCode';
      case _i43.OwnerAccount():
        return 'OwnerAccount';
      case _i44.OwnerReport():
        return 'OwnerReport';
      case _i45.Parent():
        return 'Parent';
      case _i46.ParentRole():
        return 'ParentRole';
      case _i47.PayoutPeriod():
        return 'PayoutPeriod';
      case _i48.PoolCandidate():
        return 'PoolCandidate';
      case _i49.PoolCapacity():
        return 'PoolCapacity';
      case _i50.QuickPhrase():
        return 'QuickPhrase';
      case _i51.RateLimitHit():
        return 'RateLimitHit';
      case _i52.ReportExport():
        return 'ReportExport';
      case _i53.Ride():
        return 'Ride';
      case _i54.RideEvent():
        return 'RideEvent';
      case _i55.RideEventSubmission():
        return 'RideEventSubmission';
      case _i56.RideEventType():
        return 'RideEventType';
      case _i57.RideFlowError():
        return 'RideFlowError';
      case _i58.RideFlowException():
        return 'RideFlowException';
      case _i59.RideLocation():
        return 'RideLocation';
      case _i60.RideLocationPoint():
        return 'RideLocationPoint';
      case _i61.RideSeat():
        return 'RideSeat';
      case _i62.RideStatus():
        return 'RideStatus';
      case _i63.RideView():
        return 'RideView';
      case _i64.RouteDirection():
        return 'RouteDirection';
      case _i65.RouteEconomics():
        return 'RouteEconomics';
      case _i66.RouteTemplate():
        return 'RouteTemplate';
      case _i67.SmsLevel():
        return 'SmsLevel';
      case _i68.SystemHealth():
        return 'SystemHealth';
      case _i69.TrackingState():
        return 'TrackingState';
      case _i70.TrainingResult():
        return 'TrainingResult';
      case _i71.VettingStatus():
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
    if (dataClassName == 'ApplicationCheck') {
      return deserialize<_i3.ApplicationCheck>(data['data']);
    }
    if (dataClassName == 'ApplicationStatus') {
      return deserialize<_i4.ApplicationStatus>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i5.AuthException>(data['data']);
    }
    if (dataClassName == 'AuthFailureReason') {
      return deserialize<_i6.AuthFailureReason>(data['data']);
    }
    if (dataClassName == 'AuthResult') {
      return deserialize<_i7.AuthResult>(data['data']);
    }
    if (dataClassName == 'AuthToken') {
      return deserialize<_i8.AuthToken>(data['data']);
    }
    if (dataClassName == 'BalanceView') {
      return deserialize<_i9.BalanceView>(data['data']);
    }
    if (dataClassName == 'CashTopUp') {
      return deserialize<_i10.CashTopUp>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i11.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatThread') {
      return deserialize<_i12.ChatThread>(data['data']);
    }
    if (dataClassName == 'CheckKind') {
      return deserialize<_i13.CheckKind>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i14.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i15.CircleRank>(data['data']);
    }
    if (dataClassName == 'DayStats') {
      return deserialize<_i16.DayStats>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i17.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i18.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i19.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i20.Driver>(data['data']);
    }
    if (dataClassName == 'DriverApplication') {
      return deserialize<_i21.DriverApplication>(data['data']);
    }
    if (dataClassName == 'DriverLoad') {
      return deserialize<_i22.DriverLoad>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i23.Family>(data['data']);
    }
    if (dataClassName == 'FamilyBalanceRow') {
      return deserialize<_i24.FamilyBalanceRow>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i25.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i26.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i27.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i28.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i29.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionAccess') {
      return deserialize<_i30.InstitutionAccess>(data['data']);
    }
    if (dataClassName == 'InstitutionChildRow') {
      return deserialize<_i31.InstitutionChildRow>(data['data']);
    }
    if (dataClassName == 'InstitutionDayView') {
      return deserialize<_i32.InstitutionDayView>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i33.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i34.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i35.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'LoadDriver') {
      return deserialize<_i36.LoadDriver>(data['data']);
    }
    if (dataClassName == 'LoadFixture') {
      return deserialize<_i37.LoadFixture>(data['data']);
    }
    if (dataClassName == 'LoadResult') {
      return deserialize<_i38.LoadResult>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i39.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i40.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i41.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i42.OtpCode>(data['data']);
    }
    if (dataClassName == 'OwnerAccount') {
      return deserialize<_i43.OwnerAccount>(data['data']);
    }
    if (dataClassName == 'OwnerReport') {
      return deserialize<_i44.OwnerReport>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i45.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i46.ParentRole>(data['data']);
    }
    if (dataClassName == 'PayoutPeriod') {
      return deserialize<_i47.PayoutPeriod>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i48.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i49.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i50.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'RateLimitHit') {
      return deserialize<_i51.RateLimitHit>(data['data']);
    }
    if (dataClassName == 'ReportExport') {
      return deserialize<_i52.ReportExport>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i53.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i54.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i55.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i56.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i57.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i58.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i59.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i60.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i61.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i62.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i63.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i64.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteEconomics') {
      return deserialize<_i65.RouteEconomics>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i66.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i67.SmsLevel>(data['data']);
    }
    if (dataClassName == 'SystemHealth') {
      return deserialize<_i68.SystemHealth>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i69.TrackingState>(data['data']);
    }
    if (dataClassName == 'TrainingResult') {
      return deserialize<_i70.TrainingResult>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i71.VettingStatus>(data['data']);
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
