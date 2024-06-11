use littlelemondb;

-- ============================================================================
-- Exercise: Create SQL queries to check available bookings based on user input

-- Task 1
-- Populate Bookings table
# Since my model connects Orders table and Customers table via Bookings table, 
# the data for Bookings table has already been populated. I will be using this 
# data for the upcoming task. 
INSERT INTO Bookings (BookingID, TableNumber, CustomerID, Date, StaffID)
VALUES
(1, 12, 1,'2024-06-02',1),
(2, 12, 2, '2024-06-03', 1),
(3, 19, 5, '2024-06-02', 3),
(4, 15, 3, '2024-06-04', 4),
(5, 5, 2, '2024-06-03', 2),
(6, 8, 1, '2024-06-04', 5),
(7, 3, 6, '2024-06-02', 5), 
(8, 11, 4, '2024-06-04', 6);

SELECT * FROM Bookings;


-- Task 2
-- Create Procedure CheckBooking
DELIMITER //
CREATE PROCEDURE CheckBooking(IN input_date DATE, IN input_tableno INT)
BEGIN
	DECLARE table_count INT;
	SELECT COUNT(*) INTO table_count FROM Bookings WHERE Date = input_date AND TableNumber = input_tableno;

	IF table_count > 0
	THEN
		SELECT CONCAT('Table ', input_tableno , ' is already booked') AS 'Booking Status';
	ELSE
		SELECT CONCAT('Table ', input_tableno , ' is available') AS 'Booking Status';
	END IF;
END//
DELIMITER ;

CALL CheckBooking('2024-06-02', 12);


-- Task 3
-- Create Procedure AddValidBooking with Transactions
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN input_date DATE, IN input_tableno INT, IN input_customer_id INT, IN input_staff_id INT)
BEGIN
	DECLARE table_count INT;
	START TRANSACTION; 
    
    SELECT COUNT(*) INTO table_count FROM Bookings WHERE Date = input_date AND TableNumber = input_tableno;
    
    IF table_count > 0
	THEN
		ROLLBACK;
		SELECT CONCAT('Table ', input_tableno , ' is already booked - booking cancelled') AS 'Booking Status';
	ELSE
		INSERT INTO Bookings (TableNumber, CustomerID, Date, StaffID)
		VALUES (input_tableno, input_customer_id, input_date, input_staff_id);
        
        COMMIT;
		SELECT CONCAT('Table ', input_tableno , ' is available - booking successful') AS 'Booking Status';
	END IF;
END//
DELIMITER ;

CALL AddValidBooking('2024-06-03', 10, 5, 3);
-- ============================================================================

-- ============================================================================
-- Exercise: Create SQL queries to add and update bookings

-- Task 1
-- Create Procedure AddBooking
DELIMITER //
CREATE PROCEDURE AddBooking(IN input_booking_id INT, IN input_date DATE, IN input_tableno INT, IN input_customer_id INT, IN input_staff_id INT)
BEGIN
	INSERT INTO Bookings (BookingID, TableNumber, CustomerID, Date, StaffID)
	VALUES (input_booking_id, input_tableno, input_customer_id, input_date, input_staff_id);
    
    SELECT 'New booking added' AS 'Confirmation';
END//
DELIMITER ;

CALL AddBooking(10, '2024-06-05', 6, 3, 4);


-- Task 2
-- Create procedure UpdateBooking
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN input_booking_id INT, IN input_date DATE)
BEGIN
	UPDATE Bookings
    SET Date = input_date
    WHERE BookingID = input_booking_id;
    
    SELECT CONCAT('Booking ', input_booking_id, ' updated') AS 'Confirmation';
END //
DELIMITER ;

CALL UpdateBooking(10, '2024-06-06');


-- Task 3
-- Create procedure CancelBooking
DELIMITER //
CREATE PROCEDURE CancelBooking(IN input_booking_id INT)
BEGIN 
	DELETE FROM Bookings
    WHERE BookingID = input_booking_id;
    
    SELECT CONCAT('Booking ', input_booking_id, ' cancelled') AS 'Confirmation';
END //
DELIMITER ;

CALL CancelBooking(10);
-- ============================================================================