--create an endpoint for this instance

drop endpoint Endpoint_Mirroring
CREATE ENDPOINT Endpoint_Mirroring
    STATE=STARTED 
    AS TCP (LISTENER_PORT=7023) 
    FOR DATABASE_MIRRORING (ROLE=ALL)
GO
--Partners under same domain user; login already exists in master

 name	fileid	filename	filegroup	size	maxsize	growth	usage
db1	1	C:\Program Files\Microsoft SQL Server\MSSQL11.I1\MSSQL\DATA\db1.mdf	PRIMARY	3072 KB	Unlimited	1024 KB	data only
db1_log	2	C:\Program Files\Microsoft SQL Server\MSSQL11.I1\MSSQL\DATA\db1_log.ldf	NULL	1024 KB	2147483648 KB	10%	log only


restore database db1 from disk='C:\temp\db1.bak'
with norecovery, replace,
move 'db1' to 'C:\Program Files\Microsoft SQL Server\MSSQL11.I1\MSSQL\DATA\db1_named_inst.mdf'
, move 'db1_log' to 'C:\Program Files\Microsoft SQL Server\MSSQL11.I1\MSSQL\DATA\db1_log_named_inst.ldf' 



restore log db1 from disk='c:\temp\db1_log.bak' with norecovery
restore log db1 from disk='c:\temp\db1_log_2.bak' with norecovery

select * from sys.endpoints 

restore database db1 with recovery
alter database db1 set partner off

USE master;
GO
ALTER DATABASE db1 
    SET PARTNER = 
    'TCP://len:7022'
GO


------------------------

USE master;
drop master key
USE master;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<Strong_Password_#2>';

GO

USE master;

drop certificate HOST_B_cert
CREATE CERTIFICATE HOST_B_cert 
   WITH SUBJECT = 'HOST_B certificate for database mirroring',
      EXPIRY_DATE = '20991031';
GO

drop endpoint Endpoint_Mirroring
drop endpoint mirroring
CREATE ENDPOINT Endpoint_Mirroring
   STATE = STARTED
   AS TCP (
      LISTENER_PORT=7025
      , LISTENER_IP = ALL
   ) 
   FOR DATABASE_MIRRORING ( 
      AUTHENTICATION = CERTIFICATE HOST_B_cert
      , ENCRYPTION = REQUIRED ALGORITHM AES
      , ROLE = ALL
   );
GO

--- 2nd version
CREATE ENDPOINT Endpoint_Mirroring
	AUTHORIZATION [len\gene]
   STATE = STARTED
   AS TCP (
      LISTENER_PORT=7025
      , LISTENER_IP = ALL
   ) 
   FOR DATABASE_MIRRORING ( 
      AUTHENTICATION = WINDOWS NEGOTIATE, ENCRYPTION = DISABLED
      , ROLE = ALL
   );

BACKUP CERTIFICATE HOST_B_cert TO FILE = 'C:\temp\HOST_B_cert.cer';
GO 
