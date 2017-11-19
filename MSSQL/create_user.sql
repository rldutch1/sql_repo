-- Create user and grant db_owner to a database.
USE [master]
GO
CREATE LOGIN [bakbone] WITH PASSWORD=N'Bakbone1', DEFAULT_DATABASE=[bakbone], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [bakbone]
GO
CREATE USER [bakbone] FOR LOGIN [bakbone]
GO
USE [bakbone]
GO
EXEC sp_addrolemember N'db_owner', N'bakbone'
GO
USE [miscellaneous]
GO
CREATE USER [bakbone] FOR LOGIN [bakbone]
GO
USE [miscellaneous]
GO
EXEC sp_addrolemember N'db_owner', N'bakbone'
GO
