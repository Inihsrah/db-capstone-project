show databases;

use littlelemondb;

-- ===================================================
-- Exercise: Create a virtual table to summarize data

-- Task 1
-- Create Virtual Table 
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;


-- Task 2
-- Using JOIN Clause
SELECT CustomerDetails.CustomerID, CustomerDetails.Name AS FullName, Orders.OrderID, Orders.TotalCost, MenuItems.Name, MenuItems.Type AS CourseName
FROM CustomerDetails 
	INNER JOIN Bookings ON CustomerDetails.CustomerID = Bookings.CustomerID -- in my model, customers table is linked to orders table via the bookings table 
    INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID 
    INNER JOIN MenuItems ON Orders.MenuItemID = MenuItems.ItemID
    INNER JOIN Menus ON MenuItems.ItemID = Menus.ItemID
ORDER BY TotalCost;
    
-- Task 3
-- SUBQUERY
SELECT Name
FROM MenuItems
WHERE MenuItems.ItemID = ANY (
	SELECT MenuItemID
    FROM Orders
    GROUP BY MenuItemID
    HAVING SUM(Quantity) > 2
);
-- ===================================================

-- ===================================================
-- Exercise: Create optimized queries to manage and analyze data

-- Task1
-- Create Procedure GetMaxQuantity
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS 'Maximum Ordered Quantity' FROM Orders;
END//
DELIMITER ;

CALL GetMaxQuantity();

-- Create prepared statement GetOrderDetail
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost AS Cost
FROM Orders 
	INNER JOIN Bookings ON Orders.BookingID = Bookings.BookingID
WHERE CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3
-- Create procedure CancelOrder
DELIMITER //
CREATE PROCEDURE CancelOrder(IN InputOrderID INT)
BEGIN
	DECLARE ValidOrderID INT;
    DECLARE ValidStatus INT;
    SELECT COUNT(*) INTO ValidOrderID FROM Orders WHERE OrderID = InputOrderID;
    
    IF ValidOrderID = 1
    THEN
		DELETE FROM Orders WHERE OrderID = InputOrderID;
		SELECT CONCAT('Order ', InputOrderID, ' is cancelled') AS Confirmation;
	ELSE
		SELECT CONCAT('Order ', InputOrderID, ' does not exist') AS Confirmation;
	END IF;
END//
DELIMITER ;

CALL CancelOrder(4);
-- ===================================================

