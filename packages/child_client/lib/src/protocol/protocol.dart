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
import 'app_notification.dart' as _i3;
import 'application_check.dart' as _i4;
import 'application_status.dart' as _i5;
import 'auth_exception.dart' as _i6;
import 'auth_failure.dart' as _i7;
import 'auth_result.dart' as _i8;
import 'auth_token.dart' as _i9;
import 'balance_view.dart' as _i10;
import 'cash_top_up.dart' as _i11;
import 'chat_message.dart' as _i12;
import 'chat_thread.dart' as _i13;
import 'check_kind.dart' as _i14;
import 'child.dart' as _i15;
import 'circle_rank.dart' as _i16;
import 'day_stats.dart' as _i17;
import 'dispatcher_account.dart' as _i18;
import 'dispatcher_task.dart' as _i19;
import 'dispatcher_task_kind.dart' as _i20;
import 'driver.dart' as _i21;
import 'driver_application.dart' as _i22;
import 'driver_load.dart' as _i23;
import 'family.dart' as _i24;
import 'family_balance_row.dart' as _i25;
import 'family_circle.dart' as _i26;
import 'health/server_health.dart' as _i27;
import 'incident.dart' as _i28;
import 'incident_severity.dart' as _i29;
import 'institution.dart' as _i30;
import 'institution_access.dart' as _i31;
import 'institution_child_row.dart' as _i32;
import 'institution_day_view.dart' as _i33;
import 'institution_type.dart' as _i34;
import 'ledger_entry.dart' as _i35;
import 'ledger_entry_type.dart' as _i36;
import 'load_driver.dart' as _i37;
import 'load_fixture.dart' as _i38;
import 'load_result.dart' as _i39;
import 'notification_channel.dart' as _i40;
import 'notification_outbox.dart' as _i41;
import 'notification_status.dart' as _i42;
import 'otp_code.dart' as _i43;
import 'owner_account.dart' as _i44;
import 'owner_report.dart' as _i45;
import 'parent.dart' as _i46;
import 'parent_role.dart' as _i47;
import 'payout_period.dart' as _i48;
import 'pool_candidate.dart' as _i49;
import 'pool_capacity.dart' as _i50;
import 'push_transport.dart' as _i51;
import 'quick_phrase.dart' as _i52;
import 'rate_limit_hit.dart' as _i53;
import 'report_export.dart' as _i54;
import 'ride.dart' as _i55;
import 'ride_event.dart' as _i56;
import 'ride_event_submission.dart' as _i57;
import 'ride_event_type.dart' as _i58;
import 'ride_flow_error.dart' as _i59;
import 'ride_flow_exception.dart' as _i60;
import 'ride_location.dart' as _i61;
import 'ride_location_point.dart' as _i62;
import 'ride_seat.dart' as _i63;
import 'ride_status.dart' as _i64;
import 'ride_view.dart' as _i65;
import 'route_direction.dart' as _i66;
import 'route_economics.dart' as _i67;
import 'route_template.dart' as _i68;
import 'sms_level.dart' as _i69;
import 'system_health.dart' as _i70;
import 'tracking_state.dart' as _i71;
import 'training_result.dart' as _i72;
import 'vetting_status.dart' as _i73;
import 'package:child_client/src/protocol/chat_message.dart' as _i74;
import 'package:child_client/src/protocol/family.dart' as _i75;
import 'package:child_client/src/protocol/parent.dart' as _i76;
import 'package:child_client/src/protocol/child.dart' as _i77;
import 'package:child_client/src/protocol/driver.dart' as _i78;
import 'package:child_client/src/protocol/institution.dart' as _i79;
import 'package:child_client/src/protocol/family_circle.dart' as _i80;
import 'package:child_client/src/protocol/route_template.dart' as _i81;
import 'package:child_client/src/protocol/ride_view.dart' as _i82;
import 'package:child_client/src/protocol/ride_event.dart' as _i83;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i84;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i85;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i86;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i87;
import 'package:child_client/src/protocol/ride_seat.dart' as _i88;
import 'package:child_client/src/protocol/driver_application.dart' as _i89;
import 'package:child_client/src/protocol/application_check.dart' as _i90;
import 'package:child_client/src/protocol/payout_period.dart' as _i91;
import 'package:child_client/src/protocol/incident.dart' as _i92;
import 'package:child_client/src/protocol/training_result.dart' as _i93;
import 'package:child_client/src/protocol/institution_access.dart' as _i94;
import 'package:child_client/src/protocol/family_balance_row.dart' as _i95;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i96;
import 'package:child_client/src/protocol/ride_location.dart' as _i97;
export 'account_role.dart';
export 'app_notification.dart';
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
export 'push_transport.dart';
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
    if (t == _i3.AppNotification) {
      return _i3.AppNotification.fromJson(data) as T;
    }
    if (t == _i4.ApplicationCheck) {
      return _i4.ApplicationCheck.fromJson(data) as T;
    }
    if (t == _i5.ApplicationStatus) {
      return _i5.ApplicationStatus.fromJson(data) as T;
    }
    if (t == _i6.AuthException) {
      return _i6.AuthException.fromJson(data) as T;
    }
    if (t == _i7.AuthFailureReason) {
      return _i7.AuthFailureReason.fromJson(data) as T;
    }
    if (t == _i8.AuthResult) {
      return _i8.AuthResult.fromJson(data) as T;
    }
    if (t == _i9.AuthToken) {
      return _i9.AuthToken.fromJson(data) as T;
    }
    if (t == _i10.BalanceView) {
      return _i10.BalanceView.fromJson(data) as T;
    }
    if (t == _i11.CashTopUp) {
      return _i11.CashTopUp.fromJson(data) as T;
    }
    if (t == _i12.ChatMessage) {
      return _i12.ChatMessage.fromJson(data) as T;
    }
    if (t == _i13.ChatThread) {
      return _i13.ChatThread.fromJson(data) as T;
    }
    if (t == _i14.CheckKind) {
      return _i14.CheckKind.fromJson(data) as T;
    }
    if (t == _i15.Child) {
      return _i15.Child.fromJson(data) as T;
    }
    if (t == _i16.CircleRank) {
      return _i16.CircleRank.fromJson(data) as T;
    }
    if (t == _i17.DayStats) {
      return _i17.DayStats.fromJson(data) as T;
    }
    if (t == _i18.DispatcherAccount) {
      return _i18.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i19.DispatcherTask) {
      return _i19.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i20.DispatcherTaskKind) {
      return _i20.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i21.Driver) {
      return _i21.Driver.fromJson(data) as T;
    }
    if (t == _i22.DriverApplication) {
      return _i22.DriverApplication.fromJson(data) as T;
    }
    if (t == _i23.DriverLoad) {
      return _i23.DriverLoad.fromJson(data) as T;
    }
    if (t == _i24.Family) {
      return _i24.Family.fromJson(data) as T;
    }
    if (t == _i25.FamilyBalanceRow) {
      return _i25.FamilyBalanceRow.fromJson(data) as T;
    }
    if (t == _i26.FamilyCircle) {
      return _i26.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i27.ServerHealth) {
      return _i27.ServerHealth.fromJson(data) as T;
    }
    if (t == _i28.Incident) {
      return _i28.Incident.fromJson(data) as T;
    }
    if (t == _i29.IncidentSeverity) {
      return _i29.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i30.Institution) {
      return _i30.Institution.fromJson(data) as T;
    }
    if (t == _i31.InstitutionAccess) {
      return _i31.InstitutionAccess.fromJson(data) as T;
    }
    if (t == _i32.InstitutionChildRow) {
      return _i32.InstitutionChildRow.fromJson(data) as T;
    }
    if (t == _i33.InstitutionDayView) {
      return _i33.InstitutionDayView.fromJson(data) as T;
    }
    if (t == _i34.InstitutionType) {
      return _i34.InstitutionType.fromJson(data) as T;
    }
    if (t == _i35.LedgerEntry) {
      return _i35.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i36.LedgerEntryType) {
      return _i36.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i37.LoadDriver) {
      return _i37.LoadDriver.fromJson(data) as T;
    }
    if (t == _i38.LoadFixture) {
      return _i38.LoadFixture.fromJson(data) as T;
    }
    if (t == _i39.LoadResult) {
      return _i39.LoadResult.fromJson(data) as T;
    }
    if (t == _i40.NotificationChannel) {
      return _i40.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i41.NotificationOutbox) {
      return _i41.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i42.NotificationStatus) {
      return _i42.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i43.OtpCode) {
      return _i43.OtpCode.fromJson(data) as T;
    }
    if (t == _i44.OwnerAccount) {
      return _i44.OwnerAccount.fromJson(data) as T;
    }
    if (t == _i45.OwnerReport) {
      return _i45.OwnerReport.fromJson(data) as T;
    }
    if (t == _i46.Parent) {
      return _i46.Parent.fromJson(data) as T;
    }
    if (t == _i47.ParentRole) {
      return _i47.ParentRole.fromJson(data) as T;
    }
    if (t == _i48.PayoutPeriod) {
      return _i48.PayoutPeriod.fromJson(data) as T;
    }
    if (t == _i49.PoolCandidate) {
      return _i49.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i50.PoolCapacity) {
      return _i50.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i51.PushTransport) {
      return _i51.PushTransport.fromJson(data) as T;
    }
    if (t == _i52.QuickPhrase) {
      return _i52.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i53.RateLimitHit) {
      return _i53.RateLimitHit.fromJson(data) as T;
    }
    if (t == _i54.ReportExport) {
      return _i54.ReportExport.fromJson(data) as T;
    }
    if (t == _i55.Ride) {
      return _i55.Ride.fromJson(data) as T;
    }
    if (t == _i56.RideEvent) {
      return _i56.RideEvent.fromJson(data) as T;
    }
    if (t == _i57.RideEventSubmission) {
      return _i57.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i58.RideEventType) {
      return _i58.RideEventType.fromJson(data) as T;
    }
    if (t == _i59.RideFlowError) {
      return _i59.RideFlowError.fromJson(data) as T;
    }
    if (t == _i60.RideFlowException) {
      return _i60.RideFlowException.fromJson(data) as T;
    }
    if (t == _i61.RideLocation) {
      return _i61.RideLocation.fromJson(data) as T;
    }
    if (t == _i62.RideLocationPoint) {
      return _i62.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i63.RideSeat) {
      return _i63.RideSeat.fromJson(data) as T;
    }
    if (t == _i64.RideStatus) {
      return _i64.RideStatus.fromJson(data) as T;
    }
    if (t == _i65.RideView) {
      return _i65.RideView.fromJson(data) as T;
    }
    if (t == _i66.RouteDirection) {
      return _i66.RouteDirection.fromJson(data) as T;
    }
    if (t == _i67.RouteEconomics) {
      return _i67.RouteEconomics.fromJson(data) as T;
    }
    if (t == _i68.RouteTemplate) {
      return _i68.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i69.SmsLevel) {
      return _i69.SmsLevel.fromJson(data) as T;
    }
    if (t == _i70.SystemHealth) {
      return _i70.SystemHealth.fromJson(data) as T;
    }
    if (t == _i71.TrackingState) {
      return _i71.TrackingState.fromJson(data) as T;
    }
    if (t == _i72.TrainingResult) {
      return _i72.TrainingResult.fromJson(data) as T;
    }
    if (t == _i73.VettingStatus) {
      return _i73.VettingStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AccountRole?>()) {
      return (data != null ? _i2.AccountRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AppNotification?>()) {
      return (data != null ? _i3.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ApplicationCheck?>()) {
      return (data != null ? _i4.ApplicationCheck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ApplicationStatus?>()) {
      return (data != null ? _i5.ApplicationStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthException?>()) {
      return (data != null ? _i6.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AuthFailureReason?>()) {
      return (data != null ? _i7.AuthFailureReason.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AuthResult?>()) {
      return (data != null ? _i8.AuthResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AuthToken?>()) {
      return (data != null ? _i9.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.BalanceView?>()) {
      return (data != null ? _i10.BalanceView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.CashTopUp?>()) {
      return (data != null ? _i11.CashTopUp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ChatMessage?>()) {
      return (data != null ? _i12.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ChatThread?>()) {
      return (data != null ? _i13.ChatThread.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.CheckKind?>()) {
      return (data != null ? _i14.CheckKind.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Child?>()) {
      return (data != null ? _i15.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.CircleRank?>()) {
      return (data != null ? _i16.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.DayStats?>()) {
      return (data != null ? _i17.DayStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DispatcherAccount?>()) {
      return (data != null ? _i18.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DispatcherTask?>()) {
      return (data != null ? _i19.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.DispatcherTaskKind?>()) {
      return (data != null ? _i20.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.Driver?>()) {
      return (data != null ? _i21.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.DriverApplication?>()) {
      return (data != null ? _i22.DriverApplication.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.DriverLoad?>()) {
      return (data != null ? _i23.DriverLoad.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Family?>()) {
      return (data != null ? _i24.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.FamilyBalanceRow?>()) {
      return (data != null ? _i25.FamilyBalanceRow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.FamilyCircle?>()) {
      return (data != null ? _i26.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.ServerHealth?>()) {
      return (data != null ? _i27.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Incident?>()) {
      return (data != null ? _i28.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.IncidentSeverity?>()) {
      return (data != null ? _i29.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Institution?>()) {
      return (data != null ? _i30.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.InstitutionAccess?>()) {
      return (data != null ? _i31.InstitutionAccess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.InstitutionChildRow?>()) {
      return (data != null ? _i32.InstitutionChildRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.InstitutionDayView?>()) {
      return (data != null ? _i33.InstitutionDayView.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.InstitutionType?>()) {
      return (data != null ? _i34.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.LedgerEntry?>()) {
      return (data != null ? _i35.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.LedgerEntryType?>()) {
      return (data != null ? _i36.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.LoadDriver?>()) {
      return (data != null ? _i37.LoadDriver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.LoadFixture?>()) {
      return (data != null ? _i38.LoadFixture.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.LoadResult?>()) {
      return (data != null ? _i39.LoadResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.NotificationChannel?>()) {
      return (data != null ? _i40.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.NotificationOutbox?>()) {
      return (data != null ? _i41.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.NotificationStatus?>()) {
      return (data != null ? _i42.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.OtpCode?>()) {
      return (data != null ? _i43.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.OwnerAccount?>()) {
      return (data != null ? _i44.OwnerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.OwnerReport?>()) {
      return (data != null ? _i45.OwnerReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.Parent?>()) {
      return (data != null ? _i46.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.ParentRole?>()) {
      return (data != null ? _i47.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.PayoutPeriod?>()) {
      return (data != null ? _i48.PayoutPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.PoolCandidate?>()) {
      return (data != null ? _i49.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.PoolCapacity?>()) {
      return (data != null ? _i50.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.PushTransport?>()) {
      return (data != null ? _i51.PushTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.QuickPhrase?>()) {
      return (data != null ? _i52.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.RateLimitHit?>()) {
      return (data != null ? _i53.RateLimitHit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.ReportExport?>()) {
      return (data != null ? _i54.ReportExport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.Ride?>()) {
      return (data != null ? _i55.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.RideEvent?>()) {
      return (data != null ? _i56.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.RideEventSubmission?>()) {
      return (data != null ? _i57.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.RideEventType?>()) {
      return (data != null ? _i58.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.RideFlowError?>()) {
      return (data != null ? _i59.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.RideFlowException?>()) {
      return (data != null ? _i60.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.RideLocation?>()) {
      return (data != null ? _i61.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.RideLocationPoint?>()) {
      return (data != null ? _i62.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.RideSeat?>()) {
      return (data != null ? _i63.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.RideStatus?>()) {
      return (data != null ? _i64.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.RideView?>()) {
      return (data != null ? _i65.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.RouteDirection?>()) {
      return (data != null ? _i66.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.RouteEconomics?>()) {
      return (data != null ? _i67.RouteEconomics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i68.RouteTemplate?>()) {
      return (data != null ? _i68.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.SmsLevel?>()) {
      return (data != null ? _i69.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.SystemHealth?>()) {
      return (data != null ? _i70.SystemHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.TrackingState?>()) {
      return (data != null ? _i71.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.TrainingResult?>()) {
      return (data != null ? _i72.TrainingResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i73.VettingStatus?>()) {
      return (data != null ? _i73.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i35.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i35.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i32.InstitutionChildRow>) {
      return (data as List)
              .map((e) => deserialize<_i32.InstitutionChildRow>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i37.LoadDriver>) {
      return (data as List).map((e) => deserialize<_i37.LoadDriver>(e)).toList()
          as T;
    }
    if (t == List<_i17.DayStats>) {
      return (data as List).map((e) => deserialize<_i17.DayStats>(e)).toList()
          as T;
    }
    if (t == List<_i23.DriverLoad>) {
      return (data as List).map((e) => deserialize<_i23.DriverLoad>(e)).toList()
          as T;
    }
    if (t == List<_i67.RouteEconomics>) {
      return (data as List)
              .map((e) => deserialize<_i67.RouteEconomics>(e))
              .toList()
          as T;
    }
    if (t == List<_i63.RideSeat>) {
      return (data as List).map((e) => deserialize<_i63.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i63.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i63.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i74.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i74.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i75.Family>) {
      return (data as List).map((e) => deserialize<_i75.Family>(e)).toList()
          as T;
    }
    if (t == List<_i76.Parent>) {
      return (data as List).map((e) => deserialize<_i76.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i77.Child>) {
      return (data as List).map((e) => deserialize<_i77.Child>(e)).toList()
          as T;
    }
    if (t == List<_i78.Driver>) {
      return (data as List).map((e) => deserialize<_i78.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i79.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i79.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i80.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i80.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i81.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i81.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i82.RideView>) {
      return (data as List).map((e) => deserialize<_i82.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i83.RideEvent>) {
      return (data as List).map((e) => deserialize<_i83.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i84.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i84.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i85.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i85.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i86.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i86.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i87.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i87.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i88.RideSeat>) {
      return (data as List).map((e) => deserialize<_i88.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i89.DriverApplication>) {
      return (data as List)
              .map((e) => deserialize<_i89.DriverApplication>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.ApplicationCheck>) {
      return (data as List)
              .map((e) => deserialize<_i90.ApplicationCheck>(e))
              .toList()
          as T;
    }
    if (t == List<_i91.PayoutPeriod>) {
      return (data as List)
              .map((e) => deserialize<_i91.PayoutPeriod>(e))
              .toList()
          as T;
    }
    if (t == List<_i92.Incident>) {
      return (data as List).map((e) => deserialize<_i92.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i93.TrainingResult>) {
      return (data as List)
              .map((e) => deserialize<_i93.TrainingResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i94.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i94.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i95.FamilyBalanceRow>) {
      return (data as List)
              .map((e) => deserialize<_i95.FamilyBalanceRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i96.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i96.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i97.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i97.RideLocation>(e))
              .toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AccountRole => 'AccountRole',
      _i3.AppNotification => 'AppNotification',
      _i4.ApplicationCheck => 'ApplicationCheck',
      _i5.ApplicationStatus => 'ApplicationStatus',
      _i6.AuthException => 'AuthException',
      _i7.AuthFailureReason => 'AuthFailureReason',
      _i8.AuthResult => 'AuthResult',
      _i9.AuthToken => 'AuthToken',
      _i10.BalanceView => 'BalanceView',
      _i11.CashTopUp => 'CashTopUp',
      _i12.ChatMessage => 'ChatMessage',
      _i13.ChatThread => 'ChatThread',
      _i14.CheckKind => 'CheckKind',
      _i15.Child => 'Child',
      _i16.CircleRank => 'CircleRank',
      _i17.DayStats => 'DayStats',
      _i18.DispatcherAccount => 'DispatcherAccount',
      _i19.DispatcherTask => 'DispatcherTask',
      _i20.DispatcherTaskKind => 'DispatcherTaskKind',
      _i21.Driver => 'Driver',
      _i22.DriverApplication => 'DriverApplication',
      _i23.DriverLoad => 'DriverLoad',
      _i24.Family => 'Family',
      _i25.FamilyBalanceRow => 'FamilyBalanceRow',
      _i26.FamilyCircle => 'FamilyCircle',
      _i27.ServerHealth => 'ServerHealth',
      _i28.Incident => 'Incident',
      _i29.IncidentSeverity => 'IncidentSeverity',
      _i30.Institution => 'Institution',
      _i31.InstitutionAccess => 'InstitutionAccess',
      _i32.InstitutionChildRow => 'InstitutionChildRow',
      _i33.InstitutionDayView => 'InstitutionDayView',
      _i34.InstitutionType => 'InstitutionType',
      _i35.LedgerEntry => 'LedgerEntry',
      _i36.LedgerEntryType => 'LedgerEntryType',
      _i37.LoadDriver => 'LoadDriver',
      _i38.LoadFixture => 'LoadFixture',
      _i39.LoadResult => 'LoadResult',
      _i40.NotificationChannel => 'NotificationChannel',
      _i41.NotificationOutbox => 'NotificationOutbox',
      _i42.NotificationStatus => 'NotificationStatus',
      _i43.OtpCode => 'OtpCode',
      _i44.OwnerAccount => 'OwnerAccount',
      _i45.OwnerReport => 'OwnerReport',
      _i46.Parent => 'Parent',
      _i47.ParentRole => 'ParentRole',
      _i48.PayoutPeriod => 'PayoutPeriod',
      _i49.PoolCandidate => 'PoolCandidate',
      _i50.PoolCapacity => 'PoolCapacity',
      _i51.PushTransport => 'PushTransport',
      _i52.QuickPhrase => 'QuickPhrase',
      _i53.RateLimitHit => 'RateLimitHit',
      _i54.ReportExport => 'ReportExport',
      _i55.Ride => 'Ride',
      _i56.RideEvent => 'RideEvent',
      _i57.RideEventSubmission => 'RideEventSubmission',
      _i58.RideEventType => 'RideEventType',
      _i59.RideFlowError => 'RideFlowError',
      _i60.RideFlowException => 'RideFlowException',
      _i61.RideLocation => 'RideLocation',
      _i62.RideLocationPoint => 'RideLocationPoint',
      _i63.RideSeat => 'RideSeat',
      _i64.RideStatus => 'RideStatus',
      _i65.RideView => 'RideView',
      _i66.RouteDirection => 'RouteDirection',
      _i67.RouteEconomics => 'RouteEconomics',
      _i68.RouteTemplate => 'RouteTemplate',
      _i69.SmsLevel => 'SmsLevel',
      _i70.SystemHealth => 'SystemHealth',
      _i71.TrackingState => 'TrackingState',
      _i72.TrainingResult => 'TrainingResult',
      _i73.VettingStatus => 'VettingStatus',
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
      case _i3.AppNotification():
        return 'AppNotification';
      case _i4.ApplicationCheck():
        return 'ApplicationCheck';
      case _i5.ApplicationStatus():
        return 'ApplicationStatus';
      case _i6.AuthException():
        return 'AuthException';
      case _i7.AuthFailureReason():
        return 'AuthFailureReason';
      case _i8.AuthResult():
        return 'AuthResult';
      case _i9.AuthToken():
        return 'AuthToken';
      case _i10.BalanceView():
        return 'BalanceView';
      case _i11.CashTopUp():
        return 'CashTopUp';
      case _i12.ChatMessage():
        return 'ChatMessage';
      case _i13.ChatThread():
        return 'ChatThread';
      case _i14.CheckKind():
        return 'CheckKind';
      case _i15.Child():
        return 'Child';
      case _i16.CircleRank():
        return 'CircleRank';
      case _i17.DayStats():
        return 'DayStats';
      case _i18.DispatcherAccount():
        return 'DispatcherAccount';
      case _i19.DispatcherTask():
        return 'DispatcherTask';
      case _i20.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i21.Driver():
        return 'Driver';
      case _i22.DriverApplication():
        return 'DriverApplication';
      case _i23.DriverLoad():
        return 'DriverLoad';
      case _i24.Family():
        return 'Family';
      case _i25.FamilyBalanceRow():
        return 'FamilyBalanceRow';
      case _i26.FamilyCircle():
        return 'FamilyCircle';
      case _i27.ServerHealth():
        return 'ServerHealth';
      case _i28.Incident():
        return 'Incident';
      case _i29.IncidentSeverity():
        return 'IncidentSeverity';
      case _i30.Institution():
        return 'Institution';
      case _i31.InstitutionAccess():
        return 'InstitutionAccess';
      case _i32.InstitutionChildRow():
        return 'InstitutionChildRow';
      case _i33.InstitutionDayView():
        return 'InstitutionDayView';
      case _i34.InstitutionType():
        return 'InstitutionType';
      case _i35.LedgerEntry():
        return 'LedgerEntry';
      case _i36.LedgerEntryType():
        return 'LedgerEntryType';
      case _i37.LoadDriver():
        return 'LoadDriver';
      case _i38.LoadFixture():
        return 'LoadFixture';
      case _i39.LoadResult():
        return 'LoadResult';
      case _i40.NotificationChannel():
        return 'NotificationChannel';
      case _i41.NotificationOutbox():
        return 'NotificationOutbox';
      case _i42.NotificationStatus():
        return 'NotificationStatus';
      case _i43.OtpCode():
        return 'OtpCode';
      case _i44.OwnerAccount():
        return 'OwnerAccount';
      case _i45.OwnerReport():
        return 'OwnerReport';
      case _i46.Parent():
        return 'Parent';
      case _i47.ParentRole():
        return 'ParentRole';
      case _i48.PayoutPeriod():
        return 'PayoutPeriod';
      case _i49.PoolCandidate():
        return 'PoolCandidate';
      case _i50.PoolCapacity():
        return 'PoolCapacity';
      case _i51.PushTransport():
        return 'PushTransport';
      case _i52.QuickPhrase():
        return 'QuickPhrase';
      case _i53.RateLimitHit():
        return 'RateLimitHit';
      case _i54.ReportExport():
        return 'ReportExport';
      case _i55.Ride():
        return 'Ride';
      case _i56.RideEvent():
        return 'RideEvent';
      case _i57.RideEventSubmission():
        return 'RideEventSubmission';
      case _i58.RideEventType():
        return 'RideEventType';
      case _i59.RideFlowError():
        return 'RideFlowError';
      case _i60.RideFlowException():
        return 'RideFlowException';
      case _i61.RideLocation():
        return 'RideLocation';
      case _i62.RideLocationPoint():
        return 'RideLocationPoint';
      case _i63.RideSeat():
        return 'RideSeat';
      case _i64.RideStatus():
        return 'RideStatus';
      case _i65.RideView():
        return 'RideView';
      case _i66.RouteDirection():
        return 'RouteDirection';
      case _i67.RouteEconomics():
        return 'RouteEconomics';
      case _i68.RouteTemplate():
        return 'RouteTemplate';
      case _i69.SmsLevel():
        return 'SmsLevel';
      case _i70.SystemHealth():
        return 'SystemHealth';
      case _i71.TrackingState():
        return 'TrackingState';
      case _i72.TrainingResult():
        return 'TrainingResult';
      case _i73.VettingStatus():
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
    if (dataClassName == 'AppNotification') {
      return deserialize<_i3.AppNotification>(data['data']);
    }
    if (dataClassName == 'ApplicationCheck') {
      return deserialize<_i4.ApplicationCheck>(data['data']);
    }
    if (dataClassName == 'ApplicationStatus') {
      return deserialize<_i5.ApplicationStatus>(data['data']);
    }
    if (dataClassName == 'AuthException') {
      return deserialize<_i6.AuthException>(data['data']);
    }
    if (dataClassName == 'AuthFailureReason') {
      return deserialize<_i7.AuthFailureReason>(data['data']);
    }
    if (dataClassName == 'AuthResult') {
      return deserialize<_i8.AuthResult>(data['data']);
    }
    if (dataClassName == 'AuthToken') {
      return deserialize<_i9.AuthToken>(data['data']);
    }
    if (dataClassName == 'BalanceView') {
      return deserialize<_i10.BalanceView>(data['data']);
    }
    if (dataClassName == 'CashTopUp') {
      return deserialize<_i11.CashTopUp>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i12.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatThread') {
      return deserialize<_i13.ChatThread>(data['data']);
    }
    if (dataClassName == 'CheckKind') {
      return deserialize<_i14.CheckKind>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i15.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i16.CircleRank>(data['data']);
    }
    if (dataClassName == 'DayStats') {
      return deserialize<_i17.DayStats>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i18.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i19.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i20.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i21.Driver>(data['data']);
    }
    if (dataClassName == 'DriverApplication') {
      return deserialize<_i22.DriverApplication>(data['data']);
    }
    if (dataClassName == 'DriverLoad') {
      return deserialize<_i23.DriverLoad>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i24.Family>(data['data']);
    }
    if (dataClassName == 'FamilyBalanceRow') {
      return deserialize<_i25.FamilyBalanceRow>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i26.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i27.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i28.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i29.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i30.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionAccess') {
      return deserialize<_i31.InstitutionAccess>(data['data']);
    }
    if (dataClassName == 'InstitutionChildRow') {
      return deserialize<_i32.InstitutionChildRow>(data['data']);
    }
    if (dataClassName == 'InstitutionDayView') {
      return deserialize<_i33.InstitutionDayView>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i34.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i35.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i36.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'LoadDriver') {
      return deserialize<_i37.LoadDriver>(data['data']);
    }
    if (dataClassName == 'LoadFixture') {
      return deserialize<_i38.LoadFixture>(data['data']);
    }
    if (dataClassName == 'LoadResult') {
      return deserialize<_i39.LoadResult>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i40.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i41.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i42.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i43.OtpCode>(data['data']);
    }
    if (dataClassName == 'OwnerAccount') {
      return deserialize<_i44.OwnerAccount>(data['data']);
    }
    if (dataClassName == 'OwnerReport') {
      return deserialize<_i45.OwnerReport>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i46.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i47.ParentRole>(data['data']);
    }
    if (dataClassName == 'PayoutPeriod') {
      return deserialize<_i48.PayoutPeriod>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i49.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i50.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'PushTransport') {
      return deserialize<_i51.PushTransport>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i52.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'RateLimitHit') {
      return deserialize<_i53.RateLimitHit>(data['data']);
    }
    if (dataClassName == 'ReportExport') {
      return deserialize<_i54.ReportExport>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i55.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i56.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i57.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i58.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i59.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i60.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i61.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i62.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i63.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i64.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i65.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i66.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteEconomics') {
      return deserialize<_i67.RouteEconomics>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i68.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i69.SmsLevel>(data['data']);
    }
    if (dataClassName == 'SystemHealth') {
      return deserialize<_i70.SystemHealth>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i71.TrackingState>(data['data']);
    }
    if (dataClassName == 'TrainingResult') {
      return deserialize<_i72.TrainingResult>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i73.VettingStatus>(data['data']);
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
