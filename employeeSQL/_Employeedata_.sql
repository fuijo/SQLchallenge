--Data Eng
drop table titles;
drop table salaries;
drop table employees;
drop table dept_manager;
drop table dept_emp;
drop table departments;


-- Titles Table
CREATE TABLE titles (
    title_id VARCHAR(10),  
    title VARCHAR(255) NOT NULL,   
    PRIMARY KEY (title_id)
);

-- Salaries Table
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,         
    salary DECIMAL(10, 2) NOT NULL,   
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Employees Table
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,  
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,      
    sex CHAR(1) NOT NULL,                
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(20) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

-- Department Manager Table
CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,
    emp_no INTEGER NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Department Employee Table
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(20) NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


select * from titles;
select * from salaries;
select * from employees;
select * from dept_manager;
select * from dept_emp;
select * from departments;

COPY titles 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\titles.csv' with CSV HEADER;

COPY salaries 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\salaries.csv' with CSV HEADER;

COPY employees 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\employees.csv' with CSV HEADER;

COPY dept_manager 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\dept_manager.csv' with CSV HEADER;

COPY dept_emp 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\dept_emp.csv' 
delimiter ','
CSV HEADER;

INSERT INTO dept_manager (dept_no, emp_no)
SELECT DISTINCT dept_no, emp_no
FROM dept_manager
ON CONFLICT (dept_no, emp_no) DO NOTHING;

COPY departments 
from 'C:\Users\fjrui\OneDrive\Documents\Desktop\Bootcamp\SQL\assignment\data\departments.csv' 
delimiter ','
CSV HEADER;




select * from titles;
select * from salaries;
select * from employees;
select * from dept_manager;
select * from dept_emp;
select * from departments;

--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee 
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no;
-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;
	
SELECT 
    first_name,
    last_name,
    hire_date
FROM 
    employees
WHERE 
    hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    departments d
JOIN 
    dept_emp dm ON d.dept_no = dm.dept_no
JOIN 
    employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no  -- Join employees to dept_emp to link each employee with a department
JOIN 
    departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name 
ORDER BY 
    frequency DESC;