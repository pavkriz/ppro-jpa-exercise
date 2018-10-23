CREATE TABLE Offices(
	officeCode VARCHAR(10) not null,
	city VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50),
	postalCode VARCHAR(15),
	territory VARCHAR(10)
);

ALTER TABLE Offices ADD CONSTRAINT offices_pk PRIMARY KEY ( officeCode );

CREATE TABLE Customers(
	customerNumber INTEGER not null,
	customerName VARCHAR(50),
	contactLastName VARCHAR(50),
	contactFirstName VARCHAR(50),
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	postalCode VARCHAR(15),
	country VARCHAR(50),
	salesRepEmployeeNumber INTEGER,
	creditLimit DOUBLE
);

ALTER TABLE Customers ADD CONSTRAINT customers_pk PRIMARY KEY (customerNumber);

CREATE TABLE Orders(
	orderNumber INTEGER not null,
	orderDate DATE,
	requiredDate DATE,
	shippedDate DATE,
	status VARCHAR(15),
	comments VARCHAR(255),
	customerNumber INTEGER 
);

ALTER TABLE Orders ADD CONSTRAINT orders_pk PRIMARY KEY (orderNumber);
CREATE INDEX orders_cutomer ON Orders( customerNumber );

CREATE TABLE OrderDetails(
	orderNumber INTEGER not null,
	productCode VARCHAR(15) not null,
	quantityOrdered INTEGER,
	priceEach DOUBLE,
	orderLineNumber SMALLINT);

ALTER TABLE OrderDetails ADD CONSTRAINT orderDetails_pk PRIMARY KEY (orderNumber, productCode);

CREATE TABLE Employees(
	employeeNumber INTEGER not null,
	lastName VARCHAR(50),
	firstName VARCHAR(50),
	extension VARCHAR(10),
	email VARCHAR(100),
	officeCode VARCHAR(10),
	reportsTo INTEGER,
	jobTitle VARCHAR(50) 
);

ALTER TABLE Employees ADD CONSTRAINT employees_pk PRIMARY KEY (employeeNumber);

CREATE TABLE Payments(
	customerNumber INTEGER not null,
	checkNumber VARCHAR(50) not null,
	paymentDate DATE,
	amount DOUBLE 
);

ALTER TABLE Payments ADD CONSTRAINT payments_pk PRIMARY KEY ( customerNumber, checkNumber );

CREATE TABLE Products(
	productCode VARCHAR(15) not null,
	productName VARCHAR(70),
	productLine VARCHAR(50),
	productScale VARCHAR(10),
	productVendor VARCHAR(50),
	productDescription VARCHAR(255),
	quantityInStock INTEGER,
	buyPrice DOUBLE,
	MSRP DOUBLE
);

ALTER TABLE Products ADD CONSTRAINT products_pk PRIMARY KEY (productCode);

CREATE TABLE ProductLines(
	productLine VARCHAR(50) not null,
	textDescription VARCHAR(4000),
	htmlDescription VARCHAR(255),
	image BLOB
);

ALTER TABLE ProductLines ADD CONSTRAINT productLines_pk PRIMARY KEY (productLine);


ALTER TABLE Customers ADD CONSTRAINT cust_rep_fk FOREIGN KEY (salesRepEmployeeNumber) REFERENCES Employees (employeeNumber);
ALTER TABLE Products ADD CONSTRAINT prod_line_fk FOREIGN KEY (productLine) REFERENCES ProductLines (productLine);
ALTER TABLE Payments ADD CONSTRAINT pay_cust_fk FOREIGN KEY (customerNumber) REFERENCES Customers (customerNumber);
ALTER TABLE Employees ADD CONSTRAINT emp_off_fk FOREIGN KEY (officeCode) REFERENCES Offices (officeCode);
ALTER TABLE OrderDetails ADD CONSTRAINT ord_num_fk FOREIGN KEY (orderNumber) REFERENCES Orders (orderNumber);
ALTER TABLE OrderDetails ADD CONSTRAINT ord_prod_fk FOREIGN KEY (productCode) REFERENCES Products (productCode);
ALTER TABLE Orders ADD CONSTRAINT ord_cust_fk FOREIGN KEY (customerNumber) REFERENCES Customers (customerNumber);