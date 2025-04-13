CREATE TABLE book_language (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100) NOT NULL
);

CREATE TABLE publisher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE author (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (language_id) REFERENCES book_language(id)
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE country (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE address_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE customer_address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (status_id) REFERENCES address_status(id)
);

CREATE TABLE shipping_method (
    id INT PRIMARY KEY AUTO_INCREMENT,
    method VARCHAR(100) NOT NULL
);

CREATE TABLE order_status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(100) NOT NULL
);

CREATE TABLE cust_order (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    shipping_method_id INT,
    status_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id),
    FOREIGN KEY (status_id) REFERENCES order_status(id)
);

CREATE TABLE order_line (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);

CREATE TABLE order_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(id),
    FOREIGN KEY (status_id) REFERENCES order_status(id)
);

-- Insert sample data for book_language
INSERT INTO book_language (language_name) VALUES 
('English'),
('Spanish'),
('French'),
('German'),
('Mandarin'),
('Japanese'),
('Russian'),
('Italian');

-- Insert sample data for publisher
INSERT INTO publisher (name) VALUES 
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster'),
('Hachette Book Group'),
('Macmillan Publishers'),
('Oxford University Press'),
('Scholastic'),
('Wiley');

-- Insert sample data for author
INSERT INTO author (name) VALUES 
('J.K. Rowling'),
('Stephen King'),
('James Patterson'),
('Toni Morrison'),
('Neil Gaiman'),
('Michelle Obama'),
('Yuval Noah Harari'),
('Chimamanda Ngozi Adichie'),
('Malcolm Gladwell'),
('Ta-Nehisi Coates');

-- Insert sample data for book
INSERT INTO book (title, publisher_id, language_id) VALUES 
('Harry Potter and the Philosopher''s Stone', 1, 1),
('The Shining', 2, 1),
('Along Came a Spider', 3, 1),
('Beloved', 4, 1),
('American Gods', 5, 1),
('Becoming', 1, 1),
('Sapiens: A Brief History of Humankind', 2, 1),
('Americanah', 3, 1),
('Outliers', 4, 1),
('Between the World and Me', 5, 1),
('The Institute', 2, 1),
('Half of a Yellow Sun', 3, 1),
('Neverwhere', 5, 1),
('The Water Dancer', 1, 1),
('21 Lessons for the 21st Century', 2, 1);

-- Insert sample data for book_author
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1),  -- Harry Potter by J.K. Rowling
(2, 2),  -- The Shining by Stephen King
(3, 3),  -- Along Came a Spider by James Patterson
(4, 4),  -- Beloved by Toni Morrison
(5, 5),  -- American Gods by Neil Gaiman
(6, 6),  -- Becoming by Michelle Obama
(7, 7),  -- Sapiens by Yuval Noah Harari
(8, 8),  -- Americanah by Chimamanda Ngozi Adichie
(9, 9),  -- Outliers by Malcolm Gladwell
(10, 10), -- Between the World and Me by Ta-Nehisi Coates
(11, 2),  -- The Institute by Stephen King
(12, 8),  -- Half of a Yellow Sun by Chimamanda Ngozi Adichie
(13, 5),  -- Neverwhere by Neil Gaiman
(14, 10), -- The Water Dancer by Ta-Nehisi Coates
(15, 7);  -- 21 Lessons for the 21st Century by Yuval Noah Harari

-- Insert sample data for country
INSERT INTO country (name) VALUES 
('United States'),
('United Kingdom'),
('Canada'),
('Australia'),
('Germany'),
('France'),
('Japan'),
('India');

-- Insert sample data for address
INSERT INTO address (street, city, country_id) VALUES 
('123 Main St', 'New York', 1),
('456 High St', 'London', 2),
('789 Maple Ave', 'Toronto', 3),
('101 Ocean Dr', 'Sydney', 4),
('202 Pine Rd', 'Berlin', 5),
('303 Oak Blvd', 'Paris', 6),
('404 Cherry Ln', 'Tokyo', 7),
('505 Cedar Ct', 'Mumbai', 8),
('606 Elm St', 'Chicago', 1),
('707 Birch Rd', 'Manchester', 2),
('808 Spruce Ave', 'Vancouver', 3),
('909 Willow Dr', 'Melbourne', 4);

-- Insert sample data for address_status
INSERT INTO address_status (status) VALUES 
('Primary'),
('Billing'),
('Shipping'),
('Previous'),
('Inactive');

-- Insert sample data for customer
INSERT INTO customer (name, email) VALUES 
('John Smith', 'john.smith@example.com'),
('Emma Wilson', 'emma.wilson@example.com'),
('Michael Brown', 'michael.brown@example.com'),
('Sophia Garcia', 'sophia.garcia@example.com'),
('William Chen', 'william.chen@example.com'),
('Olivia Singh', 'olivia.singh@example.com'),
('James Kim', 'james.kim@example.com'),
('Ava Patel', 'ava.patel@example.com'),
('Robert Johnson', 'robert.johnson@example.com'),
('Isabella Martin', 'isabella.martin@example.com');

-- Insert sample data for customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES 
(1, 1, 1),  -- John Smith's primary address
(1, 9, 3),  -- John Smith's shipping address
(2, 2, 1),  -- Emma Wilson's primary address
(3, 3, 1),  -- Michael Brown's primary address
(4, 4, 1),  -- Sophia Garcia's primary address
(5, 5, 1),  -- William Chen's primary address
(6, 6, 1),  -- Olivia Singh's primary address
(7, 7, 1),  -- James Kim's primary address
(8, 8, 1),  -- Ava Patel's primary address
(9, 10, 1), -- Robert Johnson's primary address
(10, 11, 1); -- Isabella Martin's primary address

-- Insert sample data for shipping_method
INSERT INTO shipping_method (method) VALUES 
('Standard Shipping'),
('Express Shipping'),
('Next Day Delivery'),
('International Shipping'),
('Local Pickup');

-- Insert sample data for order_status
INSERT INTO order_status (status) VALUES 
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned'),
('On Hold');

-- Insert sample data for cust_order
INSERT INTO cust_order (customer_id, shipping_method_id, status_id, order_date) VALUES 
(1, 1, 3, '2025-04-01'),
(2, 2, 4, '2025-03-28'),
(3, 1, 2, '2025-04-05'),
(4, 3, 3, '2025-04-02'),
(5, 4, 3, '2025-03-25'),
(6, 1, 4, '2025-03-20'),
(7, 2, 5, '2025-03-15'),
(8, 3, 4, '2025-04-03'),
(1, 1, 1, '2025-04-10'),
(9, 4, 2, '2025-04-07');

-- Insert sample data for order_line
INSERT INTO order_line (order_id, book_id, quantity) VALUES 
(1, 1, 1),  -- John ordered Harry Potter
(1, 7, 1),  -- John also ordered Sapiens
(2, 2, 2),  -- Emma ordered 2 copies of The Shining
(3, 3, 1),  -- Michael ordered Along Came a Spider
(3, 9, 1),  -- Michael also ordered Outliers
(4, 4, 1),  -- Sophia ordered Beloved
(5, 5, 1),  -- William ordered American Gods
(6, 6, 1),  -- Olivia ordered Becoming
(7, 10, 1), -- James ordered Between the World and Me
(8, 8, 1),  -- Ava ordered Americanah
(9, 11, 1), -- John's second order with The Institute
(10, 12, 1); -- Robert ordered Half of a Yellow Sun

-- Insert sample data for order_history
INSERT INTO order_history (order_id, status_id, timestamp) VALUES 
(1, 1, '2025-04-01 10:00:00'),
(1, 2, '2025-04-01 14:30:00'),
(1, 3, '2025-04-02 09:15:00'),
(2, 1, '2025-03-28 11:20:00'),
(2, 2, '2025-03-28 15:45:00'),
(2, 3, '2025-03-29 08:30:00'),
(2, 4, '2025-03-30 13:10:00'),
(3, 1, '2025-04-05 09:45:00'),
(3, 2, '2025-04-05 16:20:00'),
(4, 1, '2025-04-02 13:30:00'),
(4, 2, '2025-04-02 17:00:00'),
(4, 3, '2025-04-03 10:15:00'),
(5, 1, '2025-03-25 14:40:00'),
(5, 2, '2025-03-26 09:00:00'),
(5, 3, '2025-03-27 11:30:00'),
(6, 1, '2025-03-20 10:25:00'),
(6, 2, '2025-03-20 15:50:00'),
(6, 3, '2025-03-21 09:45:00'),
(6, 4, '2025-03-22 14:20:00'),
(7, 1, '2025-03-15 12:15:00'),
(7, 2, '2025-03-15 16:40:00'),
(7, 5, '2025-03-16 11:00:00'),
(8, 1, '2025-04-03 13:50:00'),
(8, 2, '2025-04-03 17:25:00'),
(8, 3, '2025-04-04 10:30:00'),
(8, 4, '2025-04-05 15:15:00'),
(9, 1, '2025-04-10 11:10:00'),
(10, 1, '2025-04-07 14:05:00'),
(10, 2, '2025-04-07 17:45:00');

-- Create a simple book_price table for retail prices only
CREATE TABLE book_price (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    retail_price DECIMAL(10,2) NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    is_current BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (book_id) REFERENCES book(id)
);

-- Sample data for book_price with retail prices only
INSERT INTO book_price (book_id, retail_price, effective_from, effective_to, is_current) VALUES
-- Harry Potter retail price history
(1, 24.99, '2024-01-01', NULL, TRUE),
(1, 19.99, '2023-06-01', '2023-12-31', FALSE),
(1, 21.99, '2023-01-01', '2023-05-31', FALSE),

-- Current retail prices for all other books
(2, 18.99, '2024-01-01', NULL, TRUE),
(3, 15.99, '2024-01-01', NULL, TRUE),
(4, 22.99, '2024-01-01', NULL, TRUE),
(5, 19.99, '2024-01-01', NULL, TRUE),
(6, 27.99, '2024-01-01', NULL, TRUE),
(7, 24.99, '2024-01-01', NULL, TRUE),
(8, 16.99, '2024-01-01', NULL, TRUE),
(9, 18.99, '2024-01-01', NULL, TRUE),
(10, 23.99, '2024-01-01', NULL, TRUE),
(11, 20.99, '2024-01-01', NULL, TRUE),
(12, 17.99, '2024-01-01', NULL, TRUE),
(13, 15.99, '2024-01-01', NULL, TRUE),
(14, 25.99, '2024-01-01', NULL, TRUE),
(15, 22.99, '2024-01-01', NULL, TRUE);

-- Update the order_line table to include price information
ALTER TABLE order_line ADD COLUMN unit_price DECIMAL(10,2) AFTER book_id;
ALTER TABLE order_line ADD COLUMN line_total DECIMAL(10,2) GENERATED ALWAYS AS (quantity * unit_price) STORED;

-- Update existing order_line records with pricing data
UPDATE order_line ol
JOIN book_price bp ON ol.book_id = bp.book_id AND bp.is_current = TRUE
SET ol.unit_price = bp.retail_price;