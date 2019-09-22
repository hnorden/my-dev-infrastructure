DROP DATABASE IF EXISTS hibernatedemodb;
DROP USER IF EXISTS hibernatedemo;

CREATE USER hibernatedemo WITH PASSWORD 'hibernatedemo';
CREATE DATABASE hibernatedemodb WITH OWNER hibernatedemo ENCODING 'UTF-8';
