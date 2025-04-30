-- Question 1 Achieving 1NF (First Normal Form)

-- Task:

-- You are given the following table ProductDetail:
-- OrderID	CustomerName	Products
-- 101	John Doe	Laptop, Mouse
-- 102	Jane Smith	Tablet, Keyboard, Mouse
-- 103	Emily Clark	Phone

-- In the table above, the Products column contains multiple values, which violates 1NF.

-- Writing an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

-- 1st step creating the products table 
    
create database productsdb;-- creating a database for the products
 
use productsdb;-- specifying the database to use

create table productdetail(
    orderid int primary key auto_increment ,
    customername varchar(255), 
    products varchar(255)
    );

 
insert into productdetail(orderid,customername,products)
values(101,"John Doe", "Laptop, Mouse"),
(102, "Jane Smith","Tablet, Keyboard, Mouse"),
(103,"Emily Clark","Phone");


-- Transforming the productsdetails table into 1nf by creating another (Products) table to ensure each row has one record

create table products(
productid int primary key auto_increment,
productname varchar(100), 
orderid int,
foreign key (orderid) references productdetail(orderid)
);

insert into products(productname, orderid)
values("Laptop",101),
("Mouse",101),
("Tablet",102),
("Keyboard",102),
("Mouse",102),
("Phone",103);


-- Question 2 Achieving 2NF (Second Normal Form) 
-- You are given the following table OrderDetails, which is already in 1NF but still contains partial dependencies:

-- OrderID	CustomerName	Product	Quantity
-- 101	John Doe	Laptop	2
-- 101	John Doe	Mouse	1
-- 102	Jane Smith	Tablet	3
-- 102	Jane Smith	Keyboard	1
-- 102	Jane Smith	Mouse	2
-- 103	Emily Clark	Phone	1

-- In the table above, the CustomerName column depends on OrderID (a partial dependency), which violates 2NF.
-- Writing an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

-- Step creating the table

use productdb;
create table OrderDetails(OrderID int, CustomerName varchar (255),Product varchar (255), Quantity int);

insert into OrderDetails(orderid,CustomerName,Product,Quantity)
values(101,"John Doe", "Laptop",2),
(101,"John Doe", "Mouse",2),
(102,"Jane Smith", "Tablet",3),
(102,"Jane Smith", "Keyboard",1),
(101,"Jane Smith", "Mouse",2),
(103,"Emily Clark", "Phone",2);

-- To ensure the OrderDetails table is into 2NF we will split it into two tables that is orders table and orderdetail table

create table orders(ID int primary key, customername varchar(255));
insert into orders(id, customername)
values(101,"John Doe"),
(102,"Jane Smith"),
(103,"Emily Clark");

create table OrderDetail(
    orderid int,
    product varchar(100),
    quantity int,
    primary key (orderid, Product),
    foreign key (orderid) REFERENCES orders(orderid)
);

insert into orderdetail (orderid, product, quantity) values
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- The orderdetails table is in 2NF