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
import 'dev_account.dart' as _i18;
import 'dispatcher_account.dart' as _i19;
import 'dispatcher_task.dart' as _i20;
import 'dispatcher_task_kind.dart' as _i21;
import 'driver.dart' as _i22;
import 'driver_application.dart' as _i23;
import 'driver_load.dart' as _i24;
import 'family.dart' as _i25;
import 'family_balance_row.dart' as _i26;
import 'family_circle.dart' as _i27;
import 'health/server_health.dart' as _i28;
import 'incident.dart' as _i29;
import 'incident_severity.dart' as _i30;
import 'institution.dart' as _i31;
import 'institution_access.dart' as _i32;
import 'institution_child_row.dart' as _i33;
import 'institution_day_view.dart' as _i34;
import 'institution_type.dart' as _i35;
import 'ledger_entry.dart' as _i36;
import 'ledger_entry_type.dart' as _i37;
import 'load_driver.dart' as _i38;
import 'load_fixture.dart' as _i39;
import 'load_result.dart' as _i40;
import 'notification_channel.dart' as _i41;
import 'notification_outbox.dart' as _i42;
import 'notification_status.dart' as _i43;
import 'otp_code.dart' as _i44;
import 'owner_account.dart' as _i45;
import 'owner_report.dart' as _i46;
import 'parent.dart' as _i47;
import 'parent_role.dart' as _i48;
import 'payout_period.dart' as _i49;
import 'pool_candidate.dart' as _i50;
import 'pool_capacity.dart' as _i51;
import 'push_transport.dart' as _i52;
import 'quick_phrase.dart' as _i53;
import 'rate_limit_hit.dart' as _i54;
import 'report_export.dart' as _i55;
import 'ride.dart' as _i56;
import 'ride_event.dart' as _i57;
import 'ride_event_submission.dart' as _i58;
import 'ride_event_type.dart' as _i59;
import 'ride_flow_error.dart' as _i60;
import 'ride_flow_exception.dart' as _i61;
import 'ride_location.dart' as _i62;
import 'ride_location_point.dart' as _i63;
import 'ride_seat.dart' as _i64;
import 'ride_status.dart' as _i65;
import 'ride_view.dart' as _i66;
import 'route_direction.dart' as _i67;
import 'route_economics.dart' as _i68;
import 'route_template.dart' as _i69;
import 'sms_level.dart' as _i70;
import 'system_health.dart' as _i71;
import 'tracking_state.dart' as _i72;
import 'training_result.dart' as _i73;
import 'vetting_status.dart' as _i74;
import 'package:child_client/src/protocol/chat_message.dart' as _i75;
import 'package:child_client/src/protocol/dev_account.dart' as _i76;
import 'package:child_client/src/protocol/family.dart' as _i77;
import 'package:child_client/src/protocol/parent.dart' as _i78;
import 'package:child_client/src/protocol/child.dart' as _i79;
import 'package:child_client/src/protocol/driver.dart' as _i80;
import 'package:child_client/src/protocol/institution.dart' as _i81;
import 'package:child_client/src/protocol/family_circle.dart' as _i82;
import 'package:child_client/src/protocol/route_template.dart' as _i83;
import 'package:child_client/src/protocol/ride_view.dart' as _i84;
import 'package:child_client/src/protocol/ride_event.dart' as _i85;
import 'package:child_client/src/protocol/dispatcher_task.dart' as _i86;
import 'package:child_client/src/protocol/notification_outbox.dart' as _i87;
import 'package:child_client/src/protocol/cash_top_up.dart' as _i88;
import 'package:child_client/src/protocol/pool_candidate.dart' as _i89;
import 'package:child_client/src/protocol/ride_seat.dart' as _i90;
import 'package:child_client/src/protocol/driver_application.dart' as _i91;
import 'package:child_client/src/protocol/application_check.dart' as _i92;
import 'package:child_client/src/protocol/payout_period.dart' as _i93;
import 'package:child_client/src/protocol/incident.dart' as _i94;
import 'package:child_client/src/protocol/training_result.dart' as _i95;
import 'package:child_client/src/protocol/institution_access.dart' as _i96;
import 'package:child_client/src/protocol/family_balance_row.dart' as _i97;
import 'package:child_client/src/protocol/ride_location_point.dart' as _i98;
import 'package:child_client/src/protocol/ride_location.dart' as _i99;
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
export 'dev_account.dart';
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
    if (t == _i18.DevAccount) {
      return _i18.DevAccount.fromJson(data) as T;
    }
    if (t == _i19.DispatcherAccount) {
      return _i19.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i20.DispatcherTask) {
      return _i20.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i21.DispatcherTaskKind) {
      return _i21.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i22.Driver) {
      return _i22.Driver.fromJson(data) as T;
    }
    if (t == _i23.DriverApplication) {
      return _i23.DriverApplication.fromJson(data) as T;
    }
    if (t == _i24.DriverLoad) {
      return _i24.DriverLoad.fromJson(data) as T;
    }
    if (t == _i25.Family) {
      return _i25.Family.fromJson(data) as T;
    }
    if (t == _i26.FamilyBalanceRow) {
      return _i26.FamilyBalanceRow.fromJson(data) as T;
    }
    if (t == _i27.FamilyCircle) {
      return _i27.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i28.ServerHealth) {
      return _i28.ServerHealth.fromJson(data) as T;
    }
    if (t == _i29.Incident) {
      return _i29.Incident.fromJson(data) as T;
    }
    if (t == _i30.IncidentSeverity) {
      return _i30.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i31.Institution) {
      return _i31.Institution.fromJson(data) as T;
    }
    if (t == _i32.InstitutionAccess) {
      return _i32.InstitutionAccess.fromJson(data) as T;
    }
    if (t == _i33.InstitutionChildRow) {
      return _i33.InstitutionChildRow.fromJson(data) as T;
    }
    if (t == _i34.InstitutionDayView) {
      return _i34.InstitutionDayView.fromJson(data) as T;
    }
    if (t == _i35.InstitutionType) {
      return _i35.InstitutionType.fromJson(data) as T;
    }
    if (t == _i36.LedgerEntry) {
      return _i36.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i37.LedgerEntryType) {
      return _i37.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i38.LoadDriver) {
      return _i38.LoadDriver.fromJson(data) as T;
    }
    if (t == _i39.LoadFixture) {
      return _i39.LoadFixture.fromJson(data) as T;
    }
    if (t == _i40.LoadResult) {
      return _i40.LoadResult.fromJson(data) as T;
    }
    if (t == _i41.NotificationChannel) {
      return _i41.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i42.NotificationOutbox) {
      return _i42.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i43.NotificationStatus) {
      return _i43.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i44.OtpCode) {
      return _i44.OtpCode.fromJson(data) as T;
    }
    if (t == _i45.OwnerAccount) {
      return _i45.OwnerAccount.fromJson(data) as T;
    }
    if (t == _i46.OwnerReport) {
      return _i46.OwnerReport.fromJson(data) as T;
    }
    if (t == _i47.Parent) {
      return _i47.Parent.fromJson(data) as T;
    }
    if (t == _i48.ParentRole) {
      return _i48.ParentRole.fromJson(data) as T;
    }
    if (t == _i49.PayoutPeriod) {
      return _i49.PayoutPeriod.fromJson(data) as T;
    }
    if (t == _i50.PoolCandidate) {
      return _i50.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i51.PoolCapacity) {
      return _i51.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i52.PushTransport) {
      return _i52.PushTransport.fromJson(data) as T;
    }
    if (t == _i53.QuickPhrase) {
      return _i53.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i54.RateLimitHit) {
      return _i54.RateLimitHit.fromJson(data) as T;
    }
    if (t == _i55.ReportExport) {
      return _i55.ReportExport.fromJson(data) as T;
    }
    if (t == _i56.Ride) {
      return _i56.Ride.fromJson(data) as T;
    }
    if (t == _i57.RideEvent) {
      return _i57.RideEvent.fromJson(data) as T;
    }
    if (t == _i58.RideEventSubmission) {
      return _i58.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i59.RideEventType) {
      return _i59.RideEventType.fromJson(data) as T;
    }
    if (t == _i60.RideFlowError) {
      return _i60.RideFlowError.fromJson(data) as T;
    }
    if (t == _i61.RideFlowException) {
      return _i61.RideFlowException.fromJson(data) as T;
    }
    if (t == _i62.RideLocation) {
      return _i62.RideLocation.fromJson(data) as T;
    }
    if (t == _i63.RideLocationPoint) {
      return _i63.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i64.RideSeat) {
      return _i64.RideSeat.fromJson(data) as T;
    }
    if (t == _i65.RideStatus) {
      return _i65.RideStatus.fromJson(data) as T;
    }
    if (t == _i66.RideView) {
      return _i66.RideView.fromJson(data) as T;
    }
    if (t == _i67.RouteDirection) {
      return _i67.RouteDirection.fromJson(data) as T;
    }
    if (t == _i68.RouteEconomics) {
      return _i68.RouteEconomics.fromJson(data) as T;
    }
    if (t == _i69.RouteTemplate) {
      return _i69.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i70.SmsLevel) {
      return _i70.SmsLevel.fromJson(data) as T;
    }
    if (t == _i71.SystemHealth) {
      return _i71.SystemHealth.fromJson(data) as T;
    }
    if (t == _i72.TrackingState) {
      return _i72.TrackingState.fromJson(data) as T;
    }
    if (t == _i73.TrainingResult) {
      return _i73.TrainingResult.fromJson(data) as T;
    }
    if (t == _i74.VettingStatus) {
      return _i74.VettingStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i18.DevAccount?>()) {
      return (data != null ? _i18.DevAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DispatcherAccount?>()) {
      return (data != null ? _i19.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.DispatcherTask?>()) {
      return (data != null ? _i20.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.DispatcherTaskKind?>()) {
      return (data != null ? _i21.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.Driver?>()) {
      return (data != null ? _i22.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.DriverApplication?>()) {
      return (data != null ? _i23.DriverApplication.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.DriverLoad?>()) {
      return (data != null ? _i24.DriverLoad.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Family?>()) {
      return (data != null ? _i25.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.FamilyBalanceRow?>()) {
      return (data != null ? _i26.FamilyBalanceRow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.FamilyCircle?>()) {
      return (data != null ? _i27.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.ServerHealth?>()) {
      return (data != null ? _i28.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.Incident?>()) {
      return (data != null ? _i29.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.IncidentSeverity?>()) {
      return (data != null ? _i30.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Institution?>()) {
      return (data != null ? _i31.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.InstitutionAccess?>()) {
      return (data != null ? _i32.InstitutionAccess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.InstitutionChildRow?>()) {
      return (data != null ? _i33.InstitutionChildRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.InstitutionDayView?>()) {
      return (data != null ? _i34.InstitutionDayView.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i35.InstitutionType?>()) {
      return (data != null ? _i35.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.LedgerEntry?>()) {
      return (data != null ? _i36.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.LedgerEntryType?>()) {
      return (data != null ? _i37.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.LoadDriver?>()) {
      return (data != null ? _i38.LoadDriver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.LoadFixture?>()) {
      return (data != null ? _i39.LoadFixture.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.LoadResult?>()) {
      return (data != null ? _i40.LoadResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.NotificationChannel?>()) {
      return (data != null ? _i41.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.NotificationOutbox?>()) {
      return (data != null ? _i42.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.NotificationStatus?>()) {
      return (data != null ? _i43.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.OtpCode?>()) {
      return (data != null ? _i44.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.OwnerAccount?>()) {
      return (data != null ? _i45.OwnerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.OwnerReport?>()) {
      return (data != null ? _i46.OwnerReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.Parent?>()) {
      return (data != null ? _i47.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.ParentRole?>()) {
      return (data != null ? _i48.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.PayoutPeriod?>()) {
      return (data != null ? _i49.PayoutPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.PoolCandidate?>()) {
      return (data != null ? _i50.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.PoolCapacity?>()) {
      return (data != null ? _i51.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.PushTransport?>()) {
      return (data != null ? _i52.PushTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.QuickPhrase?>()) {
      return (data != null ? _i53.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.RateLimitHit?>()) {
      return (data != null ? _i54.RateLimitHit.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.ReportExport?>()) {
      return (data != null ? _i55.ReportExport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.Ride?>()) {
      return (data != null ? _i56.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.RideEvent?>()) {
      return (data != null ? _i57.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.RideEventSubmission?>()) {
      return (data != null ? _i58.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i59.RideEventType?>()) {
      return (data != null ? _i59.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.RideFlowError?>()) {
      return (data != null ? _i60.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.RideFlowException?>()) {
      return (data != null ? _i61.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.RideLocation?>()) {
      return (data != null ? _i62.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.RideLocationPoint?>()) {
      return (data != null ? _i63.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.RideSeat?>()) {
      return (data != null ? _i64.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.RideStatus?>()) {
      return (data != null ? _i65.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.RideView?>()) {
      return (data != null ? _i66.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.RouteDirection?>()) {
      return (data != null ? _i67.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i68.RouteEconomics?>()) {
      return (data != null ? _i68.RouteEconomics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.RouteTemplate?>()) {
      return (data != null ? _i69.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.SmsLevel?>()) {
      return (data != null ? _i70.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.SystemHealth?>()) {
      return (data != null ? _i71.SystemHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.TrackingState?>()) {
      return (data != null ? _i72.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i73.TrainingResult?>()) {
      return (data != null ? _i73.TrainingResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i74.VettingStatus?>()) {
      return (data != null ? _i74.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i36.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i36.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i33.InstitutionChildRow>) {
      return (data as List)
              .map((e) => deserialize<_i33.InstitutionChildRow>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i38.LoadDriver>) {
      return (data as List).map((e) => deserialize<_i38.LoadDriver>(e)).toList()
          as T;
    }
    if (t == List<_i17.DayStats>) {
      return (data as List).map((e) => deserialize<_i17.DayStats>(e)).toList()
          as T;
    }
    if (t == List<_i24.DriverLoad>) {
      return (data as List).map((e) => deserialize<_i24.DriverLoad>(e)).toList()
          as T;
    }
    if (t == List<_i68.RouteEconomics>) {
      return (data as List)
              .map((e) => deserialize<_i68.RouteEconomics>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.RideSeat>) {
      return (data as List).map((e) => deserialize<_i64.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i64.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i64.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i75.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i75.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i76.DevAccount>) {
      return (data as List).map((e) => deserialize<_i76.DevAccount>(e)).toList()
          as T;
    }
    if (t == List<_i77.Family>) {
      return (data as List).map((e) => deserialize<_i77.Family>(e)).toList()
          as T;
    }
    if (t == List<_i78.Parent>) {
      return (data as List).map((e) => deserialize<_i78.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i79.Child>) {
      return (data as List).map((e) => deserialize<_i79.Child>(e)).toList()
          as T;
    }
    if (t == List<_i80.Driver>) {
      return (data as List).map((e) => deserialize<_i80.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i81.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i81.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i82.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i82.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i83.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i83.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i84.RideView>) {
      return (data as List).map((e) => deserialize<_i84.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i85.RideEvent>) {
      return (data as List).map((e) => deserialize<_i85.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i86.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i86.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i87.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i87.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i88.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i88.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i89.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i89.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i90.RideSeat>) {
      return (data as List).map((e) => deserialize<_i90.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i91.DriverApplication>) {
      return (data as List)
              .map((e) => deserialize<_i91.DriverApplication>(e))
              .toList()
          as T;
    }
    if (t == List<_i92.ApplicationCheck>) {
      return (data as List)
              .map((e) => deserialize<_i92.ApplicationCheck>(e))
              .toList()
          as T;
    }
    if (t == List<_i93.PayoutPeriod>) {
      return (data as List)
              .map((e) => deserialize<_i93.PayoutPeriod>(e))
              .toList()
          as T;
    }
    if (t == List<_i94.Incident>) {
      return (data as List).map((e) => deserialize<_i94.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i95.TrainingResult>) {
      return (data as List)
              .map((e) => deserialize<_i95.TrainingResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i96.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i96.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i97.FamilyBalanceRow>) {
      return (data as List)
              .map((e) => deserialize<_i97.FamilyBalanceRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i98.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i98.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i99.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i99.RideLocation>(e))
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
      _i18.DevAccount => 'DevAccount',
      _i19.DispatcherAccount => 'DispatcherAccount',
      _i20.DispatcherTask => 'DispatcherTask',
      _i21.DispatcherTaskKind => 'DispatcherTaskKind',
      _i22.Driver => 'Driver',
      _i23.DriverApplication => 'DriverApplication',
      _i24.DriverLoad => 'DriverLoad',
      _i25.Family => 'Family',
      _i26.FamilyBalanceRow => 'FamilyBalanceRow',
      _i27.FamilyCircle => 'FamilyCircle',
      _i28.ServerHealth => 'ServerHealth',
      _i29.Incident => 'Incident',
      _i30.IncidentSeverity => 'IncidentSeverity',
      _i31.Institution => 'Institution',
      _i32.InstitutionAccess => 'InstitutionAccess',
      _i33.InstitutionChildRow => 'InstitutionChildRow',
      _i34.InstitutionDayView => 'InstitutionDayView',
      _i35.InstitutionType => 'InstitutionType',
      _i36.LedgerEntry => 'LedgerEntry',
      _i37.LedgerEntryType => 'LedgerEntryType',
      _i38.LoadDriver => 'LoadDriver',
      _i39.LoadFixture => 'LoadFixture',
      _i40.LoadResult => 'LoadResult',
      _i41.NotificationChannel => 'NotificationChannel',
      _i42.NotificationOutbox => 'NotificationOutbox',
      _i43.NotificationStatus => 'NotificationStatus',
      _i44.OtpCode => 'OtpCode',
      _i45.OwnerAccount => 'OwnerAccount',
      _i46.OwnerReport => 'OwnerReport',
      _i47.Parent => 'Parent',
      _i48.ParentRole => 'ParentRole',
      _i49.PayoutPeriod => 'PayoutPeriod',
      _i50.PoolCandidate => 'PoolCandidate',
      _i51.PoolCapacity => 'PoolCapacity',
      _i52.PushTransport => 'PushTransport',
      _i53.QuickPhrase => 'QuickPhrase',
      _i54.RateLimitHit => 'RateLimitHit',
      _i55.ReportExport => 'ReportExport',
      _i56.Ride => 'Ride',
      _i57.RideEvent => 'RideEvent',
      _i58.RideEventSubmission => 'RideEventSubmission',
      _i59.RideEventType => 'RideEventType',
      _i60.RideFlowError => 'RideFlowError',
      _i61.RideFlowException => 'RideFlowException',
      _i62.RideLocation => 'RideLocation',
      _i63.RideLocationPoint => 'RideLocationPoint',
      _i64.RideSeat => 'RideSeat',
      _i65.RideStatus => 'RideStatus',
      _i66.RideView => 'RideView',
      _i67.RouteDirection => 'RouteDirection',
      _i68.RouteEconomics => 'RouteEconomics',
      _i69.RouteTemplate => 'RouteTemplate',
      _i70.SmsLevel => 'SmsLevel',
      _i71.SystemHealth => 'SystemHealth',
      _i72.TrackingState => 'TrackingState',
      _i73.TrainingResult => 'TrainingResult',
      _i74.VettingStatus => 'VettingStatus',
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
      case _i18.DevAccount():
        return 'DevAccount';
      case _i19.DispatcherAccount():
        return 'DispatcherAccount';
      case _i20.DispatcherTask():
        return 'DispatcherTask';
      case _i21.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i22.Driver():
        return 'Driver';
      case _i23.DriverApplication():
        return 'DriverApplication';
      case _i24.DriverLoad():
        return 'DriverLoad';
      case _i25.Family():
        return 'Family';
      case _i26.FamilyBalanceRow():
        return 'FamilyBalanceRow';
      case _i27.FamilyCircle():
        return 'FamilyCircle';
      case _i28.ServerHealth():
        return 'ServerHealth';
      case _i29.Incident():
        return 'Incident';
      case _i30.IncidentSeverity():
        return 'IncidentSeverity';
      case _i31.Institution():
        return 'Institution';
      case _i32.InstitutionAccess():
        return 'InstitutionAccess';
      case _i33.InstitutionChildRow():
        return 'InstitutionChildRow';
      case _i34.InstitutionDayView():
        return 'InstitutionDayView';
      case _i35.InstitutionType():
        return 'InstitutionType';
      case _i36.LedgerEntry():
        return 'LedgerEntry';
      case _i37.LedgerEntryType():
        return 'LedgerEntryType';
      case _i38.LoadDriver():
        return 'LoadDriver';
      case _i39.LoadFixture():
        return 'LoadFixture';
      case _i40.LoadResult():
        return 'LoadResult';
      case _i41.NotificationChannel():
        return 'NotificationChannel';
      case _i42.NotificationOutbox():
        return 'NotificationOutbox';
      case _i43.NotificationStatus():
        return 'NotificationStatus';
      case _i44.OtpCode():
        return 'OtpCode';
      case _i45.OwnerAccount():
        return 'OwnerAccount';
      case _i46.OwnerReport():
        return 'OwnerReport';
      case _i47.Parent():
        return 'Parent';
      case _i48.ParentRole():
        return 'ParentRole';
      case _i49.PayoutPeriod():
        return 'PayoutPeriod';
      case _i50.PoolCandidate():
        return 'PoolCandidate';
      case _i51.PoolCapacity():
        return 'PoolCapacity';
      case _i52.PushTransport():
        return 'PushTransport';
      case _i53.QuickPhrase():
        return 'QuickPhrase';
      case _i54.RateLimitHit():
        return 'RateLimitHit';
      case _i55.ReportExport():
        return 'ReportExport';
      case _i56.Ride():
        return 'Ride';
      case _i57.RideEvent():
        return 'RideEvent';
      case _i58.RideEventSubmission():
        return 'RideEventSubmission';
      case _i59.RideEventType():
        return 'RideEventType';
      case _i60.RideFlowError():
        return 'RideFlowError';
      case _i61.RideFlowException():
        return 'RideFlowException';
      case _i62.RideLocation():
        return 'RideLocation';
      case _i63.RideLocationPoint():
        return 'RideLocationPoint';
      case _i64.RideSeat():
        return 'RideSeat';
      case _i65.RideStatus():
        return 'RideStatus';
      case _i66.RideView():
        return 'RideView';
      case _i67.RouteDirection():
        return 'RouteDirection';
      case _i68.RouteEconomics():
        return 'RouteEconomics';
      case _i69.RouteTemplate():
        return 'RouteTemplate';
      case _i70.SmsLevel():
        return 'SmsLevel';
      case _i71.SystemHealth():
        return 'SystemHealth';
      case _i72.TrackingState():
        return 'TrackingState';
      case _i73.TrainingResult():
        return 'TrainingResult';
      case _i74.VettingStatus():
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
    if (dataClassName == 'DevAccount') {
      return deserialize<_i18.DevAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i19.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i20.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i21.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i22.Driver>(data['data']);
    }
    if (dataClassName == 'DriverApplication') {
      return deserialize<_i23.DriverApplication>(data['data']);
    }
    if (dataClassName == 'DriverLoad') {
      return deserialize<_i24.DriverLoad>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i25.Family>(data['data']);
    }
    if (dataClassName == 'FamilyBalanceRow') {
      return deserialize<_i26.FamilyBalanceRow>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i27.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i28.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i29.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i30.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i31.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionAccess') {
      return deserialize<_i32.InstitutionAccess>(data['data']);
    }
    if (dataClassName == 'InstitutionChildRow') {
      return deserialize<_i33.InstitutionChildRow>(data['data']);
    }
    if (dataClassName == 'InstitutionDayView') {
      return deserialize<_i34.InstitutionDayView>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i35.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i36.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i37.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'LoadDriver') {
      return deserialize<_i38.LoadDriver>(data['data']);
    }
    if (dataClassName == 'LoadFixture') {
      return deserialize<_i39.LoadFixture>(data['data']);
    }
    if (dataClassName == 'LoadResult') {
      return deserialize<_i40.LoadResult>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i41.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i42.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i43.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i44.OtpCode>(data['data']);
    }
    if (dataClassName == 'OwnerAccount') {
      return deserialize<_i45.OwnerAccount>(data['data']);
    }
    if (dataClassName == 'OwnerReport') {
      return deserialize<_i46.OwnerReport>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i47.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i48.ParentRole>(data['data']);
    }
    if (dataClassName == 'PayoutPeriod') {
      return deserialize<_i49.PayoutPeriod>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i50.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i51.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'PushTransport') {
      return deserialize<_i52.PushTransport>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i53.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'RateLimitHit') {
      return deserialize<_i54.RateLimitHit>(data['data']);
    }
    if (dataClassName == 'ReportExport') {
      return deserialize<_i55.ReportExport>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i56.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i57.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i58.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i59.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i60.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i61.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i62.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i63.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i64.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i65.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i66.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i67.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteEconomics') {
      return deserialize<_i68.RouteEconomics>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i69.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i70.SmsLevel>(data['data']);
    }
    if (dataClassName == 'SystemHealth') {
      return deserialize<_i71.SystemHealth>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i72.TrackingState>(data['data']);
    }
    if (dataClassName == 'TrainingResult') {
      return deserialize<_i73.TrainingResult>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i74.VettingStatus>(data['data']);
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
