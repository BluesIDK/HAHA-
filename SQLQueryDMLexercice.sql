create table products ( productID int primary key, productname nvarchar(50), price decimal(10, 2), category nvarchar(50) );
create table customers ( customerID int primary key, customername nvarchar(50), address nvarchar(100) );
create table orders ( orderID int primary key, customerID int, productID int, quantity int, orderdate date,
foreign key (customerID) references customers(customerID),
foreign key (productID) references products(productID) );

insert into products (productID, productname, price, category) 
values (1, 'cookies', 10, 'snacks');

insert into products values (2, 'Candy', 5.2, 'Sweets'),
(3, 'Chips', 8.5, 'Snacks'),
(4, 'Juice', 15, 'Beverages'),
(5, 'Ice Cream', 12, 'Desserts');

insert into customers values (1, 'Ahmed', 'Tunisia'),
(2, 'Coulibaly', 'Senegal'),
(3, 'Hasan', 'Egypt'),
(4, 'Yasmine', 'Morocco'),
(5, 'John', 'France'),
(6, 'Fatima', 'Algeria');


insert into orders values (1, 1, 2, 3, '2023-01-22'),
(2, 2, 1, 10, '2023-04-14'),
(3, 3, 4, 5, '2023-06-10'),
(4, 5, 3, 7, '2023-07-05'),
(5, 6, 5, 2, '2023-10-15');


update orders
set quantity=6
where orderID=2;

alter table orders
drop column customerID;

DELETE FROM orders
WHERE CustomerID = 3;

DELETE FROM Customers
WHERE CustomerID = 3;

select *
from orders;

select*
from customers;

select *
from products;
