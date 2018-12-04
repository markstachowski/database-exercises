USE employees;

SELECT DISTINCT last_name FROM employees
order by last_name desc
         LIMIT 10;

SELECT *
from employees
where (hire_date between "1990-01-01" and "1999-12-31")
  and birth_date like "%12-25"
order by birth_date, hire_date desc
         limit 5;

SELECT *
from employees
where (hire_date between "1990-01-01" and "1999-12-31")
  and birth_date like "%12-25"
order by birth_date, hire_date desc
         limit 5 offset 45;
# Tenth page = limit * page - limit