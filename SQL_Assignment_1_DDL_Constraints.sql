-- SQL Assignment 1
-- Topic: DDL Commands and Constraints
-- Part 1: DDL Commands

CREATE DATABASE employee;
USE employee;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
-- Add email column to Employees
ALTER TABLE Employees
ADD email VARCHAR(100);

-- Modify designation column
ALTER TABLE Employees
MODIFY designation VARCHAR(150);

-- Drop age column
ALTER TABLE Employees
DROP COLUMN age;

-- Rename hire_date column
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;

-- Rename Departments table
RENAME TABLE Departments TO Departments_Info;

-- Rename Location table
RENAME TABLE Location TO Locations;
-- Remove all records from Employees
TRUNCATE TABLE Employees;

-- Delete Employees table
DROP TABLE Employees;

-- Delete employee database
DROP DATABASE employee;
-- Remove all records from Employees
TRUNCATE TABLE Employees;

-- Delete Employees table
DROP TABLE Employees;

-- Delete employee database
DROP DATABASE employee;
-- =====================================
-- PART 2: DDL COMMANDS WITH CONSTRAINTS
-- =====================================

CREATE DATABASE employee;
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
-- Insert Departments records
INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert Location records
INSERT INTO Location (location)
VALUES
('Kerala'),
('Dubai'),
('Bangalore'),
('Chennai');

-- Insert Employees records
INSERT INTO Employees
(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES
(101, 'Aisha', 'F', 23, '2025-01-10', 'HR Executive', 1, 1, 25000.00),
(102, 'Rahul', 'M', 25, '2025-02-15', 'Software Developer', 2, 2, 35000.00),
(103, 'Anu', 'F', 24, '2025-03-20', 'Accountant', 3, 3, 30000.00),
(104, 'Arun', 'M', 26, '2025-04-05', 'Marketing Executive', 4, 4, 28000.00);

-- Display Departments
SELECT * FROM Departments
ORDER BY department_id;

-- Display Location
SELECT * FROM Location
ORDER BY location_id;

-- Display Employees
SELECT * FROM Employees
ORDER BY employee_id;
