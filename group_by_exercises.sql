USE employees;

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name
from employees
where last_name like "e%"
  and last_name like "%e"
GROUP BY last_name;

SELECT DISTINCT first_name, last_name
from employees
where last_name like "e%"
  and last_name like "%e"
GROUP BY first_name, last_name;

SELECT DISTINCT last_name
from employees
where last_name like "%q%"
  and last_name not like "%qu%"
GROUP BY last_name;

SELECT DISTINCT last_name, count(last_name)
from employees
where last_name like "%q%"
  and last_name not like "%qu%"
GROUP BY last_name
ORDER BY count(last_name);

SELECT DISTINCT gender, count(*)
from employees
where first_name IN("Irena","Vidya","Maya")
GROUP BY gender;

SELECT DISTINCT gender, count(*)
from employees
where first_name IN("Irena","Vidya","Maya")
GROUP BY gender
ORDER BY count(gender);