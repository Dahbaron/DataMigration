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

--Countries
insert into	Countries	values (CountryID_seq.nextval, 'Afghanistan');
insert into	Countries	values (CountryID_seq.nextval,	'Albania');
insert into	Countries	values (CountryID_seq.nextval,	'Algeria');
insert into	Countries	values (CountryID_seq.nextval,	'Andorra');
insert into	Countries	values (CountryID_seq.nextval,	'Angola');
insert into	Countries	values (CountryID_seq.nextval,	'Anguilla');
insert into	Countries	values (CountryID_seq.nextval,	'Antigua and Barbuda');
insert into	Countries	values (CountryID_seq.nextval,	'Argentina');
insert into	Countries	values	(CountryID_seq.nextval,	'Armenia');
insert into	Countries	values	(CountryID_seq.nextval,	'Aruba');
insert into	Countries	values	(CountryID_seq.nextval,	'Australia');
insert into	Countries	values	(CountryID_seq.nextval,	'Austria');
insert into	Countries	values	(CountryID_seq.nextval,	'Azerbaijan');
insert into	Countries	values	(CountryID_seq.nextval,	'Bahamas');
insert into	Countries	values	(CountryID_seq.nextval,	'Bahrain');
insert into	Countries	values	(CountryID_seq.nextval,	'Bangladesh');
insert into	Countries	values	(CountryID_seq.nextval,	'Barbados');
insert into	Countries	values	(CountryID_seq.nextval,	'Belarus');
insert into	Countries	values	(CountryID_seq.nextval,	'Belgium');
insert into	Countries	values	(CountryID_seq.nextval,	'Belize');
insert into	Countries	values	(CountryID_seq.nextval,	'Benin');
insert into	Countries	values	(CountryID_seq.nextval,	'Bermuda');
insert into	Countries	values	(CountryID_seq.nextval,	'Bhutan');
insert into	Countries	values	(CountryID_seq.nextval,	'Bolivia');
insert into	Countries	values	(CountryID_seq.nextval,	'Bosnia and Herzegovina');
insert into	Countries	values	(CountryID_seq.nextval,	'Botswana');
insert into	Countries	values	(CountryID_seq.nextval,	'Brazil');
insert into	Countries	values	(CountryID_seq.nextval,	'Brunei');
insert into	Countries	values	(CountryID_seq.nextval,	'Bulgaria');
insert into	Countries	values	(CountryID_seq.nextval,	'Burkina Faso');
insert into	Countries	values	(CountryID_seq.nextval,	'Burundi');
insert into	Countries	values	(CountryID_seq.nextval,	'Cambodia');
insert into	Countries	values	(CountryID_seq.nextval,	'Cameroon');
insert into	Countries	values	(CountryID_seq.nextval,	'Canada');
insert into	Countries	values	(CountryID_seq.nextval,	'Cape Verde');
insert into	Countries	values	(CountryID_seq.nextval,	'Cayman Islands');
insert into	Countries	values	(CountryID_seq.nextval,	'Central African Republic');
insert into	Countries	values	(CountryID_seq.nextval,	'Chad');
insert into	Countries	values	(CountryID_seq.nextval,	'Chile');
insert into	Countries	values	(CountryID_seq.nextval,	'China');
insert into	Countries	values	(CountryID_seq.nextval,	'Christmas Island');
insert into	Countries	values	(CountryID_seq.nextval,	'Colombia');
insert into	Countries	values	(CountryID_seq.nextval,	'Comoros');
insert into	Countries	values	(CountryID_seq.nextval,	'Cook Islands');
insert into	Countries	values	(CountryID_seq.nextval,	'Democratic Republic of the Congo');
insert into	Countries	values	(CountryID_seq.nextval,	'Republic of the Congo');
insert into	Countries	values	(CountryID_seq.nextval,	'Costa Rica');
insert into	Countries	values	(CountryID_seq.nextval,	'Côte d''Ivoire');
insert into	Countries	values	(CountryID_seq.nextval,	'Croatia');
insert into	Countries	values	(CountryID_seq.nextval,	'Cuba');
insert into	Countries	values	(CountryID_seq.nextval,	'Cyprus');
insert into	Countries	values	(CountryID_seq.nextval,	'Czech Republic');
insert into	Countries	values	(CountryID_seq.nextval,	'Denmark');
insert into	Countries	values	(CountryID_seq.nextval,	'Djibouti');
insert into	Countries	values	(CountryID_seq.nextval,	'Dominica');
insert into	Countries	values	(CountryID_seq.nextval,	'Dominican Republic');
insert into	Countries	values	(CountryID_seq.nextval,	'Ecuador');
insert into	Countries	values	(CountryID_seq.nextval,	'Egypt');
insert into	Countries	values	(CountryID_seq.nextval,	'El Salvador');
insert into	Countries	values	(CountryID_seq.nextval,	'Equatorial Guinea');
insert into	Countries	values	(CountryID_seq.nextval,	'Eritrea');
insert into	Countries	values	(CountryID_seq.nextval,	'Estonia');
insert into	Countries	values	(CountryID_seq.nextval,	'Ethiopia');
insert into	Countries	values	(CountryID_seq.nextval,	'Fiji');
insert into	Countries	values	(CountryID_seq.nextval,	'Finland');
insert into	Countries	values	(CountryID_seq.nextval,	'France');
insert into	Countries	values	(CountryID_seq.nextval,	'Gabon');
insert into	Countries	values	(CountryID_seq.nextval,	'Gambia');
insert into	Countries	values	(CountryID_seq.nextval,	'Georgia');
insert into	Countries	values	(CountryID_seq.nextval,	'Germany');
insert into	Countries	values	(CountryID_seq.nextval,	'Ghana');
insert into	Countries	values	(CountryID_seq.nextval,	'Greece');
insert into	Countries	values	(CountryID_seq.nextval,	'Greenland');
insert into	Countries	values	(CountryID_seq.nextval,	'Grenada');
insert into	Countries	values	(CountryID_seq.nextval,	'Guam');
insert into	Countries	values	(CountryID_seq.nextval,	'Guatemala');
insert into	Countries	values	(CountryID_seq.nextval,	'Guinea');
insert into	Countries	values	(CountryID_seq.nextval,	'Guinea Bissau');
insert into	Countries	values	(CountryID_seq.nextval,	'Guyana');
insert into	Countries	values	(CountryID_seq.nextval,	'Haiti');
insert into	Countries	values	(CountryID_seq.nextval,	'Honduras');
insert into	Countries	values	(CountryID_seq.nextval,	'Hungary');
insert into	Countries	values	(CountryID_seq.nextval,	'Iceland');
insert into	Countries	values	(CountryID_seq.nextval,	'India');
insert into	Countries	values	(CountryID_seq.nextval,	'Indonesia');
insert into	Countries	values	(CountryID_seq.nextval,	'Iran');
insert into	Countries	values	(CountryID_seq.nextval,	'Iraq');
insert into	Countries	values	(CountryID_seq.nextval,	'Ireland');
insert into	Countries	values	(CountryID_seq.nextval,	'Israel');
insert into	Countries	values	(CountryID_seq.nextval,	'Italy');
insert into	Countries	values	(CountryID_seq.nextval,	'Jamaica');
insert into	Countries	values	(CountryID_seq.nextval,	'Japan');
insert into	Countries	values	(CountryID_seq.nextval,	'Jordan');
insert into	Countries	values	(CountryID_seq.nextval,	'Kazakhstan');
insert into	Countries	values	(CountryID_seq.nextval,	'Kenya');
insert into	Countries	values	(CountryID_seq.nextval,	'Kiribati');
insert into	Countries	values	(CountryID_seq.nextval,	'Kuwait');
insert into	Countries	values	(CountryID_seq.nextval,	'Kyrgyzstan');
insert into	Countries	values	(CountryID_seq.nextval,	'Laos');
insert into	Countries	values	(CountryID_seq.nextval,	'Latvia');
insert into	Countries	values	(CountryID_seq.nextval,	'Lebanon');
insert into	Countries	values	(CountryID_seq.nextval,	'Lesotho');
insert into	Countries	values	(CountryID_seq.nextval,	'Liberia');
insert into	Countries	values	(CountryID_seq.nextval,	'Libya');
insert into	Countries	values	(CountryID_seq.nextval,	'Liechtenstein');
insert into	Countries	values	(CountryID_seq.nextval,	'Lithuania');
insert into	Countries	values	(CountryID_seq.nextval,	'Luxembourg');
insert into	Countries	values	(CountryID_seq.nextval,	'Macedonia');
insert into	Countries	values	(CountryID_seq.nextval,	'Madagascar');
insert into	Countries	values	(CountryID_seq.nextval,	'Malawi');
insert into	Countries	values	(CountryID_seq.nextval,	'Malaysia');
insert into	Countries	values	(CountryID_seq.nextval,	'Maldives');
insert into	Countries	values	(CountryID_seq.nextval,	'Mali');
insert into	Countries	values	(CountryID_seq.nextval,	'Malta');
insert into	Countries	values	(CountryID_seq.nextval,	'Marshall Islands');
insert into	Countries	values	(CountryID_seq.nextval,	'Mauritania');
insert into	Countries	values	(CountryID_seq.nextval,	'Mauritius');
insert into	Countries	values	(CountryID_seq.nextval,	'Mexico');
insert into	Countries	values	(CountryID_seq.nextval,	'Micronesia');
insert into	Countries	values	(CountryID_seq.nextval,	'Moldova');
insert into	Countries	values	(CountryID_seq.nextval,	'Monaco');
insert into	Countries	values	(CountryID_seq.nextval,	'Mongolia');
insert into	Countries	values	(CountryID_seq.nextval,	'Morocco');
insert into	Countries	values	(CountryID_seq.nextval,	'Mozambique');
insert into	Countries	values	(CountryID_seq.nextval,	'Myanmar');
insert into	Countries	values	(CountryID_seq.nextval,	'Namibia');
insert into	Countries	values	(CountryID_seq.nextval,	'Nauru');
insert into	Countries	values	(CountryID_seq.nextval,	'Nepal');
insert into	Countries	values	(CountryID_seq.nextval,	'Netherlands');
insert into	Countries	values	(CountryID_seq.nextval,	'New Zealand');
insert into	Countries	values	(CountryID_seq.nextval,	'Nicaragua');
insert into	Countries	values	(CountryID_seq.nextval,	'Niger');
insert into	Countries	values	(CountryID_seq.nextval,	'Nigeria');
insert into	Countries	values	(CountryID_seq.nextval,	'North Korea');
insert into	Countries	values	(CountryID_seq.nextval,	'Norway');
insert into	Countries	values	(CountryID_seq.nextval,	'Oman');
insert into	Countries	values	(CountryID_seq.nextval,	'Pakistan');
insert into	Countries	values	(CountryID_seq.nextval,	'Palau');
insert into	Countries	values	(CountryID_seq.nextval,	'Panama');
insert into	Countries	values	(CountryID_seq.nextval,	'Papua New Guinea');
insert into	Countries	values	(CountryID_seq.nextval,	'Paraguay');
insert into	Countries	values	(CountryID_seq.nextval,	'Peru');
insert into	Countries	values	(CountryID_seq.nextval,	'Philippines');
insert into	Countries	values	(CountryID_seq.nextval,	'Poland');
insert into	Countries	values	(CountryID_seq.nextval,	'Portugal');
insert into	Countries	values	(CountryID_seq.nextval,	'Qatar');
insert into	Countries	values	(CountryID_seq.nextval,	'Romania');
insert into	Countries	values	(CountryID_seq.nextval,	'Russian Federation');
insert into	Countries	values	(CountryID_seq.nextval,	'Rwanda');
insert into	Countries	values	(CountryID_seq.nextval,	'Saint Kitts and Nevis');
insert into	Countries	values	(CountryID_seq.nextval,	'Saint Lucia');
insert into	Countries	values	(CountryID_seq.nextval,	'Saint Vincent and the Grenadines');
insert into	Countries	values	(CountryID_seq.nextval,	'Samoa');
insert into	Countries	values	(CountryID_seq.nextval,	'San Marino');
insert into	Countries	values	(CountryID_seq.nextval,	'Sao Tome and Principe');
insert into	Countries	values	(CountryID_seq.nextval,	'Saudi Arabia');
insert into	Countries	values	(CountryID_seq.nextval,	'Senegal');
insert into	Countries	values	(CountryID_seq.nextval,	'Serbia');
insert into	Countries	values	(CountryID_seq.nextval,	'Seychelles');
insert into	Countries	values	(CountryID_seq.nextval,	'Sierra Leone');
insert into	Countries	values	(CountryID_seq.nextval,	'Singapore');
insert into	Countries	values	(CountryID_seq.nextval,	'Slovakia');
insert into	Countries	values	(CountryID_seq.nextval,	'Slovenia');
insert into	Countries	values	(CountryID_seq.nextval,	'Solomon Islands');
insert into	Countries	values	(CountryID_seq.nextval,	'Somalia');
insert into	Countries	values	(CountryID_seq.nextval,	'South Africa');
insert into	Countries	values	(CountryID_seq.nextval,	'South Korea');
insert into	Countries	values	(CountryID_seq.nextval,	'Spain');
insert into	Countries	values	(CountryID_seq.nextval,	'Sri Lanka');
insert into	Countries	values	(CountryID_seq.nextval,	'Sudan');
insert into	Countries	values	(CountryID_seq.nextval,	'Suriname');
insert into	Countries	values	(CountryID_seq.nextval,	'Swaziland');
insert into	Countries	values	(CountryID_seq.nextval,	'Sweden');
insert into	Countries	values	(CountryID_seq.nextval,	'Switzerland');
insert into	Countries	values	(CountryID_seq.nextval,	'Syria');
insert into	Countries	values	(CountryID_seq.nextval,	'Taiwan');
insert into	Countries	values	(CountryID_seq.nextval,	'Tajikistan');
insert into	Countries	values	(CountryID_seq.nextval,	'Tanzania');
insert into	Countries	values	(CountryID_seq.nextval,	'Thailand');
insert into	Countries	values	(CountryID_seq.nextval,	'Timor-Leste');
insert into	Countries	values	(CountryID_seq.nextval,	'Togo');
insert into	Countries	values	(CountryID_seq.nextval,	'Tonga');
insert into	Countries	values	(CountryID_seq.nextval,	'Trinidad and Tobago');
insert into	Countries	values	(CountryID_seq.nextval,	'Tunisia');
insert into	Countries	values	(CountryID_seq.nextval,	'Turkey');
insert into	Countries	values	(CountryID_seq.nextval,	'Turkmenistan');
insert into	Countries	values	(CountryID_seq.nextval,	'Tuvalu');
insert into	Countries	values	(CountryID_seq.nextval,	'Uganda');
insert into	Countries	values	(CountryID_seq.nextval,	'Ukraine');
insert into	Countries	values	(CountryID_seq.nextval,	'United Arab Emirates');
insert into	Countries	values	(CountryID_seq.nextval,	'United Kingdom');
insert into	Countries	values	(CountryID_seq.nextval,	'United States of America');
insert into	Countries	values	(CountryID_seq.nextval,	'Uruguay');
insert into	Countries	values	(CountryID_seq.nextval,	'Uzbekistan');
insert into	Countries	values	(CountryID_seq.nextval,	'Vanuatu');
insert into	Countries	values	(CountryID_seq.nextval,	'Vatican City');
insert into	Countries	values	(CountryID_seq.nextval,	'Venezuela');
insert into	Countries	values	(CountryID_seq.nextval,	'Vietnam');
insert into	Countries	values	(CountryID_seq.nextval,	'Yemen');
insert into	Countries	values	(CountryID_seq.nextval,	'Zambia');
insert into	Countries	values	(CountryID_seq.nextval,	'Zimbabwe');

--Categories
insert into northwind.Shippers select * from northwindOLD.SHIPPERS;

--Region
insert into northwind.Region select * from NORTHWINDOLD.REGION;

--Territories
insert into northwind.Territories select * from NORTHWINDOLD.TERRITORIES;

--Suppliers
insert into northwind.Suppliers select * from NORTHWINDOLD.SUPPLIERS;

--Customers
--insert into northwind.Customers values (CustomerID_seq.nextval, (select * from NORTHWINDOLD.CUSTOMERS));
