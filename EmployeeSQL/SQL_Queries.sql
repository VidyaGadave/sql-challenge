-- List the employee number, last name, first name, sex, and salary of each employee 
SELECT 
e.emp_no as employee_number,
last_name,
first_name,
sex,
salary 
FROM employees e INNER JOIN
salaries s 
on e.emp_no=s.emp_no


--List the first name, last name, and hire date for the employees who were hired in 1986.
select
first_name,
last_name,
hire_date
from employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';


--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no = d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B.
select
first_name,
last_name,
sex
from employees 
where first_name='Hercules'
and last_name like 'B%'


-- List each employee in the Sales department, including their 
-- employee number, last name, and first name 
SELECT e.emp_no,
	e.last_name,
	e.first_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name (4 points)
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');


-- List the frequency counts, in descending order, of all the 
-- employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY Frequency DESC;