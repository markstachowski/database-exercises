USE employees;

select * from employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

select * from employees
WHERE last_name LIKE 'E%';

select * from employees
WHERE hire_date between '1990-01-01' AND '1999-12-31';

select * from employees
WHERE birth_date LIKE '%-12-25';

select *
from employees
WHERE last_name LIKE '%q%';

select *
from employees
WHERE (first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya');

select *
from employees
WHERE (first_name = 'Irena'
  OR first_name = 'Vidya'
  OR first_name = 'Maya')
  AND gender = 'M';

select *
from employees
WHERE last_name LIKE '%E'
   OR last_name LIKE 'E%';

select *
from employees
WHERE last_name LIKE '%E'
   AND last_name LIKE 'E%';

select *
from employees
where hire_date LIKE '199%'
and birth_date like '%-12-25';

select *
from employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';
