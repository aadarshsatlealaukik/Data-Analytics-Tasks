## 1. COUNT()

**Definition:** `COUNT()` counts records or values in SQL.

There are three common ways to use it.

**A. COUNT(*) — Count all rows**

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

This counts all rows in the Employees table, including rows where some columns contain `NULL`.

**B. COUNT(column_name) — Count non-NULL values**

```sql
SELECT COUNT(salary) AS employees_with_salary
FROM employees;
```

This counts employees whose Salary value is not `NULL`.

**C. COUNT(DISTINCT column_name) — Count unique non-NULL values**

```sql
SELECT COUNT(DISTINCT department)
FROM employees;
```

This counts the number of distinct departments represented by non-NULL Department values.

**Business application:** Counting employees, customers, orders, completed transactions, or unique product categories.

**Remember:** `COUNT(*)` counts rows, while `COUNT(column_name)` ignores `NULL` values in that column.

## 2. SUM()

**Definition:** `SUM()` calculates the total of numeric values in a column.

**Syntax:**

```sql
SELECT SUM(column_name)
FROM table_name;
```

**Example — Calculate total sales revenue:**

```sql
SELECT SUM(revenue) AS total_revenue
FROM sales;
```

This adds the revenue values from the Sales table.

**Example — Calculate total salary expense:**

```sql
SELECT SUM(salary) AS total_salary_expense
FROM employees;
```

**Business application:**
- Total sales revenue.
- Total salary expense.
- Total product costs.
- Total monthly expenses.

**Remember:** `SUM()` ignores `NULL` values. If there are no non-NULL values to add, it returns `NULL`.

## 3. AVG()

**Definition:** `AVG()` calculates the average of numeric values.

**Formula:**

`Average = Sum of values / Number of non-NULL values`

**Example — Calculate average salary:**

```sql
SELECT AVG(salary) AS average_salary
FROM employees;
```

**Example — Calculate average order value:**

```sql
SELECT AVG(order_amount) AS average_order_value
FROM orders;
```

**Business application:**
- Average employee salary.
- Average customer spending.
- Average order value.
- Average delivery time.

**Important:** `AVG()` ignores `NULL` values. The average is calculated using only non-NULL numeric values.

## 4. MIN()

**Definition:** `MIN()` returns the smallest value in a column.

**Example — Find the lowest salary:**

```sql
SELECT MIN(salary) AS lowest_salary
FROM employees;
```

**Example — Find the lowest product price:**

```sql
SELECT MIN(price) AS lowest_price
FROM products;
```

`MIN()` can also work with dates and text, using the database's ordering rules.

**Business application:** Finding the lowest salary, cheapest product, earliest order date, or shortest delivery time.

## 5. MAX()

**Definition:** `MAX()` returns the largest value in a column.

**Example — Find the highest salary:**

```sql
SELECT MAX(salary) AS highest_salary
FROM employees;
```

**Example — Find the highest sales revenue:**

```sql
SELECT MAX(revenue) AS highest_revenue
FROM sales;
```

**Business application:** Finding the highest salary, most expensive product, latest order date, or largest transaction.

**Remember:** `MIN()` finds the smallest value; `MAX()` finds the largest value. Both ignore `NULL` values.

## 6. GROUP BY

**Definition:** `GROUP BY` groups rows that have the same value in one or more columns so that aggregate functions can calculate a result for each group.

**Example — Calculate total salary by department:**

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

**How it works:**

1. SQL groups employees with the same department.
2. `SUM(salary)` adds the salaries within each group.
3. The result contains one row per department group.

**Example — Count employees in each department:**

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

**Example — Calculate average salary by department:**

```sql
SELECT department,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

**Example — Calculate revenue by region:**

```sql
SELECT region,
       SUM(revenue) AS total_revenue
FROM sales
GROUP BY region;
```

**Business application:** Analyzing revenue by region, employee count by department, or orders by customer.

**Important rule:** In a grouped query, a selected column generally needs to be included in `GROUP BY` or used inside an aggregate function, subject to the database's rules.

## 7. HAVING

**Definition:** `HAVING` filters groups after `GROUP BY` has grouped the records and calculated aggregate results.

**Example — Find departments with more than 10 employees:**

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 10;
```

Only departments with more than 10 employee records appear in the result.

**Example — Find regions with revenue above ₹1,00,000:**

```sql
SELECT region,
       SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
HAVING SUM(revenue) > 100000;
```

**Difference between WHERE and HAVING:**

- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after grouping.

**Example using both:**

```sql
SELECT department,
       AVG(salary) AS average_salary
FROM employees
WHERE salary > 0
GROUP BY department
HAVING AVG(salary) > 30000;
```

This query:
1. Keeps employee records with a salary greater than zero.
2. Groups the remaining employees by department.
3. Calculates each department's average salary.
4. Returns departments whose average salary exceeds ₹30,000.

**Business application:** Finding regions with high revenue, departments with many employees, or customers with large total purchases.

## 8. CASE

**Definition:** `CASE` adds conditional logic to a SQL query. It works like an IF-ELSE statement in programming or Excel.

**Basic syntax:**

```sql
SELECT column_name,
       CASE
           WHEN condition1 THEN result1
           WHEN condition2 THEN result2
           ELSE default_result
       END AS new_column
FROM table_name;
```

**Example — Classify employees by salary:**

```sql
SELECT employee_name,
       salary,
       CASE
           WHEN salary >= 50000 THEN 'High Salary'
           WHEN salary >= 30000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM employees;
```

**How it works:**
- Salary of ₹50,000 or more → High Salary.
- Salary of ₹30,000 to less than ₹50,000 → Medium Salary.
- Salary below ₹30,000 → Low Salary.

SQL checks the `WHEN` conditions in order and returns the result for the first condition that is true.

**Example — Classify sales performance:**

```sql
SELECT salesperson_id,
       revenue,
       CASE
           WHEN revenue >= 100000 THEN 'Excellent'
           WHEN revenue >= 50000 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance
FROM sales;
```

**Business application:** Creating salary categories, sales performance labels, customer segments, or order status categories.

### CASE with GROUP BY

You can use `CASE` inside aggregate functions to calculate conditional totals.

**Example — Count employees by salary category:**

```sql
SELECT
    SUM(CASE
        WHEN salary >= 50000 THEN 1
        ELSE 0
    END) AS high_salary_count
FROM employees;
```

This counts employees earning at least ₹50,000.

**Example — Count won deals:**

Assume the Sales table contains a `status` column.

```sql
SELECT
    SUM(CASE
        WHEN status = 'Won' THEN 1
        ELSE 0
    END) AS won_deals
FROM sales;
```

This counts the records whose status is Won.

## 9. Combined Business Analysis Example

**Business question:** Find departments that have more than five employees and an average salary above ₹30,000, and classify their average salary.

```sql
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary,
    SUM(salary) AS total_salary,
    CASE
        WHEN AVG(salary) >= 50000 THEN 'High'
        WHEN AVG(salary) >= 30000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_level
FROM employees
GROUP BY department
HAVING COUNT(*) > 5
   AND AVG(salary) > 30000;
```

**How this query works:**

1. `FROM employees` selects the source data.
2. `GROUP BY department` groups employees by department.
3. `COUNT(*)` counts employees in each department.
4. `AVG(salary)` calculates the average salary.
5. `SUM(salary)` calculates total salary expense.
6. `CASE` classifies the average salary.
7. `HAVING` keeps only departments with more than five employees and an average salary above ₹30,000.

**Business insight:** This query helps compare departmental headcount, salary expense, and average salary level.

## Quick Revision

- **COUNT():** Counts rows or non-NULL values, depending on its form.
- **SUM():** Calculates the total of numeric values.
- **AVG():** Calculates the average of non-NULL numeric values.
- **MIN():** Returns the smallest value.
- **MAX():** Returns the largest value.
- **GROUP BY:** Groups records to calculate aggregate results.
- **HAVING:** Filters groups based on conditions.
- **CASE:** Applies conditional logic and creates categories.

## Day 15 Learning Objective

By the end of this lesson, you should be able to calculate totals and averages, count records, find minimum and maximum values, summarize data by groups, filter grouped results, and create business categories using SQL.
