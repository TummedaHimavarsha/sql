-- 1
INSERT INTO orders VALUES (1, 'phone', 'Samsung', 20000, '5GB');

-- 2
UPDATE orders SET orderstatus = 'Shipped' WHERE orderID = 105;

-- 3
DELETE FROM orders WHERE status = 'Cancelled';

-- 4
CREATE TABLE orders (
  SNo INT PRIMARY KEY,
  Name VARCHAR(20) NOT NULL,
  age INT CHECK (age > 18)
);

-- 5
SELECT * FROM orders WHERE orderstatus = 'Delivered';

-- 6
SELECT * FROM orders ORDER BY TotalAmount DESC;

-- 7
SELECT * FROM orders GROUP BY paymentmethod;

-- 8
SELECT * FROM orders GROUP BY paymentmethod HAVING COUNT(*) > 50;

-- 9
SELECT DISTINCT(orderstatus) FROM orders;

-- 10
SELECT o.*, c.CustomerName
FROM orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID;

-- 11
SELECT c.*, o.*
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID;

-- 12
SELECT * FROM orders
RIGHT JOIN products p ON orders.ProductID = p.ProductID;

-- 13
SELECT * FROM customers
FULL OUTER JOIN orders ON customers.CustomerID = orders.CustomerID
UNION
SELECT * FROM orders;

-- 14
SELECT productname, categoryname
FROM products
JOIN category ON products.categoryID = category.categoryID;

-- 15
SELECT * FROM orders
WHERE orderDate >= CURDATE() - INTERVAL 7 DAY;

-- 16
SELECT EXTRACT(YEAR FROM orderdate), EXTRACT(MONTH FROM orderdate)
FROM orders;

-- 17
SELECT DATEDIFF(deliverydate, orderdate) AS days_to_deliver
FROM orders;

-- 18
SELECT * FROM orders WHERE deliverydate IS NULL;

-- 19
SELECT * FROM orders
WHERE orderdate BETWEEN '2024-01-01' AND '2024-03-31';

-- 20
SELECT UPPER(paymentmethod) FROM orders;

-- 21
SELECT SUBSTR(orderstatus, 1, 3) FROM orders;

-- 22
SELECT REPLACE(orderstatus, 'Pending', 'Awaiting') FROM orders;

-- 23
SELECT CONCAT(orderID, '-', orderstatus) FROM orders;

-- 24
SELECT *, ROW_NUMBER() OVER (ORDER BY totalamount DESC) AS new_rows
FROM orders;

-- 25
SELECT *, RANK() OVER (ORDER BY totalamount DESC) AS new_ranks
FROM orders;

-- 26
SELECT *, DENSE_RANK() OVER (ORDER BY discount ASC) AS new_discounts
FROM orders;

-- 27
SELECT *, LEAD(orderID) OVER (ORDER BY customerID) AS next_order
FROM customers;

-- 28
SELECT CustomerID, SUM(quantity) AS TotalQuantity
FROM orders
GROUP BY CustomerID;

-- 29
SELECT * FROM orders
WHERE totalamount > (SELECT AVG(totalamount) FROM orders);

-- 30
SELECT * FROM orders
ORDER BY quantity DESC
LIMIT 1;

-- 31
SELECT * FROM orders
WHERE CustomerID IN (SELECT CustomerID FROM orders WHERE status = 'Pending');

-- 32
SELECT ProductID
FROM orders
GROUP BY ProductID
HAVING COUNT(*) > 1;

-- 33
SELECT CustomerID, ProductID
FROM orders
GROUP BY CustomerID, ProductID
HAVING COUNT(*) > 1;

-- 34
SELECT OrderDate, PaymentMethod
FROM orders
GROUP BY OrderDate, PaymentMethod
HAVING COUNT(*) > 1;
