-- querry

CREATE DATABASE EMPLOYEES;

USE EMPLOYEES;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
) ;

USE EMPLOYEES;

CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100)
);
USE EMPLOYEES;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender ENUM('M','F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
    );
    
USE EMPLOYEES;
 # Table Alteration
ALTER TABLE Employees 
  ADD COLUMN email VARCHAR(100),
 MODIFY COLUMN Designation varchar(100),
 DROP COLUMN age,
 CHANGE hire_date date_of_joining DATE;
 
 # table Rename
 
 USE EMPLOYEES;
 
 RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;

# truncate table
truncate table employees;

# Database & TAble Dropping

DROP TABLE Employees;

DROP DATABASE Employees;


#Recreate Database

DROP DATABASE IF EXISTS employee;
DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;
USE employee;


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(30) NOT NULL UNIQUE
);


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);





 
 


