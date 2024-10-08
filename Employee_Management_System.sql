CREATE DATABASE Employee_Management_System;

USE Employee_Management_System;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    role_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Insert data into departments
INSERT INTO departments (department_name) VALUES ('HR'), ('Engineering'), ('Sales'), ('Marketing');

-- Insert data into roles
INSERT INTO roles (role_name) VALUES ('Manager'), ('Developer'), ('Analyst'), ('Salesperson');

-- Insert data into the employees table
INSERT INTO employees (employee_name, age, hire_date, salary, department_id, role_id)
VALUES ('John Doe', 30, '2022-01-10', 55000, 1, 1),
       ('Jane Smith', 25, '2021-05-22', 70000, 2, 2),
       ('Emily Davis', 35, '2020-11-15', 60000, 3, 3),
       ('Robert Brown', 29, '2023-03-30', 48000, 4, 4);
       
-- Update salary and department of an employee
UPDATE employees
SET salary = 60000, department_id = 3
WHERE employee_id = 1;

-- Update the role of an employee
UPDATE employees
SET role_id = 2
WHERE employee_id = 1;

-- Delete  an Employee
DELETE FROM employees
WHERE employee_id = 3;

-- Get All Employees with Departments and Roles
SELECT e.employee_name, e.age, e.hire_date, e.salary, d.department_name, r.role_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN roles r ON e.role_id = r.role_id;


-- Get Employees by Department
SELECT e.employee_name, e.age, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';


-- Get Employees by Role
SELECT e.employee_name, e.salary
FROM employees e
JOIN roles r ON e.role_id = r.role_id
WHERE r.role_name = 'Developer';


-- Get Employees Hired After a Certain Date
SELECT employee_name, hire_date
FROM employees
WHERE hire_date > '2022-01-01';


-- Get Total Salary by Department
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


-- Get Average Salary by Role
SELECT r.role_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN roles r ON e.role_id = r.role_id
GROUP BY r.role_name;

-- Get Employee Count by Department
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


-- Get Department with Highest Average Salary
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC
LIMIT 3;



