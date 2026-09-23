BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rate_limit_hit" (
    "id" bigserial PRIMARY KEY,
    "bucket" text NOT NULL,
    "at" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "rate_limit_bucket_idx" ON "rate_limit_hit" USING btree ("bucket", "at");


--
-- MIGRATION VERSION FOR child
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('child', '20260923011326567', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260923011326567', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260129180959368', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129180959368', "timestamp" = now();


COMMIT;
