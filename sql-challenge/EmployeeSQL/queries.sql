--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, 
    employees.first_name, 
	employees.last_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986

SELECT employees.first_name, 
	employees.last_name,
	employees.hire_date
FROM employees
WHERE (hire_date) BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
	--department number, department name, the manager's employee number, last name, first name
	
SELECT dept_manager.dept_no,
	dept_manager.emp_no,
	departments.dept_name,
	employees.first_name,
	employees.last_name
FROM employees
	INNER JOIN dept_manager on dept_manager.emp_no=employees.emp_no
	INNER JOIN departments on departments.dept_no=dept_manager.dept_no;
	
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name

SELECT employees.first_name,
	employees.last_name,
	departments.dept_name,
	dept_emp.emp_no
FROM employees
	INNER JOIN dept_emp on dept_emp.emp_no=employees.emp_no
	INNER JOIN departments on departments.dept_no=dept_emp.dept_no;
	
--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
	
SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp on dept_emp.emp_no=employees.emp_no
	INNER JOIN departments on departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name

SELECT dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
	INNER JOIN dept_emp on dept_emp.emp_no=employees.emp_no
	INNER JOIN departments on departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY employees.last_name DESC;

