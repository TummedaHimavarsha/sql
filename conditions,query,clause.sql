-- 1. Create database if it doesn't exist
CREATE DATABASE orders;
USE orders;

-- 2. Create the orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE,
    City VARCHAR(50)
);

-- 3. Insert sample data
INSERT INTO orders (OrderID, CustomerName, Product, Category, Quantity, Price, OrderDate, City) VALUES
(101, 'Ravi Kumar', 'Laptop', 'Electronics', 1, 55000, '2023-01-15', 'Hyderabad'),
(102, 'Priya Sharma', 'Mobile Phone', 'Electronics', 2, 18000, '2023-02-20', 'Bangalore'),
(103, 'Arjun Reddy', 'Headphones', 'Accessories', 3, 1500, '2023-03-05', 'Chennai'),
(104, 'Sneha Gupta', 'T-shirt', 'Fashion', 4, 700, '2023-03-25', 'Mumbai'),
(105, 'Manish Verma', 'Shoes', 'Fashion', 2, 2500, '2023-04-10', 'Delhi'),
(106, 'Kavya Iyer', 'Smartwatch', 'Electronics', 1, 12000, '2023-04-22', 'Pune'),
(107, 'Rohit Yadav', 'Refrigerator', 'HomeAppliance', 1, 30000, '2023-05-01', 'Hyderabad'),
(108, 'Ananya Singh', 'WashingMachine', 'HomeAppliance', 1, 22000, '2023-05-15', 'Bangalore'),
(109, 'Karan Patel', 'Microwave', 'HomeAppliance', 1, 9000, '2023-06-12', 'Chennai'),
(110, 'Neha Joshi', 'Jeans', 'Fashion', 2, 1800, '2023-07-05', 'Mumbai'),
(111, 'Suresh Raina', 'TV', 'Electronics', 1, 40000, '2023-07-18', 'Delhi'),
(112, 'Aditi Mehra', 'Dress', 'Fashion', 3, 3500, '2023-08-02', 'Pune'),
(113, 'Harish Kumar', 'Mobile Phone', 'Electronics', 1, 20000, '2023-08-20', 'Hyderabad'),
(114, 'Divya Nair', 'Mixer Grinder', 'HomeAppliance', 2, 5000, '2023-09-10', 'Bangalore'),
(115, 'Vivek Sharma', 'Jacket', 'Fashion', 1, 3000, '2023-09-22', 'Chennai');

-- 4. Queries

-- 4.1 Find all orders placed from Hyderabad
SELECT * FROM orders WHERE city = 'Hyderabad';

-- 4.2 List all products whose price is greater than 20000
SELECT product FROM orders WHERE price > 20000;

-- 4.3 Display all orders sorted by Price descending
SELECT * FROM orders ORDER BY price DESC;

-- 4.4 Show customers sorted by OrderDate ascending
SELECT customername FROM orders ORDER BY orderdate ASC;

-- 4.5 Find total number of orders placed in each city
SELECT city, COUNT(*) AS total_orders FROM orders GROUP BY city;

-- 4.6 Find categories where total sales amount > 30000
SELECT category, SUM(price * quantity) AS total_sales 
FROM orders 
GROUP BY category 
HAVING total_sales > 30000;

-- 4.7 Get unique cities from which orders were placed
SELECT DISTINCT city FROM orders;

-- 4.8 Find all unique product categories
SELECT DISTINCT category FROM orders;

-- 4.9 Display the 5 most recent orders
SELECT * FROM orders ORDER BY orderdate DESC LIMIT 5;

-- 4.10 Show the top 3 most expensive products ordered
SELECT * FROM orders ORDER BY price DESC LIMIT 3;
