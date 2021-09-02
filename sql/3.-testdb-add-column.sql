--liquibase formatted sql

--changeset JuanPerez:2222
--Database: testbd-1
ALTER TABLE country ADD COLUMN country_desc VARCHAR;