# Employee Management System – SQL Project

## 1. Project Overview

The **Employee Management System SQL Project** is a database management and analysis project developed using MySQL. It focuses on managing employee information and analyzing organizational data, including departments, salaries, attendance, leaves, and project assignments.

The project demonstrates practical SQL skills through database operations, data analysis, table relationships, advanced queries, stored procedures, functions, triggers, and transaction management.

The database used in this project is:

`company_management_db`

## 2. Project Objectives

- Understand and manage relational databases.
- Retrieve and analyze employee information.
- Perform employee and department data operations.
- Analyze salary and department-wise employee statistics.
- Understand relationships between multiple database tables.
- Write advanced SQL queries to solve business problems.
- Create reusable database objects.
- Maintain data integrity and database security.

## 3. Tools & Technologies

- **Database:** MySQL
- **Query Language:** SQL
- **Database Tool:** MySQL Workbench

## 4. Database Tables

The project works with the following tables:

| Table Name | Description |
|---|---|
| employees | Stores employee personal and professional information |
| departments | Stores department details |
| attendance | Maintains employee attendance records |
| salaries | Stores employee salary information |
| leaves | Maintains employee leave records |
| projects | Stores project information |
| employee_projects | Connects employees with assigned projects |
| employee_audit | Maintains employee activity and salary-change audit records |

## 5. SQL Concepts Covered

### Phase 1 – SQL Fundamentals
- SHOW DATABASES
- USE DATABASE
- SHOW TABLES
- DESCRIBE
- SELECT
- WHERE
- BETWEEN
- LIKE
- IN
- IS NULL
- ORDER BY
- LIMIT
- DISTINCT
- COUNT

### Phase 2 – Data Manipulation (DML)
- INSERT
- UPDATE
- DELETE
- Filtering records
- Modifying employee and department information

### Phase 3 – Database Constraints & Table Structure
- Primary key and foreign key concepts
- Testing duplicate and invalid records
- NOT NULL constraints
- ALTER TABLE
- ADD COLUMN
- MODIFY COLUMN
- RENAME COLUMN
- DROP COLUMN

### Phase 4 – Aggregate Functions
- COUNT
- SUM
- AVG
- MIN
- MAX
- GROUP BY
- HAVING
- Department-wise salary analysis

### Phase 5 – SQL Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- SELF JOIN
- Multiple-table joins
- Employee and manager relationships
- Department-wise employee analysis

### Phase 6 – Subqueries, CTEs & SQL Functions
- Subqueries
- Correlated subqueries
- Common Table Expressions (CTEs)
- WITH clause
- EXISTS and NOT EXISTS
- String functions
- Date functions
- NULL handling
- IF and CASE statements

### Phase 7 – SQL Functions & Conditional Logic
- UPPER and LOWER
- CONCAT
- LENGTH and CHAR_LENGTH
- TRIM and REPLACE
- CURDATE and NOW
- DATEDIFF
- DATE_ADD
- TIMESTAMPDIFF
- COALESCE
- IFNULL
- NULLIF
- CASE statements
- Conditional salary categorization

### Phase 8 – Advanced SQL & Window Functions
- Common Table Expressions
- ROW_NUMBER
- RANK
- DENSE_RANK
- PARTITION BY
- SUM OVER
- AVG OVER
- COUNT OVER
- LAG
- LEAD
- Running totals
- Department-wise salary ranking
- Salary comparisons

### Phase 9 – Database Exploration & Data Validation
- Table structure inspection
- SHOW CREATE TABLE
- Duplicate employee checks
- Duplicate email checks
- Relationship validation
- Foreign key inspection
- Index inspection
- Employee attendance and salary analysis
- Database metadata using INFORMATION_SCHEMA

### Phase 10 – SQL Views
- CREATE VIEW
- CREATE OR REPLACE VIEW
- SELECT FROM VIEW
- SHOW FULL TABLES
- SHOW CREATE VIEW
- DROP VIEW
- Employee details view
- Department employee summary
- Employee project details
- Employee salary details

### Phase 11 – Stored Procedures & Functions
- CREATE PROCEDURE
- CREATE FUNCTION
- DELIMITER
- IN parameters
- OUT parameters
- IF and ELSEIF logic
- CALL procedure
- RETURN statement
- Salary category function
- Annual salary calculation
- Employee and department reporting procedures

### Phase 12 – SQL Triggers & Audit Management
- CREATE TRIGGER
- BEFORE INSERT
- AFTER INSERT
- AFTER UPDATE
- AFTER DELETE
- OLD and NEW values
- SIGNAL SQLSTATE
- Employee audit table
- Salary-change tracking
- Data validation through triggers

### Phase 13 – Transaction Management
- START TRANSACTION
- COMMIT
- ROLLBACK
- SAVEPOINT
- ROLLBACK TO SAVEPOINT
- SELECT FOR UPDATE
- Transaction isolation levels
- READ COMMITTED
- REPEATABLE READ

### Phase 15 – Database Security & User Management
- CREATE USER
- CREATE ROLE
- GRANT
- REVOKE
- SET DEFAULT ROLE
- SHOW GRANTS
- CURRENT_USER
- Database access management
- Read-only user permissions

## 6. Business Analysis Performed

The SQL queries demonstrate how organizational data can be analyzed to answer business questions, including:

- How many employees work in each department?
- What is the average salary across the organization?
- Which employees earn more than the company average?
- Who are the highest-paid employees in each department?
- Which employees are not assigned to any project?
- Which departments have no employees?
- How many projects are assigned to each employee?
- What is the salary difference between employees?
- How many days has each employee worked?
- Which employees earn more than their managers?
- How many attendance and leave records exist for each employee?

## 7. Key Skills Demonstrated

- SQL Query Writing
- Database Management
- Data Retrieval and Filtering
- Data Manipulation
- Data Cleaning and Validation
- Relational Database Concepts
- Aggregate Analysis
- Advanced SQL Queries
- Data Analysis Using Joins
- Window Functions
- Database Objects
- Transaction Management
- Database Security

## 8. Project Structure

```text
Employee-Management-SQL-Project/
│
├── TASK QUERIES.sql
│
└── README.md
```

## 9. How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Connect to your MySQL database server.
4. Create or select the `company_management_db` database.
5. Open the `TASK QUERIES.sql` file.
6. Execute the queries phase by phase.
7. Review the output and understand the results.

**Important:** Some queries modify or delete records, create database objects, or change user permissions. Run the script on a test database and review each phase before executing it. The script also contains test data and operations that may depend on the existing database state.

## 10. Conclusion

This project demonstrates practical knowledge of SQL and relational database management, starting from basic data retrieval and progressing to advanced SQL concepts.

It provides hands-on experience in analyzing employee data, writing complex queries, maintaining data integrity, automating database operations, managing transactions, and implementing access controls.

**Project Name:** Employee Management System – SQL Project  
**Database:** company_management_db  
**Technology:** MySQL  
**Project Type:** SQL Practice & Database Analysis
