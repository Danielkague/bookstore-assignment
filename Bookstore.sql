-- CREATES CATEGORY TABLE

CREATE TABLE CATEGORY (
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(100) NOT NULL,
description TEXT
);

-- CREATES AUTHORS TABLE

CREATE TABLE AUTHORS (
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(100) NOT NULL,
biography TEXT
);

-- CREATES BOOKS TABLE

CREATE TABLE BOOKS (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(300) NOT NULL,
publication_date DATE,
price DECIMAL(10, 2) NOT NULL,
publisher VARCHAR(100),
category_id INT,
FOREIGN KEY (category_id)REFERENCES CATEGORY(category_id)
);

-- CREATES BOOK_AUTHOR TABLE AS THE JUNCTION TABLE FOR MANY TO MANY RELATIONSHIP BETWEEN BOOKS AND AUTHORS

CREATE TABLE BOOK_AUTHOR (
book_id INT,
author_id INT,
PRIMARY KEY (book_id, author_id),
FOREIGN KEY (book_id)REFERENCES BOOKS(book_id) ON DELETE CASCADE,
FOREIGN KEY (author_id)REFERENCES AUTHORS(author_id) ON DELETE CASCADE
);

-- CREATES INVENTORY TABLE

CREATE TABLE INVENTORY (
inventory_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT NOT NULL,
quantity_in_stock INT NOT NULL DEFAULT 0,
shelf_location VARCHAR(100),
FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

-- CREATES CUSTOMERS TABLE

CREATE TABLE CUSTOMERS (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(50),
address TEXT
);

-- CREATES EMPLOYEES TABLE

CREATE TABLE EMPLOYEES (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
position VARCHAR(100) NOT NULL,
hire_date DATE NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(50)
);

-- CREATES ORDERS TABLE

CREATE TABLE ORDERS (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
employee_id INT NOT NULL,
order_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
order_status VARCHAR(100) NOT NULL DEFAULT 'pending',
total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id)
);

-- CREATES ORDERS_ITEMS TABLE AS THE JUNCTION TABLE FOR MANY TO MANY RELATIONSHIP BETWEEN ORDERS AND BOOKS

CREATE TABLE ORDERS_ITEMS (
order_id INT,
book_id INT,
quantity INT NOT NULL DEFAULT 1,
unit_price DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (order_id, book_id),
FOREIGN KEY (order_id) REFERENCES ORDERS(order_id) ON DELETE CASCADE,
FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

-- INSERTS SAMPLE DATA INTO CATEGORY TABLE

INSERT INTO CATEGORY (category_name, description) VALUES
('Fiction', 'Literary works based on imagination'),
('Science Fiction', 'Fiction based on scientific facts and future possibilities'),
('Mystery', 'Fiction that revolves around solving a crime or puzzle'),
('Non-Fiction', 'Literary works based on facts and real events'),
('Biography', 'Account of someone''s life written by someone else');

-- INSERTS SAMPLE DATA INTO BOOKS TABLE

INSERT INTO AUTHORS (author_name, biography) VALUES
('J.K. Rowling', 'British author best known for the Harry Potter series'),
('George Orwell', 'English novelist and essayist, journalist and critic'),
('Agatha Christie', 'English writer known for her detective novels'),
('Stephen King', 'American author of horror, supernatural fiction, suspense, crime, and fantasy novels'),
('Michelle Obama', 'American attorney and author who served as the First Lady of the United States');

-- INSERTS SAMPLE DATA INTO BOOK_AUTHOR TABLE

INSERT INTO BOOKS (title, publication_date, price, publisher, category_id) VALUES
('Harry Potter and the Philosopher''s Stone', '1997-06-26', 19.99, 'Bloomsbury', 1),
('1984', '1949-06-08', 14.99, 'Secker & Warburg', 2),
('Murder on the Orient Express', '1934-01-01', 12.99, 'Collins Crime Club', 3),
('The Shining', '1977-01-28', 16.99, 'Doubleday', 1),
('Becoming', '2018-11-13', 24.99, 'Crown Publishing', 5);

-- CONNECTS BOOKS WITH AUTHORS IN JUNCTION TABLE

INSERT INTO BOOK_AUTHOR (book_id, author_id) VALUES
(1, 1), -- Harry Potter by J.K. Rowling
(2, 2), -- 1984 by George Orwell
(3, 3), -- Murder on the Orient Express by Agatha Christie
(4, 4), -- The Shining by Stephen King
(5, 5); -- Becoming by Michelle Obama

-- INSERTS SAMPLE DATA INTO INVENTORY TABLE

INSERT INTO INVENTORY (book_id, quantity_in_stock, shelf_location) VALUES
(1, 25, 'A1-S3'),
(2, 15, 'B2-S1'),
(3, 10, 'C3-S2'),
(4, 20, 'A2-S4'),
(5, 30, 'D1-S5');

-- INSERTS SAMPLE DATE INTO CUSTOMERS TABLE

INSERT INTO CUSTOMERS (first_name, last_name, email, phone, address) VALUES
('John', 'Smith', 'john.smith@email.com', '555-123-4567', '123 Main St, Anytown, AN 12345'),
('Emma', 'Johnson', 'emma.johnson@email.com', '555-234-5678', '456 Oak Ave, Somewhere, SW 67890'),
('Michael', 'Williams', 'michael.williams@email.com', '555-345-6789', '789 Pine Rd, Nowhere, NW 10112'),
('Sophia', 'Brown', 'sophia.brown@email.com', '555-456-7890', '101 Elm Dr, Elsewhere, EL 31415'),
('William', 'Jones', 'william.jones@email.com', '555-567-8901', '202 Maple Ln, Anywhere, AW 16171');

-- INSERTS SAMPLE DATA INTO EMPLOYEES TABLE
-- NOTE: The hire_date is set to the current date by default.
-- The position is set to 'Sales Associate' by default for all employees.

INSERT INTO EMPLOYEES (first_name, last_name, position, hire_date, email, phone) VALUES
('Sarah', 'Davis', 'Manager', '2020-01-15', 'sarah.davis@bookstore.com', '555-987-6543'),
('David', 'Miller', 'Sales Associate', '2021-03-10', 'david.miller@bookstore.com', '555-876-5432'),
('Jennifer', 'Wilson', 'Cashier', '2022-05-20', 'jennifer.wilson@bookstore.com', '555-765-4321'),
('Robert', 'Moore', 'Book Specialist', '2020-11-05', 'robert.moore@bookstore.com', '555-654-3210'),
('Lisa', 'Taylor', 'Assistant Manager', '2021-07-22', 'lisa.taylor@bookstore.com', '555-543-2109');

-- INSERTS SAMPLE DATA INTO ORDERS TABLE
-- NOTE: The order_status is set to 'Pending' by default, and the total_amount is set to 0.00 by default.
-- The total_amount should be calculated based on the sum of (quantity * unit_price) from the orders_items table.

INSERT INTO ORDERS (customer_id, employee_id, order_date, order_status, total_amount) VALUES
(1, 2, '2023-01-10', 'Completed', 19.99),
(2, 3, '2023-01-15', 'Completed', 29.98),
(3, 1, '2023-01-20', 'Processing', 24.99),
(4, 4, '2023-01-25', 'Shipped', 46.97),
(5, 5, '2023-01-30', 'Pending', 16.99);

-- CONNECTS ORDERS WITH BOOKS IN JUNCTION TABLE
-- NOTE: The quantity and unit price are set in the junction table to allow for different prices for the same book in different orders.
-- The unit price should reflect the price at the time of the order.
-- The total amount in the orders table should be calculated based on the sum of (quantity * unit_price) from the orders_items table.

INSERT INTO ORDERS_ITEMS (order_id, book_id, quantity, unit_price) VALUES
(1, 1, 1, 19.99),
(2, 2, 1, 14.99),
(2, 3, 1, 14.99),
(3, 5, 1, 24.99),
(4, 1, 1, 19.99),
(4, 4, 1, 16.99),
(4, 3, 1, 9.99),
(5, 4, 1, 16.99);