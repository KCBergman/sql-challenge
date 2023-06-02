-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Date Hired"
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no as "Department Number", d.dept_name as "Department Name", dm.emp_no as "Manager ID", e.last_name as "Last Name", e.first_name as "First Name"
FROM dept_manager as dm
JOIN departments as d
ON dm.dept_no = d.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no
;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no as "Department Number", e.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no = e.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name as "First Name", last_name as "Last Name", sex as "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name"
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee ID", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT DISTINCT last_name as "Last Name", COUNT(last_name) as "Count of Last Name"
FROM employees
GROUP BY "Last Name"
ORDER BY "Count of Last Name" DESC
;