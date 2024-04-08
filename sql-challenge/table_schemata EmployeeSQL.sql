-- DATA ENGINEERING

CREATE TABLE departments(
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR (30) NOT NULL, 
	dept_name VARCHAR (30) NOT NULL 
);

CREATE TABLE dept_emp (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER, 
    dept_no VARCHAR(30) NOT NULL, 
	-- Foreign key constraint for emp_no column
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    -- Foreign key constraint for dept_no column
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	id SERIAL PRIMARY KEY,
    dept_no VARCHAR(30) NOT NULL, 
    emp_no INTEGER,
	-- Foreign key constraint for dept_no column
    CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    -- Foreign key constraint for emp_no column
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
    emp_no INTEGER, 
    emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL, 
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL, 
	sex VARCHAR(30) NOT NULL, 
	hire_date DATE NOT NULL, 
-- Add foreign key constraint for emp_title_id
    CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	id SERIAL PRIMARY KEY,
    emp_no INTEGER NOT NULL, 
    salary INTEGER NOT NULL,
	-- Foreign key constraint for emp_no column
    CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	id SERIAL PRIMARY KEY,
    title_id VARCHAR(30) NOT NULL UNIQUE, 
    title VARCHAR(30) NOT NULL 	
);