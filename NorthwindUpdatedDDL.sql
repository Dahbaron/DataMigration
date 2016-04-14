/*
  Author: Niko Bentley
  Description: DDL Script for DBAS 1100 Final Project

*/

/*
  DROPS
*/
drop table Order_Details;
drop table Orders;
drop table EmployeeTerritories;
drop table Territories;
drop table Region;
drop table Employees;
drop table Customers;
drop table Shippers;
drop table Product_Location;
drop table Products;
drop table Suppliers;
drop table Categories;
drop table Warehouses;
drop table Countries;

/*
  TABLES
*/

create table Countries (
  CountryID int primary key,
  CountryName varchar(30)
);

create table Warehouses (
  WarehouseID int primary key,
  WarehouseName varchar(20),
  Address varchar(60)
);

create table Categories (
  CategoryID int primary key,
  CategoryName varchar(15),
  Description varchar(255)  
);

create table Suppliers (
  SupplierID int primary key,
  CompanyName varchar(40),
  ContactName varchar(30),
  ContactTitle varchar(30),
  Address varchar(60),
  City varchar(15),
  Region varchar(15),
  Country int references Countries(CountryID),
  PostalCode varchar(10),
  Phone varchar(24),
  Fax varchar(24),
  HomePage varchar(2000)
);

create table Products (
  ProductID int primary key,
  ProductName varchar(40),
  CategoryID int references Categories(CategoryID),
  SupplierID int references Suppliers(SupplierID),
  QuantityPerUnit int,
  UnitPrice number(6, 2),
  Discontinued number(1),
  constraint chk_discontinued check(Discontinued in (0,1))
);

create table Product_Location (
  ProductID int references Products(ProductID),
  WarehouseID int references Warehouses(WarehouseID),
  UnitsInStock int,
  ReorderLevel int,
  UnitsOnOrder int,
  constraint pl_pk primary key (ProductID, WarehouseID)
);

create table Shippers (
  ShipperID int primary key,
  CompanyName varchar(40),
  Phone varchar(24)
);

create table Customers (
  CustomerID int primary key,
  CustomerCode varchar(5),
  CompanyName varchar(40),
  ContactName varchar(30),
  Address varchar(60),
  City varchar(15),
  Region varchar(15),
  Country int references Countries(CountryID),
  PostalCode varchar(10),
  Phone varchar(24),
  Fax varchar(24)
);

create table Employees (
  EmployeeID int primary key,
  LastName varchar(20),
  FirstName varchar(10),
  Title varchar(30),
  TitleOfCourtesy varchar(25),
  NameAndTitle varchar(55),
  BirthDate date,
  HireDate date,
  Address varchar(60),
  City varchar(15),
  Region varchar(15),
  Country int references Countries(CountryID),
  PostalCode varchar(10),
  HomePhone varchar(24),
  Extension varchar(4),
  Notes varchar(500),
  ReportsTo int references Employees(EmployeeID)
);

create table Region (
  RegionID int primary key,
  RegionDescription varchar(50)
);

create table Territories (
  TerritoryID int primary key,
  TerritoryDescription varchar(50),
  RegionID int references Region(RegionID)
);

create table EmployeeTerritories (
  EmployeeID int references Employees(EmployeeID),
  TerritoryID int references Territories(TerritoryID),
  constraint et_pk primary key (EmployeeID, TerritoryID)
);

create table Orders (
  OrderID int primary key,
  CustomerID int references Customers(CustomerID),
  EmployeeID int references Employees(EmployeeID),
  OrderDate date,
  RequiredDate date,
  ShippedDate date,
  ShipVia int references Shippers(ShipperID),
  Freight int,
  ShipName varchar(40),
  ShipAddress varchar(60),
  ShipCity varchar(15),
  ShipRegion varchar(15),
  ShipPostalCode varchar(10),
  ShipCountry int references Countries(CountryID),
  ShipperID int
);

create table Order_Details (
  ProductID int references Products(ProductID),
  OrderID int references Orders(OrderID),
  Quantity int,
  Discount number(6, 2),
  UnitPrice number (6,2),
  constraint od_pk primary key(ProductID, OrderID)
);