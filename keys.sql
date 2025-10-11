-- Create table breeds
CREATE TABLE breeds (
  sno INT PRIMARY KEY,
  name VARCHAR(20)
);

-- Create table dogs with foreign key reference
CREATE TABLE dogs (
  sno INT,
  types VARCHAR(20),
  FOREIGN KEY (sno) REFERENCES breeds(sno)
);

-- Insert data into breeds
INSERT INTO breeds VALUES
(1, 'leo'),
(2, 'bantu'),
(3, 'leo');

-- Insert data into dogs
INSERT INTO dogs VALUES
(1, 'lesapso'),
(2, 'pug'),
(3, 'poemarian');

-- View data from both tables
SELECT * FROM breeds;
SELECT * FROM dogs;

-- Tried inserting same values again into dogs (successful because foreign key values exist)
INSERT INTO dogs VALUES
(1, 'lesapso'),
(2, 'pug'),
(3, 'poemarian');

-- Tried inserting same values again into breeds (failed because primary key 'sno' is duplicated)
INSERT INTO breeds VALUES
(1, 'lesapso'),
(2, 'pug'),
(3, 'poemarian');
-- This will cause:
-- ERROR 1062: Duplicate entry '1' for key 'breeds.PRIMARY'
