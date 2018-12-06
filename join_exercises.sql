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
USING (dept_no)
JOIN employees
USING (emp_no)
WHERE dept_manager.to_date >= NOW()
ORDER BY dept_name;


