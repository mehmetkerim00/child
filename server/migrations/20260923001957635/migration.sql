BEGIN;

--
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "ride_seat" ADD COLUMN "absenceReason" text;
ALTER TABLE "ride_seat" ADD COLUMN "confirmedByInstitutionAt" timestamp without time zone;
ALTER TABLE "ride_seat" ADD COLUMN "confirmedByInstitutionName" text;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "institution_access"
    ADD CONSTRAINT "institution_access_fk_0"
    FOREIGN KEY("institutionId")
    REFERENCES "institution"("id")
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
