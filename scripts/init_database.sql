USE master
Go

if exists (Select 1 from sys.databases where name = 'DataWarehouse')
begin 
	alter DATABASE DataWarehouse SET SINGLE_USER with rollback immediate;
	drop DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

use DataWarehouse
GO

Create Schema Bronze;
Go
Create Schema Silver;
go 
create schema Gold
