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

