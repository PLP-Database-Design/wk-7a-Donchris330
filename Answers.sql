question 1

-- First, assume this is the initial raw data (for example only):
-- CREATE TABLE ProductDetail (OrderID INT, CustomerName VARCHAR(255), Products VARCHAR(255));

-- To achieve 1NF, we must split the Products column using a helper query or a series of inserts:

-- Option 1: Manually inserting rows in 1NF form
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
  (101, 'John Doe', 'Laptop'),
  (101, 'John Doe', 'Mouse'),
  (102, 'Jane Smith', 'Tablet'),
  (102, 'Jane Smith', 'Keyboard'),
  (102, 'Jane Smith', 'Mouse'),
  (103, 'Emily Clark', 'Phone');

-- This assumes you've created a new table like:
-- CREATE TABLE ProductDetail_1NF (OrderID INT, CustomerName VARCHAR(255), Product VARCHAR(255));

question 2, step 1

-- Contains OrderID and CustomerName only
CREATE TABLE CustomerOrders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

-- Insert distinct order info
INSERT INTO CustomerOrders (OrderID, CustomerName)
VALUES 
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

step 2

-- Contains details for each product ordered
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES CustomerOrders(OrderID)
);

-- Insert the normalized product-level data
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);
