BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "ride_event" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ride_event" (
    "id" bigserial PRIMARY KEY,
    "rideId" bigint NOT NULL,
    "clientEventId" text NOT NULL,
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ride_event"
    ADD CONSTRAINT "ride_event_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260922205040337', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260922205040337', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
