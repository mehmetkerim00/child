BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ride_location"
    ADD CONSTRAINT "ride_location_fk_0"
    FOREIGN KEY("rideId")
    REFERENCES "ride"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260922222029830', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260922222029830', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
