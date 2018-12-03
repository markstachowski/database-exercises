USE employees;

select * from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER by first_name;

select * from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER by first_name, last_name;

select * from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER by last_name, first_name;

select * from employees
WHERE last_name LIKE 'E%'
ORDER by emp_no;

select * from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER by last_name DESC, first_name DESC;

select * from employees
WHERE last_name LIKE 'E%'
ORDER by emp_no DESC;

select * from employees
WHERE hire_date between '1990-01-01' AND '1999-12-31'
ORDER BY birth_date DESC, hire_date DESC;

select * from employees
WHERE (hire_date between '1990-01-01' AND '1999-12-31')
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;