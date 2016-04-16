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
select Count(categories.categoryid) as "Updated Category Count", Count(northwindOLD.categories.categoryID) as "Old Category Count"
from northwindOLD.categories;

--Customers
select Count(Customers.Customerid) as "Updated Customer Count", Count(northwindOLD.Customers.CustomerID) as "Old Customer Count"
from northwindOLD.Customers;

--Employees
select Count(Employees.EmployeeID) as "Updated Employee Count", Count(northwindOLD.Employees.EmployeeID) as "Old Employee Count"
from northwindOLD.Employees;

--EmployeeTerritories
select Count(EmployeeTerritories.EmployeeID) as "Updated Count", 
  Count(northwindOLD.EmployeeTerritories.EmployeeID) as "Old Count"
from northwindOLD.EmployeeTerritories;

--Order_Details
select Count(Order_Details.OrderID) as "Updated Count", Count(northwindOLD.Order_Details.OrderID) as "Old Count"
from northwindOLD.Order_Details;

--Orders
select Count(Orders.OrderID) as "Updated Order Count", Count(northwindOLD.Orders.OrderID) as "Old Order Count"
from northwindOLD.Orders;

--Products
select Count(Products.ProductID) as "Updated Product Count", Count(northwindOLD.Products.ProductID) as "Old Product Count"
from northwindOLD.Products;

--Region
select Count(Region.RegionID) as "Updated Region Count", Count(northwindOLD.Region.RegionID) as "Old Region Count"
from northwindOLD.Region;

--Shippers
select Count(Shippers.ShipperID) as "Updated Shipper Count", Count(northwindOLD.Shippers.ShipperID) as "Old Shipper Count"
from northwindOLD.Shippers;

--Suppliers
select Count(Suppliers.SupplierID) as "Updated Supplier Count", Count(northwindOLD.Suppliers.SupplierID) as "Old Supplier Count"
from northwindOLD.Suppliers;

--Territories
select Count(Territories.TerritoryID) as "Updated Territory Count", Count(northwindOLD.Territories.TerritoryID) as "Old Territory Count"
from northwindOLD.Territories;


/*
  TESTING INSERTING DATA INTO EACH TABLE
*/

--Categories
--Insert a record into Categories
insert into Categories values (10, 'Junk', 'Just some junk and stuff.');
--Remove test record from categories
delete from Categories where CategoryID = 10;

--Countries
--Insert a record into Countries
insert into Countries values (200, 'Nikopolis');
--Remove test record from Countries
delete from Countries where CountryID = 200;

--Customers
--Insert a record into Customers
insert into Customers values (4321, 'DBAS4', 'Database 4', 'John', 'Owner', '123 Address', 'Halifax', 'NS', 4, 'postal', '9025551478', '283742463');
--Remove test record from Customers
delete from Customers where CustomerID = 4321;

--Employees
--Insert a record into Employees
insert into Employees values (9876, 'last', 'first', 'engineer', 'mr', 'mr first last', '11-JUN-91', '14-APR-09', '123 address', 'halifax', 'NS', 4,
  'postcode', '123456789', '1234', 'notesnotes', 1);
--Remove test record from Employees
delete from Employees where EmployeeID = 9876;

--EmployeeTerritories
--Insert a record into EmployeeTerritories
insert into EmployeeTerritories values (1, 20852);
--Remove test record from EmployeeTerritories
delete from EmployeeTerritories where EmployeeID = 1 and territoryID = 20852;

--Order_Details
--Insert a record into Order_Details
insert into Order_Details values (1, 10252, 5, 0, 10);
--Remove test record from Order_Details
delete from Order_Details where productID = 1 and orderID = 10252;

--Orders
--Insert a record into Orders
insert into Orders values (78945, 20, 1, '1/1/1991', '6/6/1991', '2/2/1991', 2, 10, 'Jon', '123 Street', 'Halifax',
  14, 'postcode', 14);
--Remove test record from Orders
delete from Orders where OrderID = 78945;

--Product_Location
--Insert a record into Product_Location
insert into Product_Location values (3, 2, 5, 10, 6);
--Remove test record from Product_Location
delete from Product_Location where ;

--Products
--Insert a record into Products
insert into Products values ();
--Remove test record from Products
delete from Products where ;