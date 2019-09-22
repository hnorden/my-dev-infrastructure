DROP DATABASE IF EXISTS mydb;
DROP USER IF EXISTS myuser;
DROP USER IF EXISTS mytenant;
DROP USER IF EXISTS tenant_group;
DROP USER IF EXISTS mygroup;

CREATE USER myuser WITH PASSWORD 'myuser';
CREATE DATABASE mydb WITH OWNER myuser ENCODING 'UTF-8';

CREATE ROLE tenant_group;
CREATE USER mytenant WITH PASSWORD 'mytenant' IN ROLE tenant_group;
CREATE USER mygroup WITH PASSWORD 'mygroup' ROLE tenant_group; -- This in effect makes the new role a "group".

\c mydb;
DROP SCHEMA IF EXISTS myschema;
CREATE SCHEMA myschema AUTHORIZATION mytenant;

-- \l+
\l+ my*

-- \dnS+
\dn+ my*

-- \dgS+
\dg+ my*|tenant*

-- \dtS+
\dt+ my*

show listen_addresses;

-- GRANT mytenant TO myuser;
-- GRANT ALL ON SCHEMA myschema TO myuser;
-- GRANT ALL ON SCHEMA myschema TO devops;
