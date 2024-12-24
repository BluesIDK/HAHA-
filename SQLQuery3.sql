create table customers (  customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_tel VARCHAR(15) NOT NULL
); 
CREATE TABLE Products (   product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0)  );
CREATE TABLE Orders (    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)   );
INSERT INTO Customers (customer_id, customer_name, customer_tel)
VALUES 
(101, 'John Doe', '123-456-7890');
INSERT INTO Products (product_id, product_name, category, price)
VALUES 
(1, 'Smartphone', 'Electronics', 699.99);
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_date, total_amount)
VALUES 
(1001, 101, 1, 2, '2024-01-15', 1399.98); -- Total amount = quantity * price

SELECT 
    o.order_id,
    c.customer_name,
    p.product_name,
    o.quantity,
    o.order_date,
    o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;