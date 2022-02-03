SET check_function_bodies = false;
-- ddl-end --

-- object: stealthis | type: SCHEMA --
-- DROP SCHEMA stealthis CASCADE;
CREATE SCHEMA stealthis;
-- ddl-end --

SET search_path TO pg_catalog,public,stealthis;
-- ddl-end --

-- object: stealthis.person_pk_seq | type: SEQUENCE --
-- DROP SEQUENCE stealthis.person_pk_seq;
CREATE SEQUENCE stealthis.person_pk_seq
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: stealthis.address_pk_seq | type: SEQUENCE --
-- DROP SEQUENCE stealthis.address_pk_seq;
CREATE SEQUENCE stealthis.address_pk_seq
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- ddl-end --
-- object: stealthis.login_pk_seq | type: SEQUENCE --
-- DROP SEQUENCE stealthis.login_pk_seq;
CREATE SEQUENCE stealthis.login_pk_seq
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --


-- object: stealthis.Person | type: TABLE --
-- DROP TABLE stealthis.Person;
CREATE TABLE stealthis.Person(
	Id bigint NOT NULL DEFAULT nextval('stealthis.person_pk_seq'::regclass),
	FirstName text,
	LastName text,
	AddressId bigint,
	CONSTRAINT pk_person_id PRIMARY KEY (Id)

);
-- ddl-end --

-- object: stealthis.Login | type: TABLE --
-- DROP TABLE stealthis.Login;
CREATE TABLE stealthis.Login(
	Id bigint NOT NULL DEFAULT nextval('stealthis.login_pk_seq'::regclass),
	PersonId bigint NOT NULL,
	Email text,
	Password text NOT NULL,
	Pin text,
	CONSTRAINT unique_email UNIQUE (Email),
	CONSTRAINT pk_login_id PRIMARY KEY (Id)

);
-- ddl-end --
-- object: Person_fk | type: CONSTRAINT --
-- ALTER TABLE stealthis.Login DROP CONSTRAINT Person_fk;
ALTER TABLE stealthis.Login ADD CONSTRAINT Person_fk FOREIGN KEY (PersonId)
REFERENCES stealthis.Person (Id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: Id | type: CONSTRAINT --
-- ALTER TABLE stealthis.Login DROP CONSTRAINT Id;
ALTER TABLE stealthis.Login ADD CONSTRAINT Id UNIQUE (PersonId);
-- ddl-end --


-- object: stealthis.Address | type: TABLE --
-- DROP TABLE stealthis.Address;
CREATE TABLE stealthis.Address(
	Id bigint NOT NULL DEFAULT nextval('stealthis.address_pk_seq'::regclass),
	Street text,
	City text,
	State text,
	PostalCode text,
	CountryCode text,
	Latitude numeric,
	Longitude numeric,
	CONSTRAINT pk_address_id PRIMARY KEY (Id)

);
-- ddl-end --
-- object: Address_fk | type: CONSTRAINT --
-- ALTER TABLE stealthis.Person DROP CONSTRAINT Address_fk;
ALTER TABLE stealthis.Person ADD CONSTRAINT Address_fk FOREIGN KEY (AddressId)
REFERENCES stealthis.Address (Id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --


-- object: Id | type: CONSTRAINT --
-- ALTER TABLE stealthis.Person DROP CONSTRAINT Id;
ALTER TABLE stealthis.Person ADD CONSTRAINT Id_Address_Person UNIQUE (AddressId);                      
-- ddl-end --