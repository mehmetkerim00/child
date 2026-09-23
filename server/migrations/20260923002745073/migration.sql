BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "application_check" (
    "id" bigserial PRIMARY KEY,
    "applicationId" bigint NOT NULL,
    "kind" text NOT NULL,
    "passed" boolean NOT NULL DEFAULT false,
    "note" text,
    "checkedAt" timestamp without time zone,
    "checkedBy" bigint
);

-- Indexes
CREATE UNIQUE INDEX "application_check_unique_idx" ON "application_check" USING btree ("applicationId", "kind");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "driver_application" (
    "id" bigserial PRIMARY KEY,
    "fullName" text NOT NULL,
    "phone" text NOT NULL,
    "experienceWithChildren" text NOT NULL,
    "drivingYears" bigint NOT NULL,
    "carModel" text NOT NULL,
    "carPlate" text NOT NULL,
    "isFemale" boolean NOT NULL DEFAULT false,
    "hasChildSeat" boolean NOT NULL DEFAULT false,
    "comment" text,
    "status" text NOT NULL DEFAULT 'submitted'::text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "driverId" bigint,
    "rejectedReason" text
);

-- Indexes
CREATE INDEX "driver_application_phone_idx" ON "driver_application" USING btree ("phone");
CREATE INDEX "driver_application_status_idx" ON "driver_application" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "incident" (
    "id" bigserial PRIMARY KEY,
    "driverId" bigint,
    "rideId" bigint,
    "familyId" bigint,
    "severity" text NOT NULL,
    "description" text NOT NULL,
    "resolution" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdBy" bigint,
    "resolvedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "incident_driver_idx" ON "incident" USING btree ("driverId");
CREATE INDEX "incident_open_idx" ON "incident" USING btree ("resolvedAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "payout_period" (
    "id" bigserial PRIMARY KEY,
    "driverId" bigint NOT NULL,
    "fromDate" timestamp without time zone NOT NULL,
    "toDate" timestamp without time zone NOT NULL,
    "blocks" bigint NOT NULL,
    "blockPayTenge" bigint NOT NULL,
    "ridePayTenge" bigint NOT NULL,
    "totalTenge" bigint NOT NULL,
    "paidAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "payout_period_driver_idx" ON "payout_period" USING btree ("driverId", "fromDate");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "training_result" (
    "id" bigserial PRIMARY KEY,
    "driverId" bigint NOT NULL,
    "correct" bigint NOT NULL,
    "total" bigint NOT NULL,
    "passed" boolean NOT NULL DEFAULT false,
    "attempt" bigint NOT NULL DEFAULT 1,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "training_result_driver_idx" ON "training_result" USING btree ("driverId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "application_check"
    ADD CONSTRAINT "application_check_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "driver_application"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "application_check"
    ADD CONSTRAINT "application_check_fk_1"
    FOREIGN KEY("checkedBy")
    REFERENCES "dispatcher_account"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "driver_application"
    ADD CONSTRAINT "driver_application_fk_0"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "incident"
    ADD CONSTRAINT "incident_fk_0"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "incident"
    ADD CONSTRAINT "incident_fk_1"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "incident"
    ADD CONSTRAINT "incident_fk_2"
    FOREIGN KEY("familyId")
    REFERENCES "family"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "incident"
    ADD CONSTRAINT "incident_fk_3"
    FOREIGN KEY("createdBy")
    REFERENCES "dispatcher_account"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "payout_period"
    ADD CONSTRAINT "payout_period_fk_0"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "training_result"
    ADD CONSTRAINT "training_result_fk_0"
    FOREIGN KEY("driverId")
    REFERENCES "driver"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923002745073', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923002745073', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
