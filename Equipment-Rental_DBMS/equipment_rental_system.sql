Create Database DBMS;
use DBMS;



CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    rental_price_per_day DECIMAL(10,2),
    available_quantity INT
);

CREATE TABLE Rental (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Rental_Detail (
    rental_id INT,
    equipment_id INT,
    quantity INT,
    PRIMARY KEY (rental_id, equipment_id),
    FOREIGN KEY (rental_id) REFERENCES Rental(rental_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    rental_id INT UNIQUE,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (rental_id) REFERENCES Rental(rental_id)
);



-- Customers
INSERT INTO Customer VALUES
(1, 'Amit Sharma', '9800000001', 'amit@gmail.com'),
(2, 'Sita Rai', '9800000002', 'sita@gmail.com'),
(3, 'Ramesh Thapa', '9800000003', 'ramesh@gmail.com'),
(4, 'Nisha Karki', '9800000004', 'nisha@gmail.com'),
(5, 'Bikash Gurung', '9800000005', 'bikash@gmail.com');

-- Equipment
INSERT INTO Equipment VALUES
(1, 'Canon DSLR Camera', 'Camera', 1500.00, 5),
(2, 'Projector Epson X200', 'Projector', 2000.00, 3),
(3, 'Dell Laptop i7', 'Laptop', 2500.00, 4),
(4, 'Sound System JBL', 'Audio', 1800.00, 2),
(5, 'GoPro Hero 10', 'Camera', 1200.00, 6);

-- Rentals
INSERT INTO Rental VALUES
(101, 1, '2026-02-01', '2026-02-05'),
(102, 2, '2026-02-02', '2026-02-06'),
(103, 1, '2026-02-10', '2026-02-12'),
(104, 3, '2026-02-11', '2026-02-15'),
(105, 4, '2026-02-15', '2026-02-18');

-- Rental Details
INSERT INTO Rental_Detail VALUES
(101, 1, 1),
(101, 2, 1),
(102, 3, 1),
(103, 5, 2),
(104, 4, 1),
(105, 1, 1);

-- Payments
INSERT INTO Payment VALUES
(1, 101, 7000.00, '2026-02-05', 'Paid'),
(2, 102, 10000.00, '2026-02-06', 'Paid'),
(3, 103, 3600.00, '2026-02-12', 'Pending'),
(4, 104, 7200.00, '2026-02-15', 'Paid'),
(5, 105, 4500.00, '2026-02-18', 'Paid');



SELECT c.name, r.rental_id, r.rental_date
FROM Customer c
INNER JOIN Rental r
ON c.customer_id = r.customer_id;



SELECT e.name
FROM Equipment e
LEFT JOIN Rental_Detail rd
ON e.equipment_id = rd.equipment_id
WHERE rd.equipment_id IS NULL;



SELECT customer_id, COUNT(rental_id) AS total_rentals
FROM Rental
GROUP BY customer_id;



SELECT SUM(amount) AS total_revenue
FROM Payment;



SELECT name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Rental
    GROUP BY customer_id
    HAVING COUNT(rental_id) > 1
);



CREATE VIEW Active_Rentals AS
SELECT r.rental_id, c.name, r.return_date
FROM Rental r
JOIN Customer c
ON r.customer_id = c.customer_id
WHERE r.return_date >= CURDATE();

-- To check view
SELECT * FROM Active_Rentals;



START TRANSACTION;

INSERT INTO Rental VALUES (106, 5, '2026-02-20', '2026-02-22');

UPDATE Equipment
SET available_quantity = available_quantity - 1
WHERE equipment_id = 3;


COMMIT;