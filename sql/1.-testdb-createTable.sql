--liquibase formatted sql

--changeset JuanPerez:createTable
--Database: testdb-1
CREATE TABLE country (country_id INT, country_name VARCHAR, PRIMARY KEY (country_id))
--rollback drop table country;