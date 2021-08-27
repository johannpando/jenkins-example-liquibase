--liquibase formatted sql

--changeset jpandode:add-column-country
--Database: postgresql
ALTER TABLE test_table_sql ADD COLUMN country VARCHAR;


--changeset jpandode:add-column-address
--Database: postgresql
ALTER TABLE test_table_sql ADD COLUMN address VARCHAR;