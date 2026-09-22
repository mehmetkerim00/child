BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_user" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_session" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_profile_image" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_profile" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_jwt_refresh_token" CASCADE;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
    "photoUrl" text,
    "active" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "driver_phone_idx" ON "driver" USING btree ("phone");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
--
CREATE TABLE "ledger_entry" (
    "id" bigserial PRIMARY KEY,
    "familyId" bigint NOT NULL,
    "type" text NOT NULL,
    "amount" bigint NOT NULL,
    "rideId" bigint,
    "driverId" bigint,
    "note" text,
    "confirmed" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "ledger_family_idx" ON "ledger_entry" USING btree ("familyId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notification_outbox" (
    "id" bigserial PRIMARY KEY,
    "eventKind" text NOT NULL,
    "recipientPhone" text NOT NULL,
    "channel" text NOT NULL,
    "status" text NOT NULL DEFAULT 'queued'::text,
    "attempts" bigint NOT NULL DEFAULT 0,
    "body" text NOT NULL,
    "rideId" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sentAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "outbox_status_idx" ON "notification_outbox" USING btree ("status");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
--
CREATE TABLE "ride_event" (
    "id" bigserial PRIMARY KEY,
    "rideId" bigint NOT NULL,
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

--
-- ACTION CREATE TABLE
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
    "pricePerRide" bigint NOT NULL DEFAULT 0,
    "active" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "child"
    ADD CONSTRAINT "child_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "notification_outbox"
    ADD CONSTRAINT "notification_outbox_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "parent"
    ADD CONSTRAINT "parent_fk_0"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ride_event"
    ADD CONSTRAINT "ride_event_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260922194232848', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260922194232848', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


--
-- MIGRATION VERSION FOR 'serverpod_auth_core'
--
DELETE FROM "serverpod_migrations"WHERE "module" IN ('serverpod_auth_core');

COMMIT;
