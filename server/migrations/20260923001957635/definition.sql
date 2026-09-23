BEGIN;

--
-- Class AuthToken as table auth_token
--
CREATE TABLE "auth_token" (
    "id" bigserial PRIMARY KEY,
    "tokenHash" text NOT NULL,
    "role" text NOT NULL,
    "subjectId" bigint NOT NULL,
    "phone" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone NOT NULL,
    "revokedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "auth_token_hash_idx" ON "auth_token" USING btree ("tokenHash");

--
-- Class CashTopUp as table cash_top_up
--
CREATE TABLE "cash_top_up" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "driverId" bigint NOT NULL,
    "amountTenge" bigint NOT NULL,
    "hasSignature" boolean NOT NULL DEFAULT false,
    "note" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "confirmedAt" timestamp without time zone,
    "confirmedBy" bigint,
    "rejectedAt" timestamp without time zone,
    "rejectReason" text
);

-- Indexes
CREATE INDEX "cash_top_up_family_idx" ON "cash_top_up" USING btree ("familyId");
CREATE INDEX "cash_top_up_open_idx" ON "cash_top_up" USING btree ("confirmedAt");

--
-- Class ChatMessage as table chat_message
--
CREATE TABLE "chat_message" (
    "id" bigserial PRIMARY KEY,
    "threadId" bigint NOT NULL,
    "senderRole" text NOT NULL,
    "senderId" bigint NOT NULL,
    "senderName" text NOT NULL,
    "body" text NOT NULL,
    "quickPhrase" text,
    "critical" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clientMessageId" text NOT NULL
);

-- Indexes
CREATE INDEX "chat_message_thread_idx" ON "chat_message" USING btree ("threadId", "createdAt");
CREATE UNIQUE INDEX "chat_message_client_idx" ON "chat_message" USING btree ("clientMessageId");

--
-- Class ChatThread as table chat_thread
--
CREATE TABLE "chat_thread" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "rideId" bigint,
    "driverId" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastMessageAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "chat_thread_family_idx" ON "chat_thread" USING btree ("familyId");
CREATE INDEX "chat_thread_ride_idx" ON "chat_thread" USING btree ("rideId");

--
-- Class Child as table child
--
CREATE TABLE "child" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "name" text NOT NULL,
    "birthYear" bigint,
    "codeWord" text NOT NULL,
    "needsChildSeat" boolean NOT NULL DEFAULT false,
    "photoUrl" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Class DispatcherAccount as table dispatcher_account
--
CREATE TABLE "dispatcher_account" (
    "id" bigserial PRIMARY KEY,
    "phone" text NOT NULL,
    "name" text NOT NULL,
    "active" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "dispatcher_phone_idx" ON "dispatcher_account" USING btree ("phone");

--
-- Class DispatcherTask as table dispatcher_task
--
CREATE TABLE "dispatcher_task" (
    "id" bigserial PRIMARY KEY,
    "kind" text NOT NULL,
    "text" text NOT NULL,
    "rideId" bigint,
    "familyId" bigint,
    "driverId" bigint,
    "dedupeKey" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "resolvedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "dispatcher_task_dedupe_idx" ON "dispatcher_task" USING btree ("dedupeKey");
CREATE INDEX "dispatcher_task_open_idx" ON "dispatcher_task" USING btree ("resolvedAt");

--
-- Class Driver as table driver
--
CREATE TABLE "driver" (
    "id" bigserial PRIMARY KEY,
    "phone" text NOT NULL,
    "name" text NOT NULL,
    "carModel" text NOT NULL,
    "carPlate" text NOT NULL,
    "experienceNote" text,
    "vettingStatus" text NOT NULL DEFAULT 'pending'::text,
    "isFemale" boolean NOT NULL DEFAULT false,
    "seats" bigint NOT NULL DEFAULT 3,
    "childSeats" bigint NOT NULL DEFAULT 1,
    "photoUrl" text,
    "active" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "driver_phone_idx" ON "driver" USING btree ("phone");

--
-- Class Family as table family
--
CREATE TABLE "family" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "ownerPhone" text NOT NULL,
    "locale" text NOT NULL DEFAULT 'ru'::text,
    "smsLevel" text NOT NULL DEFAULT 'all'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "family_owner_phone_idx" ON "family" USING btree ("ownerPhone");

--
-- Class FamilyCircle as table family_circle
--
CREATE TABLE "family_circle" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "driverId" bigint NOT NULL,
    "rank" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "family_circle_unique_idx" ON "family_circle" USING btree ("familyId", "rank");

--
-- Class Institution as table institution
--
CREATE TABLE "institution" (
    "id" bigserial PRIMARY KEY,
    "type" text NOT NULL,
    "name" text NOT NULL,
    "address" text NOT NULL,
    "lat" double precision,
    "lng" double precision,
    "contactPhone" text,
    "handoverCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Class InstitutionAccess as table institution_access
--
CREATE TABLE "institution_access" (
    "id" bigserial PRIMARY KEY,
    "institutionId" bigint NOT NULL,
    "tokenHash" text NOT NULL,
    "issuedTo" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUsedAt" timestamp without time zone,
    "revokedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "institution_access_token_idx" ON "institution_access" USING btree ("tokenHash");
CREATE INDEX "institution_access_institution_idx" ON "institution_access" USING btree ("institutionId");

--
-- Class LedgerEntry as table ledger_entry
--
CREATE TABLE "ledger_entry" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "type" text NOT NULL,
    "amountTenge" bigint NOT NULL,
    "rideId" bigint,
    "driverId" bigint,
    "note" text,
    "dedupeKey" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "ledger_family_idx" ON "ledger_entry" USING btree ("familyId");
CREATE UNIQUE INDEX "ledger_dedupe_idx" ON "ledger_entry" USING btree ("dedupeKey");

--
-- Class NotificationOutbox as table notification_outbox
--
CREATE TABLE "notification_outbox" (
    "id" bigserial PRIMARY KEY,
    "dedupeKey" text NOT NULL,
    "eventKind" text NOT NULL,
    "critical" boolean NOT NULL DEFAULT false,
    "recipientPhone" text NOT NULL,
    "recipientRole" text NOT NULL,
    "channel" text NOT NULL,
    "status" text NOT NULL DEFAULT 'queued'::text,
    "attempts" bigint NOT NULL DEFAULT 0,
    "body" text NOT NULL,
    "rideId" bigint,
    "familyId" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "nextAttemptAt" timestamp without time zone,
    "sentAt" timestamp without time zone,
    "ackedAt" timestamp without time zone,
    "ackDeadline" timestamp without time zone,
    "lastError" text
);

-- Indexes
CREATE UNIQUE INDEX "outbox_dedupe_idx" ON "notification_outbox" USING btree ("dedupeKey");
CREATE INDEX "outbox_status_idx" ON "notification_outbox" USING btree ("status");
CREATE INDEX "outbox_family_idx" ON "notification_outbox" USING btree ("familyId");

--
-- Class OtpCode as table otp_code
--
CREATE TABLE "otp_code" (
    "id" bigserial PRIMARY KEY,
    "phone" text NOT NULL,
    "codeHash" text NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "attempts" bigint NOT NULL DEFAULT 0,
    "usedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "otp_phone_idx" ON "otp_code" USING btree ("phone");

--
-- Class Parent as table parent
--
CREATE TABLE "parent" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "phone" text NOT NULL,
    "name" text NOT NULL,
    "role" text NOT NULL DEFAULT 'owner'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "parent_phone_idx" ON "parent" USING btree ("phone");

--
-- Class Ride as table ride
--
CREATE TABLE "ride" (
    "id" bigserial PRIMARY KEY,
    "templateId" bigint,
    "childId" bigint NOT NULL,
    "driverId" bigint,
    "date" timestamp without time zone NOT NULL,
    "plannedTime" text NOT NULL,
    "status" text NOT NULL DEFAULT 'scheduled'::text,
    "confirmedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "ride_date_idx" ON "ride" USING btree ("date");

--
-- Class RideEvent as table ride_event
--
CREATE TABLE "ride_event" (
    "id" bigserial PRIMARY KEY,
    "rideId" bigint NOT NULL,
    "clientEventId" text NOT NULL,
    "childId" bigint,
    "type" text NOT NULL,
    "at" timestamp without time zone NOT NULL,
    "byRole" text NOT NULL,
    "lat" double precision,
    "lng" double precision,
    "photoUrl" text,
    "note" text
);

-- Indexes
CREATE INDEX "ride_event_ride_idx" ON "ride_event" USING btree ("rideId");
CREATE UNIQUE INDEX "ride_event_client_id_idx" ON "ride_event" USING btree ("clientEventId");

--
-- Class RideLocation as table ride_location
--
CREATE TABLE "ride_location" (
    "id" bigserial PRIMARY KEY,
    "rideId" bigint NOT NULL,
    "at" timestamp without time zone NOT NULL,
    "lat" double precision NOT NULL,
    "lng" double precision NOT NULL,
    "speedKmh" double precision,
    "accuracyM" double precision
);

-- Indexes
CREATE INDEX "ride_location_ride_at_idx" ON "ride_location" USING btree ("rideId", "at");
CREATE INDEX "ride_location_at_idx" ON "ride_location" USING btree ("at");

--
-- Class RideSeat as table ride_seat
--
CREATE TABLE "ride_seat" (
    "id" bigserial PRIMARY KEY,
    "rideId" bigint NOT NULL,
    "childId" bigint NOT NULL,
    "templateId" bigint,
    "pickupOrder" bigint NOT NULL DEFAULT 1,
    "pickedUpAt" timestamp without time zone,
    "handedOverAt" timestamp without time zone,
    "cancelledAt" timestamp without time zone,
    "absenceReason" text,
    "confirmedByInstitutionAt" timestamp without time zone,
    "confirmedByInstitutionName" text,
    "seatPriceTenge" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE INDEX "ride_seat_ride_idx" ON "ride_seat" USING btree ("rideId");
CREATE UNIQUE INDEX "ride_seat_unique_idx" ON "ride_seat" USING btree ("rideId", "childId");

--
-- Class RouteTemplate as table route_template
--
CREATE TABLE "route_template" (
    "id" bigserial PRIMARY KEY,
    "childId" bigint NOT NULL,
    "weekdays" json NOT NULL,
    "pickupTime" text NOT NULL,
    "fromAddress" text NOT NULL,
    "fromLat" double precision,
    "fromLng" double precision,
    "toInstitutionId" bigint,
    "toAddress" text,
    "direction" text NOT NULL,
    "driverId" bigint,
    "pricePerRideTenge" bigint NOT NULL DEFAULT 0,
    "active" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_time_idx" ON "serverpod_session_log" USING btree ("time");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "cash_top_up" table
--
ALTER TABLE ONLY "cash_top_up"
    ADD CONSTRAINT "cash_top_up_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cash_top_up"
    ADD CONSTRAINT "cash_top_up_fk_1"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cash_top_up"
    ADD CONSTRAINT "cash_top_up_fk_2"
    FOREIGN KEY("confirmedBy")
    REFERENCES "dispatcher_account"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "chat_message" table
--
ALTER TABLE ONLY "chat_message"
    ADD CONSTRAINT "chat_message_fk_0"
    FOREIGN KEY("threadId")
    REFERENCES "chat_thread"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "chat_thread" table
--
ALTER TABLE ONLY "chat_thread"
    ADD CONSTRAINT "chat_thread_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "chat_thread"
    ADD CONSTRAINT "chat_thread_fk_1"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "chat_thread"
    ADD CONSTRAINT "chat_thread_fk_2"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "child" table
--
ALTER TABLE ONLY "child"
    ADD CONSTRAINT "child_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "dispatcher_task" table
--
ALTER TABLE ONLY "dispatcher_task"
    ADD CONSTRAINT "dispatcher_task_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "dispatcher_task"
    ADD CONSTRAINT "dispatcher_task_fk_1"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "dispatcher_task"
    ADD CONSTRAINT "dispatcher_task_fk_2"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "family_circle" table
--
ALTER TABLE ONLY "family_circle"
    ADD CONSTRAINT "family_circle_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "family_circle"
    ADD CONSTRAINT "family_circle_fk_1"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "institution_access" table
--
ALTER TABLE ONLY "institution_access"
    ADD CONSTRAINT "institution_access_fk_0"
    FOREIGN KEY("institutionId")
    REFERENCES "institution"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ledger_entry" table
--
ALTER TABLE ONLY "ledger_entry"
    ADD CONSTRAINT "ledger_entry_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ledger_entry"
    ADD CONSTRAINT "ledger_entry_fk_1"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ledger_entry"
    ADD CONSTRAINT "ledger_entry_fk_2"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "notification_outbox" table
--
ALTER TABLE ONLY "notification_outbox"
    ADD CONSTRAINT "notification_outbox_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification_outbox"
    ADD CONSTRAINT "notification_outbox_fk_1"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "parent" table
--
ALTER TABLE ONLY "parent"
    ADD CONSTRAINT "parent_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ride" table
--
ALTER TABLE ONLY "ride"
    ADD CONSTRAINT "ride_fk_0"
    FOREIGN KEY("templateId")
    REFERENCES "route_template"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ride"
    ADD CONSTRAINT "ride_fk_1"
    FOREIGN KEY("childId")
    REFERENCES "child"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ride"
    ADD CONSTRAINT "ride_fk_2"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ride_event" table
--
ALTER TABLE ONLY "ride_event"
    ADD CONSTRAINT "ride_event_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ride_event"
    ADD CONSTRAINT "ride_event_fk_1"
    FOREIGN KEY("childId")
    REFERENCES "child"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ride_location" table
--
ALTER TABLE ONLY "ride_location"
    ADD CONSTRAINT "ride_location_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "ride_seat" table
--
ALTER TABLE ONLY "ride_seat"
    ADD CONSTRAINT "ride_seat_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ride_seat"
    ADD CONSTRAINT "ride_seat_fk_1"
    FOREIGN KEY("childId")
    REFERENCES "child"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ride_seat"
    ADD CONSTRAINT "ride_seat_fk_2"
    FOREIGN KEY("templateId")
    REFERENCES "route_template"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "route_template" table
--
ALTER TABLE ONLY "route_template"
    ADD CONSTRAINT "route_template_fk_0"
    FOREIGN KEY("childId")
    REFERENCES "child"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "route_template"
    ADD CONSTRAINT "route_template_fk_1"
    FOREIGN KEY("toInstitutionId")
    REFERENCES "institution"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "route_template"
    ADD CONSTRAINT "route_template_fk_2"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923001957635', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923001957635', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
