-- Question 1 Achieving 1NF (First Normal Form)

-- Writing an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

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
-- To ensure the OrderDetails table is into 2NF we will split it into two tables that is orders table and orderdetail table

create table orders(ID int primary key, customername varchar(255));
insert into orders(id, customername)
values(101,"John Doe"),
(102,"Jane Smith"),
(103,"Emily Clark");

create table products(
    orderid int,
    product varchar(100),
    quantity int,
    primary key (orderid, Product),
    foreign key (orderid) REFERENCES orders(orderid)
);

insert into products(orderid, product, quantity) values
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- The orderdetails table is in 2NF