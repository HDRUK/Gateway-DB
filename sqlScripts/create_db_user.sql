-- Role: "HDR_DB_ACCESS"
-- DROP ROLE "HDR_DB_ACCESS";

CREATE ROLE "HDR_DB_ACCESS"
WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;