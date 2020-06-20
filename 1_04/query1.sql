select * from [dbo].[Employee1]
select * from [dbo].[Employee_dif_7933]
select * from [dbo].[Employee_dif_54570]
select * from t1

--create an endpoint for this instance
drop endpoint Endpoint_Mirroring
CREATE ENDPOINT Endpoint_Mirroring
    STATE=STARTED 
    AS TCP (LISTENER_PORT=7022) 
    FOR DATABASE_MIRRORING (ROLE=ALL)
GO
--Partners under same domain user; login already exists in master.

BACKUP DATABASE db1 
      TO DISK = 'C:\temp\db1.bak' 
      WITH FORMAT
  GO

  sp_helpdb db1

  backup log db1 to disk='c:\temp\db1_log.bak' with format
  backup log db1 to disk='c:\temp\db1_log_2.bak' with format
  select * from sys.endpoints 
  restore database db1 with recovery

ALTER DATABASE db1 
    SET PARTNER = 
    'TCP://len:7023'
GO


---------------------------------

drop master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<1_Strong_Password!>';
GO

USE master;

drop certificate HOST_A_cert
CREATE CERTIFICATE HOST_A_cert 
   WITH SUBJECT = 'HOST_A certificate',
      EXPIRY_DATE = '20991031';
GO
drop endpoint Endpoint_Mirroring
CREATE ENDPOINT Endpoint_Mirroring
   STATE = STARTED
   AS TCP (
      LISTENER_PORT=7024
      , LISTENER_IP = ALL
   ) 
   FOR DATABASE_MIRRORING ( 
      AUTHENTICATION = CERTIFICATE HOST_A_cert
      , ENCRYPTION = REQUIRED ALGORITHM AES
      , ROLE = ALL
   );
GO


---- 2nd version
CREATE ENDPOINT Endpoint_Mirroring
	AUTHORIZATION [len\gene]
   STATE = STARTED
   AS TCP (
      LISTENER_PORT=7024
      , LISTENER_IP = ALL
   ) 
   FOR DATABASE_MIRRORING ( 
      AUTHENTICATION = WINDOWS NEGOTIATE, ENCRYPTION = DISABLED
      , ROLE = ALL
   );
GO





BACKUP CERTIFICATE HOST_A_cert TO FILE = 'C:\temp\HOST_A_cert.cer';
GO
---

USE master;
drop user host_b_user
drop login host_b_login
CREATE LOGIN HOST_B_login WITH PASSWORD = '1Sample_Strong_Password!@#';
GO
CREATE USER HOST_B_user FOR LOGIN HOST_B_login;
GO


CREATE CERTIFICATE HOST_B_cert
   AUTHORIZATION HOST_B_user
   FROM FILE = 'C:\temp\HOST_B_cert.cer'
GO


USE [master]
GO

/****** Object:  Endpoint [Endpoint_Mirroring]    Script Date: 1/5/2013 12:19:00 AM ******/
CREATE ENDPOINT [Endpoint_Mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 7024, LISTENER_IP = ALL)
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = CERTIFICATE [HOST_A_cert]
, ENCRYPTION = REQUIRED ALGORITHM AES)
GO


USE [master]
GO

/****** Object:  Endpoint [Endpoint_Mirroring]    Script Date: 1/5/2013 12:19:34 AM ******/
CREATE ENDPOINT [Endpoint_Mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 7025, LISTENER_IP = ALL)
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = CERTIFICATE [HOST_B_cert]
, ENCRYPTION = REQUIRED ALGORITHM AES)
GO


go