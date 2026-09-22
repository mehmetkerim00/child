BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION DROP TABLE
--
DROP TABLE "ledger_entry" CASCADE;

--
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "route_template" DROP COLUMN "pricePerRide";
ALTER TABLE "route_template" ADD COLUMN "pricePerRideTenge" bigint NOT NULL DEFAULT 0;
--
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260922230441032', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260922230441032', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
