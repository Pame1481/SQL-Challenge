DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  	dept_no VARCHAR(4) NOT NULL,
  	dept_name VARCHAR(40) NOT NULL,
   	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255)NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no, emp_no) REFERENCES dept_emp (dept_no,emp_no)
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
	emp_no INTEGER NOT NULL,
	title VARCHAR(255) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)										
);

SELECT * FROM departments

SELECT * FROM employees

SELECT * FROM dept_emp

SELECT * FROM dept_manager

SELECT * FROM salaries

SELECT * FROM titles