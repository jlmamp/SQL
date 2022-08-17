-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees"."emp_no", 	  
               "Employees"."last_name", 	  
               "Employees"."first_name", 	  
               "Employees"."sex",	  
               "Salaries"."salary"
FROM "Employees"
JOIN "Salaries" ON "Employees"."emp_no"="Salaries"."emp_no"

select * from "Employees"

-- 2.List first name, last name, and hire date for employees who were hired in 1986.
Select last_name,
        first_name,
        hire_date
From "Employees"
Where date_part('year',hire_date)=1986

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Manager"."dept_no",
	   "Departments"."dept_name",
	   "Employees"."emp_no",
	   "Employees"."first_name",
	   "Employees"."last_name"
FROM "Dept_Manager"
JOIN "Employees" ON "Dept_Manager"."emp_no"="Employees"."emp_no"
JOIN "Departments" ON "Dept_Manager"."dept_no"="Departments"."dept_no"

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Departments"."dept_name",
	   "Dept_Emp"."emp_no",
	   "Employees"."first_name",
	   "Employees"."last_name"
FROM "Employees"
JOIN "Dept_Emp" ON "Employees"."emp_no"="Dept_Emp"."emp_no"
JOIN "Departments" ON "Dept_Emp"."dept_no"="Departments"."dept_no"

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	   last_name,
	   sex
FROM "Employees"
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Employees"."first_name",
	   "Employees"."last_name",
	   "Dept_Emp"."emp_no",
	   "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Emp" ON  "Employees"."emp_no"="Dept_Emp"."emp_no"
JOIN "Departments" ON "Dept_Emp"."dept_no"="Departments"."dept_no"
WHERE dept_name='Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Employees".first_name,
	   "Employees".last_name,
	   "Dept_Emp".emp_no,
	   "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp" ON "Employees"."emp_no"="Dept_Emp"."emp_no"
JOIN "Departments" ON "Dept_Emp"."dept_no"="Departments"."dept_no"
WHERE dept_name='Sales' 
OR dept_name='Development'


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT count(last_name),
	   last_name
FROM "Employees"
GROUP BY last_name
ORDER BY count(last_name) desc