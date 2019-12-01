-- eroadmin is db owner
CREATE USER erpadmin WITH PASSWORD 'admin4test';
-- hrmapp is the application user
CREATE USER hrmapp WITH PASSWORD 'cnp4test';
-- erp is the db name
CREATE DATABASE erp OWNER erpadmin ;
\connect erp erpadmin;
-- hrm schema will contain all the hr related tables
CREATE SCHEMA hrm AUTHORIZATION erpadmin
GRANT ALL ON SCHEMA hrm TO hrmapp;

-- Table: hrm.test -- Just for testing purpose 
CREATE TABLE hrm.test
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    info json NOT NULL,
    CONSTRAINT test_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE hrm.test
    OWNER to erpadmin;

GRANT ALL ON TABLE hrm.test TO erpadmin;

GRANT ALL ON TABLE hrm.test TO hrmapp;
