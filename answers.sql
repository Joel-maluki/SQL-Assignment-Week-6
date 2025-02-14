-- SQL Assignment Week 5: Database Indexing and Optimization

-- Question 1: INNER JOIN Bills and Payments Table
SELECT 
    b.TotalAmount, 
    b.Status, 
    p.DueDate, 
    p.PaymentMethod, 
    p.PaymentAmount 
FROM bills b
INNER JOIN payments p ON b.BillID = p.BillID;

-- Question 2: LEFT JOIN Customer and Bills Table
SELECT 
    c.customerName, 
    c.email, 
    c.customerAddress, 
    b.TotalAmount, 
    b.Status 
FROM customer c
LEFT JOIN bills b ON c.customerID = b.customerID;

-- Question 3: RIGHT JOIN Bills and Bill Items Table
SELECT 
    b.BillDate, 
    b.DueDate, 
    bi.Status, 
    bi.ItemDescription, 
    bi.Quantity, 
    bi.LineTotal, 
    DATEDIFF(b.DueDate, b.BillDate) AS Number_of_Days
FROM bills b
RIGHT JOIN bill_items bi ON b.BillID = bi.BillID;

-- Question 4: One-to-One Relationship: Users and User Profiles
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    profile_data TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Question 5: One-to-Many Relationship: Departments and Employees
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL
);

-- Question 6: Categories, Bills, and Customer Tables Join
SELECT 
    cat.CategoryName, 
    b.TotalAmount, 
    b.DueDate, 
    c.customerName, 
    c.customerAddress 
FROM categories cat
INNER JOIN bills b ON cat.CategoryID = b.CategoryID
LEFT JOIN customer c ON b.CustomerID = c.CustomerID;
