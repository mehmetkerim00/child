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
import 'package:serverpod/protocol.dart' as _i2;
import 'account_role.dart' as _i3;
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
import 'notification_channel.dart' as _i37;
import 'notification_outbox.dart' as _i38;
import 'notification_status.dart' as _i39;
import 'otp_code.dart' as _i40;
import 'owner_account.dart' as _i41;
import 'owner_report.dart' as _i42;
import 'parent.dart' as _i43;
import 'parent_role.dart' as _i44;
import 'payout_period.dart' as _i45;
import 'pool_candidate.dart' as _i46;
import 'pool_capacity.dart' as _i47;
import 'quick_phrase.dart' as _i48;
import 'report_export.dart' as _i49;
import 'ride.dart' as _i50;
import 'ride_event.dart' as _i51;
import 'ride_event_submission.dart' as _i52;
import 'ride_event_type.dart' as _i53;
import 'ride_flow_error.dart' as _i54;
import 'ride_flow_exception.dart' as _i55;
import 'ride_location.dart' as _i56;
import 'ride_location_point.dart' as _i57;
import 'ride_seat.dart' as _i58;
import 'ride_status.dart' as _i59;
import 'ride_view.dart' as _i60;
import 'route_direction.dart' as _i61;
import 'route_economics.dart' as _i62;
import 'route_template.dart' as _i63;
import 'sms_level.dart' as _i64;
import 'tracking_state.dart' as _i65;
import 'training_result.dart' as _i66;
import 'vetting_status.dart' as _i67;
import 'package:child_server/src/generated/chat_message.dart' as _i68;
import 'package:child_server/src/generated/family.dart' as _i69;
import 'package:child_server/src/generated/parent.dart' as _i70;
import 'package:child_server/src/generated/child.dart' as _i71;
import 'package:child_server/src/generated/driver.dart' as _i72;
import 'package:child_server/src/generated/institution.dart' as _i73;
import 'package:child_server/src/generated/family_circle.dart' as _i74;
import 'package:child_server/src/generated/route_template.dart' as _i75;
import 'package:child_server/src/generated/ride_view.dart' as _i76;
import 'package:child_server/src/generated/ride_event.dart' as _i77;
import 'package:child_server/src/generated/dispatcher_task.dart' as _i78;
import 'package:child_server/src/generated/notification_outbox.dart' as _i79;
import 'package:child_server/src/generated/cash_top_up.dart' as _i80;
import 'package:child_server/src/generated/pool_candidate.dart' as _i81;
import 'package:child_server/src/generated/ride_seat.dart' as _i82;
import 'package:child_server/src/generated/driver_application.dart' as _i83;
import 'package:child_server/src/generated/application_check.dart' as _i84;
import 'package:child_server/src/generated/payout_period.dart' as _i85;
import 'package:child_server/src/generated/incident.dart' as _i86;
import 'package:child_server/src/generated/training_result.dart' as _i87;
import 'package:child_server/src/generated/institution_access.dart' as _i88;
import 'package:child_server/src/generated/family_balance_row.dart' as _i89;
import 'package:child_server/src/generated/ride_location_point.dart' as _i90;
import 'package:child_server/src/generated/ride_location.dart' as _i91;
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
export 'tracking_state.dart';
export 'training_result.dart';
export 'vetting_status.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'application_check',
      dartName: 'ApplicationCheck',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'application_check_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'kind',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CheckKind',
        ),
        _i2.ColumnDefinition(
          name: 'passed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'checkedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'checkedBy',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'application_check_fk_0',
          columns: ['applicationId'],
          referenceTable: 'driver_application',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'application_check_fk_1',
          columns: ['checkedBy'],
          referenceTable: 'dispatcher_account',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'application_check_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'application_check_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'kind',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'auth_token',
      dartName: 'AuthToken',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'auth_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AccountRole',
        ),
        _i2.ColumnDefinition(
          name: 'subjectId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'revokedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'auth_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_token_hash_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tokenHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'cash_top_up',
      dartName: 'CashTopUp',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'cash_top_up_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'amountTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'hasSignature',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'confirmedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'confirmedBy',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'rejectedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'rejectReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'cash_top_up_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'cash_top_up_fk_1',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'cash_top_up_fk_2',
          columns: ['confirmedBy'],
          referenceTable: 'dispatcher_account',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'cash_top_up_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'cash_top_up_family_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'familyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'cash_top_up_open_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'confirmedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_message',
      dartName: 'ChatMessage',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'threadId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'senderRole',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AccountRole',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'senderName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'quickPhrase',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:QuickPhrase?',
        ),
        _i2.ColumnDefinition(
          name: 'critical',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'clientMessageId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_message_fk_0',
          columns: ['threadId'],
          referenceTable: 'chat_thread',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_message_thread_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'threadId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_message_client_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'clientMessageId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_thread',
      dartName: 'ChatThread',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_thread_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lastMessageAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_thread_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_thread_fk_1',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_thread_fk_2',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_thread_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_thread_family_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'familyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'chat_thread_ride_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rideId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'child',
      dartName: 'Child',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'child_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'birthYear',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'codeWord',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'needsChildSeat',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'child_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'child_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dispatcher_account',
      dartName: 'DispatcherAccount',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dispatcher_account_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dispatcher_account_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'dispatcher_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dispatcher_task',
      dartName: 'DispatcherTask',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dispatcher_task_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'kind',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DispatcherTaskKind',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'dedupeKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dispatcher_task_fk_0',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'dispatcher_task_fk_1',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'dispatcher_task_fk_2',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dispatcher_task_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'dispatcher_task_dedupe_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dedupeKey',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dispatcher_task_open_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'resolvedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'driver',
      dartName: 'Driver',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'driver_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'carModel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'carPlate',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'experienceNote',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'vettingStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:VettingStatus',
          columnDefault: '\'pending\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'isFemale',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'seats',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '3',
        ),
        _i2.ColumnDefinition(
          name: 'childSeats',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'driver_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'driver_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'driver_application',
      dartName: 'DriverApplication',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'driver_application_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'fullName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'experienceWithChildren',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'drivingYears',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'carModel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'carPlate',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isFemale',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'hasChildSeat',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'comment',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ApplicationStatus',
          columnDefault: '\'submitted\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'rejectedReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'driver_application_fk_0',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'driver_application_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'driver_application_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'driver_application_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'family',
      dartName: 'Family',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'family_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerPhone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'locale',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'ru\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'smsLevel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SmsLevel',
          columnDefault: '\'all\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'family_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'family_owner_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerPhone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'family_circle',
      dartName: 'FamilyCircle',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'family_circle_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rank',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CircleRank',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'family_circle_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'family_circle_fk_1',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'family_circle_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'family_circle_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'familyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rank',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'incident',
      dartName: 'Incident',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'incident_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'severity',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:IncidentSeverity',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'resolution',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'createdBy',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_0',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_1',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_2',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'incident_fk_3',
          columns: ['createdBy'],
          referenceTable: 'dispatcher_account',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'incident_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'incident_driver_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'driverId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'incident_open_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'resolvedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'institution',
      dartName: 'Institution',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'institution_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:InstitutionType',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'lng',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'contactPhone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'handoverCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'institution_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'institution_access',
      dartName: 'InstitutionAccess',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'institution_access_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'institutionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'issuedTo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lastUsedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'revokedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'institution_access_fk_0',
          columns: ['institutionId'],
          referenceTable: 'institution',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'institution_access_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'institution_access_token_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tokenHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'institution_access_institution_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'institutionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ledger_entry',
      dartName: 'LedgerEntry',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ledger_entry_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:LedgerEntryType',
        ),
        _i2.ColumnDefinition(
          name: 'amountTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'dedupeKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ledger_entry_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ledger_entry_fk_1',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ledger_entry_fk_2',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ledger_entry_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ledger_family_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'familyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ledger_dedupe_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dedupeKey',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'notification_outbox',
      dartName: 'NotificationOutbox',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'notification_outbox_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dedupeKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'eventKind',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'critical',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'recipientPhone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'recipientRole',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AccountRole',
        ),
        _i2.ColumnDefinition(
          name: 'channel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:NotificationChannel',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:NotificationStatus',
          columnDefault: '\'queued\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'attempts',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'nextAttemptAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'sentAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ackedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ackDeadline',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastError',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'notification_outbox_fk_0',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'notification_outbox_fk_1',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'notification_outbox_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'outbox_dedupe_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dedupeKey',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'outbox_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'outbox_family_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'familyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'otp_code',
      dartName: 'OtpCode',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'otp_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'codeHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'attempts',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'usedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'otp_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'otp_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'owner_account',
      dartName: 'OwnerAccount',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'owner_account_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'owner_account_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'owner_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'parent',
      dartName: 'Parent',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'parent_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'familyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ParentRole',
          columnDefault: '\'owner\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'parent_fk_0',
          columns: ['familyId'],
          referenceTable: 'family',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'parent_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'parent_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'payout_period',
      dartName: 'PayoutPeriod',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'payout_period_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fromDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'toDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'blocks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'blockPayTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ridePayTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'totalTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'paidAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'payout_period_fk_0',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'payout_period_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'payout_period_driver_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'driverId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'fromDate',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'report_export',
      dartName: 'ReportExport',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'report_export_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fromDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'toDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'smsPriceTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'blockPayTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'perRideTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'usedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'report_export_fk_0',
          columns: ['ownerId'],
          referenceTable: 'owner_account',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'report_export_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'report_export_token_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tokenHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ride',
      dartName: 'Ride',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ride_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'templateId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'plannedTime',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RideStatus',
          columnDefault: '\'scheduled\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'confirmedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_fk_0',
          columns: ['templateId'],
          referenceTable: 'route_template',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_fk_1',
          columns: ['childId'],
          referenceTable: 'child',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_fk_2',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ride_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ride_event',
      dartName: 'RideEvent',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ride_event_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'clientEventId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RideEventType',
        ),
        _i2.ColumnDefinition(
          name: 'at',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'byRole',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AccountRole',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'lng',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'photoUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_event_fk_0',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_event_fk_1',
          columns: ['childId'],
          referenceTable: 'child',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ride_event_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_event_ride_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rideId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_event_client_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'clientEventId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ride_location',
      dartName: 'RideLocation',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ride_location_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'at',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'lng',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'speedKmh',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'accuracyM',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_location_fk_0',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ride_location_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_location_ride_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rideId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'at',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_location_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'at',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ride_seat',
      dartName: 'RideSeat',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ride_seat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'rideId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'templateId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'pickupOrder',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'pickedUpAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'handedOverAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'cancelledAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'absenceReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'confirmedByInstitutionAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'confirmedByInstitutionName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'seatPriceTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_seat_fk_0',
          columns: ['rideId'],
          referenceTable: 'ride',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_seat_fk_1',
          columns: ['childId'],
          referenceTable: 'child',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ride_seat_fk_2',
          columns: ['templateId'],
          referenceTable: 'route_template',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ride_seat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_seat_ride_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rideId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ride_seat_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'rideId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'childId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'route_template',
      dartName: 'RouteTemplate',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'route_template_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'weekdays',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'pickupTime',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fromAddress',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fromLat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'fromLng',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'toInstitutionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'toAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'direction',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RouteDirection',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'pricePerRideTenge',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'route_template_fk_0',
          columns: ['childId'],
          referenceTable: 'child',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'route_template_fk_1',
          columns: ['toInstitutionId'],
          referenceTable: 'institution',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'route_template_fk_2',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'route_template_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'training_result',
      dartName: 'TrainingResult',
      schema: 'public',
      module: 'child',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'training_result_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'driverId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'correct',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'total',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'passed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'attempt',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'training_result_fk_0',
          columns: ['driverId'],
          referenceTable: 'driver',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'training_result_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'training_result_driver_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'driverId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i3.AccountRole) {
      return _i3.AccountRole.fromJson(data) as T;
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
    if (t == _i37.NotificationChannel) {
      return _i37.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i38.NotificationOutbox) {
      return _i38.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i39.NotificationStatus) {
      return _i39.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i40.OtpCode) {
      return _i40.OtpCode.fromJson(data) as T;
    }
    if (t == _i41.OwnerAccount) {
      return _i41.OwnerAccount.fromJson(data) as T;
    }
    if (t == _i42.OwnerReport) {
      return _i42.OwnerReport.fromJson(data) as T;
    }
    if (t == _i43.Parent) {
      return _i43.Parent.fromJson(data) as T;
    }
    if (t == _i44.ParentRole) {
      return _i44.ParentRole.fromJson(data) as T;
    }
    if (t == _i45.PayoutPeriod) {
      return _i45.PayoutPeriod.fromJson(data) as T;
    }
    if (t == _i46.PoolCandidate) {
      return _i46.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i47.PoolCapacity) {
      return _i47.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i48.QuickPhrase) {
      return _i48.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i49.ReportExport) {
      return _i49.ReportExport.fromJson(data) as T;
    }
    if (t == _i50.Ride) {
      return _i50.Ride.fromJson(data) as T;
    }
    if (t == _i51.RideEvent) {
      return _i51.RideEvent.fromJson(data) as T;
    }
    if (t == _i52.RideEventSubmission) {
      return _i52.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i53.RideEventType) {
      return _i53.RideEventType.fromJson(data) as T;
    }
    if (t == _i54.RideFlowError) {
      return _i54.RideFlowError.fromJson(data) as T;
    }
    if (t == _i55.RideFlowException) {
      return _i55.RideFlowException.fromJson(data) as T;
    }
    if (t == _i56.RideLocation) {
      return _i56.RideLocation.fromJson(data) as T;
    }
    if (t == _i57.RideLocationPoint) {
      return _i57.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i58.RideSeat) {
      return _i58.RideSeat.fromJson(data) as T;
    }
    if (t == _i59.RideStatus) {
      return _i59.RideStatus.fromJson(data) as T;
    }
    if (t == _i60.RideView) {
      return _i60.RideView.fromJson(data) as T;
    }
    if (t == _i61.RouteDirection) {
      return _i61.RouteDirection.fromJson(data) as T;
    }
    if (t == _i62.RouteEconomics) {
      return _i62.RouteEconomics.fromJson(data) as T;
    }
    if (t == _i63.RouteTemplate) {
      return _i63.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i64.SmsLevel) {
      return _i64.SmsLevel.fromJson(data) as T;
    }
    if (t == _i65.TrackingState) {
      return _i65.TrackingState.fromJson(data) as T;
    }
    if (t == _i66.TrainingResult) {
      return _i66.TrainingResult.fromJson(data) as T;
    }
    if (t == _i67.VettingStatus) {
      return _i67.VettingStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.AccountRole?>()) {
      return (data != null ? _i3.AccountRole.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i37.NotificationChannel?>()) {
      return (data != null ? _i37.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.NotificationOutbox?>()) {
      return (data != null ? _i38.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.NotificationStatus?>()) {
      return (data != null ? _i39.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.OtpCode?>()) {
      return (data != null ? _i40.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.OwnerAccount?>()) {
      return (data != null ? _i41.OwnerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.OwnerReport?>()) {
      return (data != null ? _i42.OwnerReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.Parent?>()) {
      return (data != null ? _i43.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.ParentRole?>()) {
      return (data != null ? _i44.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.PayoutPeriod?>()) {
      return (data != null ? _i45.PayoutPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.PoolCandidate?>()) {
      return (data != null ? _i46.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.PoolCapacity?>()) {
      return (data != null ? _i47.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.QuickPhrase?>()) {
      return (data != null ? _i48.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.ReportExport?>()) {
      return (data != null ? _i49.ReportExport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.Ride?>()) {
      return (data != null ? _i50.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.RideEvent?>()) {
      return (data != null ? _i51.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.RideEventSubmission?>()) {
      return (data != null ? _i52.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.RideEventType?>()) {
      return (data != null ? _i53.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.RideFlowError?>()) {
      return (data != null ? _i54.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.RideFlowException?>()) {
      return (data != null ? _i55.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.RideLocation?>()) {
      return (data != null ? _i56.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.RideLocationPoint?>()) {
      return (data != null ? _i57.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.RideSeat?>()) {
      return (data != null ? _i58.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.RideStatus?>()) {
      return (data != null ? _i59.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.RideView?>()) {
      return (data != null ? _i60.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.RouteDirection?>()) {
      return (data != null ? _i61.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.RouteEconomics?>()) {
      return (data != null ? _i62.RouteEconomics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.RouteTemplate?>()) {
      return (data != null ? _i63.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.SmsLevel?>()) {
      return (data != null ? _i64.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.TrackingState?>()) {
      return (data != null ? _i65.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.TrainingResult?>()) {
      return (data != null ? _i66.TrainingResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.VettingStatus?>()) {
      return (data != null ? _i67.VettingStatus.fromJson(data) : null) as T;
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
    if (t == List<_i17.DayStats>) {
      return (data as List).map((e) => deserialize<_i17.DayStats>(e)).toList()
          as T;
    }
    if (t == List<_i23.DriverLoad>) {
      return (data as List).map((e) => deserialize<_i23.DriverLoad>(e)).toList()
          as T;
    }
    if (t == List<_i62.RouteEconomics>) {
      return (data as List)
              .map((e) => deserialize<_i62.RouteEconomics>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i58.RideSeat>) {
      return (data as List).map((e) => deserialize<_i58.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i58.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i58.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i68.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i68.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.Family>) {
      return (data as List).map((e) => deserialize<_i69.Family>(e)).toList()
          as T;
    }
    if (t == List<_i70.Parent>) {
      return (data as List).map((e) => deserialize<_i70.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i71.Child>) {
      return (data as List).map((e) => deserialize<_i71.Child>(e)).toList()
          as T;
    }
    if (t == List<_i72.Driver>) {
      return (data as List).map((e) => deserialize<_i72.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i73.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i73.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i74.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i74.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i75.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i75.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i76.RideView>) {
      return (data as List).map((e) => deserialize<_i76.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i77.RideEvent>) {
      return (data as List).map((e) => deserialize<_i77.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i78.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i78.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i79.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i79.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i80.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i80.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i81.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i81.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i82.RideSeat>) {
      return (data as List).map((e) => deserialize<_i82.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i83.DriverApplication>) {
      return (data as List)
              .map((e) => deserialize<_i83.DriverApplication>(e))
              .toList()
          as T;
    }
    if (t == List<_i84.ApplicationCheck>) {
      return (data as List)
              .map((e) => deserialize<_i84.ApplicationCheck>(e))
              .toList()
          as T;
    }
    if (t == List<_i85.PayoutPeriod>) {
      return (data as List)
              .map((e) => deserialize<_i85.PayoutPeriod>(e))
              .toList()
          as T;
    }
    if (t == List<_i86.Incident>) {
      return (data as List).map((e) => deserialize<_i86.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i87.TrainingResult>) {
      return (data as List)
              .map((e) => deserialize<_i87.TrainingResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i88.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i88.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i89.FamilyBalanceRow>) {
      return (data as List)
              .map((e) => deserialize<_i89.FamilyBalanceRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i90.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i91.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i91.RideLocation>(e))
              .toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i3.AccountRole => 'AccountRole',
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
      _i37.NotificationChannel => 'NotificationChannel',
      _i38.NotificationOutbox => 'NotificationOutbox',
      _i39.NotificationStatus => 'NotificationStatus',
      _i40.OtpCode => 'OtpCode',
      _i41.OwnerAccount => 'OwnerAccount',
      _i42.OwnerReport => 'OwnerReport',
      _i43.Parent => 'Parent',
      _i44.ParentRole => 'ParentRole',
      _i45.PayoutPeriod => 'PayoutPeriod',
      _i46.PoolCandidate => 'PoolCandidate',
      _i47.PoolCapacity => 'PoolCapacity',
      _i48.QuickPhrase => 'QuickPhrase',
      _i49.ReportExport => 'ReportExport',
      _i50.Ride => 'Ride',
      _i51.RideEvent => 'RideEvent',
      _i52.RideEventSubmission => 'RideEventSubmission',
      _i53.RideEventType => 'RideEventType',
      _i54.RideFlowError => 'RideFlowError',
      _i55.RideFlowException => 'RideFlowException',
      _i56.RideLocation => 'RideLocation',
      _i57.RideLocationPoint => 'RideLocationPoint',
      _i58.RideSeat => 'RideSeat',
      _i59.RideStatus => 'RideStatus',
      _i60.RideView => 'RideView',
      _i61.RouteDirection => 'RouteDirection',
      _i62.RouteEconomics => 'RouteEconomics',
      _i63.RouteTemplate => 'RouteTemplate',
      _i64.SmsLevel => 'SmsLevel',
      _i65.TrackingState => 'TrackingState',
      _i66.TrainingResult => 'TrainingResult',
      _i67.VettingStatus => 'VettingStatus',
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
      case _i3.AccountRole():
        return 'AccountRole';
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
      case _i37.NotificationChannel():
        return 'NotificationChannel';
      case _i38.NotificationOutbox():
        return 'NotificationOutbox';
      case _i39.NotificationStatus():
        return 'NotificationStatus';
      case _i40.OtpCode():
        return 'OtpCode';
      case _i41.OwnerAccount():
        return 'OwnerAccount';
      case _i42.OwnerReport():
        return 'OwnerReport';
      case _i43.Parent():
        return 'Parent';
      case _i44.ParentRole():
        return 'ParentRole';
      case _i45.PayoutPeriod():
        return 'PayoutPeriod';
      case _i46.PoolCandidate():
        return 'PoolCandidate';
      case _i47.PoolCapacity():
        return 'PoolCapacity';
      case _i48.QuickPhrase():
        return 'QuickPhrase';
      case _i49.ReportExport():
        return 'ReportExport';
      case _i50.Ride():
        return 'Ride';
      case _i51.RideEvent():
        return 'RideEvent';
      case _i52.RideEventSubmission():
        return 'RideEventSubmission';
      case _i53.RideEventType():
        return 'RideEventType';
      case _i54.RideFlowError():
        return 'RideFlowError';
      case _i55.RideFlowException():
        return 'RideFlowException';
      case _i56.RideLocation():
        return 'RideLocation';
      case _i57.RideLocationPoint():
        return 'RideLocationPoint';
      case _i58.RideSeat():
        return 'RideSeat';
      case _i59.RideStatus():
        return 'RideStatus';
      case _i60.RideView():
        return 'RideView';
      case _i61.RouteDirection():
        return 'RouteDirection';
      case _i62.RouteEconomics():
        return 'RouteEconomics';
      case _i63.RouteTemplate():
        return 'RouteTemplate';
      case _i64.SmsLevel():
        return 'SmsLevel';
      case _i65.TrackingState():
        return 'TrackingState';
      case _i66.TrainingResult():
        return 'TrainingResult';
      case _i67.VettingStatus():
        return 'VettingStatus';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
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
      return deserialize<_i3.AccountRole>(data['data']);
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
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i37.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i38.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i39.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i40.OtpCode>(data['data']);
    }
    if (dataClassName == 'OwnerAccount') {
      return deserialize<_i41.OwnerAccount>(data['data']);
    }
    if (dataClassName == 'OwnerReport') {
      return deserialize<_i42.OwnerReport>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i43.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i44.ParentRole>(data['data']);
    }
    if (dataClassName == 'PayoutPeriod') {
      return deserialize<_i45.PayoutPeriod>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i46.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i47.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i48.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'ReportExport') {
      return deserialize<_i49.ReportExport>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i50.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i51.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i52.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i53.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i54.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i55.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i56.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i57.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i58.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i59.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i60.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i61.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteEconomics') {
      return deserialize<_i62.RouteEconomics>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i63.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i64.SmsLevel>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i65.TrackingState>(data['data']);
    }
    if (dataClassName == 'TrainingResult') {
      return deserialize<_i66.TrainingResult>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i67.VettingStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.ApplicationCheck:
        return _i4.ApplicationCheck.t;
      case _i9.AuthToken:
        return _i9.AuthToken.t;
      case _i11.CashTopUp:
        return _i11.CashTopUp.t;
      case _i12.ChatMessage:
        return _i12.ChatMessage.t;
      case _i13.ChatThread:
        return _i13.ChatThread.t;
      case _i15.Child:
        return _i15.Child.t;
      case _i18.DispatcherAccount:
        return _i18.DispatcherAccount.t;
      case _i19.DispatcherTask:
        return _i19.DispatcherTask.t;
      case _i21.Driver:
        return _i21.Driver.t;
      case _i22.DriverApplication:
        return _i22.DriverApplication.t;
      case _i24.Family:
        return _i24.Family.t;
      case _i26.FamilyCircle:
        return _i26.FamilyCircle.t;
      case _i28.Incident:
        return _i28.Incident.t;
      case _i30.Institution:
        return _i30.Institution.t;
      case _i31.InstitutionAccess:
        return _i31.InstitutionAccess.t;
      case _i35.LedgerEntry:
        return _i35.LedgerEntry.t;
      case _i38.NotificationOutbox:
        return _i38.NotificationOutbox.t;
      case _i40.OtpCode:
        return _i40.OtpCode.t;
      case _i41.OwnerAccount:
        return _i41.OwnerAccount.t;
      case _i43.Parent:
        return _i43.Parent.t;
      case _i45.PayoutPeriod:
        return _i45.PayoutPeriod.t;
      case _i49.ReportExport:
        return _i49.ReportExport.t;
      case _i50.Ride:
        return _i50.Ride.t;
      case _i51.RideEvent:
        return _i51.RideEvent.t;
      case _i56.RideLocation:
        return _i56.RideLocation.t;
      case _i58.RideSeat:
        return _i58.RideSeat.t;
      case _i63.RouteTemplate:
        return _i63.RouteTemplate.t;
      case _i66.TrainingResult:
        return _i66.TrainingResult.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'child';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i2.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
