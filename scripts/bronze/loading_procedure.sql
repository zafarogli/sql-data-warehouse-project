/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
Create or Alter Procedure bronze.loading_bronze as
begin 
	begin try
truncate table [Bronze].[crm_customer_info];
bulk insert [Bronze].[crm_customer_info]
from 'C:\Program Files\datasets\source_crm\customer_info.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
truncate table [Bronze].[crm_product_info];
bulk insert [Bronze].[crm_product_info]
from 'C:\Program Files\datasets\source_crm\product_info.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
truncate table [Bronze].[crm_sales_details];
bulk insert [Bronze].[crm_sales_details]
from 'C:\Program Files\datasets\source_crm\sales_details.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
truncate table [Bronze].[erp_cust_az12];
bulk insert [Bronze].[erp_cust_az12]
from 'C:\Program Files\datasets\source_erp\CUST_AZ12.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
truncate table [Bronze].[erp_loc_a101];
bulk insert [Bronze].[erp_loc_a101]
from 'C:\Program Files\datasets\source_erp\LOC_A101.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
truncate table [Bronze].[erp_px_cat_g1v2];
bulk insert [Bronze].[erp_px_cat_g1v2]
from 'C:\Program Files\datasets\source_erp\PX_CAT_G1V2.csv'
with(
	firstrow = 2,
	fieldterminator = ',',
	tablock
)
	end try
	begin catch
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
	end catch
end




