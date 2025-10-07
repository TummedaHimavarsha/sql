-- -- Create database
-- CREATE DATABASE food;
-- USE food;

-- Create table 'food'
CREATE TABLE food (
    sno INT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) UNIQUE,
    price INT CHECK (price > 50),
    famous VARCHAR(20) NOT NULL,
    ingredients VARCHAR(20) DEFAULT 'nomsg'
) AUTO_INCREMENT = 101;

-- Insert values into 'food' table
INSERT INTO food VALUES (101, 'paneerbiryani', 500, 'gujarat', 'kasthurimethi');
INSERT INTO food VALUES (102, 'chickenbiryani', 120, 'hyderabad', 'spices');
INSERT INTO food VALUES (103 ,'mutton', 750, 'banglore', 'masala');
INSERT INTO food VALUES (104, 'ppotharekulu', 60, 'athreyapuram', 'paper');

-- View table data
SELECT * FROM food;

Rename table
RENAME TABLE food TO foods;

-- View renamed table
SELECT * FROM foods;

-- -- Add a new column 'category'
ALTER TABLE foods ADD COLUMN category VARCHAR(50);

-- Verify structure
SELECT * FROM foods;

-- Add new column 'address' after 'price'
ALTER TABLE foods ADD COLUMN address VARCHAR(50) AFTER price;

-- Verify structure
SELECT * FROM foods;

-- Add new column 'deliverystatus' as the first column
ALTER TABLE foods ADD COLUMN deliverystatus VARCHAR(50) FIRST;

-- View updated table
SELECT * FROM foods;

-- Rename column 'deliverystatus' to 'status'
ALTER TABLE foods RENAME COLUMN deliverystatus TO status;

-- View table after renaming column
SELECT * FROM foods;

-- Drop column 'status'
ALTER TABLE foods DROP COLUMN status;

-- Verify structure
SELECT * FROM foods;

-- Truncate (clear all rows) from table
TRUNCATE TABLE foods;

-- Verify table is empty
SELECT * FROM foods;

-- Drop table permanently
DROP TABLE foods;

Verify table deletion
(This will show an error because 'foods' no longer exists)
SELECT * FROM foods;
