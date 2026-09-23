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
import 'auth_exception.dart' as _i4;
import 'auth_failure.dart' as _i5;
import 'auth_result.dart' as _i6;
import 'auth_token.dart' as _i7;
import 'balance_view.dart' as _i8;
import 'cash_top_up.dart' as _i9;
import 'chat_message.dart' as _i10;
import 'chat_thread.dart' as _i11;
import 'child.dart' as _i12;
import 'circle_rank.dart' as _i13;
import 'dispatcher_account.dart' as _i14;
import 'dispatcher_task.dart' as _i15;
import 'dispatcher_task_kind.dart' as _i16;
import 'driver.dart' as _i17;
import 'family.dart' as _i18;
import 'family_circle.dart' as _i19;
import 'health/server_health.dart' as _i20;
import 'institution.dart' as _i21;
import 'institution_access.dart' as _i22;
import 'institution_child_row.dart' as _i23;
import 'institution_day_view.dart' as _i24;
import 'institution_type.dart' as _i25;
import 'ledger_entry.dart' as _i26;
import 'ledger_entry_type.dart' as _i27;
import 'notification_channel.dart' as _i28;
import 'notification_outbox.dart' as _i29;
import 'notification_status.dart' as _i30;
import 'otp_code.dart' as _i31;
import 'parent.dart' as _i32;
import 'parent_role.dart' as _i33;
import 'pool_candidate.dart' as _i34;
import 'pool_capacity.dart' as _i35;
import 'quick_phrase.dart' as _i36;
import 'ride.dart' as _i37;
import 'ride_event.dart' as _i38;
import 'ride_event_submission.dart' as _i39;
import 'ride_event_type.dart' as _i40;
import 'ride_flow_error.dart' as _i41;
import 'ride_flow_exception.dart' as _i42;
import 'ride_location.dart' as _i43;
import 'ride_location_point.dart' as _i44;
import 'ride_seat.dart' as _i45;
import 'ride_status.dart' as _i46;
import 'ride_view.dart' as _i47;
import 'route_direction.dart' as _i48;
import 'route_template.dart' as _i49;
import 'sms_level.dart' as _i50;
import 'tracking_state.dart' as _i51;
import 'vetting_status.dart' as _i52;
import 'package:child_server/src/generated/chat_message.dart' as _i53;
import 'package:child_server/src/generated/family.dart' as _i54;
import 'package:child_server/src/generated/parent.dart' as _i55;
import 'package:child_server/src/generated/child.dart' as _i56;
import 'package:child_server/src/generated/driver.dart' as _i57;
import 'package:child_server/src/generated/institution.dart' as _i58;
import 'package:child_server/src/generated/family_circle.dart' as _i59;
import 'package:child_server/src/generated/route_template.dart' as _i60;
import 'package:child_server/src/generated/ride_view.dart' as _i61;
import 'package:child_server/src/generated/ride_event.dart' as _i62;
import 'package:child_server/src/generated/dispatcher_task.dart' as _i63;
import 'package:child_server/src/generated/notification_outbox.dart' as _i64;
import 'package:child_server/src/generated/cash_top_up.dart' as _i65;
import 'package:child_server/src/generated/pool_candidate.dart' as _i66;
import 'package:child_server/src/generated/ride_seat.dart' as _i67;
import 'package:child_server/src/generated/institution_access.dart' as _i68;
import 'package:child_server/src/generated/ride_location_point.dart' as _i69;
import 'package:child_server/src/generated/ride_location.dart' as _i70;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
    if (t == _i4.AuthException) {
      return _i4.AuthException.fromJson(data) as T;
    }
    if (t == _i5.AuthFailureReason) {
      return _i5.AuthFailureReason.fromJson(data) as T;
    }
    if (t == _i6.AuthResult) {
      return _i6.AuthResult.fromJson(data) as T;
    }
    if (t == _i7.AuthToken) {
      return _i7.AuthToken.fromJson(data) as T;
    }
    if (t == _i8.BalanceView) {
      return _i8.BalanceView.fromJson(data) as T;
    }
    if (t == _i9.CashTopUp) {
      return _i9.CashTopUp.fromJson(data) as T;
    }
    if (t == _i10.ChatMessage) {
      return _i10.ChatMessage.fromJson(data) as T;
    }
    if (t == _i11.ChatThread) {
      return _i11.ChatThread.fromJson(data) as T;
    }
    if (t == _i12.Child) {
      return _i12.Child.fromJson(data) as T;
    }
    if (t == _i13.CircleRank) {
      return _i13.CircleRank.fromJson(data) as T;
    }
    if (t == _i14.DispatcherAccount) {
      return _i14.DispatcherAccount.fromJson(data) as T;
    }
    if (t == _i15.DispatcherTask) {
      return _i15.DispatcherTask.fromJson(data) as T;
    }
    if (t == _i16.DispatcherTaskKind) {
      return _i16.DispatcherTaskKind.fromJson(data) as T;
    }
    if (t == _i17.Driver) {
      return _i17.Driver.fromJson(data) as T;
    }
    if (t == _i18.Family) {
      return _i18.Family.fromJson(data) as T;
    }
    if (t == _i19.FamilyCircle) {
      return _i19.FamilyCircle.fromJson(data) as T;
    }
    if (t == _i20.ServerHealth) {
      return _i20.ServerHealth.fromJson(data) as T;
    }
    if (t == _i21.Institution) {
      return _i21.Institution.fromJson(data) as T;
    }
    if (t == _i22.InstitutionAccess) {
      return _i22.InstitutionAccess.fromJson(data) as T;
    }
    if (t == _i23.InstitutionChildRow) {
      return _i23.InstitutionChildRow.fromJson(data) as T;
    }
    if (t == _i24.InstitutionDayView) {
      return _i24.InstitutionDayView.fromJson(data) as T;
    }
    if (t == _i25.InstitutionType) {
      return _i25.InstitutionType.fromJson(data) as T;
    }
    if (t == _i26.LedgerEntry) {
      return _i26.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i27.LedgerEntryType) {
      return _i27.LedgerEntryType.fromJson(data) as T;
    }
    if (t == _i28.NotificationChannel) {
      return _i28.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i29.NotificationOutbox) {
      return _i29.NotificationOutbox.fromJson(data) as T;
    }
    if (t == _i30.NotificationStatus) {
      return _i30.NotificationStatus.fromJson(data) as T;
    }
    if (t == _i31.OtpCode) {
      return _i31.OtpCode.fromJson(data) as T;
    }
    if (t == _i32.Parent) {
      return _i32.Parent.fromJson(data) as T;
    }
    if (t == _i33.ParentRole) {
      return _i33.ParentRole.fromJson(data) as T;
    }
    if (t == _i34.PoolCandidate) {
      return _i34.PoolCandidate.fromJson(data) as T;
    }
    if (t == _i35.PoolCapacity) {
      return _i35.PoolCapacity.fromJson(data) as T;
    }
    if (t == _i36.QuickPhrase) {
      return _i36.QuickPhrase.fromJson(data) as T;
    }
    if (t == _i37.Ride) {
      return _i37.Ride.fromJson(data) as T;
    }
    if (t == _i38.RideEvent) {
      return _i38.RideEvent.fromJson(data) as T;
    }
    if (t == _i39.RideEventSubmission) {
      return _i39.RideEventSubmission.fromJson(data) as T;
    }
    if (t == _i40.RideEventType) {
      return _i40.RideEventType.fromJson(data) as T;
    }
    if (t == _i41.RideFlowError) {
      return _i41.RideFlowError.fromJson(data) as T;
    }
    if (t == _i42.RideFlowException) {
      return _i42.RideFlowException.fromJson(data) as T;
    }
    if (t == _i43.RideLocation) {
      return _i43.RideLocation.fromJson(data) as T;
    }
    if (t == _i44.RideLocationPoint) {
      return _i44.RideLocationPoint.fromJson(data) as T;
    }
    if (t == _i45.RideSeat) {
      return _i45.RideSeat.fromJson(data) as T;
    }
    if (t == _i46.RideStatus) {
      return _i46.RideStatus.fromJson(data) as T;
    }
    if (t == _i47.RideView) {
      return _i47.RideView.fromJson(data) as T;
    }
    if (t == _i48.RouteDirection) {
      return _i48.RouteDirection.fromJson(data) as T;
    }
    if (t == _i49.RouteTemplate) {
      return _i49.RouteTemplate.fromJson(data) as T;
    }
    if (t == _i50.SmsLevel) {
      return _i50.SmsLevel.fromJson(data) as T;
    }
    if (t == _i51.TrackingState) {
      return _i51.TrackingState.fromJson(data) as T;
    }
    if (t == _i52.VettingStatus) {
      return _i52.VettingStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.AccountRole?>()) {
      return (data != null ? _i3.AccountRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AuthException?>()) {
      return (data != null ? _i4.AuthException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthFailureReason?>()) {
      return (data != null ? _i5.AuthFailureReason.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthResult?>()) {
      return (data != null ? _i6.AuthResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AuthToken?>()) {
      return (data != null ? _i7.AuthToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.BalanceView?>()) {
      return (data != null ? _i8.BalanceView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CashTopUp?>()) {
      return (data != null ? _i9.CashTopUp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ChatMessage?>()) {
      return (data != null ? _i10.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ChatThread?>()) {
      return (data != null ? _i11.ChatThread.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Child?>()) {
      return (data != null ? _i12.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.CircleRank?>()) {
      return (data != null ? _i13.CircleRank.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DispatcherAccount?>()) {
      return (data != null ? _i14.DispatcherAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.DispatcherTask?>()) {
      return (data != null ? _i15.DispatcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DispatcherTaskKind?>()) {
      return (data != null ? _i16.DispatcherTaskKind.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.Driver?>()) {
      return (data != null ? _i17.Driver.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Family?>()) {
      return (data != null ? _i18.Family.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.FamilyCircle?>()) {
      return (data != null ? _i19.FamilyCircle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.ServerHealth?>()) {
      return (data != null ? _i20.ServerHealth.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Institution?>()) {
      return (data != null ? _i21.Institution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.InstitutionAccess?>()) {
      return (data != null ? _i22.InstitutionAccess.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.InstitutionChildRow?>()) {
      return (data != null ? _i23.InstitutionChildRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.InstitutionDayView?>()) {
      return (data != null ? _i24.InstitutionDayView.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.InstitutionType?>()) {
      return (data != null ? _i25.InstitutionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.LedgerEntry?>()) {
      return (data != null ? _i26.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.LedgerEntryType?>()) {
      return (data != null ? _i27.LedgerEntryType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.NotificationChannel?>()) {
      return (data != null ? _i28.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.NotificationOutbox?>()) {
      return (data != null ? _i29.NotificationOutbox.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.NotificationStatus?>()) {
      return (data != null ? _i30.NotificationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.OtpCode?>()) {
      return (data != null ? _i31.OtpCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.Parent?>()) {
      return (data != null ? _i32.Parent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.ParentRole?>()) {
      return (data != null ? _i33.ParentRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PoolCandidate?>()) {
      return (data != null ? _i34.PoolCandidate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PoolCapacity?>()) {
      return (data != null ? _i35.PoolCapacity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.QuickPhrase?>()) {
      return (data != null ? _i36.QuickPhrase.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.Ride?>()) {
      return (data != null ? _i37.Ride.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.RideEvent?>()) {
      return (data != null ? _i38.RideEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.RideEventSubmission?>()) {
      return (data != null ? _i39.RideEventSubmission.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.RideEventType?>()) {
      return (data != null ? _i40.RideEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.RideFlowError?>()) {
      return (data != null ? _i41.RideFlowError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.RideFlowException?>()) {
      return (data != null ? _i42.RideFlowException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.RideLocation?>()) {
      return (data != null ? _i43.RideLocation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.RideLocationPoint?>()) {
      return (data != null ? _i44.RideLocationPoint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.RideSeat?>()) {
      return (data != null ? _i45.RideSeat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.RideStatus?>()) {
      return (data != null ? _i46.RideStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.RideView?>()) {
      return (data != null ? _i47.RideView.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.RouteDirection?>()) {
      return (data != null ? _i48.RouteDirection.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.RouteTemplate?>()) {
      return (data != null ? _i49.RouteTemplate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.SmsLevel?>()) {
      return (data != null ? _i50.SmsLevel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.TrackingState?>()) {
      return (data != null ? _i51.TrackingState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.VettingStatus?>()) {
      return (data != null ? _i52.VettingStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i26.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i26.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.InstitutionChildRow>) {
      return (data as List)
              .map((e) => deserialize<_i23.InstitutionChildRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i45.RideSeat>) {
      return (data as List).map((e) => deserialize<_i45.RideSeat>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i45.RideSeat>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i45.RideSeat>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i53.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i53.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i54.Family>) {
      return (data as List).map((e) => deserialize<_i54.Family>(e)).toList()
          as T;
    }
    if (t == List<_i55.Parent>) {
      return (data as List).map((e) => deserialize<_i55.Parent>(e)).toList()
          as T;
    }
    if (t == List<_i56.Child>) {
      return (data as List).map((e) => deserialize<_i56.Child>(e)).toList()
          as T;
    }
    if (t == List<_i57.Driver>) {
      return (data as List).map((e) => deserialize<_i57.Driver>(e)).toList()
          as T;
    }
    if (t == List<_i58.Institution>) {
      return (data as List)
              .map((e) => deserialize<_i58.Institution>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.FamilyCircle>) {
      return (data as List)
              .map((e) => deserialize<_i59.FamilyCircle>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.RouteTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i60.RouteTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.RideView>) {
      return (data as List).map((e) => deserialize<_i61.RideView>(e)).toList()
          as T;
    }
    if (t == List<_i62.RideEvent>) {
      return (data as List).map((e) => deserialize<_i62.RideEvent>(e)).toList()
          as T;
    }
    if (t == List<_i63.DispatcherTask>) {
      return (data as List)
              .map((e) => deserialize<_i63.DispatcherTask>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.NotificationOutbox>) {
      return (data as List)
              .map((e) => deserialize<_i64.NotificationOutbox>(e))
              .toList()
          as T;
    }
    if (t == List<_i65.CashTopUp>) {
      return (data as List).map((e) => deserialize<_i65.CashTopUp>(e)).toList()
          as T;
    }
    if (t == List<_i66.PoolCandidate>) {
      return (data as List)
              .map((e) => deserialize<_i66.PoolCandidate>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i67.RideSeat>) {
      return (data as List).map((e) => deserialize<_i67.RideSeat>(e)).toList()
          as T;
    }
    if (t == List<_i68.InstitutionAccess>) {
      return (data as List)
              .map((e) => deserialize<_i68.InstitutionAccess>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.RideLocationPoint>) {
      return (data as List)
              .map((e) => deserialize<_i69.RideLocationPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i70.RideLocation>) {
      return (data as List)
              .map((e) => deserialize<_i70.RideLocation>(e))
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
      _i4.AuthException => 'AuthException',
      _i5.AuthFailureReason => 'AuthFailureReason',
      _i6.AuthResult => 'AuthResult',
      _i7.AuthToken => 'AuthToken',
      _i8.BalanceView => 'BalanceView',
      _i9.CashTopUp => 'CashTopUp',
      _i10.ChatMessage => 'ChatMessage',
      _i11.ChatThread => 'ChatThread',
      _i12.Child => 'Child',
      _i13.CircleRank => 'CircleRank',
      _i14.DispatcherAccount => 'DispatcherAccount',
      _i15.DispatcherTask => 'DispatcherTask',
      _i16.DispatcherTaskKind => 'DispatcherTaskKind',
      _i17.Driver => 'Driver',
      _i18.Family => 'Family',
      _i19.FamilyCircle => 'FamilyCircle',
      _i20.ServerHealth => 'ServerHealth',
      _i21.Institution => 'Institution',
      _i22.InstitutionAccess => 'InstitutionAccess',
      _i23.InstitutionChildRow => 'InstitutionChildRow',
      _i24.InstitutionDayView => 'InstitutionDayView',
      _i25.InstitutionType => 'InstitutionType',
      _i26.LedgerEntry => 'LedgerEntry',
      _i27.LedgerEntryType => 'LedgerEntryType',
      _i28.NotificationChannel => 'NotificationChannel',
      _i29.NotificationOutbox => 'NotificationOutbox',
      _i30.NotificationStatus => 'NotificationStatus',
      _i31.OtpCode => 'OtpCode',
      _i32.Parent => 'Parent',
      _i33.ParentRole => 'ParentRole',
      _i34.PoolCandidate => 'PoolCandidate',
      _i35.PoolCapacity => 'PoolCapacity',
      _i36.QuickPhrase => 'QuickPhrase',
      _i37.Ride => 'Ride',
      _i38.RideEvent => 'RideEvent',
      _i39.RideEventSubmission => 'RideEventSubmission',
      _i40.RideEventType => 'RideEventType',
      _i41.RideFlowError => 'RideFlowError',
      _i42.RideFlowException => 'RideFlowException',
      _i43.RideLocation => 'RideLocation',
      _i44.RideLocationPoint => 'RideLocationPoint',
      _i45.RideSeat => 'RideSeat',
      _i46.RideStatus => 'RideStatus',
      _i47.RideView => 'RideView',
      _i48.RouteDirection => 'RouteDirection',
      _i49.RouteTemplate => 'RouteTemplate',
      _i50.SmsLevel => 'SmsLevel',
      _i51.TrackingState => 'TrackingState',
      _i52.VettingStatus => 'VettingStatus',
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
      case _i4.AuthException():
        return 'AuthException';
      case _i5.AuthFailureReason():
        return 'AuthFailureReason';
      case _i6.AuthResult():
        return 'AuthResult';
      case _i7.AuthToken():
        return 'AuthToken';
      case _i8.BalanceView():
        return 'BalanceView';
      case _i9.CashTopUp():
        return 'CashTopUp';
      case _i10.ChatMessage():
        return 'ChatMessage';
      case _i11.ChatThread():
        return 'ChatThread';
      case _i12.Child():
        return 'Child';
      case _i13.CircleRank():
        return 'CircleRank';
      case _i14.DispatcherAccount():
        return 'DispatcherAccount';
      case _i15.DispatcherTask():
        return 'DispatcherTask';
      case _i16.DispatcherTaskKind():
        return 'DispatcherTaskKind';
      case _i17.Driver():
        return 'Driver';
      case _i18.Family():
        return 'Family';
      case _i19.FamilyCircle():
        return 'FamilyCircle';
      case _i20.ServerHealth():
        return 'ServerHealth';
      case _i21.Institution():
        return 'Institution';
      case _i22.InstitutionAccess():
        return 'InstitutionAccess';
      case _i23.InstitutionChildRow():
        return 'InstitutionChildRow';
      case _i24.InstitutionDayView():
        return 'InstitutionDayView';
      case _i25.InstitutionType():
        return 'InstitutionType';
      case _i26.LedgerEntry():
        return 'LedgerEntry';
      case _i27.LedgerEntryType():
        return 'LedgerEntryType';
      case _i28.NotificationChannel():
        return 'NotificationChannel';
      case _i29.NotificationOutbox():
        return 'NotificationOutbox';
      case _i30.NotificationStatus():
        return 'NotificationStatus';
      case _i31.OtpCode():
        return 'OtpCode';
      case _i32.Parent():
        return 'Parent';
      case _i33.ParentRole():
        return 'ParentRole';
      case _i34.PoolCandidate():
        return 'PoolCandidate';
      case _i35.PoolCapacity():
        return 'PoolCapacity';
      case _i36.QuickPhrase():
        return 'QuickPhrase';
      case _i37.Ride():
        return 'Ride';
      case _i38.RideEvent():
        return 'RideEvent';
      case _i39.RideEventSubmission():
        return 'RideEventSubmission';
      case _i40.RideEventType():
        return 'RideEventType';
      case _i41.RideFlowError():
        return 'RideFlowError';
      case _i42.RideFlowException():
        return 'RideFlowException';
      case _i43.RideLocation():
        return 'RideLocation';
      case _i44.RideLocationPoint():
        return 'RideLocationPoint';
      case _i45.RideSeat():
        return 'RideSeat';
      case _i46.RideStatus():
        return 'RideStatus';
      case _i47.RideView():
        return 'RideView';
      case _i48.RouteDirection():
        return 'RouteDirection';
      case _i49.RouteTemplate():
        return 'RouteTemplate';
      case _i50.SmsLevel():
        return 'SmsLevel';
      case _i51.TrackingState():
        return 'TrackingState';
      case _i52.VettingStatus():
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
    if (dataClassName == 'AuthException') {
      return deserialize<_i4.AuthException>(data['data']);
    }
    if (dataClassName == 'AuthFailureReason') {
      return deserialize<_i5.AuthFailureReason>(data['data']);
    }
    if (dataClassName == 'AuthResult') {
      return deserialize<_i6.AuthResult>(data['data']);
    }
    if (dataClassName == 'AuthToken') {
      return deserialize<_i7.AuthToken>(data['data']);
    }
    if (dataClassName == 'BalanceView') {
      return deserialize<_i8.BalanceView>(data['data']);
    }
    if (dataClassName == 'CashTopUp') {
      return deserialize<_i9.CashTopUp>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i10.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatThread') {
      return deserialize<_i11.ChatThread>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i12.Child>(data['data']);
    }
    if (dataClassName == 'CircleRank') {
      return deserialize<_i13.CircleRank>(data['data']);
    }
    if (dataClassName == 'DispatcherAccount') {
      return deserialize<_i14.DispatcherAccount>(data['data']);
    }
    if (dataClassName == 'DispatcherTask') {
      return deserialize<_i15.DispatcherTask>(data['data']);
    }
    if (dataClassName == 'DispatcherTaskKind') {
      return deserialize<_i16.DispatcherTaskKind>(data['data']);
    }
    if (dataClassName == 'Driver') {
      return deserialize<_i17.Driver>(data['data']);
    }
    if (dataClassName == 'Family') {
      return deserialize<_i18.Family>(data['data']);
    }
    if (dataClassName == 'FamilyCircle') {
      return deserialize<_i19.FamilyCircle>(data['data']);
    }
    if (dataClassName == 'ServerHealth') {
      return deserialize<_i20.ServerHealth>(data['data']);
    }
    if (dataClassName == 'Institution') {
      return deserialize<_i21.Institution>(data['data']);
    }
    if (dataClassName == 'InstitutionAccess') {
      return deserialize<_i22.InstitutionAccess>(data['data']);
    }
    if (dataClassName == 'InstitutionChildRow') {
      return deserialize<_i23.InstitutionChildRow>(data['data']);
    }
    if (dataClassName == 'InstitutionDayView') {
      return deserialize<_i24.InstitutionDayView>(data['data']);
    }
    if (dataClassName == 'InstitutionType') {
      return deserialize<_i25.InstitutionType>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i26.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'LedgerEntryType') {
      return deserialize<_i27.LedgerEntryType>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i28.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationOutbox') {
      return deserialize<_i29.NotificationOutbox>(data['data']);
    }
    if (dataClassName == 'NotificationStatus') {
      return deserialize<_i30.NotificationStatus>(data['data']);
    }
    if (dataClassName == 'OtpCode') {
      return deserialize<_i31.OtpCode>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i32.Parent>(data['data']);
    }
    if (dataClassName == 'ParentRole') {
      return deserialize<_i33.ParentRole>(data['data']);
    }
    if (dataClassName == 'PoolCandidate') {
      return deserialize<_i34.PoolCandidate>(data['data']);
    }
    if (dataClassName == 'PoolCapacity') {
      return deserialize<_i35.PoolCapacity>(data['data']);
    }
    if (dataClassName == 'QuickPhrase') {
      return deserialize<_i36.QuickPhrase>(data['data']);
    }
    if (dataClassName == 'Ride') {
      return deserialize<_i37.Ride>(data['data']);
    }
    if (dataClassName == 'RideEvent') {
      return deserialize<_i38.RideEvent>(data['data']);
    }
    if (dataClassName == 'RideEventSubmission') {
      return deserialize<_i39.RideEventSubmission>(data['data']);
    }
    if (dataClassName == 'RideEventType') {
      return deserialize<_i40.RideEventType>(data['data']);
    }
    if (dataClassName == 'RideFlowError') {
      return deserialize<_i41.RideFlowError>(data['data']);
    }
    if (dataClassName == 'RideFlowException') {
      return deserialize<_i42.RideFlowException>(data['data']);
    }
    if (dataClassName == 'RideLocation') {
      return deserialize<_i43.RideLocation>(data['data']);
    }
    if (dataClassName == 'RideLocationPoint') {
      return deserialize<_i44.RideLocationPoint>(data['data']);
    }
    if (dataClassName == 'RideSeat') {
      return deserialize<_i45.RideSeat>(data['data']);
    }
    if (dataClassName == 'RideStatus') {
      return deserialize<_i46.RideStatus>(data['data']);
    }
    if (dataClassName == 'RideView') {
      return deserialize<_i47.RideView>(data['data']);
    }
    if (dataClassName == 'RouteDirection') {
      return deserialize<_i48.RouteDirection>(data['data']);
    }
    if (dataClassName == 'RouteTemplate') {
      return deserialize<_i49.RouteTemplate>(data['data']);
    }
    if (dataClassName == 'SmsLevel') {
      return deserialize<_i50.SmsLevel>(data['data']);
    }
    if (dataClassName == 'TrackingState') {
      return deserialize<_i51.TrackingState>(data['data']);
    }
    if (dataClassName == 'VettingStatus') {
      return deserialize<_i52.VettingStatus>(data['data']);
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
      case _i7.AuthToken:
        return _i7.AuthToken.t;
      case _i9.CashTopUp:
        return _i9.CashTopUp.t;
      case _i10.ChatMessage:
        return _i10.ChatMessage.t;
      case _i11.ChatThread:
        return _i11.ChatThread.t;
      case _i12.Child:
        return _i12.Child.t;
      case _i14.DispatcherAccount:
        return _i14.DispatcherAccount.t;
      case _i15.DispatcherTask:
        return _i15.DispatcherTask.t;
      case _i17.Driver:
        return _i17.Driver.t;
      case _i18.Family:
        return _i18.Family.t;
      case _i19.FamilyCircle:
        return _i19.FamilyCircle.t;
      case _i21.Institution:
        return _i21.Institution.t;
      case _i22.InstitutionAccess:
        return _i22.InstitutionAccess.t;
      case _i26.LedgerEntry:
        return _i26.LedgerEntry.t;
      case _i29.NotificationOutbox:
        return _i29.NotificationOutbox.t;
      case _i31.OtpCode:
        return _i31.OtpCode.t;
      case _i32.Parent:
        return _i32.Parent.t;
      case _i37.Ride:
        return _i37.Ride.t;
      case _i38.RideEvent:
        return _i38.RideEvent.t;
      case _i43.RideLocation:
        return _i43.RideLocation.t;
      case _i45.RideSeat:
        return _i45.RideSeat.t;
      case _i49.RouteTemplate:
        return _i49.RouteTemplate.t;
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
