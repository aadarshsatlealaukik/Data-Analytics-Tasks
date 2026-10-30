---------------------------------------- PAHSE 1 ALL TASKS --------------------------------------------
 
SHOW DATABASES;
USE company_management_db;
SHOW tables;

describe attendance;
describe departments;
describe employee_projects;
describe employees;
describe leaves;
describe projects;
describe salaries;

SELECT * FROM employees;
SELECT first_name, last_name, email, job_title 
FROM employees;

SELECT employee_id, first_name, last_name, salary
From employees
Where salary>50000;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

SELECT first_name FROM employees 
where first_name LIKE 'a%';

SELECT *  FROM employees where 
department_id IN(1,2,3);

select employee_id FROM employees WHERE phone is NULL;

SELECT * from employees
Order By salary ASC;

SELECT employee_id, first_name, last_name, job_title, salary
FROM employees
ORDER BY salary DESC
LIMIT 5; 

SELECT DISTINCT job_title from employees;

SELECT COUNT(employee_id) From employees;

--------------------------------------------- PHASE 2 TASKS ---------------------------------------------------
SELECT * From departments;

INSERT INTO departments (department_name, location)
VALUES ('Research', 'Indore');

INSERT INTO employees
(first_name, last_name, email, phone, gender,
 hire_date, job_title, salary, department_id,
 manager_id, employment_status, created_at)
VALUES
('Sahil', 'Talreja', 'sahil@gmail.com', '900000012',
 'Male', '2003-03-02', 'HR', 30000, 1,
 6, 'Active', '2026-10-13 14:08:47');
 
SELECT * from employees where employee_id=2;

SELECT * from employees where email= 'sahil@gmail.com';

UPDATE employees SET salary = 40000 where 	department_id =6; 

UPDATE employees SET job_title  = 'HR' where employee_id=2;

SELECT * from employees;

UPDATE employees
SET salary = salary + (10 / 100 * salary) where employee_id>0;

DELETE FROM departments
WHERE department_name = 'Research';

delete from employees where employee_id =13;

SELECT* from departments;

-------------------------------------------- PHASE 3 TASKS --------------------------------------------------------------
USE company_management_db;
DESC employees;

SELECT employee_id, first_name, email
FROM employees
WHERE email = 'priya@demo.com';

INSERT INTO employees
(first_name, last_name, email, hire_date, job_title, salary, department_id)
VALUES

('Test', 'User', 'priya@demo.com', '2026-01-01', 'Tester', 30000, 2);

INSERT INTO employees
(
    first_name,
    last_name,
    email,
    hire_date,
    job_title,
    salary,
    department_id
)
VALUES
(
    'Negative',
    'SalaryTest',
    'negative.test@example.com',
    '2026-01-01',
    'Tester',
    -5000,
    2
);

SELECT *
FROM departments;
INSERT INTO employees
(
    first_name,
    last_name,
    email,
    hire_date,
    job_title,
    salary,
    department_id
)
VALUES
(
    'Foreign',
    'KeyTest',
    'foreign.key.test@example.com',
    '2026-01-01',
    'Tester',
    30000,
    9999
);

INSERT INTO departments (department_name, location)
VALUES ('Test Department', 'Indore');

SELECT department_id, department_name
FROM departments
WHERE department_name = 'Test Department';

UPDATE employees
SET department_id = 6
WHERE employee_id = 2; 

select * from departments;

SELECT employee_id, first_name, department_id
FROM employees
WHERE employee_id = 2;

DELETE FROM departments
WHERE department_id = 10;

UPDATE employees
SET department_id = 2
WHERE employee_id = 2;

SELECT department_id
FROM departments
WHERE department_id = 2;

INSERT INTO employees
(
    first_name,
    last_name,
    email,
    hire_date,
    job_title,
    salary,
    department_id
)
VALUES
(
    'Cascade',
    'Test',
    'cascade.test@example.com',
    '2026-01-01',
    'Tester',
    30000,
    2
);
INSERT INTO attendance
(employee_id, attendance_date, attendance_status)
VALUES
(13, '2026-01-02', 'Present');

SELECT *
FROM employees
WHERE employee_id = 21;

INSERT INTO employees
(first_name, last_name, email, hire_date,
 job_title, salary, department_id)
VALUES
('Cascade', 'Test', 'cascade.test@example.com',
 '2026-01-01', 'Tester', 30000, 2);

SELECT employee_id, first_name, email
FROM employees
WHERE email = 'cascade.test@example.com';

INSERT INTO attendance
(employee_id, attendance_date, attendance_status)
VALUES
(21, '2026-01-02', 'Present');

ALTER TABLE employees
ADD COLUMN city VARCHAR(100);
UPDATE employees
SET city = 'Indore'
WHERE employee_id = 2;

SELECT employee_id, first_name, city
FROM employees
WHERE employee_id = 2;

ALTER TABLE employees
MODIFY COLUMN job_title VARCHAR(150) NOT NULL;

SELECT employee_id, job_title
FROM employees
WHERE job_title IS NULL;

ALTER TABLE employees
RENAME COLUMN city TO employee_city;

select* from employees;

ALTER TABLE employees
DROP COLUMN employee_city;


------------------------------------------------ PHASE 4 TASKS ---------------------------------------------

SELECT COUNT(*) AS total_employees
FROM employees;

SELECT COUNT(salary) AS total_employees
FROM employees;

SELECT SUM(salary) AS total_salary
FROM employees;

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT MIN(salary) AS lowest_salary
FROM employees;

SELECT MAX(salary) AS lowest_salary
FROM employees;

SELECT
    department_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department_id;

SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY average_salary DESC;

SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 3;

SELECT
    department_id,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

----------------------------------------- PHASE 5 TASKS ---------------------------------------------------

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;
    
    SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;
    
SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.first_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;
    
    SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    p.project_id,
    p.project_name,
    ep.assigned_role
FROM employees AS e
INNER JOIN employee_projects AS ep
    ON e.employee_id = ep.employee_id
INNER JOIN projects AS p
    ON ep.project_id = p.project_id;
    
SELECT
    e.employee_id,
    e.first_name AS employee_name,
    m.first_name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;
    
    SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_salary DESC;

------------------------------------------ PHASE 6 TASKS -------------------------------------------------

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments AS d
INNER JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > (
    SELECT AVG(salary)
    FROM employees
);

SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees AS e
WHERE NOT EXISTS (
    SELECT 1
    FROM employee_projects AS ep
    WHERE ep.employee_id = e.employee_id
);

SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);

UPDATE employees
SET salary = 250000
WHERE employee_id = 4;

WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    ca.avg_salary
FROM employees AS e
CROSS JOIN company_average AS ca
WHERE e.salary > ca.avg_salary;

WITH department_summary AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        AVG(salary) AS average_salary
    FROM employees
    WHERE department_id IS NOT NULL
    GROUP BY department_id
),
large_departments AS (
    SELECT *
    FROM department_summary
    WHERE total_employees >= 2
)
SELECT
    d.department_name,
    ld.total_employees,
    ld.average_salary
FROM large_departments AS ld
INNER JOIN departments AS d
    ON ld.department_id = d.department_id
ORDER BY ld.average_salary DESC;

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    e.manager_id
FROM employees AS e
WHERE e.manager_id IS NOT NULL
  AND e.salary > (
      SELECT m.salary
      FROM employees AS m
      WHERE m.employee_id = e.manager_id
  );
  
  SELECT
    d.department_id,
    d.department_name
FROM departments AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees AS e
    WHERE e.department_id = d.department_id
);

WITH high_salary_employees AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        salary
    FROM employees
    WHERE salary > 30000
)
SELECT *
FROM high_salary_employees
ORDER BY salary DESC;

SELECT first_name,
upper(first_name) as uppercase_name,
lower(first_name) as lowercase_name 
from employees;


Select employee_id,
CONCAT(first_name,' ', last_name) as full_name
from employees;

SELECT
first_name,
LENGTH(first_name) as bytes_count,
char_length(first_name) as Charatcers_count
From employees;

Select trim('  Data Analyst  ') as cleaned_text;

SELECT REPLACE('Data analyst Inter', 'Intern', 'Professional')
as updated_title;


select curdate() as today_date;


select now() as curent_date_time;


SELECT
    first_name,
    hire_date,
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    DAY(hire_date) AS hire_day
FROM employees;

SELECT
    first_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_employed
FROM employees;

SELECT
    hire_date,
    DATE_ADD(hire_date, INTERVAL 1 YEAR) AS one_year_anniversary
FROM employees;

SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE department_id IS NULL;

SELECT
    employee_id,
    first_name,
    COALESCE(department_id, 0) AS department_id
FROM employees;

SELECT
    employee_id,
    first_name,
    IFNULL(department_id, 0) AS department_id
FROM employees;

SELECT
    employee_id,
    first_name,
    salary,
    IF(salary >= 50000, 'High Salary', 'Standard Salary')
        AS salary_category
FROM employees;


SELECT
    employee_id,
    first_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'Very High'
        WHEN salary >= 50000 THEN 'High'
        WHEN salary >= 30000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;  

 SELECT
    employee_id,
    UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees;


SELECT
    employee_id,
    first_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_employed
FROM employees
WHERE DATEDIFF(CURDATE(), hire_date) > 365;

SELECT
    CASE
        WHEN salary >= 70000 THEN 'Very High'
        WHEN salary >= 50000 THEN 'High'
        WHEN salary >= 30000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary >= 70000 THEN 'Very High'
        WHEN salary >= 50000 THEN 'High'
        WHEN salary >= 30000 THEN 'Medium'
        ELSE 'Low'
    END;
    
    SELECT
    employee_id,
    first_name,
    COALESCE(CAST(department_id AS CHAR), 'Not Assigned')
        AS department_status
FROM employees;

SELECT *
FROM attendance
WHERE attendance_date >= '2026-01-01'
  AND attendance_date < '2026-02-01' ;
  
--------------------------------------- PHASE 7 --------------------------------------------------
USE company_management_db;

SELECT employee_id, UPPER(first_name) AS uppercase_name
FROM employees;

SELECT employee_id, LOWER(first_name) AS lowercase_name
FROM employees;

SELECT employee_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT first_name, LENGTH(first_name) AS name_length
FROM employees;

SELECT first_name, CHAR_LENGTH(first_name) AS character_count
FROM employees;

SELECT TRIM('   Aadarsh Satle   ') AS cleaned_name;

SELECT REPLACE('Employee Management System', 'Employee', 'Staff') AS updated_text;

SELECT CURDATE() AS current_date;

SELECT NOW() AS current_datetime;

SELECT employee_id, first_name, YEAR(date_of_birth) AS birth_year
FROM employees;

SELECT employee_id, first_name, MONTH(date_of_birth) AS birth_month
FROM employees;

SELECT employee_id, first_name, DAY(date_of_birth) AS birth_day
FROM employees;

SELECT employee_id, first_name,
       TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM employees;

SELECT employee_id, first_name,
       DATEDIFF(CURDATE(), hire_date) AS days_since_joining
FROM employees;

SELECT DATE_ADD(CURDATE(), INTERVAL 30 DAY) AS date_after_30_days;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id IS NULL;

SELECT employee_id, first_name,
       COALESCE(department_id, 0) AS department_id
FROM employees;

SELECT employee_id, first_name,
       COALESCE(manager_id, 0) AS manager_id
FROM employees;

SELECT employee_id, first_name,
       IFNULL(salary, 0) AS salary
FROM employees;

SELECT NULLIF(100, 100) AS result;

SELECT employee_id, first_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;

SELECT employee_id, first_name, salary,
       IF(salary >= 50000, 'High Salary', 'Regular Salary') AS salary_category
FROM employees;

SELECT employee_id, first_name, salary,
       CASE
           WHEN salary >= 80000 THEN 'Very High Salary'
           WHEN salary >= 50000 THEN 'High Salary'
           WHEN salary >= 30000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM employees;

SELECT employee_id, first_name, department_id,
       CASE
           WHEN department_id = 1 THEN 'HR'
           WHEN department_id = 2 THEN 'IT'
           WHEN department_id = 3 THEN 'Finance'
           WHEN department_id IS NULL THEN 'No Department'
           ELSE 'Other Department'
       END AS department_category
FROM employees;

WITH department_average AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM department_average;

WITH department_average AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id, e.first_name, e.department_id,
       e.salary, da.avg_salary
FROM employees AS e
JOIN department_average AS da
    ON e.department_id = da.department_id
WHERE e.salary > da.avg_salary;

--------------------------------------------------- PHASE 8 -----------------------------------------------
USE company_management_db;

WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.employee_id, e.first_name, e.salary, ca.avg_salary
FROM employees AS e
CROSS JOIN company_average AS ca
WHERE e.salary > ca.avg_salary;

WITH department_average AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM department_average;

WITH department_average AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.employee_id, e.first_name, e.department_id,
       e.salary, da.avg_salary
FROM employees AS e
JOIN department_average AS da
    ON e.department_id = da.department_id
WHERE e.salary > da.avg_salary;

WITH department_salary AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
company_salary AS (
    SELECT AVG(salary) AS company_avg_salary
    FROM employees
)
SELECT ds.department_id, ds.avg_salary, cs.company_avg_salary
FROM department_salary AS ds
CROSS JOIN company_salary AS cs
WHERE ds.avg_salary > cs.company_avg_salary;

SELECT employee_id, first_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

SELECT employee_id, first_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

SELECT employee_id, first_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

SELECT employee_id, first_name, department_id, salary,
       DENSE_RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS department_salary_rank
FROM employees;

WITH ranked_employees AS (
    SELECT employee_id, first_name, department_id, salary,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT employee_id, first_name, department_id, salary, salary_rank
FROM ranked_employees
WHERE salary_rank <= 2
ORDER BY department_id, salary DESC;

SELECT employee_id, first_name, salary,
       SUM(salary) OVER (
           ORDER BY employee_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_salary_total
FROM employees;

SELECT employee_id, first_name, salary,
       LAG(salary) OVER (
           ORDER BY salary, employee_id
       ) AS previous_salary
FROM employees;

SELECT employee_id, first_name, salary,
       LEAD(salary) OVER (
           ORDER BY salary, employee_id
       ) AS next_salary
FROM employees;

SELECT employee_id, first_name, salary,
       salary - LAG(salary) OVER (
           ORDER BY salary, employee_id
       ) AS salary_difference
FROM employees;

SELECT employee_id, first_name, department_id, salary,
       AVG(salary) OVER (
           PARTITION BY department_id
       ) AS department_avg_salary
FROM employees;

WITH employee_analysis AS (
    SELECT employee_id, first_name, department_id, salary,
           AVG(salary) OVER (
               PARTITION BY department_id
           ) AS department_avg_salary
    FROM employees
)
SELECT employee_id, first_name, department_id,
       salary, department_avg_salary
FROM employee_analysis
WHERE salary > department_avg_salary;

SELECT employee_id, first_name, department_id,
       COUNT(*) OVER (
           PARTITION BY department_id
       ) AS employees_in_department
FROM employees;

SELECT employee_id,
       CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name,
       salary,
       CASE
           WHEN salary >= 80000 THEN 'Very High'
           WHEN salary >= 50000 THEN 'High'
           WHEN salary >= 30000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category,
       DENSE_RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS department_salary_rank
FROM employees;

WITH ranked_employees AS (
    SELECT employee_id,
           CONCAT(first_name, ' ', last_name) AS full_name,
           department_id, salary,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT employee_id, full_name, department_id, salary
FROM ranked_employees
WHERE salary_rank = 1;

SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       hire_date,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_of_service
FROM employees
ORDER BY years_of_service DESC;

WITH company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.employee_id,
       CONCAT(e.first_name, ' ', e.last_name) AS full_name,
       e.salary, ca.avg_salary,
       CASE
           WHEN e.salary >= 80000 THEN 'Very High'
           WHEN e.salary >= 50000 THEN 'High'
           ELSE 'Medium or Low'
       END AS salary_category
FROM employees AS e
CROSS JOIN company_average AS ca
WHERE e.salary > ca.avg_salary
ORDER BY e.salary DESC;

SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age,
       salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

------------------------------------------- PHASE 9 -----------------------------------------------------

USE company_management_db;

SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM projects;

SELECT * FROM employee_projects;

SELECT * FROM attendance;

SELECT * FROM salaries;

SELECT * FROM leaves;

DESCRIBE departments;

DESCRIBE employees;

DESCRIBE projects;

DESCRIBE employee_projects;

DESCRIBE attendance;

DESCRIBE salaries;

DESCRIBE leaves;

SHOW CREATE TABLE departments;

SHOW CREATE TABLE employees;

SHOW CREATE TABLE projects;

SHOW CREATE TABLE employee_projects;

SHOW CREATE TABLE attendance;

SHOW CREATE TABLE salaries;

SHOW CREATE TABLE leaves;

SELECT
    employee_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

SELECT
    email,
    COUNT(*) AS email_count
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

SELECT
    department_id,
    department_name
FROM departments
ORDER BY department_id;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

SELECT
    ep.employee_id,
    ep.project_id,
    e.first_name,
    e.last_name,
    p.project_name
FROM employee_projects AS ep
JOIN employees AS e
    ON ep.employee_id = e.employee_id
JOIN projects AS p
    ON ep.project_id = p.project_id;

SELECT
    employee_id,
    project_id,
    COUNT(*) AS assignment_count
FROM employee_projects
GROUP BY employee_id, project_id
HAVING COUNT(*) > 1;

SELECT
    employee_id,
    salary_month,
    COUNT(*) AS salary_record_count
FROM salaries
GROUP BY employee_id, salary_month
HAVING COUNT(*) > 1;

SELECT
    employee_id,
    attendance_date,
    COUNT(*) AS attendance_record_count
FROM attendance
GROUP BY employee_id, attendance_date
HAVING COUNT(*) > 1;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(ep.project_id) AS total_projects
FROM employees AS e
LEFT JOIN employee_projects AS ep
    ON e.employee_id = ep.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name;

SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.salary_month,
    s.basic_salary,
    s.bonus,
    s.deductions,
    s.net_salary
FROM employees AS e
JOIN salaries AS s
    ON e.employee_id = s.employee_id
ORDER BY e.employee_id, s.salary_month;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(l.leave_id) AS total_leave_records
FROM employees AS e
LEFT JOIN leaves AS l
    ON e.employee_id = l.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(a.attendance_date) AS attendance_days
FROM employees AS e
LEFT JOIN attendance AS a
    ON e.employee_id = a.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'company_management_db'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME,
    NON_UNIQUE
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'company_management_db'
ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX;

---------------------------------------------- PHASE 10 --------------------------------------------------

USE company_management_db;

CREATE VIEW employee_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.job_title,
    e.salary,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

SELECT * FROM employee_details;

SELECT employee_id, first_name, last_name, department_name
FROM employee_details;

SELECT *
FROM employee_details
WHERE salary > 50000;

CREATE VIEW high_salary_employees AS
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 50000;

SELECT * FROM high_salary_employees;

CREATE OR REPLACE VIEW department_employee_summary AS
SELECT
    d.department_id,
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

SELECT * FROM department_employee_summary;

SELECT *
FROM department_employee_summary
ORDER BY average_salary DESC;

CREATE VIEW employee_project_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    p.project_id,
    p.project_name,
    ep.assigned_role,
    ep.assigned_date,
    ep.hours_allocated
FROM employees AS e
JOIN employee_projects AS ep
    ON e.employee_id = ep.employee_id
JOIN projects AS p
    ON ep.project_id = p.project_id;

SELECT * FROM employee_project_details;

SELECT *
FROM employee_project_details
WHERE employee_id = 1;

CREATE VIEW employee_salary_details AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    s.salary_month,
    s.basic_salary,
    s.bonus,
    s.deductions,
    s.net_salary
FROM employees AS e
JOIN salaries AS s
    ON e.employee_id = s.employee_id;

SELECT * FROM employee_salary_details;

SELECT *
FROM employee_salary_details
ORDER BY net_salary DESC;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SHOW CREATE VIEW employee_details;

DROP VIEW IF EXISTS high_salary_employees;


--------------------------------------------- PHASE 11 ---------------------------------------------------

USE company_management_db;

SHOW FUNCTION STATUS
WHERE Db = 'company_management_db'
AND Name = 'GetSalaryCategory';

USE company_management_db;

DELIMITER $$

CREATE FUNCTION GetSalaryCategory(emp_salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE salary_category VARCHAR(20);

    IF emp_salary >= 80000 THEN
        SET salary_category = 'Very High';
    ELSEIF emp_salary >= 50000 THEN
        SET salary_category = 'High';
    ELSEIF emp_salary >= 30000 THEN
        SET salary_category = 'Medium';
    ELSE
        SET salary_category = 'Low';
    END IF;

    RETURN salary_category;
END $$

DELIMITER ;



USE company_management_db;

DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT *
    FROM employees;
END $$

DELIMITER ;

CALL GetAllEmployees();


DELIMITER $$

CREATE PROCEDURE GetEmployeeByID(IN emp_id INT)
BEGIN
    SELECT *
    FROM employees
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL GetEmployeeByID(1);


DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name,
        job_title,
        salary
    FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL GetEmployeesByDepartment(2);


DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalary(IN min_salary DECIMAL(10,2))
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name,
        salary
    FROM employees
    WHERE salary >= min_salary
    ORDER BY salary DESC;
END $$

DELIMITER ;

CALL GetEmployeesBySalary(50000);


DELIMITER $$

CREATE PROCEDURE GetDepartmentEmployeeCount(IN dept_id INT)
BEGIN
    SELECT
        d.department_id,
        d.department_name,
        COUNT(e.employee_id) AS total_employees
    FROM departments AS d
    LEFT JOIN employees AS e
        ON d.department_id = e.department_id
    WHERE d.department_id = dept_id
    GROUP BY d.department_id, d.department_name;
END $$

DELIMITER ;

CALL GetDepartmentEmployeeCount(2);


DELIMITER $$

CREATE PROCEDURE UpdateEmployeeSalary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = new_salary
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL UpdateEmployeeSalary(1, 55000);

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;


DELIMITER $$

CREATE PROCEDURE GetSalaryByEmployee(
    IN emp_id INT,
    OUT emp_salary DECIMAL(10,2)
)
BEGIN
    SELECT salary
    INTO emp_salary
    FROM employees
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL GetSalaryByEmployee(1, @employee_salary);

SELECT @employee_salary AS employee_salary;


DELIMITER $$

CREATE FUNCTION CalculateAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN monthly_salary * 12;
END $$

DELIMITER ;

SELECT
    employee_id,
    first_name,
    salary,
    CalculateAnnualSalary(salary) AS annual_salary
FROM employees;


DELIMITER $$

CREATE FUNCTION GetSalaryCategory(emp_salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE salary_category VARCHAR(20);

    IF emp_salary >= 80000 THEN
        SET salary_category = 'Very High';
    ELSEIF emp_salary >= 50000 THEN
        SET salary_category = 'High';
    ELSEIF emp_salary >= 30000 THEN
        SET salary_category = 'Medium';
    ELSE
        SET salary_category = 'Low';
    END IF;

    RETURN salary_category;
END $$

DELIMITER ;

SELECT
    employee_id,
    first_name,
    salary,
    GetSalaryCategory(salary) AS salary_category
FROM employees;


SHOW PROCEDURE STATUS
WHERE Db = 'company_management_db';

SHOW FUNCTION STATUS
WHERE Db = 'company_management_db';

DROP PROCEDURE IF EXISTS GetAllEmployees;

DROP PROCEDURE IF EXISTS GetEmployeeByID;

DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;

DROP PROCEDURE IF EXISTS GetEmployeesBySalary;

DROP PROCEDURE IF EXISTS GetDepartmentEmployeeCount;

DROP PROCEDURE IF EXISTS UpdateEmployeeSalary;

DROP PROCEDURE IF EXISTS GetSalaryByEmployee;

DROP FUNCTION IF EXISTS CalculateAnnualSalary;

DROP FUNCTION IF EXISTS GetSalaryCategory;


----------------------------------------- PHASE 12 ------------------------------------------------------

USE company_management_db;

CREATE TABLE IF NOT EXISTS employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_type VARCHAR(20) NOT NULL,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details VARCHAR(255)
);

DROP TRIGGER IF EXISTS before_employee_insert;
DROP TRIGGER IF EXISTS after_employee_insert;
DROP TRIGGER IF EXISTS after_employee_update;
DROP TRIGGER IF EXISTS after_employee_delete;

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (
        employee_id,
        action_type,
        new_salary,
        details
    )
    VALUES (
        NEW.employee_id,
        'INSERT',
        NEW.salary,
        'New employee added'
    );
END $$

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NOT (OLD.salary <=> NEW.salary) THEN
        INSERT INTO employee_audit (
            employee_id,
            action_type,
            old_salary,
            new_salary,
            details
        )
        VALUES (
            NEW.employee_id,
            'UPDATE',
            OLD.salary,
            NEW.salary,
            'Employee salary changed'
        );
    END IF;
END $$

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (
        employee_id,
        action_type,
        old_salary,
        details
    )
    VALUES (
        OLD.employee_id,
        'DELETE',
        OLD.salary,
        'Employee deleted'
    );
END $$

DELIMITER ;

SHOW TRIGGERS FROM company_management_db;

INSERT INTO employees (
    first_name,
    last_name,
    email,
    salary,
    department_id
)
VALUES (
    'Test',
    'Employee',
    'trigger.test@example.com',
    35000,
    1
);

SELECT *
FROM employee_audit
ORDER BY audit_id DESC;

UPDATE employees
SET salary = salary + 1000
WHERE email = 'trigger.test@example.com';

SELECT *
FROM employee_audit
WHERE action_type = 'UPDATE'
ORDER BY audit_id DESC;

INSERT INTO employees (
    first_name,
    last_name,
    email,
    salary,
    department_id
)
VALUES (
    'Invalid',
    'Salary',
    'negative.salary@example.com',
    -5000,
    1
);

DELETE FROM employees
WHERE email = 'trigger.test@example.com';

SELECT *
FROM employee_audit
ORDER BY audit_id DESC;


---------------------------------------- PHASE 13 --------------------------------------------------------

USE company_management_db;

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

ROLLBACK;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;


START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

COMMIT;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;


START TRANSACTION;

UPDATE employees
SET salary = salary + 500
WHERE employee_id = 1;

SAVEPOINT salary_update_point;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

ROLLBACK TO SAVEPOINT salary_update_point;

COMMIT;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;


START TRANSACTION;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1
FOR UPDATE;

COMMIT;


START TRANSACTION;

SELECT employee_id, first_name, salary
FROM employees
WHERE department_id = 1
FOR UPDATE;

COMMIT;


START TRANSACTION;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 1;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 2;

COMMIT;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id IN (1, 2);


START TRANSACTION;

UPDATE employees
SET salary = salary + 500
WHERE employee_id = 1;

UPDATE employees
SET salary = salary + 500
WHERE employee_id = 2;

ROLLBACK;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id IN (1, 2);


SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

COMMIT;


SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

SELECT employee_id, first_name, salary
FROM employees
WHERE employee_id = 1;

COMMIT;


SHOW VARIABLES LIKE 'transaction_isolation';

--------------------------------------------- PHASE 15 ---------------------------------------------------

USE company_management_db;

CREATE USER IF NOT EXISTS 'report_user'@'localhost'
IDENTIFIED BY 'ChangeThis_StrongPassword123!';

GRANT SELECT
ON company_management_db.*
TO 'report_user'@'localhost';

SHOW GRANTS FOR 'report_user'@'localhost';

CREATE ROLE IF NOT EXISTS 'employee_read_only';

GRANT SELECT
ON company_management_db.*
TO 'employee_read_only';

GRANT 'employee_read_only'
TO 'report_user'@'localhost';

SET DEFAULT ROLE 'employee_read_only'
TO 'report_user'@'localhost';

SHOW GRANTS FOR 'employee_read_only';

SHOW GRANTS FOR 'report_user'@'localhost';

SELECT CURRENT_USER();

SHOW DATABASES;

SHOW TABLES;

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SHOW TRIGGERS FROM company_management_db;

SHOW PROCEDURE STATUS
WHERE Db = 'company_management_db';

SHOW FUNCTION STATUS
WHERE Db = 'company_management_db';

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'company_management_db';

SELECT
    TABLE_NAME,
    INDEX_NAME,
    COLUMN_NAME
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = 'company_management_db';

START TRANSACTION;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE employee_id = 1;

ROLLBACK;

REVOKE SELECT
ON company_management_db.*
FROM 'report_user'@'localhost';

GRANT SELECT
ON company_management_db.*
TO 'report_user'@'localhost';

SHOW GRANTS FOR 'report_user'@'localhost';


