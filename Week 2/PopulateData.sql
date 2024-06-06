use littlelemondb;

INSERT INTO MenuItems (ItemID, Name, Type, Price)
VALUES
(1, 'Olives','Starters',5),
(2, 'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);


INSERT INTO Menus (MenuID,ItemID,Cuisine)
VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');


INSERT INTO CustomerDetails (CustomerID, Name, ContactNumber, Email)
VALUES
(1, 'Marcos Romero', 354789612, 'marcos@mail.com'), 
(2, 'Vanessa McCarthy', 958741235, 'vanessa@mail.com'), 
(3, 'Takashi Ito', 902178562, 'takashi@mail.com'), 
(4, 'Jane Murphy', 851203474, 'jane@mail.com'), 
(5, 'Laurina Delgado', 656104783, 'laurina@mail.com'), 
(6, 'Benjamin Clauss', 686697402, 'benjamin@mail.com');


INSERT INTO StaffInformation (StaffID, Name, Role, Address, ContactNumber, Email, Salary)
VALUES
(1,'Mario Gollini','Manager','724, Parsley Lane, Old Town, Chicago, IL',351258074,'Mario.g@littlelemon.com', 70000),
(2,'Adrian Gollini','Assistant Manager','334, Dill Square, Lincoln Park, Chicago, IL',351474048,'Adrian.g@littlelemon.com', 65000),
(3,'Giorgos Dioudis','Head Chef','879 Sage Street, West Loop, Chicago, IL',351970582,'Giorgos.d@littlelemon.com', 50000),
(4,'Fatma Kaya','Assistant Chef','132  Bay Lane, Chicago, IL',351963569,'Fatma.k@littlelemon.com', 45000),
(5,'Elena Salvai','Head Waiter','989 Thyme Square, EdgeWater, Chicago, IL',351074198,'Elena.s@littlelemon.com', 40000),
(6,'John Millar','Receptionist','245 Dill Square, Lincoln Park, Chicago, IL',351584508,'John.m@littlelemon.com', 35000);


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


INSERT INTO Orders (OrderID, TableNo, MenuIemID, BookingID, Quantity, TotalCost)
VALUES
(1, 12, 7, 1, 2, 86),
(2, 19, 17, 2, 1, 37),
(3, 15, 9, 3, 1, 37),
(4, 5, 16, 4, 1, 40),
(5, 8, 5, 5, 1, 43), 
(6, 12, 17, 2, 4, 125), 
(7, 11, 9, 8, 3, 97);


INSERT INTO OrderDeliveryStatus (DeliveryID, OrderID, Date, Status) 
VALUES
(1, 1, '2024-06-02', 'Preparing'),
(2, 2, '2024-06-03', 'Delivered'),
(3, 3, '2024-06-02', 'Perparing'),
(4, 4, '2024-06-04', 'Out for delivery'),
(5, 5, '2024-06-03', 'Delivered'), 
(6, 6, '2024-06-03', 'Out for delivery'), 
(7, 7, '2024-06-04', 'Preparing');