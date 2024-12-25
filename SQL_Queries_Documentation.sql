-- **INSERT QUERIES**
-- QUR_001: Insert a new user into the Users table
INSERT INTO Users (FullName, Email, Password, Role, PhoneNumber, DateCreated) 
VALUES ('John Doe', 'john.doe@example.com', 'encryptedpassword123', 'Customer', '123-456-7890', NOW());

-- QUR_002: Insert a new product into the Products table
INSERT INTO Products (Name, Description, Price, CategoryID, ImageURL, SKU, DateAdded, ActiveStatus) 
VALUES ('T-Shirt', 'Cotton T-shirt, white color', 19.99, 1, 'http://example.com/tshirt.jpg', 'SKU12345', NOW(), 'Active');

-- QUR_003: Insert a new order into the Orders table
INSERT INTO Orders (UserID, OrderDate, TotalAmount, Status, PaymentID) 
VALUES (1, NOW(), 59.97, 'Pending', 1);

-- **UPDATE QUERIES**
-- QUR_004: Update a product price
UPDATE Products 
SET Price = 17.99 
WHERE ProductID = 1;

-- QUR_005: Update order status to Shipped
UPDATE Orders 
SET Status = 'Shipped' 
WHERE OrderID = 1;

-- **DELETE QUERIES**
-- QUR_006: Delete a user by email
DELETE FROM Users 
WHERE Email = 'john.doe@example.com';

-- QUR_007: Delete all discontinued products
DELETE FROM Products 
WHERE ActiveStatus = 'Discontinued';

-- **SELECT QUERIES**
-- QUR_008: Retrieve all orders for a specific user using JOIN
SELECT O.OrderID, O.OrderDate, O.TotalAmount, P.Name AS ProductName, OI.Quantity
FROM Orders O
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
WHERE O.UserID = 1;

-- QUR_009: Retrieve the top 3 most expensive products
SELECT Name, Price 
FROM Products
ORDER BY Price DESC
LIMIT 3;

-- QUR_010: Count the total number of orders by status
SELECT Status, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Status;

-- QUR_011: Subquery to find all products that belong to categories with "Clothing" in the name
SELECT P.Name
FROM Products P
WHERE P.CategoryID IN (
    SELECT CategoryID
    FROM Categories
    WHERE CategoryName LIKE '%Clothing%'
);

-- QUR_012: Aggregate query to calculate the total revenue
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

-- **REQUIREMENT-QUERY MATRIX**
-- | Requirement         | Query ID(s)          |
-- |---------------------|----------------------|
-- | Insert Data         | QUR_001, QUR_002, QUR_003 |
-- | Update Data         | QUR_004, QUR_005    |
-- | Delete Data         | QUR_006, QUR_007    |
-- | Select Queries      | QUR_008, QUR_009, QUR_010, QUR_011, QUR_012 |
