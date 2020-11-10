DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars (ID SMALLINT,
				  VIN VARCHAR(25),
				  Manufacturer VARCHAR(20),
				  Model VARCHAR(20),
				  Year INTEGER,
				  Color VARCHAR(20));

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (ID SMALLINT,
					   "Customer ID" INTEGER,
					   Name VARCHAR(50),
					   Phone VARCHAR(25),
					   Email VARCHAR(25),
					   Address TEXT,
					   City VARCHAR(25),
					   "State/Province" VARCHAR(25),
					   Country VARCHAR(25),
					   Postal INTEGER);

DROP TABLE IF EXISTS Salespersons;
CREATE TABLE Salespersons (ID SMALLINT,
						  "Staff ID" VARCHAR(10),
						  Name VARCHAR(25),
						  Store VARCHAR(25));

DROP TABLE IF EXISTS Invoices;
CREATE TABLE Invoices (ID SMALLINT,
					  "Invoice Number" BIGINT,
					  Date VARCHAR(25),
					  Car SMALLINT,
					  Custome SMALLINT,
					  "Sales Person" SMALLINT);