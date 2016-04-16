/*
  Database Manipulation
  Author: Niko Bentley
  Description: DML scripts to migrate data from the old database
  to the updated one.
*/

/*
  DROPS
*/

delete from Order_Details;
delete from Product_Location;

delete from Products;
delete from Orders;
delete from EmployeeTerritories;
delete from Employees;
delete from Customers;
delete from Suppliers;
delete from Shippers;
delete from Territories;
delete from Region;
delete from Categories;
delete from Countries;
delete from Warehouses;

/*
  INSERTS
*/

--Warehouses
insert into Warehouses values (WarehouseID_seq.nextval, 'Airport warehouse', '747 Flying Cloud Ln.');
insert into Warehouses values (WarehouseID_seq.nextval, 'Dockside warehouse', '2356 Lower Water St.');
insert into Warehouses values (WarehouseID_seq.nextval, 'Central warehouse', '27 Main St.');

--Countries
insert into Countries (CountryID, CountryName)
select CountryID_seq.nextval, Country from
  (select northwindOLD.customers.country
  from northwindOLD.customers
  union
  select northwindOLD.employees.country
  from northwindOLD.employees
  union
  select northwindOLD.orders.shipcountry
  from northwindOLD.orders
  union 
  select northwindOLD.suppliers.country
  from northwindOLD.suppliers);

--Categories
insert into northwind.Categories select * from northwindOLD.Categories;

--Region
insert into northwind.Region select * from NORTHWINDOLD.REGION;

--Territories
insert into northwind.Territories select * from NORTHWINDOLD.TERRITORIES;

--Shippers
insert into northwind.Shippers select * from northwindOLD.shippers;

--Suppliers
insert into northwind.Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, 
    City, Region, Country, PostalCode, Phone, Fax, HomePage)
  select northwindOLD.suppliers.supplierID,
    northwindOLD.suppliers.companyname,
    northwindOLD.suppliers.contactname,
    northwindOLD.suppliers.contacttitle,
    northwindOLD.suppliers.address,
    northwindOLD.suppliers.city,
    northwindOLD.suppliers.region,
    (select northwind.countries.countryid from northwind.countries
      where northwindOLD.suppliers.country = northwind.countries.countryname),
    northwindOLD.suppliers.postalcode,
    northwindOLD.suppliers.phone,
    northwindOLD.suppliers.fax,
    northwindOLD.suppliers.homepage
  from northwindOLD.suppliers;

--Customers
insert into northwind.Customers (CustomerID, CustomerCode, CompanyName, ContactName, ContactTitle, Address,
    City, Region, Country, PostalCode, Phone, Fax)
  select CustomerID_seq.nextval,
    northwindOLD.customers.customerid,
    northwindOLD.customers.companyname,
    northwindOLD.customers.contactname,
    northwindOLD.customers.contacttitle,
    northwindOLD.customers.address,
    northwindOLD.customers.city,
    northwindOLD.customers.region,
    (select northwind.countries.countryid from northwind.countries
      where northwindOLD.customers.country = northwind.countries.countryname),
    northwindOLD.customers.postalcode,
    northwindOLD.customers.phone,
    northwindOLD.customers.fax
  from northwindold.customers;
  
--Employees
insert into northwind.Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy,
    NameAndTitle, BirthDate, HireDate, Address, City, Region, Country, PostalCode, HomePhone,
    Extension, Notes, ReportsTo)
  select northwindOLD.Employees.employeeID,
    northwindOLD.Employees.LastName,
    northwindOLD.Employees.FirstName,
    northwindOLD.Employees.Title,
    northwindOLD.Employees.titleofcourtesy,
    northwindOLD.Employees.titleofcourtesy || ' ' || northwindOLD.Employees.FirstName
      || ' ' || northwindOLD.Employees.LastName,
    northwindOLD.Employees.birthdate,
    northwindOLD.Employees.hiredate,
    northwindOLD.Employees.address,
    northwindOLD.Employees.city,
    northwindOLD.Employees.region,
    (select northwind.countries.countryid from northwind.countries
      where northwindOLD.Employees.country = northwind.countries.countryname),
    northwindOLD.Employees.postalcode,
    northwindOLD.Employees.homephone,
    northwindOLD.Employees.extension,
    northwindOLD.Employees.notes,
    northwindOLD.Employees.reportsto
  from northwindOLD.Employees;

--EmployeeTerritories
insert into northwind.EmployeeTerritories select * from northwindOLD.EmployeeTerritories;

--Orders
insert into northwind.Orders (OrderID, CustomerID, EmployeeID, OrderDate, 
  RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, 
  ShipRegion, ShipPostalCode, ShipCountry)
  select northwindOLD.Orders.OrderID,
  (select northwind.Customers.customerID from northwind.customers
    where northwindOLD.Orders.CustomerID = customers.customercode),
  northwindOLD.Orders.employeeID,
  northwindOLD.Orders.orderDate,
  northwindOLD.Orders.RequiredDate,
  northwindOLD.Orders.ShippedDate,
  northwindOLD.Orders.ShipVia,
  northwindOLD.Orders.Freight,
  northwindOLD.Orders.ShipName,
  northwindOLD.Orders.ShipAddress,
  northwindOLD.Orders.ShipCity,
  northwindOLD.Orders.ShipRegion,
  northwindOLD.Orders.ShipPostalCode,
  (select northwind.countries.countryid from northwind.countries
      where northwindOLD.Orders.shipcountry = northwind.countries.countryname)
  from northwindOLD.Orders;
  
--Products
insert into northwind.Products (ProductID, ProductName, CategoryID, SupplierID,
  QuantityPerUnit, UnitPrice, Discontinued)
  select northwindOLD.products.productID,
    northwindOLD.products.productName,
    northwindOLD.products.CategoryID,
    northwindOLD.products.SupplierID,
    northwindOLD.products.QuantityPerUnit,
    northwindOLD.products.UnitPrice,
    northwindOLD.products.Discontinued
  from northwindOLD.products;
  
--Order_Details
insert into northwind.Order_Details (ProductID, OrderID, Quantity, Discount, UnitPrice)
  select northwindOLD.Order_Details.ProductID,
    northwindOLD.Order_Details.OrderID,
    northwindOLD.Order_Details.Quantity,
    northwindOLD.Order_Details.Discount,
    northwindOLD.Order_Details.UnitPrice
  from northwindOLD.Order_Details;

--Product_Location
insert into northwind.Product_Location (ProductID, WarehouseID, UnitsInStock, 
  ReorderLevel, UnitsOnOrder)
  select northwindOLD.products.productID,
    (select round(dbms_random.value(1,3)) from dual),
    northwindOLD.products.unitsinstock,
    northwindOLD.products.reorderlevel,
    northwindOLD.products.unitsonorder
  from northwindOLD.products;