Create database Production;

Use Production;
Create table ProductLine
(   productline bigint not null auto_increment,
    htmlDescription tinyblob,
    textDescription tinyblob,
    image int,
    Primary Key (productline)
);
Create table Product
(   productcode bigint not null auto_increment,
    productname varchar(50) not null,
    productline bigint ,
    productscale bigint,
    productvendor varchar(50),
    productdescription text,
    quantityinstock tinyint,
    buyprice int,
    MSRP int,
    Key idx_fk_productline (productline),
 CONSTRAINT fk_Product_ProductLine FOREIGN KEY (productline) REFERENCES ProductLine(productline)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    Primary Key (productcode)
);
Create table Offices
(   OfficeCode int not null,
    city varchar(20),
    phone bigint,
    addressLine1 varchar (50),
    addressLine2 varchar(50),
    state varchar(20),
    country varchar(20),
    postalcode int,
    territory varchar(50),
    Primary Key (OfficeCode)
);
Create table Employees
(   EmployeeNumber int not null auto_increment,
	lastname varchar(100),
	firstname varchar(100),
    extension varchar(50),
    email varchar(50),
    reportsto int,
    officeCode int,
    jobtitle varchar(50),
    Key idx_fk_officeCode (OfficeCode),
    CONSTRAINT fk_Employees_Offices FOREIGN KEY (OfficeCode) REFERENCES Offices (OfficeCode)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    Primary Key (EmployeeNumber)
);

Create table Customer
(
	CustomerNumber bigint not null auto_increment,
	Customername varchar(100),
    contactfirstname varchar(100),
	contactlastname varchar(100),
    phone bigint,
    addressline1 varchar(100),
    addressline2 varchar(100),
    city varchar(50), 
    state varchar(20),
    postalcode int,
	country varchar(15),
    EmployeeNumber int not null,
    creditlimit bigint,
    Primary Key (CustomerNumber)
);


Create table Orders
(   orderNo int not null auto_increment,
    orderdate date,
    required date,
    shipped date,
    stat varchar(50),
	comments text,
    CustomerNumber bigint,
    Key idx_fk_CustomerNumber (CustomerNumber),
    CONSTRAINT fk_Order_Customer FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    Primary Key(orderNo)
);
Create table OrderDetails
(  orderNo bigint not null auto_increment,
   productcode bigint not null,
   quantityordered int,
   priceach int,
   orderlinenumber bigint,
    Key idx_fk_productcode (productcode),
   CONSTRAINT fk_OrderDetails_Product FOREIGN KEY (productcode) REFERENCES Product(productcode)
    ON DELETE RESTRICT ON UPDATE CASCADE,
   Primary Key(orderNo,productcode)
);
Create table Payments
(  CustomerNumber bigint not null,
   checkNumber bigint not null,
   paymentdate date,
   amount int,
   Primary key(CustomerNumber,checkNumber)
); 











