create database employee;
Use employee;
create table departments(department_id INT Primary key, department_name varchar(100));
create table location(location_id int primary key, location varchar(30));
create table employees(employee_id INT primary key,employee_name varchar(50),gender ENUM('M','F'),age INT,hire_date date,designation varchar(100),
department_id INT,location_id INT,salary DECIMAL(10,2), foreign key(department_id)references departments(department_id),foreign key(location_id)
references location(location_id));
alter table employees add email varchar(100);
alter table employees modify designation varchar(200);
alter table employees drop column age;
alter table employees rename column hire_date to date_of_joining;
rename table departments to departments_info;
rename table location to locations;
truncate table employees;
drop table employees;
drop database employee;
-- Drop and recreate the database
DROP DATABASE IF EXISTS employee;

CREATE DATABASE employee;

USE employee;

-- Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT(current_date()),
    designation VARCHAR(100),
    department_id INT NOT NULL,
    location_id INT NOT NULL,
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES location(location_id)
);