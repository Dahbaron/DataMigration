/*
  Author: Niko Bentley
  Description: DML scripts to migrate data from the old database
  to the updated one.
*/

/*
  DROPS
*/

delete from Order_Details;
delete from Orders;
delete from EmployeeTerritories;
delete from Territories;
delete from Region;
delete from Employees;
delete from Customers;
delete from Shippers;
delete from Product_Location;
delete from Products;
delete from Suppliers;
delete from Categories;
delete from Warehouses;
delete from Countries;