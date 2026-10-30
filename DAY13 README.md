## 1. Database

**Definition:** A database is an organized collection of data stored electronically so that we can easily access, manage, and update it.

**Example:** A company stores customer details, employee information, product details, and sales records in a database.

**Why is it useful?**
- Stores large amounts of data.
- Makes searching and updating data easier.
- Helps analysts retrieve data for reporting.

**Example database name:** `CompanyDB`

## 2. Tables

**Definition:** A table stores related data in rows and columns.

**Example:** An Employees table might contain employee IDs, names, departments, and salaries.

Example records:
- EmployeeID: 101, Name: Rahul, Department: Sales
- EmployeeID: 102, Name: Priya, Department: HR
- EmployeeID: 103, Name: Amit, Department: IT

**Remember:** A table is similar to a worksheet in Excel.

## 3. Rows

**Definition:** A row represents one complete record in a table.

**Example:** The record `101, Rahul, Sales` represents one employee.

**Business example:** One row in a Sales table can represent one sales transaction.

**Remember:** Row = Record.

## 4. Columns

**Definition:** A column represents one particular type of information stored for every record.

**Example:**
- `EmployeeID` stores employee IDs.
- `Name` stores employee names.
- `Department` stores department names.
- `Salary` stores employee salaries.

**Remember:** Column = Field or attribute.

## 5. Primary Key

**Definition:** A primary key is a column, or combination of columns, that uniquely identifies every row in a table.

**Example:** `EmployeeID` can be the primary key in an Employees table.

**Rules:**
- Every primary key value must be unique.
- A primary key cannot contain `NULL`.
- A table has one primary key constraint, which may consist of multiple columns.

**Business example:** Employee IDs distinguish employees even when they have the same name.

## 6. Foreign Key

**Definition:** A foreign key is a column, or combination of columns, that refers to a primary key or another eligible unique key.

**Example:**

The Departments table contains:
- DepartmentID: 1, DepartmentName: Sales
- DepartmentID: 2, DepartmentName: HR

The Employees table contains:
- EmployeeID: 101, Name: Rahul, DepartmentID: 1
- EmployeeID: 102, Name: Priya, DepartmentID: 2

Here, `DepartmentID` is the primary key in Departments and a foreign key in Employees.

**Why is it useful?** It connects related data and helps maintain data consistency.

## 7. Relationships

**Definition:** A relationship describes how data in one table is connected to data in another table.

**Common types:**

**One-to-One (1:1):** One record in a table relates to one record in another table.

Example: One employee has one company-issued ID card record.

**One-to-Many (1:M):** One record relates to multiple records in another table.

Example: One department can have many employees.

**Many-to-Many (M:N):** Multiple records in one table relate to multiple records in another table.

Example: Many students can enroll in many courses. A junction table such as `StudentCourses` is commonly used to manage this relationship.

**Business application:** Relationships help analysts combine customer, order, product, and employee data accurately.

## 8. SELECT

**Definition:** `SELECT` retrieves data from a database.

**Basic syntax:**

```sql
SELECT column_name
FROM table_name;
```

**Example — Retrieve employee names:**

```sql
SELECT Name
FROM Employees;
```

**Retrieve all columns:**

```sql
SELECT *
FROM Employees;
```

The `*` symbol means all columns.

**Business application:** Retrieving sales amounts, customer names, product prices, or employee details for analysis.

**Best practice:** Select only the columns you need when working with large datasets.

## 9. DISTINCT

**Definition:** `DISTINCT` returns unique result rows by removing duplicate combinations of the selected columns.

**Example:**

```sql
SELECT DISTINCT Department
FROM Employees;
```

If multiple employees work in Sales, the result displays Sales only once.

**Example with multiple columns:**

```sql
SELECT DISTINCT Department, JobTitle
FROM Employees;
```

This returns unique combinations of departments and job titles.

**Business application:** Finding unique cities, product categories, departments, or customer segments.

## 10. Aliases

**Definition:** An alias gives a temporary alternative name to a column or table in a query.

**Column alias example:**

```sql
SELECT Name AS EmployeeName
FROM Employees;
```

The output column is displayed as `EmployeeName` instead of `Name`.

**Table alias example:**

```sql
SELECT e.Name
FROM Employees AS e;
```

Here, `e` is a short alias for the Employees table.

**Why is it useful?**
- Makes output headings easier to understand.
- Makes long SQL queries easier to read.
- Helps identify columns when working with multiple tables.

**Remember:** An alias normally changes the name used in the query result, not the actual database column name.

## 11. WHERE

**Definition:** `WHERE` filters rows based on a condition.

**Syntax:**

```sql
SELECT column_name
FROM table_name
WHERE condition;
```

**Example 1 — Find Sales employees:**

```sql
SELECT *
FROM Employees
WHERE Department = 'Sales';
```

**Example 2 — Find employees earning more than ₹30,000:**

```sql
SELECT *
FROM Employees
WHERE Salary > 30000;
```

**Common operators:**

- `=` — Equal to
- `<>` — Not equal to
- `>` — Greater than
- `<` — Less than
- `>=` — Greater than or equal to
- `<=` — Less than or equal to
- `AND` — Both conditions must be true
- `OR` — At least one condition must be true
- `IN` — Matches any value in a list
- `BETWEEN` — Checks whether a value falls within a range, including the endpoints
- `LIKE` — Matches a text pattern
- `IS NULL` — Checks for missing values

**Example using AND:**

```sql
SELECT *
FROM Employees
WHERE Department = 'Sales'
  AND Salary > 30000;
```

This finds Sales employees earning more than ₹30,000.

**Example using IN:**

```sql
SELECT *
FROM Employees
WHERE Department IN ('Sales', 'HR');
```

This returns employees from Sales or HR.

**Example using LIKE:**

```sql
SELECT *
FROM Employees
WHERE Name LIKE 'A%';
```

This finds names starting with A in SQL systems such as MySQL and SQL Server.

**Business application:** Filtering sales by region, finding high-value orders, or identifying employees in a specific department.

## 12. ORDER BY

**Definition:** `ORDER BY` sorts query results in ascending or descending order.

**Ascending order:**

```sql
SELECT *
FROM Employees
ORDER BY Salary ASC;
```

`ASC` sorts from smallest to largest.

**Descending order:**

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC;
```

`DESC` sorts from largest to smallest.

**Sorting by multiple columns:**

```sql
SELECT *
FROM Employees
ORDER BY Department ASC, Salary DESC;
```

This sorts departments alphabetically and then sorts salaries from highest to lowest within each department.

**Business application:** Finding top earners, arranging sales by revenue, or sorting products by price.

## 13. LIMIT

**Definition:** `LIMIT` restricts how many rows a query returns in SQL systems such as MySQL and PostgreSQL.

**Example:**

```sql
SELECT *
FROM Employees
LIMIT 5;
```

This returns up to five rows.

**Example — Find the five highest-paid employees:**

```sql
SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 5;
```

`ORDER BY` sorts the salaries first, and `LIMIT 5` returns the first five rows.

**Important:** SQL Server uses `TOP` or `OFFSET ... FETCH` instead of `LIMIT`.

**SQL Server equivalent:**

```sql
SELECT TOP 5 *
FROM Employees
ORDER BY Salary DESC;
```

**Business application:** Viewing a small sample of records or identifying the top five products by sales.

## 14. Combined SQL Example

**Business question:** Find the five highest-paid employees in the Sales department.

For MySQL or PostgreSQL:

```sql
SELECT
    Name AS EmployeeName,
    Salary
FROM Employees
WHERE Department = 'Sales'
ORDER BY Salary DESC
LIMIT 5;
```

**How the query works:**

1. `SELECT` chooses the Name and Salary columns.
2. `AS EmployeeName` gives the Name column a temporary display name.
3. `FROM Employees` identifies the source table.
4. `WHERE` keeps only Sales employees.
5. `ORDER BY Salary DESC` sorts salaries from highest to lowest.
6. `LIMIT 5` returns the first five rows.

## Quick Revision

- **Database:** An organized collection of data.
- **Table:** Data arranged in rows and columns.
- **Row:** One complete record.
- **Column:** One type of information.
- **Primary key:** Uniquely identifies a record.
- **Foreign key:** Connects records using a referenced key.
- **Relationship:** Describes how tables are connected.
- **SELECT:** Retrieves data.
- **DISTINCT:** Removes duplicate result rows.
- **Alias:** Gives a temporary name to a column or table.
- **WHERE:** Filters rows using conditions.
- **ORDER BY:** Sorts results.
- **LIMIT:** Restricts the number of returned rows in supported SQL systems.

## Day 13 Learning Objective

By the end of this lesson, you should be able to explain basic database concepts, understand how tables are connected, and write simple SQL queries to retrieve, filter, sort, and limit data for analysis.

## Practice Tasks

Assume you have an Employees table with the columns `EmployeeID`, `Name`, `Department`, and `Salary`.

1. Display all employees.
2. Display only employee names.
3. Find all unique departments.
4. Find employees whose salary is greater than ₹30,000.
5. Find employees who work in Sales or HR.
6. Sort employees by salary from highest to lowest.
7. Display the five highest-paid employees.
8. Display employee names using the alias `EmployeeName`.
