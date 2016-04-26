/*
  TEST PLAN
  Author: Niko Bentley
  Description: Test queries to test the integrity of data after migration.
*/


/*
  This will display all created table names linked to the user "northwind" alphabetically
*/
select table_name as "Table Names" from user_tables
order by table_name;


/*
  The following queries will compare record count between the tables that exist in both databases
*/

--Categories
select Count(northwind.categories.categoryid) as "Updated Category Count", Count(northwindOLD.categories.categoryID) as "Old Category Count"
from northwind.categories
full join northwindOLD.categories on northwind.categories.categoryid = northwindOLD.categories.categoryid;

--Customers
select Count(northwind.Customers.Customerid) as "Updated Customer Count", Count(northwindOLD.Customers.CustomerID) as "Old Customer Count"
from northwind.Customers
full join northwindOLD.Customers on northwind.Customers.customercode = northwindOLD.Customers.customerid;

--Employees
select Count(northwind.Employees.EmployeeID) as "Updated Employee Count", Count(northwindOLD.Employees.EmployeeID) as "Old Employee Count"
from northwind.Employees
full join northwindOLD.Employees on northwind.Employees.EmployeeID = northwindOLD.Employees.EmployeeID;

--EmployeeTerritories
select Count(northwind.EmployeeTerritories.EmployeeID) as "Updated Count", Count(northwindOLD.EmployeeTerritories.EmployeeID) as "Old Count"
from northwind.EmployeeTerritories
full join northwindOLD.EmployeeTerritories on northwind.EmployeeTerritories.EmployeeID = northwindOLD.EmployeeTerritories.EmployeeID;

--Order_Details
select Count(northwind.Order_Details.OrderID) as "Updated Count", Count(northwindOLD.Order_Details.OrderID) as "Old Count"
from northwind.Order_Details
full join northwindOLD.Order_Details on northwind.Order_Details.OrderID = northwindOLD.Order_Details.OrderID;

--Orders
select Count(northwind.Orders.OrderID) as "Updated Order Count", Count(northwindOLD.Orders.OrderID) as "Old Order Count"
from northwind.Orders
full join northwindOLD.Orders on northwind.Orders.OrderID = northwindOLD.Orders.OrderID;

--Products
select Count(northwind.Products.ProductID) as "Updated Product Count", Count(northwindOLD.Products.ProductID) as "Old Product Count"
from northwind.Products
full join northwindOLD.Products on northwind.Products.ProductID = northwindOLD.Products.ProductID;

--Region
select Count(northwind.Region.RegionID) as "Updated Region Count", Count(northwindOLD.Region.RegionID) as "Old Region Count"
from northwind.Region
full join northwindOLD.Region on northwind.Region.RegionID = northwindOLD.Region.RegionID;

--Shippers
select Count(northwind.Shippers.ShipperID) as "Updated Shipper Count", Count(northwindOLD.Shippers.ShipperID) as "Old Shipper Count"
from northwind.Shippers
full join northwindOLD.Shippers on northwind.Shippers.ShipperID = northwindOLD.Shippers.ShipperID;

--Suppliers
select Count(northwind.Suppliers.SupplierID) as "Updated Supplier Count", Count(northwindOLD.Suppliers.SupplierID) as "Old Supplier Count"
from northwind.Suppliers
full join northwindOLD.Suppliers on northwind.Suppliers.SupplierID = northwindOLD.Suppliers.SupplierID;

--Territories
select Count(northwind.Territories.TerritoryID) as "Updated Territory Count", Count(northwindOLD.Territories.TerritoryID) as "Old Territory Count"
from northwind.Territories
full join northwindOLD.Territories on northwind.Territories.TerritoryID = northwindOLD.Territories.TerritoryID;


/*
  INSERTING/DELETING DATA INTO EACH TABLE
  These will all insert perfectly fine.
*/

--Categories
insert into Categories values (10, 'Junk', 'Just some junk and stuff.');
delete from Categories where CategoryID = 10;

--Countries
insert into Countries values (200, 'Nikopolis');
delete from Countries where CountryID = 200;

--Customers
insert into Customers values (4321, 'DBAS4', 'Database 4', 'John', 'Owner', '123 Address', 'Halifax', 'NS', 4, 'postal', '9025551478', '283742463');
delete from Customers where CustomerID = 4321;

--Employees
insert into Employees values (9876, 'last', 'first', 'engineer', 'mr', 'mr first last', '11-JUN-91', '14-APR-09', '123 address', 'halifax', 'NS', 4,
  'postcode', '123456789', '1234', 'notesnotes', 1);
delete from Employees where EmployeeID = 9876;

--EmployeeTerritories
insert into EmployeeTerritories values (1, 20852);
delete from EmployeeTerritories where EmployeeID = 1 and territoryID = 20852;

--Order_Details
insert into Order_Details values (1, 10252, 5, 0, 10);
delete from Order_Details where productID = 1 and orderID = 10252;

--Orders
insert into Orders values (78945, 20, 1, '1/1/1991', '6/6/1991', '2/2/1991', 2, 10, 'Jon', '123 Street', 'Halifax',
  14, 'postcode', 14);
delete from Orders where OrderID = 78945;

--Product_Location
insert into Product_Location values (3, 1, 5, 10, 6);
delete from Product_Location where ProductID = 3 and WarehouseID = 1;

--Products
insert into Products values (80085, 'Test', 6, 2, '12 per box', 12, 0);
delete from Products where ProductID = 80085;

--Region
insert into Region values (1984, 'Distopia');
delete from Region where RegionID = 1984;

--Shippers
insert into Shippers values (4, 'FedEx', '4');
delete from Shippers where ShipperID = 4;

--Suppliers
insert into Suppliers values (30, 'Niko Co.', 'Niko', 'Bestest', 'Here', 'Halifax', 'NS',
  6, 'postcode', '9022210558', null, 'nikobentley.ca');
delete from Suppliers where SupplierID = 30;

--Territories
insert into Territories values (1, 'Test-i-tory', 1);
delete from Territories where TerritoryID = 1;

--Warehouses
insert into Warehouses values (4, 'Next Warehouse', '123 Street');
delete from Warehouses where WarehouseID = 4;

/*
  TESTING SHECIAL CHECKS
*/
--This insert will fail because the Discontinued check will fail
insert into Products values (7357, 'Fail', 1, 1, 'All your base.', 7, 2);
--this insert will pass, all that has changed is the Discontinued value
insert into Products values (7357, 'Pass', 1, 1, 'All your base.', 7, 1);
delete from Products where ProductID = 7357;

