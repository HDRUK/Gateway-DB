
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'HDR_GATEWAY_DB'
)
CREATE DATABASE HDR_GATEWAY_DB
GO

CREATE user HDR_GATEWAY_ACCESS
with encrypted password 'mypass'
GO

GRANT all privileges on database HDR_GATEWAY to HDR_GATEWAY_ACCESS;
GO
