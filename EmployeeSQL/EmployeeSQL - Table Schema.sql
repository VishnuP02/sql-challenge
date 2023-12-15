-- Exported from QuickDBD: https://app.quickdatabasediagrams.com/
-- Link to Schema: https://app.quickdatabasediagrams.com/#/d/EV1pEj

DROP TABLE IF EXISTS Titles, Employees, Departments, Dept_Manager, Dept_Emp, Salaries;

CREATE TABLE Titles(
	title_id VARCHAR(5) PRIMARY KEY, 
	title VARCHAR(50) NOT NULL
);

CREATE TABLE Employees(
	emp_no INT PRIMARY KEY NOT NULL, 
	emp_title_id VARCHAR(5) REFERENCES Titles(title_id), 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL, 
	sex CHAR(1) NOT NULL, 
	hire_date DATE NOT NULL
);

CREATE TABLE Departments(
	dept_no VARCHAR(5) PRIMARY KEY, 
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Dept_Manager(
	dept_no VARCHAR(5) REFERENCES Departments(dept_no), 
	emp_no INT REFERENCES Employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Dept_Emp(
	emp_no INT REFERENCES Employees(emp_no), 
	dept_no VARCHAR(5) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Salaries(
	emp_no INT PRIMARY KEY REFERENCES Employees(emp_no), 
	salary INT NOT NULL
);