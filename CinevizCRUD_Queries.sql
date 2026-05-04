-- =============================
-- Table for CLIENT
-- =============================
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) CHECK (Phone LIKE '03%')
);

INSERT INTO Client VALUES
(1, 'Ali Raza', 'ali.raza@example.com', '03001234567'),
(2, 'Fatima Khan', 'fatima.khan@example.com', '03012345678'),
(3, 'Ahmed Farooq', 'ahmed.farooq@example.com', '03111234567'),
(4, 'Ayesha Iqbal', 'ayesha.iqbal@example.com', '03219876543'),
(5, 'Usman Tariq', 'usman.tariq@example.com', '03421234567'),
(6, 'Sana Mir', 'sana.mir@example.com', '03123456789'),
(7, 'Zain Ahmed', 'zain.ahmed@example.com', '03334567890'),
(8, 'Talha Saeed', 'talha.saeed@example.com', '03439876543'),
(9, 'Nida Hassan', 'nida.hassan@example.com', '03331234567'),
(10, 'Bilal Zafar', 'bilal.zafar@example.com', '03011234567');

-- =============================
-- Table for SERVICE
-- =============================
CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(255),
    Price INT CHECK (Price >= 1000)
);

INSERT INTO Service VALUES
(1, 'Photography', 'Professional wedding and event photography', 15000),
(2, 'Videography', 'HD/4K event videography coverage', 20000),
(3, 'Live Streaming', 'Live stream with multi-camera setup', 25000),
(4, 'OB Setup', 'Outdoor broadcast setup with technical support', 35000),
(5, 'Technical Support', 'On-site technical support for AV equipment', 10000),
(6, 'Drone Coverage', 'Aerial footage with drone', 18000),
(7, 'Editing Services', 'Post-event video/photo editing', 12000),
(8, 'Lighting Setup', 'Professional lighting arrangement', 8000),
(9, 'Stage Setup', 'Customized stage for events', 22000),
(10, 'Sound System', 'Professional sound and mic system', 14000);

-- =============================
-- Table for LOCATION
-- =============================
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100) CHECK (City IN ('Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Multan', 'Faisalabad', 'Peshawar', 'Quetta'))
);

INSERT INTO Location VALUES
(1, '123 Clifton Block 5', 'Karachi'),
(2, '12 Ghalib Street', 'Lahore'),
(3, 'Sector G-11', 'Islamabad'),
(4, 'Mall Road', 'Rawalpindi'),
(5, 'Model Town', 'Lahore'),
(6, 'Shahrah-e-Faisal', 'Karachi'),
(7, 'Karkhano Market', 'Peshawar'),
(8, 'Satellite Town', 'Quetta'),
(9, 'New Multan Colony', 'Multan'),
(10, 'People''s Colony', 'Faisalabad');

-- =============================
-- Table for STAFF
-- =============================
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Phone VARCHAR(20) CHECK (Phone LIKE '03%')
);

INSERT INTO Staff VALUES
(1, 'Tariq Mehmood', 'Photographer', '03005551234'),
(2, 'Adeel Akram', 'Videographer', '03112223344'),
(3, 'Hina Aslam', 'Technician', '03214445566'),
(4, 'Saad Javed', 'Editor', '03316667788'),
(5, 'Rabia Naveed', 'Drone Operator', '03419998877'),
(6, 'Imran Bashir', 'Sound Engineer', '03014442211'),
(7, 'Kiran Malik', 'Lighting Expert', '03443332211'),
(8, 'Shahid Iqbal', 'Camera Assistant', '03118886655'),
(9, 'Asma Noreen', 'Makeup Artist', '03219997755'),
(10, 'Noman Zafar', 'Stage Coordinator', '03317773322');

-- =============================
-- Table for EVENT
-- =============================
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    LocationID INT FOREIGN KEY REFERENCES Location(LocationID),
    ClientID INT FOREIGN KEY REFERENCES Client(ClientID)
);

INSERT INTO Event VALUES

(1, 'Wedding Ceremony', '2024-07-15', 1, 1),
(2, 'Corporate Seminar', '2024-08-10', 2, 2),
(3, 'Live Concert', '2024-09-05', 3, 3),
(4, 'Product Launch', '2024-06-20', 4, 4),
(5, 'Photography Expo', '2024-07-01', 5, 5),
(6, 'Drone Showcase', '2024-10-10', 6, 6),
(7, 'Film Screening', '2024-11-12', 7, 7),
(8, 'Wedding Reception', '2024-12-25', 8, 8),
(9, 'Sports Meet', '2024-06-15', 9, 9),
(10, 'Cultural Night', '2024-07-20', 10, 10);
SELECT EventID FROM Event WHERE EventID BETWEEN 1 AND 10;
-- =============================
-- Table for BOOKING
-- =============================
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    ServiceID INT FOREIGN KEY REFERENCES Service(ServiceID),
    ClientID INT FOREIGN KEY REFERENCES Client(ClientID),
    BookingDate DATE
);

INSERT INTO Booking VALUES
(1, 1, 1, '2024-06-01'),
(2, 2, 2, '2024-06-02'),
(3, 3, 3, '2024-06-03'),
(4, 4, 4, '2024-06-04'),
(5, 5, 5, '2024-06-05'),
(6, 6, 6, '2024-06-06'),
(7, 7, 7, '2024-06-07'),
(8, 8, 8, '2024-06-08'),
(9, 9, 9, '2024-06-09'),
(10, 10, 10, '2024-06-10');

-- =============================
-- Table for EQUIPMENT
-- =============================
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Quantity INT CHECK (Quantity > 0),
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Rented', 'Sold'))
);

INSERT INTO Equipment VALUES
(1, 'Canon DSLR', 5, 'Available'),
(2, 'Sony Camcorder', 3, 'Rented'),
(3, 'LED Light', 10, 'Available'),
(4, 'Tripod', 15, 'Available'),
(5, 'Wireless Mic', 7, 'Available'),
(6, 'Switcher', 4, 'Rented'),
(7, 'Laptop', 6, 'Available'),
(8, 'PA System', 2, 'Available'),
(9, 'Gimbal', 3, 'Available'),
(10, 'GoPro', 5, 'Sold');

-- =============================
-- Table for RENTAL
-- =============================
CREATE TABLE Rental (
    RentalID INT PRIMARY KEY,
    EquipmentID INT FOREIGN KEY REFERENCES Equipment(EquipmentID),
    ClientID INT FOREIGN KEY REFERENCES Client(ClientID),
    RentDate DATE,
    ReturnDate DATE,
    Status VARCHAR(20) CHECK (Status IN ('Ongoing', 'Returned'))
);

INSERT INTO Rental VALUES
(1, 1, 1, '2024-06-01', '2024-06-05', 'Returned'),
(2, 2, 2, '2024-06-02', '2024-06-07', 'Returned'),
(3, 3, 3, '2024-06-03', NULL, 'Ongoing'),
(4, 4, 4, '2024-06-04', NULL, 'Ongoing'),
(5, 5, 5, '2024-06-05', '2024-06-06', 'Returned'),
(6, 6, 6, '2024-06-06', NULL, 'Ongoing'),
(7, 7, 7, '2024-06-07', '2024-06-10', 'Returned'),
(8, 8, 8, '2024-06-08', NULL, 'Ongoing'),
(9, 9, 9, '2024-06-09', '2024-06-12', 'Returned'),
(10, 10, 10, '2024-06-10', NULL, 'Ongoing');

-- =============================
-- Table for SALE
-- =============================
CREATE TABLE Sale (
    SaleID INT PRIMARY KEY,
    EquipmentID INT FOREIGN KEY REFERENCES Equipment(EquipmentID),
    ClientID INT FOREIGN KEY REFERENCES Client(ClientID),
    SaleDate DATE,
    Amount INT CHECK (Amount > 0)
);

INSERT INTO Sale VALUES
(1, 10, 1, '2024-05-01', 30000),
(2, 2, 2, '2024-05-02', 50000),
(3, 4, 3, '2024-05-03', 15000),
(4, 5, 4, '2024-05-04', 20000),
(5, 6, 5, '2024-05-05', 25000),
(6, 9, 6, '2024-05-06', 18000),
(7, 3, 7, '2024-05-07', 10000),
(8, 7, 8, '2024-05-08', 45000),
(9, 1, 9, '2024-05-09', 55000),
(10, 8, 10, '2024-05-10', 60000);

-- =============================
-- Table for PURCHASE
-- =============================
CREATE TABLE Purchase (
    PurchaseID INT PRIMARY KEY,
    EquipmentID INT FOREIGN KEY REFERENCES Equipment(EquipmentID),
    SupplierName VARCHAR(100),
    PurchaseDate DATE,
    Amount INT CHECK (Amount > 0)
);

INSERT INTO Purchase VALUES
(1, 1, 'Vision Traders', '2024-01-01', 40000),
(2, 2, 'PakTech Supplies', '2024-01-05', 60000),
(3, 3, 'AV Store', '2024-01-10', 12000),
(4, 4, 'Event Gear', '2024-01-15', 8000),
(5, 5, 'SoundCity', '2024-01-20', 15000),
(6, 6, 'Streamline Co.', '2024-01-25', 35000),
(7, 7, 'TechWorld', '2024-02-01', 45000),
(8, 8, 'Audio Vision', '2024-02-05', 70000),
(9, 9, 'Gadget Mart', '2024-02-10', 22000),
(10, 10, 'GoCam Pvt Ltd', '2024-02-15', 28000);

-- =============================
-- Table for PAYMENT
-- =============================
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    ClientID INT FOREIGN KEY REFERENCES Client(ClientID),
    Amount INT CHECK (Amount > 0),
    PaymentDate DATE,
    Method VARCHAR(20) CHECK (Method IN ('Cash', 'Card', 'Online'))
);

INSERT INTO Payment VALUES
(1, 1, 20000, '2024-06-01', 'Card'),
(2, 2, 30000, '2024-06-02', 'Cash'),
(3, 3, 15000, '2024-06-03', 'Online'),
(4, 4, 40000, '2024-06-04', 'Card'),
(5, 5, 10000, '2024-06-05', 'Cash'),
(6, 6, 18000, '2024-06-06', 'Online'),
(7, 7, 22000, '2024-06-07', 'Card'),
(8, 8, 14000, '2024-06-08', 'Online'),
(9, 9, 17000, '2024-06-09', 'Cash'),
(10, 10, 16000, '2024-06-10', 'Card');

-- =============================
-- Table for OB_SETUP
-- =============================
CREATE TABLE OB_Setup (
    OBID INT PRIMARY KEY,
    EventID INT FOREIGN KEY REFERENCES Event(EventID),
    StaffID INT FOREIGN KEY REFERENCES Staff(StaffID),
    SetupDate DATE,
    Notes VARCHAR(255)
);

INSERT INTO OB_Setup VALUES
(1, 1, 1, '2024-06-01', 'Camera setup with switcher'),
(2, 2, 2, '2024-06-02', 'Multi-cam live feed arrangement'),
(3, 3, 3, '2024-06-03', 'Sound system included'),
(4, 4, 4, '2024-06-04', 'Stage and lighting configured'),
(5, 5, 5, '2024-06-05', 'Drone setup with high angle view'),
(6, 6, 6, '2024-06-06', 'AV and projector arrangement'),
(7, 7, 7, '2024-06-07', 'LED walls connected'),
(8, 8, 8, '2024-06-08', 'Wireless transmission tested'),
(9, 9, 9, '2024-06-09', 'Gimbal camera support'),
(10, 10, 10, '2024-06-10', 'Full OB with generator and booth');

DROP TABLE OB_Setup, Payment, Purchase, Sale, Rental, Equipment, Booking, Event, Staff, Location, Service, Client;

-- =============================
-- CRUD for CLIENT
-- =============================
-- Create
INSERT INTO Client (ClientID, Name, Email, Phone)
VALUES (11, 'Tariq Mehmood', 'tariq@example.com', '03019998888');

-- Read
SELECT * FROM Client;
SELECT * FROM Client WHERE ClientID = 1;

-- Update
UPDATE Client SET Phone = '03007776666' WHERE ClientID = 11;

-- Delete
DELETE FROM Client WHERE ClientID = 11;

-- =============================
-- CRUD for SERVICE
-- =============================
INSERT INTO Service (ServiceID, Name, Description, Price)
VALUES (11, '360 Coverage', 'Panoramic event coverage', 20000);

SELECT * FROM Service;
SELECT * FROM Service WHERE ServiceID = 1;

UPDATE Service SET Price = 18000 WHERE ServiceID = 11;

DELETE FROM Service WHERE ServiceID = 11;

-- =============================
-- CRUD for LOCATION
-- =============================
INSERT INTO Location (LocationID, Address, City)
VALUES (11, 'Main Boulevard', 'Lahore');

SELECT * FROM Location;
SELECT * FROM Location WHERE LocationID = 1;

UPDATE Location SET Address = 'New Boulevard' WHERE LocationID = 11;

DELETE FROM Location WHERE LocationID = 11;

-- =============================
-- CRUD for STAFF
-- =============================
INSERT INTO Staff (StaffID, Name, Role, Phone)
VALUES (11, 'Hassan Ali', 'Photographer', '03001112222');

SELECT * FROM Staff;
SELECT * FROM Staff WHERE StaffID = 1;

UPDATE Staff SET Role = 'Senior Photographer' WHERE StaffID = 11;

DELETE FROM Staff WHERE StaffID = 11;

-- =============================
-- CRUD for EVENT
-- =============================
INSERT INTO Event (EventID, Name, Date, LocationID, ClientID)
VALUES (11, 'Fashion Show', '2024-12-01', 1, 2);

SELECT * FROM Event;
SELECT * FROM Event WHERE EventID = 1;

UPDATE Event SET Name = 'Mega Fashion Show' WHERE EventID = 11;

DELETE FROM Event WHERE EventID = 11;

-- =============================
-- CRUD for BOOKING
-- =============================
INSERT INTO Booking (BookingID, ServiceID, ClientID, BookingDate)
VALUES (11, 1, 2, '2024-06-15');

SELECT * FROM Booking;
SELECT * FROM Booking WHERE BookingID = 1;

UPDATE Booking SET BookingDate = '2024-06-20' WHERE BookingID = 11;

DELETE FROM Booking WHERE BookingID = 11;

-- =============================
-- CRUD for EQUIPMENT
-- =============================
INSERT INTO Equipment (EquipmentID, Name, Quantity, Status)
VALUES (11, 'Stage Lights', 4, 'Available');

SELECT * FROM Equipment;
SELECT * FROM Equipment WHERE EquipmentID = 1;

UPDATE Equipment SET Status = 'Rented' WHERE EquipmentID = 11;

DELETE FROM Equipment WHERE EquipmentID = 11;

-- =============================
-- CRUD for RENTAL
-- =============================
INSERT INTO Rental (RentalID, EquipmentID, ClientID, RentDate, ReturnDate, Status)
VALUES (11, 1, 2, '2024-06-11', NULL, 'Ongoing');

SELECT * FROM Rental;
SELECT * FROM Rental WHERE RentalID = 1;

UPDATE Rental SET ReturnDate = '2024-06-15', Status = 'Returned' WHERE RentalID = 11;

DELETE FROM Rental WHERE RentalID = 11;

-- =============================
-- CRUD for SALE
-- =============================
INSERT INTO Sale (SaleID, EquipmentID, ClientID, SaleDate, Amount)
VALUES (11, 1, 2, '2024-06-12', 35000);

SELECT * FROM Sale;
SELECT * FROM Sale WHERE SaleID = 1;

UPDATE Sale SET Amount = 37000 WHERE SaleID = 11;

DELETE FROM Sale WHERE SaleID = 11;

-- =============================
-- CRUD for PURCHASE
-- =============================
INSERT INTO Purchase (PurchaseID, EquipmentID, SupplierName, PurchaseDate, Amount)
VALUES (11, 1, 'New Supplier Co.', '2024-06-13', 30000);

SELECT * FROM Purchase;
SELECT * FROM Purchase WHERE PurchaseID = 1;

UPDATE Purchase SET Amount = 32000 WHERE PurchaseID = 11;

DELETE FROM Purchase WHERE PurchaseID = 11;

-- =============================
-- CRUD for PAYMENT
-- =============================
INSERT INTO Payment (PaymentID, ClientID, Amount, PaymentDate, Method)
VALUES (11, 2, 25000, '2024-06-14', 'Cash');

SELECT * FROM Payment;
SELECT * FROM Payment WHERE PaymentID = 1;

UPDATE Payment SET Method = 'Card' WHERE PaymentID = 11;

DELETE FROM Payment WHERE PaymentID = 11;

-- =============================
-- CRUD for OB_SETUP
-- =============================
INSERT INTO OB_Setup (OBID, EventID, StaffID, SetupDate, Notes)
VALUES (11, 1, 2, '2024-06-15', 'Test OB setup for new cam');

SELECT * FROM OB_Setup;
SELECT * FROM OB_Setup WHERE OBID = 1;

UPDATE OB_Setup SET Notes = 'Updated setup instructions' WHERE OBID = 11;

DELETE FROM OB_Setup WHERE OBID = 11;

