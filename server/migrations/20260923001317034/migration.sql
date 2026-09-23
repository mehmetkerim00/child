BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "chat_message"
    ADD CONSTRAINT "chat_message_fk_0"
    FOREIGN KEY("threadId")
    REFERENCES "chat_thread"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923001317034', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923001317034', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
