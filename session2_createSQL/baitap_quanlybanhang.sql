create database QuanLyBanHang;

use QuanLyBanHang;

create table Customers(
	customerId int not null auto_increment primary key,
    customerName varchar(50) not null,
    customerAge int check (customerAge between 0 and 100)
);

create table Orders(
	orderId int not null auto_increment primary key,
    customerId int not null,
    orderDate datetime,
    orderTotalPrice float default 0,
    foreign key (orderId) references Customers(customerId)
);

create table Product(
	productId varchar(10) not null primary key,
    productName varchar(50),
    productPrime float default 0
);

create table OrderDetail(
	orderID int not null auto_increment,
    productID varchar(10) not null,
    detailQTY varchar(50),
    unique (orderID, productID),
    foreign key(orderID) references Orders(orderId),
    foreign key(productID) references Product(productId)
);