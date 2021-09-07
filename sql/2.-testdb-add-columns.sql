--liquibase formatted sql

--changeset JulianGaston:add-column-language
--Database: testdb-1
ALTER TABLE country ADD COLUMN country_language VARCHAR;
--rollback ALTER TABLE country DROP COLUMN country_language;

--changeset JulianGaston:add-column-code
--Database: testdb-1
ALTER TABLE country ADD COLUMN country_code VARCHAR;
--rollback ALTER TABLE country DROP COLUMN country_code;