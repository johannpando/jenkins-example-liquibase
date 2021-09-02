--liquibase formatted sql

--changeset JuanPerez:create-table
--tag firstChange
--Database: testdb-1
CREATE TABLE country (country_id INT, country_name VARCHAR, PRIMARY KEY (country_id))