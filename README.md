Equipment Rental Management System (DBMS Project)

📌 Project Overview
The Equipment Rental Management System is a relational database application developed as part of the DBMS Practical Internal Evaluation. 
It is designed to manage the inventory, customer rentals, and payment processing for an equipment-based business (eg, cameras, laptops, projectors).

🚀 Features
Customer Management: Stores and manages client contact information.
Inventory Tracking: Real-time tracking of available equipment quantities.
Rental Logging: Records pick-up and return dates for every transaction.
Payment Processing: Tracks billing status (Paid/Pending) for all rentals.
Concurrency Control  Uses SQL Transactions to ensure inventory is updated accurately during a rental.

📊 Database Design
The system consists of 5 entities, fulfilling the maximum requirement for the project.
Entities & Relationships:
Customer: One-to-Many (1:N) relationship with Rentals.
Equipment: Many-to-Many (M:N) relationship with Rentals via Rental_Detail.
Rental: The core entity linking customers and equipment.
Rental_Detail: Junction table for managing multiple items per rental.
Payment: One-to-One (1:1) relationship with Rentals to ensure unique billing.

🛠️ SQL Implementation
The project demonstrates the following mandatory SQL features:
DDL: CREATE TABLEwith Primary Key (PK) and Foreign Key (FK) constraints.
DML: INSERTstatements with 5 sample records per table.
Joins: INNER JOIN for rental history and LEFT JOINfor inventory auditing.
Aggregates: COUNT with GROUP BY and SUM for revenue analysis.
Advanced Features: One Sub-query, one View ( Active_Rentals), and a Transaction with COMMIT.

📂 File Structure

Equipment-Rental-DBMS/
│
├── equipment_rental_system.sql   # Complete SQL Script
├── ER_Diagram.png                # Database Design Diagram
├── Project_Report.pdf            # Formal Documentation

⚙️ How to Run
Clone the repository or download the files.
Open your preferred SQL Workbench (MySQL, PostgreSQL, etc.).
Execute the equipment_rental_system.sqlscript to create the database and tables.
Run the sample queries provided at the bottom of the SQL file to verify the results.
