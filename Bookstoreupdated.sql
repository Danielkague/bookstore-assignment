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


-- Create tables for user authentication and authorization

-- User table to store basic user information
CREATE TABLE user_account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- Role table to define different access levels
CREATE TABLE role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- User-Role junction table for many-to-many relationship
CREATE TABLE user_role (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES user_account(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);

-- Permission table to define granular access controls
CREATE TABLE permission (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    resource VARCHAR(50) NOT NULL,
    action VARCHAR(50) NOT NULL,
    UNIQUE KEY unique_resource_action (resource, action)
);

-- Role-Permission junction table
CREATE TABLE role_permission (
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE
);

-- Insert sample roles
INSERT INTO role (name, description) VALUES
('Admin', 'Full system access with all privileges'),
('Manager', 'Access to manage inventory, orders, and view reports'),
('Sales', 'Access to customer and order management'),
('Inventory', 'Access to manage book inventory'),
('Customer Service', 'Access to customer data and orders for support'),
('Accounting', 'Access to financial data and reports'),
('Read Only', 'View-only access to non-sensitive data');

-- Insert sample permissions
INSERT INTO permission (name, description, resource, action) VALUES
-- Book related permissions
('view_books', 'View book information', 'book', 'view'),
('add_book', 'Add new books to inventory', 'book', 'add'),
('edit_book', 'Edit existing book information', 'book', 'edit'),
('delete_book', 'Remove books from database', 'book', 'delete'),

-- Author related permissions
('view_authors', 'View author information', 'author', 'view'),
('add_author', 'Add new authors', 'author', 'add'),
('edit_author', 'Edit author information', 'author', 'edit'),
('delete_author', 'Remove authors from database', 'author', 'delete'),

-- Publisher related permissions
('view_publishers', 'View publisher information', 'publisher', 'view'),
('add_publisher', 'Add new publishers', 'publisher', 'add'),
('edit_publisher', 'Edit publisher information', 'publisher', 'edit'),
('delete_publisher', 'Remove publishers from database', 'publisher', 'delete'),

-- Customer related permissions
('view_customers', 'View customer information', 'customer', 'view'),
('add_customer', 'Add new customers', 'customer', 'add'),
('edit_customer', 'Edit customer information', 'customer', 'edit'),
('delete_customer', 'Remove customers from database', 'customer', 'delete'),

-- Order related permissions
('view_orders', 'View order information', 'order', 'view'),
('create_order', 'Create new orders', 'order', 'add'),
('update_order', 'Update order status or details', 'order', 'edit'),
('cancel_order', 'Cancel existing orders', 'order', 'cancel'),
('delete_order', 'Remove orders from database', 'order', 'delete'),

-- Price related permissions
('view_prices', 'View price information', 'price', 'view'),
('set_prices', 'Set or update prices', 'price', 'edit'),

-- Report related permissions
('view_sales_reports', 'Access to sales reports', 'report', 'view_sales'),
('view_inventory_reports', 'Access to inventory reports', 'report', 'view_inventory'),
('view_financial_reports', 'Access to financial reports', 'report', 'view_financial'),

-- System permissions
('manage_users', 'Create and edit user accounts', 'system', 'manage_users'),
('manage_roles', 'Create and edit roles', 'system', 'manage_roles'),
('view_audit_logs', 'View system audit logs', 'system', 'view_logs');

-- Assign permissions to roles
-- Admin role gets all permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 1, id FROM permission;

-- Manager role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 2, id FROM permission 
WHERE name IN (
    'view_books', 'add_book', 'edit_book', 
    'view_authors', 'add_author', 'edit_author',
    'view_publishers', 'add_publisher', 'edit_publisher',
    'view_customers', 'view_orders', 'update_order', 'cancel_order',
    'view_prices', 'set_prices',
    'view_sales_reports', 'view_inventory_reports'
);

-- Sales role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 3, id FROM permission 
WHERE name IN (
    'view_books', 'view_authors', 'view_publishers',
    'view_customers', 'add_customer', 'edit_customer',
    'view_orders', 'create_order', 'update_order', 'cancel_order',
    'view_prices', 'view_sales_reports'
);

-- Inventory role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 4, id FROM permission 
WHERE name IN (
    'view_books', 'add_book', 'edit_book',
    'view_authors', 'add_author', 'edit_author',
    'view_publishers', 'add_publisher', 'edit_publisher',
    'view_inventory_reports'
);

-- Customer Service role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 5, id FROM permission 
WHERE name IN (
    'view_books', 'view_customers', 'edit_customer',
    'view_orders', 'update_order', 'cancel_order'
);

-- Accounting role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 6, id FROM permission 
WHERE name IN (
    'view_books', 'view_customers', 'view_orders',
    'view_prices', 'view_sales_reports', 'view_financial_reports'
);

-- Read Only role permissions
INSERT INTO role_permission (role_id, permission_id)
SELECT 7, id FROM permission 
WHERE name IN (
    'view_books', 'view_authors', 'view_publishers'
);

-- Create sample users
INSERT INTO user_account (username, password_hash, email, first_name, last_name) VALUES
('admin', '$2a$12$1234567890abcdefghijkl', 'admin@bookstore.com', 'System', 'Administrator'),
('jsmith', '$2a$12$abcdefghijkl1234567890', 'jsmith@bookstore.com', 'John', 'Smith'),
('agarcia', '$2a$12$ghijkl1234567890abcdef', 'agarcia@bookstore.com', 'Ana', 'Garcia'),
('mwilson', '$2a$12$567890abcdefghijkl1234', 'mwilson@bookstore.com', 'Mike', 'Wilson'),
('tchen', '$2a$12$efghijkl1234567890abcd', 'tchen@bookstore.com', 'Tina', 'Chen'),
('rjohnson', '$2a$12$90abcdefghijkl12345678', 'rjohnson@bookstore.com', 'Robert', 'Johnson'),
('spatil', '$2a$12$34567890abcdefghijkl12', 'spatil@bookstore.com', 'Sunita', 'Patil');

-- Assign roles to users
INSERT INTO user_role (user_id, role_id) VALUES
(1, 1), -- admin is Admin
(2, 2), -- jsmith is Manager
(3, 3), -- agarcia is Sales
(4, 4), -- mwilson is Inventory
(5, 5), -- tchen is Customer Service
(6, 6), -- rjohnson is Accounting
(7, 7); -- spatil is Read Only

-- Add some users with multiple roles
INSERT INTO user_role (user_id, role_id) VALUES
(2, 3), -- jsmith is also Sales
(3, 5); -- agarcia is also Customer Service

-- Create an audit log table to track user actions
CREATE TABLE audit_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(50) NOT NULL,
    resource VARCHAR(50) NOT NULL,
    resource_id INT,
    details TEXT,
    ip_address VARCHAR(45),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_account(id)
);

-- Sample audit log entries
INSERT INTO audit_log (user_id, action, resource, resource_id, details, ip_address) VALUES
(1, 'CREATE', 'book', 15, 'Added new book: 21 Lessons for the 21st Century', '192.168.1.100'),
(2, 'UPDATE', 'book', 1, 'Updated price from $21.99 to $24.99', '192.168.1.101'),
(3, 'CREATE', 'order', 10, 'Created new order for customer ID 9', '192.168.1.102'),
(4, 'UPDATE', 'book', 7, 'Updated inventory count from 15 to 12', '192.168.1.103'),
(5, 'UPDATE', 'order', 7, 'Changed status from Processing to Cancelled', '192.168.1.104');

-- Create database views for simplified access control
CREATE VIEW vw_books_public AS
SELECT b.id, b.title, a.name AS author, p.name AS publisher, l.language_name, bp.retail_price
FROM book b
JOIN book_author ba ON b.id = ba.book_id
JOIN author a ON ba.author_id = a.id
JOIN publisher p ON b.publisher_id = p.id
JOIN book_language l ON b.language_id = l.id
LEFT JOIN book_price bp ON b.id = bp.book_id AND bp.is_current = TRUE;
*/

-- Database login function example (pseudo-code as stored procedure)
DELIMITER //
CREATE PROCEDURE sp_user_login(IN p_username VARCHAR(50), IN p_password VARCHAR(255))
BEGIN
    DECLARE v_user_id INT;
    DECLARE v_password_hash VARCHAR(255);
    
    -- Get user information
    SELECT id, password_hash INTO v_user_id, v_password_hash
    FROM user_account 
    WHERE username = p_username AND is_active = TRUE;
    
    -- In real implementation, you would verify password hash here
    -- This is just a simplified example
    IF v_user_id IS NOT NULL THEN
        -- Update last login time
        UPDATE user_account SET last_login = NOW() WHERE id = v_user_id;
        
        -- Return user permissions
        SELECT p.resource, p.action
        FROM user_account u
        JOIN user_role ur ON u.id = ur.user_id
        JOIN role r ON ur.role_id = r.id
        JOIN role_permission rp ON r.id = rp.role_id
        JOIN permission p ON rp.permission_id = p.id
        WHERE u.id = v_user_id;
        
        -- Log the login
        INSERT INTO audit_log (user_id, action, resource, details, ip_address)
        VALUES (v_user_id, 'LOGIN', 'system', 'User login successful', '0.0.0.0');
    ELSE
        -- Log failed login attempt
        INSERT INTO audit_log (action, resource, details, ip_address)
        VALUES ('LOGIN_FAILED', 'system', CONCAT('Failed login attempt for username: ', p_username), '0.0.0.0');
    END IF;
END //
DELIMITER ;