--liquibase formatted sql

--changeset jpandode:1
--Database: postgresql
ALTER TABLE test_table_sql
ADD COLUMN new_column phone VARCHAR;