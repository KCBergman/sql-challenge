-- drop tables if exist to update tables without having to use alter 

DROP TABLE IF EXISTS titles CASCADE
;

DROP TABLE IF EXISTS departments CASCADE
;

DROP TABLE IF EXISTS employees CASCADE
;

DROP TABLE IF EXISTS salaries CASCADE
;

DROP TABLE IF EXISTS dept_emp CASCADE
;

DROP TABLE IF EXISTS dept_manager CASCADE
;

-- create tables 

CREATE TABLE titles (
    title_id CHAR(5) PRIMARY KEY,
    title VARCHAR(20) NOT NULL
)
;

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL
)
;

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id CHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)
;

CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(emp_no, salary)
)
;

CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
)
;

CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
)
;

