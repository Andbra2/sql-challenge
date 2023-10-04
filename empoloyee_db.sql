-- Query 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.sex AS "Sex", s.salary AS "Salary"
FROM employees AS e 
	JOIN 
	salaries AS s 
	ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.hire_date AS "Hire Date"
FROM employees AS e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- Query 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no AS "Department Number", d.dept_name AS "Department Name", e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM dept_manager AS dm
	JOIN 
	employees AS e
	ON e.emp_no = dm.emp_no
	JOIN 
	departments AS d
	ON dm.dept_no = d.dept_no;

-- Query 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no AS "Department Number", e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name" 
FROM departments AS d
	JOIN 
	dept_emp AS de
	ON d.dept_no = de.dept_no 
	JOIN 
	employees AS e
	ON de.emp_no = e.emp_no;
				
-- Query 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.sex AS "Sex"
FROM employees AS e
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

-- Query 6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name"
FROM employees AS e
WHERE e.emp_no IN
	(SELECT de.emp_no 
	 FROM dept_emp AS de
	 WHERE de.dept_no = 
		(SELECT d.dept_no
		 FROM departments AS d
		 WHERE d.dept_name = 'Sales'));

-- Query 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name" 
FROM employees AS e
	JOIN 
	dept_emp AS de
	ON e.emp_no = de.emp_no 
	JOIN 
	departments AS d
	ON de.dept_no = d.dept_no 
	WHERE d.dept_name = 'Sales' 
		OR d.dept_name = 'Development';

-- Query 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name AS "Last Name", COUNT(e.last_name) AS "Last Name Count"
FROM employees AS e
GROUP BY e.last_name
ORDER BY "Last Name Count" DESC;
