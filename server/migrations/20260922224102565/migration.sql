BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION DROP TABLE
--
DROP TABLE "notification_outbox" CASCADE;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260922224102565', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260922224102565', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
