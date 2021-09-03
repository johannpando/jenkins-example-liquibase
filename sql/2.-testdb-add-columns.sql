--liquibase formatted sql

--changeset JulianGaston:add-column-language
--Database: testdb-1
--tagDatabase secondChange
ALTER TABLE country ADD COLUMN country_language VARCHAR;


--changeset JulianGaston:add-column-code
--Database: testdb-1
--tagDatabase thirdChange
ALTER TABLE country ADD COLUMN country_code VARCHAR;