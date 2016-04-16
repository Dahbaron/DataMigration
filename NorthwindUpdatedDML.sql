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
delete from Employees;
delete from Customers;
delete from Shippers;
delete from Product_Location;
delete from Products;
delete from Categories;

delete from Suppliers;
delete from EmployeeTerritories;
delete from Territories;
delete from Region;
delete from Countries;
delete from Warehouses;


/*
  INSERTS
*/

--Warehouses
insert into Warehouses values (WarehouseID_seq.nextval, 'Airport warehouse', '747 Cloudview Ln.');
insert into Warehouses values (WarehouseID_seq.nextval, 'Dockside warehouse', '2356 Lower Water St.');
insert into Warehouses values (WarehouseID_seq.nextval, 'Central warehouse', '27 Main St.');

--Countries NOT WORKING
select distinct northwindOLD.customers.country
from northwindOLD.customers
order by northwindOLD.customers.country
;


--Categories
insert into northwind.Shippers select * from northwindOLD.SHIPPERS;

--Region
insert into northwind.Region select * from NORTHWINDOLD.REGION;

--Territories
insert into northwind.Territories select * from NORTHWINDOLD.TERRITORIES;

--Suppliers
insert into northwind.Suppliers select * from NORTHWINDOLD.SUPPLIERS;

--Customers
insert into northwind.Customers 
  values (CustomerID_seq.nextval,
    northwindOLD.customer.customerid,
    northwindOLD.customer.companyname,
    northwindOLD.customer.contactname,
    northwindOLD.customer.address,
    northwindOLD.customer.city,
    northwindOLD.customer.region,
    northwindOLD.customer.postalcode,
    (select northwind.Countries.countryid
     from northwind.countries
     where northwindOLD.customers.country = northwind.countries.countryname),
    northwindOLD.customer.phone,
    northwindOLD.customer.fax
     )
;


/*
  TESTING
*/

insert into northwind.countries values (CountryID_seq.nextval, "Germany");