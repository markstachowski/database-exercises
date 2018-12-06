DROP DATABASE IF EXISTS join_test_db;
CREATE DATABASE join_test_db;

USE join_test_db;

CREATE TABLE IF NOT EXISTS roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS  users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('fred', 'fred@example.com', null),
  ('cindy', 'cindy@example.com', 2),
  ('bobby', 'bobby@example.com', 2),
  ('michael', 'michael@example.com', 2),
  ('kyle', 'kyle@example.com', 2);


SELECT * FROM users;
SELECT * FROM roles;

SELECT users.name, roles.name FROM users
INNER JOIN roles
  ON roles.id = users.role_id;

SELECT users.name, roles.name FROM users
LEFT JOIN roles
  ON roles.id = users.role_id;


SELECT users.name, roles.name FROM users
INNER JOIN roles
  ON roles.id = users.role_id;

SELECT users.name, roles.name FROM users
RIGHT JOIN roles
 ON roles.id = users.role_id;

SELECT roles.name, COUNT(*) FROM users
JOIN roles
 ON roles.id = users.role_id
GROUP BY roles.name;


SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name)
FROM employees.employees as e
JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01';

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager AS dm
ON dm.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = dm.emp_no
WHERE dm.to_date >= NOW()
ORDER BY dept_name;

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM departments
JOIN dept_manager
USING(dept_no)
JOIN employees
USING(emp_no)
WHERE dept_manager.to_date >= NOW()
ORDER BY dept_name;

SELECT CONCAT(first_name, ' ', last_name) Employees, salary Salaries
FROM employees e
JOIN salaries s USING (emp_no)
ORDER BY salary DESC;

SELECT COUNT(*) dups, first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING dups > 1;

SELECT CONCAT(first_name, ' ', last_name) AS Employees, COUNT(*) as dups
FROM employees
GROUP BY Employees
HAVING dups > 1;

SELECT *
FROM employees JOIN (
SELECT COUNT(*) AS dups
  FROM employees
  GROUP BY first_name, last_name
  HAVING dups > 1
) tsum;

SELECT GROUP_CONCAT(first_name, " ", last_name SEPARATOR ",") AS `Employee Name`, dept_name AS `Department Name`, CONCAT(first_name, ' ', last_name) AS `Department Manager`
FROM employees
JOIN dept_manager dm USING (emp_no)
JOIN departments d USING (dept_no)
WHERE dm.to_date > NOW();

SELECT CONCAT(e.first_name, " ", e.last_name) AS `Employee Name`, dept_name AS `Department Name`, CONCAT(first_name, ' ', last_name) AS `Department Manager`
FROM employees AS e
JOIN dept_manager AS dm USING (emp_no)
JOIN departments AS d USING (dept_no)
WHERE dm.to_date > NOW();

----------------------------------------------------------------
USE employees;
-- 2. Write a query that shows each department along with the name of the current manager for that department.

-- needed tables: departments, employees table, dept_manager table

SELECT departments.dept_name as 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) as 'Department Manager' FROM departments
JOIN dept_manager
  ON dept_manager.dept_no = departments.dept_no
JOIN employees
  ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > NOW()
ORDER BY `Department Name`;

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager' FROM departments as d
JOIN dept_manager as dm
  ON dm.dept_no = d.dept_no
JOIN employees as e
  ON e.emp_no = dm.emp_no
WHERE dm.to_date > NOW()
ORDER BY `Department Name`;



-- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
       JOIN dept_manager AS m
         ON m.emp_no = e.emp_no
       JOIN departments AS d
         ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND e.gender = 'F'
ORDER BY d.dept_name;

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS "Title", COUNT(*) AS "Count"
FROM departments AS d
       JOIN dept_emp AS de
         ON de.dept_no = d.dept_no
       JOIN titles AS t
         ON t.emp_no = de.emp_no
WHERE de.to_date > NOW()
  AND t.to_date > NOW()
  AND d.dept_name = "Customer Service"
GROUP BY t.title;


-- 5. Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Manager', s.salary
FROM salaries AS s
       JOIN dept_manager AS m
         ON m.emp_no = s.emp_no
       JOIN employees AS e
         ON e.emp_no = m.emp_no
       JOIN departments AS d
         ON d.dept_no = m.dept_no
WHERE m.to_date > NOW()
  AND s.to_date > NOW()
ORDER BY d.dept_name;


-- Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(managers.first_name, ' ', managers.last_name) AS 'Manager Name'
FROM employees AS e
       JOIN dept_emp AS de
         ON de.emp_no = e.emp_no
       JOIN departments AS d
         ON d.dept_no = de.dept_no
       JOIN dept_manager AS m
         ON m.dept_no = d.dept_no
       JOIN employees AS managers
         ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW()
  AND m.to_date > NOW();

SELECT CONCAT(e.first_name, ' ', e.last_name) 'Employee Name',
d.dept_name 'Department Name',
CONCAT(managers.first_name, ' ', managers.last_name) 'Manager Name'
FROM employees e
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no)
JOIN dept_manager m USING (dept_no)
JOIN employees managers
 ON m.emp_no = managers.emp_no
WHERE de.to_date > NOW()
  AND m.to_date > NOW()
  ORDER BY `Department Name`;

SELECT salary 'Checking Duplicates',
COUNT(salary) Duplicate
FROM employees
JOIN salaries s USING (emp_no)
GROUP BY salary
HAVING COUNT(salary) > 1;

SELECT salary 'Checking Duplicates',
COUNT(salary) Duplicate
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY salary
HAVING COUNT(salary) > 1;

SELECT salary 'Checking Duplicates',
COUNT(salary) Duplicate
FROM employees.salaries
GROUP BY salary
HAVING Duplicate > 1
ORDER BY salary DESC;

SELECT first_name, COUNT(first_name),
last_name, COUNT(last_name)
FROM employees
GROUP BY first_name,
last_name
HAVING (COUNT(first_name) > 1)
AND (COUNT(last_name) > 1);

SELECT first_name, COUNT(first_name) 'first name dups',
last_name, COUNT(last_name) 'last name dups'
FROM employees
GROUP BY first_name,
last_name
HAVING (`first name dups` > 1)
AND (`last name dups` > 1);




