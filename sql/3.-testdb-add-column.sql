--liquibase formatted sql

--changeset JuanPerez:2222
--Database: testbd-1
--tagDatabase tag:algo
ALTER TABLE country ADD COLUMN country_desc VARCHAR;