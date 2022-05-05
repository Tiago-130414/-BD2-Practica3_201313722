--Select @@SERVERNAME as container, @@version SQL_VERSION

-- make sure were on the right server
SELECT @@version AS Version;
SELECT @@SERVERNAME AS Server_Name;

-- tell the publisher who the remote distributor is
EXEC sp_adddistributor @distributor = 'distributor',
                       @password = 'Santi130414';

-- create a test database
CREATE DATABASE Northwind;
GO

-- create a test table
USE [Northwind];


-- lets enable the database for replication
USE [Northwind];
EXEC sp_replicationdboption @dbname = N'Northwind',
                            @optname = N'publish',
                            @value = N'true';

-- Add the publication (this will create the snapshot agent if we wanted to use it)
EXEC sp_addpublication @publication = N'NorthwindDBS1',
                       @description = N'',
                       @retention = 0,
                       @allow_push = N'true',
                       @repl_freq = N'continuous',
                       @status = N'active',
                       @independent_agent = N'true';

EXEC sp_addpublication @publication = N'NorthwindDBS2',
                       @description = N'',
                       @retention = 0,
                       @allow_push = N'true',
                       @repl_freq = N'continuous',
                       @status = N'active',
                       @independent_agent = N'true';

-- now let's add an article to our publication SUBSCRIBER 1
USE [Northwind];
EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Employees',
                   @source_owner = N'dbo',
                   @source_object = N'Employees',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Employees',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Categories',
                   @source_owner = N'dbo',
                   @source_object = N'Categories',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Categories',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Customers',
                   @source_owner = N'dbo',
                   @source_object = N'Customers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Customers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Shippers',
                   @source_owner = N'dbo',
                   @source_object = N'Shippers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Shippers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Suppliers',
                   @source_owner = N'dbo',
                   @source_object = N'Suppliers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Suppliers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Orders',
                   @source_owner = N'dbo',
                   @source_object = N'Orders',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Orders',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Products',
                   @source_owner = N'dbo',
                   @source_object = N'Products',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Products',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Order Details',
                   @source_owner = N'dbo',
                   @source_object = N'Order Details',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Order Details',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'CustomerCustomerDemo',
                   @source_owner = N'dbo',
                   @source_object = N'CustomerCustomerDemo',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'CustomerCustomerDemo',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'CustomerDemographics',
                   @source_owner = N'dbo',
                   @source_object = N'CustomerDemographics',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'CustomerDemographics',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Region',
                   @source_owner = N'dbo',
                   @source_object = N'Region',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Region',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'Territories',
                   @source_owner = N'dbo',
                   @source_object = N'Territories',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Territories',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS1',
                   @article = N'EmployeeTerritories',
                   @source_owner = N'dbo',
                   @source_object = N'EmployeeTerritories',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'EmployeeTerritories',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';


-- now let's add an article to our publication SUBSCRIBER 2
USE [Northwind];

EXEC sp_addarticle @publication = N'NorthwindDBS2',
                   @article = N'Customers',
                   @source_owner = N'dbo',
                   @source_object = N'Customers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Customers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS2',
                   @article = N'Shippers',
                   @source_owner = N'dbo',
                   @source_object = N'Shippers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Shippers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';


EXEC sp_addarticle @publication = N'NorthwindDBS2',
                   @article = N'CustomerDemographics',
                   @source_owner = N'dbo',
                   @source_object = N'CustomerDemographics',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'CustomerDemographics',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS2',
                   @article = N'Region',
                   @source_owner = N'dbo',
                   @source_object = N'Region',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Region',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';

EXEC sp_addarticle @publication = N'NorthwindDBS2',
                   @article = N'Suppliers',
                   @source_owner = N'dbo',
                   @source_object = N'Suppliers',
                   @type = N'logbased',
                   @description = NULL,
                   @creation_script = NULL,
                   @pre_creation_cmd = N'drop',
                   @schema_option = 0x000000000803509D,
                   @identityrangemanagementoption = N'manual',
                   @destination_table = N'Suppliers',
                   @destination_owner = N'dbo',
                   @vertical_partition = N'false';


-- now let's add a subscriber to our publication
use [Northwind]
exec sp_addsubscription 
@publication = N'NorthwindDBS1', 
@subscriber = 'subscriber1',
@destination_db = 'Northwind', 
@subscription_type = N'Push', 
@sync_type = N'none', 
@article = N'all', 
@update_mode = N'read only', 
@subscriber_type = 0

exec sp_addsubscription 
@publication = N'NorthwindDBS2', 
@subscriber = 'subscriber2',
@destination_db = 'Northwind', 
@subscription_type = N'Push', 
@sync_type = N'none', 
@article = N'all', 
@update_mode = N'read only', 
@subscriber_type = 0

-- and add the push agent
exec sp_addpushsubscription_agent 
@publication = N'NorthwindDBS1', 
@subscriber = 'subscriber1',
@subscriber_db = 'Northwind', 
@subscriber_security_mode = 0, 
@subscriber_login =  'sa',
@subscriber_password =  'Santi130414',
@frequency_type = 64,
@frequency_interval = 0, 
@frequency_relative_interval = 0, 
@frequency_recurrence_factor = 0, 
@frequency_subday = 0, 
@frequency_subday_interval = 0, 
@active_start_time_of_day = 0, 
@active_end_time_of_day = 0, 
@active_start_date = 0, 
@active_end_date = 19950101
GO

exec sp_addpushsubscription_agent 
@publication = N'NorthwindDBS2', 
@subscriber = 'subscriber2',
@subscriber_db = 'Northwind', 
@subscriber_security_mode = 0, 
@subscriber_login =  'sa',
@subscriber_password =  'Santi130414',
@frequency_type = 64,
@frequency_interval = 0, 
@frequency_relative_interval = 0, 
@frequency_recurrence_factor = 0, 
@frequency_subday = 0, 
@frequency_subday_interval = 0, 
@active_start_time_of_day = 0, 
@active_end_time_of_day = 0, 
@active_start_date = 0, 
@active_end_date = 19950101
GO

-- by default it sets up the log reader agent with a default account that won�t work, you need to change that to something that will.
EXEC sp_changelogreader_agent @publisher_security_mode = 0,
                              @publisher_login = 'sa',
                              @publisher_password = 'Santi130414';
