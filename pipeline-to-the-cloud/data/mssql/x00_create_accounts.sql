USE DEMO;
CREATE TABLE demo.dbo.ACCOUNTS ( ID INT, FIRST_NAME VARCHAR(50), LAST_NAME VARCHAR(50), USERNAME VARCHAR(50), COMPANY VARCHAR(50), CREATED_DATE DATE, ROW_VER ROWVERSION );
-- GRANT SELECT ON demo.dbo.ACCOUNTS TO [connect_user]
GO

EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name   = N'ACCOUNTS',
@role_name     = NULL,
@supports_net_changes = 0
GO