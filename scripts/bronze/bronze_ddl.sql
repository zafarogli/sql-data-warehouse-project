/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.crm_customer_info', 'U') is not null
    DROP TABLE bronze.crm_cust_info;
GO
CREATE TABLE bronze.crm_customer_info (
    cst_id              INT,
    cst_key             Nvarchar(50),
    cst_firstname       Nvarchar(50),
    cst_lastname        Nvarchar(50),
    cst_marital_status  Nvarchar(50),
    cst_gndr            Nvarchar(50),
    cst_create_date     DATE
);
GO

If OBJECT_ID('bronze.crm_product_info', 'U') is not null
	drop table bronze.crm_product_info;
GO
Create Table bronze.crm_product_info (
	prd_id			Int, 
	prd_key			Nvarchar(50),
	prd_name		Nvarchar(50),
	prd_cost		Int,
	prd_line		Nvarchar(50),
	prd_start_date	Date,
	prd_end_date	Date
);
Go

IF OBJECT_ID('bronze.crm_sales_details', 'U') is not null
	drop table bronze.crm_sales_details;
Go
Create Table bronze.crm_sales_details (
	sales_order_num		nvarchar(50),
	sales_prd_key		nvarchar(50),
	sls_cust_id			int,	
	sales_order_dt		int, 
	sales_ship_dt		int,
	sales_due_dt		int,	
	sales_sales			int, 	
	sales_quantity		int,
	sales_price			int
);
go

if OBJECT_ID('bronze.erp_cust_az12', 'U') is not null
	drop table bronze.erp_cust_az12;
go
create table bronze.erp_cust_az12 (
	cid		nvarchar(50),
	bdate	date,
	gen		nvarchar(50)
);
Go

if OBJECT_ID('bronze.erp_loc_a101', 'U') is not null
	drop table bronze.erp_loc_a101;
Go
create table bronze.erp_loc_a101 (
	cid			nvarchar(50),
	country		nvarchar(50)
);
go

if OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') is not null
	drop table bronze.erp_px_cat_g1v2;
go
create table bronze.erp_px_cat_g1v2 (
	id				nvarchar(50),
	cat				nvarchar(50),
	subcat			nvarchar(50),
	maintenance		nvarchar(50)
);
go
