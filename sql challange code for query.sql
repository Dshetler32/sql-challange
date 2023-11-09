--Create tables, import data

CREATE TABLE departments (
dept_no varchar NOT NULL,
dept_name varchar NOT NULL,
CONSTRAINT "pk_departments" PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no varchar NOT NULL,
CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no","dept_no")	
);

drop table dept_manager
CREATE TABLE dept_manager (
dept_no varchar NOT NULL,
emp_no int NOT NULL,
CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no","dept_no")
);

Drop table employee
CREATE TABLE employee (
    emp_no int NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);


CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no)
);


CREATE TABLE titles (
title_id varchar NOT NULL,
title varchar NOT NULL,
CONSTRAINT pk_titles PRIMARY KEY ("title_id")
);

--Data question #1
SELECT employee.emp_no, employee.first_name, employee.last_name, employee.sex, salaries.salary
FROM salaries
INNER JOIN employee ON employee.emp_no = salaries.emp_no
ORDER BY employee.emp_no asc;

--Data question #2
SELECT first_name, last_name, hire_date
FROM employee
where hire_date between '1986-01-01' and '12-31-1986'
ORDER BY hire_date asc;

--research question 3

SELECT
    d.dept_no AS department_number,
    d.dept_name AS department_name,
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    t.title_id as title
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employee e ON dm.emp_no = e.emp_no
JOIN
    titles t ON t.title_id = e.emp_title_id
WHERE
    e.emp_title_id = 'm0001';


--research Q 4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
d.dept_no AS department_number,
d.dept_name AS department_name,
dm.emp_no AS employee_number,
e.last_name,
e.first_name
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employee e ON dm.emp_no = e.emp_no
	
--research question 5 List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B.
SELECT 
e.last_name,
e.first_name,
e.sex
From employee e
where first_name = 'Hercules'
AND last_name LIKE 'B%';

--research question 6 List each employee in the 
--Sales department, including their employee number, last name, and first name.
SELECT 
e.last_name,
e.first_name,
e.emp_no, 
d.dept_name

FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employee e ON dm.emp_no = e.emp_no
WHERE 
d.dept_name = 'Sales'

--research question 7 List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.v
SELECT 
e.last_name,
e.first_name,
e.emp_no, 
d.dept_name

FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employee e ON dm.emp_no = e.emp_no
WHERE 
	d.dept_name = 'Sales'
	OR 
	d.dept_name = 'Development'
	
--research Q 8 List the frequency counts, in descending order,
--of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) AS frequency
FROM employee
GROUP BY last_name
ORDER BY frequency DESC, last_name;