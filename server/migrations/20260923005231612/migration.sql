BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "owner_account" (
    "id" bigserial PRIMARY KEY,
    "phone" text NOT NULL,
    "name" text NOT NULL,
    "active" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "owner_phone_idx" ON "owner_account" USING btree ("phone");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "report_export" (
    "id" bigserial PRIMARY KEY,
    "tokenHash" text NOT NULL,
    "ownerId" bigint NOT NULL,
    "fromDate" timestamp without time zone NOT NULL,
    "toDate" timestamp without time zone NOT NULL,
    "smsPriceTenge" bigint NOT NULL,
    "blockPayTenge" bigint NOT NULL,
    "perRideTenge" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "usedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "report_export_token_idx" ON "report_export" USING btree ("tokenHash");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "report_export"
    ADD CONSTRAINT "report_export_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "owner_account"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923005231612', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923005231612', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
