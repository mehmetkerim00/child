BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "driver" ADD COLUMN "seats" bigint NOT NULL DEFAULT 3;
ALTER TABLE "driver" ADD COLUMN "childSeats" bigint NOT NULL DEFAULT 1;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "ride_event" ADD COLUMN "childId" bigint;
--
-- ACTION CREATE TABLE
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
    "seatPriceTenge" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE INDEX "ride_seat_ride_idx" ON "ride_seat" USING btree ("rideId");
CREATE UNIQUE INDEX "ride_seat_unique_idx" ON "ride_seat" USING btree ("rideId", "childId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ride_event"
    ADD CONSTRAINT "ride_event_fk_1"
    FOREIGN KEY("childId")
    REFERENCES "child"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923000325244', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923000325244', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
