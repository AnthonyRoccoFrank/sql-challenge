-- Joining employees and salaries tables on emp_no
SELECT e.emp_no, last_name, first_name, sex, salary FROM employees as e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- Finding employees hired in 1986 from employees table
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- Joining employees, department manager and department tables to find manager information
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name FROM dept_manager AS m
INNER JOIN departments AS d on d.dept_no = m.dept_no
INNER JOIN employees AS e on e.emp_no = m.emp_no;

-- Joining employees, departments, and dept_emp tables to find employee infor
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no FROM dept_employees as de
INNER JOIN departments AS d on d.dept_no = de.dept_no
INNER JOIN employees AS e on e.emp_no = de.emp_no;

-- Employees with the first name Hercules and last name starts with B
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Employee number, last name and first name from sales department
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_employees AS DE
INNER JOIN departments AS d on d.dept_no = de.dept_no
INNER JOIN employees AS e on e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

-- Employee number, last name and first name from sales or development department
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name FROM dept_employees AS DE
INNER JOIN departments AS d on d.dept_no = de.dept_no
INNER JOIN employees AS e on e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- Frequency count of all last names
SELECT last_name, count(last_name) FROM employees
GROUP BY last_name
ORDER BY count DESC;