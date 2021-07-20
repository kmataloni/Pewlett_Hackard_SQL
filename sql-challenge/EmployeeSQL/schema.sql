--start of schema file for PH Employee DB

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title TEXT,
	PRIMARY KEY (title_id)
);
CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE,
	first_name TEXT,
	last_name TEXT,
	sex TEXT,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)	
);

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name TEXT,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,	
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)	
);

CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);