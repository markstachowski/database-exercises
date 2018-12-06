SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
) LIMIT 10;

SELECT CONCAT(first_name, ' ', last_name) Employees
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
) LIMIT 70;

SELECT CONCAT(e.first_name, ' ', e.last_name) Employees, title Titles
FROM employees e
JOIN titles t
ON t.emp_no = e.emp_no
WHERE hire IN (
    SELECT hire_date
    FROM employees
    WHERE first_name = 'Aamod'
) LIMIT 320;

SELECT first_name, title Titles
FROM employees e
JOIN titles USING (emp_no)
AND e.first_name = 'Aamod';