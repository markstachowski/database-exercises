USE employees;

SELECT *
from employees
where first_name IN("Irena","Vidya","Maya")
                          and gender = "M"
order by last_name desc, first_name desc;

SELECT CONCAT(first_name, ' ',last_name)
from employees
where last_name like "e%"
  and last_name like "%e"
order by emp_no desc;

SELECT *
from employees
where hire_date between "1990-01-01" and "1999-12-31";

SELECT *
from employees
where birth_date like "%-12-25";

SELECT *
from employees
where last_name like "%q%";

SELECT first_name, last_name, datediff(current_date, hire_date)
from employees
where hire_date between "1990-01-01" and "1999-12-31"
  and birth_date like "%-12-25"
order by birth_date, hire_date desc;

SELECT *
from employees
where last_name like "%q%"
  and last_name not like "%qu%";