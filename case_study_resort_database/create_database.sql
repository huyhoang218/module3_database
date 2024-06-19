create database resort;

use resort;

create table Positions(
    id_position int primary key,
    name_position varchar(45)
);

create table Levels(
    id_level int primary key ,
    level varchar(45)
);

create table Departments(
    id_part int primary key ,
    name_part varchar(45)
);

create table Staffs(
    id_staff int primary key ,
    name varchar(45),
    id_position int,
    id_level int,
    id_part int,
    dob date,
    id_number varchar(45) unique ,
    salary double,
    phone varchar(10),
    email varchar(45),
    address varchar(45),
    foreign key fk_position_staff(id_position) references Positions(id_position),
    foreign key fk_level_staff(id_level) references Levels(id_level),
    foreign key fk_part_staff(id_part) references Departments(id_part)
);

create table Customer_Types(
    id_customer_type int primary key ,
    name varchar(45)
);

create table Customers(
    id_customer int primary key ,
    id_customer_type int,
    name varchar(45),
    dob varchar(45),
    id_number varchar(45) unique ,
    phone varchar(10),
    email varchar(45),
    address varchar(45),
    foreign key fk_customer_type_customer(id_customer_type) references Customer_Types(id_customer_type)
);

create table Contracts(
    id_contract int primary key ,
    id_staff int,
    id_customer int,
    id_service int,
    day_start date,
    day_end date,
    deposit double,
    total_money double,
    foreign key fk_staff_contract(id_staff) references Staffs(id_staff),
    foreign key fk_customer_contract(id_customer) references Customers(id_customer),
    foreign key fk_service_contract(id_service) references Services(id_service)
);

create table Service_Types(
    id_service_type int primary key ,
    name_service_type varchar(45)
);

create table Rental_Types(
    id_rental_type int primary key ,
    name_rental_type varchar(45),
    price double
);

create table Services(
    id_service int primary key ,
    name_service varchar(45),
    area int,
    number_floors int,
    max_people int,
    rental_costs double,
    id_rental_type int,
    id_service_type int,
    status varchar(45),
    foreign key fk_rental_service(id_rental_type) references Rental_Types(id_rental_type),
    foreign key fk_service_type_service(id_service_type) references Service_Types(id_service_type)
);

create table Accompanied_Services(
    id_accompanied_service int primary key ,
    name_accompanied_service varchar(45),
    price double,
    unit int,
    status varchar(45)
);

create table Contract_Details(
    id_contract_detail int primary key ,
    id_contract int,
    id_accompanied_service int,
    quantity int,
    foreign key fk_contract_contract_detail(id_contract) references Contracts(id_contract),
    foreign key fk_accompanied_service_contract_detail(id_accompanied_service) references Accompanied_Services(id_accompanied_service)
);