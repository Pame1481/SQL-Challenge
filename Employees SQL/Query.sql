-- 1. List of each employee: employee number, last name, first name, gender and salary.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. Employees hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List of manager for each department: department number, department name, 
--    the manager's employee number, last name, first name and start and end employment dates.
SELECT departments.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name,
		dept_manager.from_date,
		dept_manager.to_date
FROM departments
LEFT JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no
LEFT JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee: employee number, last name, first name,
--    department name.
SELECT dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees 
LEFT JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON
dept_emp.dept_no = departments.dept_no;

-- 5. List of all employees: first name = Hercules, last name begins "B"
SELECT emp_no, first_name, last_name, gender 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE'B%';

-- 6. List all employees in Sales Department: employee number, last name, first name, 
--    and department name.
SELECT dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in Sales/Development Department: employee number, last name, 
--    first name, and department name.
SELECT dept_emp.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- 8. List frequency count of employees names
SELECT last_name, COUNT(last_name) as "Frequency of Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Last Names" DESC