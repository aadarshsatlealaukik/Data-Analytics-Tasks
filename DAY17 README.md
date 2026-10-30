# SQL Advanced Queries — Complete Notes

## Learning Objectives

By the end of this lesson, you will be able to:

- Combine results from multiple queries using `UNION` and `UNION ALL`.
- Write subqueries to solve complex business questions.
- Understand correlated and non-correlated subqueries.
- Use CTEs to make SQL queries cleaner and easier to read.
- Combine multiple CTEs in a single query.
- Solve real-world business analysis problems using SQL.

---

## 1. UNION

### What is UNION?

`UNION` combines the results of two or more `SELECT` queries into a single result.

**Important:** `UNION` removes duplicate rows from the final result.

### Syntax

```sql
SELECT column_name
FROM table1

UNION

SELECT column_name
FROM table2;
```

### Example

Suppose you have two tables: `employees` and `customers`. Both contain a `first_name` column.

```sql
SELECT first_name
FROM employees

UNION

SELECT first_name
FROM customers;
```

This query combines employee and customer names into one list and removes duplicate names.

### Rules of UNION

- Each `SELECT` must return the same number of columns.
- Corresponding columns should have compatible data types.
- Column names in the result generally come from the first `SELECT`.
- `UNION` removes duplicate complete rows, not merely duplicate values in one column.

### Business use case

A company wants a combined list of people who are either employees or customers, without duplicate names.

---

## 2. UNION ALL

### What is UNION ALL?

`UNION ALL` combines the results of multiple `SELECT` queries but **keeps duplicate rows**.

### Syntax

```sql
SELECT column_name
FROM table1

UNION ALL

SELECT column_name
FROM table2;
```

### Example

```sql
SELECT first_name
FROM employees

UNION ALL

SELECT first_name
FROM customers;
```

If the name `Rahul` appears three times across the results, all three rows remain.

### Difference between UNION and UNION ALL

- `UNION`: removes duplicate rows.
- `UNION ALL`: keeps duplicate rows.
- `UNION ALL` is generally faster because it does not need to remove duplicates.

### Business use case

A business wants to combine sales records from January and February. If two transactions have identical displayed values, both must remain because they may represent separate transactions.

```sql
SELECT order_id, order_date, total_amount
FROM january_orders

UNION ALL

SELECT order_id, order_date, total_amount
FROM february_orders;
```

**Note:** The example assumes the two monthly tables have matching columns and compatible data types.

---

## 3. Subqueries

### What is a subquery?

A subquery is a query written inside another SQL query.

The inner query produces a result that the outer query uses to filter, calculate, or retrieve data.

A subquery is also called an **inner query** or **nested query**.

### Basic syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name operator (
    SELECT column_name
    FROM another_table
);
```

### Example 1: Employees earning more than the company average

First, calculate the average salary:

```sql
SELECT AVG(salary)
FROM employees;
```

Now use that calculation inside another query:

```sql
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

### Explanation

1. The inner query calculates the average salary of all employees.
2. The outer query compares each employee's salary with that average.
3. Only employees earning more than the average are returned.

### Example 2: Find employees earning more than the average salary of their department

```sql
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
```

This is a correlated subquery because the inner query refers to the current employee's department from the outer query.

### Example 3: Find employees working in the IT department

```sql
SELECT
    employee_id,
    first_name,
    department_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'IT'
);
```

This assumes the department name `IT` exists only once.

### Example 4: Find customers who have placed orders

```sql
SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
```

`IN` checks whether a value appears in the list returned by the subquery.

### Example 5: Find customers who have never placed an order

```sql
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
);
```

`NOT EXISTS` checks whether the inner query returns no matching rows. This is often a good way to find records with no related records.

---

## 4. Correlated Subquery Concept

### What is a correlated subquery?

A correlated subquery is an inner query that refers to a column from the outer query.

Unlike a simple independent subquery, its result depends on the current row being evaluated by the outer query.

### Example

Find employees whose salary is higher than the average salary in their own department.

```sql
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
```

### How it works

- The outer query considers an employee.
- The inner query calculates the average salary for that employee's department.
- The employee's salary is compared with that department's average.
- The process is logically evaluated for each candidate employee, though the database optimizer may execute it differently.

### Another example: Find the highest-paid employee in each department

```sql
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
);
```

If multiple employees tie for the highest salary in a department, all tied employees are returned.

### Non-correlated vs. correlated subqueries

**Non-correlated subquery:**

- The inner query can run independently.
- It does not refer to columns from the outer query.
- Example: finding employees earning more than the overall company average.

**Correlated subquery:**

- The inner query refers to a column from the outer query.
- Its result depends on the current outer row.
- Example: finding employees earning more than their department's average.

### When should you use correlated subqueries?

Use them when the comparison depends on each individual record, such as:

- Employees earning more than their department's average.
- Highest-paid employees in each department.
- Customers who have or have not placed orders.
- Products priced above their category's average.

---

## 5. CTE — Common Table Expression

### What is a CTE?

A CTE is a temporary named result set defined using the `WITH` keyword.

It exists for the duration of a single SQL statement and can make complex queries easier to read.

CTEs are useful when you want to separate a complicated query into logical steps.

### Syntax

```sql
WITH cte_name AS (
    SELECT column_name
    FROM table_name
)
SELECT *
FROM cte_name;
```

### Example 1: Find employees earning more than the company average

```sql
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
```

### Explanation

- `WITH company_average AS (...)` creates a named result containing the average salary.
- `AVG(salary)` calculates the average.
- `CROSS JOIN` attaches the single-row average result to each employee row.
- `WHERE` returns employees whose salaries exceed the average.

### Why use AS?

In SQL, `AS` assigns an alias to a table, column, or CTE.

For example:

```sql
SELECT AVG(salary) AS avg_salary
FROM employees;
```

Here, `avg_salary` is the name given to the calculated column.

In this example:

```sql
WITH company_average AS (...)
```

`company_average` is the name of the CTE. The `AS` keyword introduces the query that defines it.

### Example 2: Find departments with more than five employees

```sql
WITH department_counts AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY department_id
)
SELECT
    department_id,
    total_employees
FROM department_counts
WHERE total_employees > 5;
```

This query first counts employees in each department and then filters the department-level results.

### Advantages of CTEs

- Improve readability.
- Break complicated queries into clear steps.
- Make intermediate results easier to understand.
- Can be referenced multiple times within the same statement.
- Support recursive queries in databases that implement recursive CTEs.

**Important:** A CTE is not necessarily a physically stored table. Its execution and materialization depend on the database optimizer.

---

## 6. Multiple CTEs

### What are multiple CTEs?

Multiple CTEs are two or more named result sets defined in the same `WITH` clause.

They are useful when a business problem requires several calculation steps.

### Syntax

```sql
WITH
cte_one AS (
    SELECT ...
),
cte_two AS (
    SELECT ...
),
cte_three AS (
    SELECT ...
)
SELECT ...
FROM cte_one;
```

Each CTE is separated by a comma. The final query uses the CTE results.

### Example 1: Find departments whose average salary is greater than the company average

```sql
WITH
company_average AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
),
department_average AS (
    SELECT
        department_id,
        AVG(salary) AS avg_department_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    da.department_id,
    da.avg_department_salary,
    ca.avg_salary AS company_avg_salary
FROM department_average AS da
CROSS JOIN company_average AS ca
WHERE da.avg_department_salary > ca.avg_salary
ORDER BY da.avg_department_salary DESC;
```

### Explanation

**CTE 1 — `company_average`**

Calculates the average salary across the company.

**CTE 2 — `department_average`**

Calculates the average salary for each department.

**Final query**

Compares each department's average with the company-wide average and returns only departments above the company average.

### Example 2: Calculate revenue by product and identify products generating more than ₹50,000

Assume `order_items` contains `product_id`, `quantity`, and `unit_price`, and `products` contains `product_id` and `product_name`.

```sql
WITH product_revenue AS (
    SELECT
        product_id,
        SUM(quantity * unit_price) AS total_revenue
    FROM order_items
    GROUP BY product_id
),
product_details AS (
    SELECT
        p.product_id,
        p.product_name,
        pr.total_revenue
    FROM products AS p
    INNER JOIN product_revenue AS pr
        ON p.product_id = pr.product_id
)
SELECT
    product_id,
    product_name,
    total_revenue
FROM product_details
WHERE total_revenue > 50000
ORDER BY total_revenue DESC;
```

This query calculates revenue first, attaches product names second, and filters the final result third.

### Example 3: Find employees earning above their department average using a CTE

```sql
WITH department_average AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary,
    da.avg_salary
FROM employees AS e
INNER JOIN department_average AS da
    ON e.department_id = da.department_id
WHERE e.salary > da.avg_salary;
```

This achieves a similar result to the correlated subquery example, using a CTE and a JOIN instead.

---

## 7. Business Analysis Problems Using SQL

Business analysis means using data to answer questions that help an organization make decisions.

The following examples demonstrate common interview and workplace problems.

### Problem 1: Find employees earning more than the company average

```sql
SELECT
    employee_id,
    first_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;
```

**Business purpose:** Identify employees whose salaries are above the overall company average.

### Problem 2: Find the highest-paid employee in each department

```sql
SELECT
    e.employee_id,
    e.first_name,
    e.department_id,
    e.salary
FROM employees AS e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees AS e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id;
```

**Business purpose:** Compare top salary levels across departments and identify top earners.

### Problem 3: Find customers who have never placed an order

```sql
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
);
```

**Business purpose:** Identify customers who may need follow-up or marketing outreach.

### Problem 4: Calculate total revenue by product

```sql
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products AS p
INNER JOIN order_items AS oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC;
```

**Business purpose:** Identify the products generating the most revenue.

This calculates item-level revenue from quantity multiplied by unit price. If discounts, refunds, or taxes affect recognized revenue, those business rules must also be incorporated.

### Problem 5: Find products that have never been ordered

```sql
SELECT
    p.product_id,
    p.product_name
FROM products AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items AS oi
    WHERE oi.product_id = p.product_id
);
```

**Business purpose:** Identify products with no recorded order-item activity.

### Problem 6: Find departments with average salary above ₹50,000

```sql
SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;
```

**Business purpose:** Compare salary levels across departments.

### Problem 7: Calculate revenue by customer

```sql
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;
```

**Business purpose:** Identify customers with the highest recorded order-item spending.

This assumes `orders` connects customers to orders and `order_items` stores each product's quantity and unit price.

### Problem 8: Find customers who spent more than ₹10,000

```sql
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING SUM(oi.quantity * oi.unit_price) > 10000
ORDER BY total_spent DESC;
```

**Business purpose:** Identify high-spending customers for loyalty programs or targeted offers.

### Problem 9: Combine employee and customer names

```sql
SELECT first_name AS person_name
FROM employees

UNION

SELECT customer_name AS person_name
FROM customers;
```

**Business purpose:** Create a combined list of names while removing duplicate result rows.

The two selected columns must have compatible data types.

### Problem 10: Calculate employee salary categories using a CTE

```sql
WITH salary_details AS (
    SELECT
        employee_id,
        first_name,
        salary,
        CASE
            WHEN salary >= 80000 THEN 'High Salary'
            WHEN salary >= 50000 THEN 'Medium Salary'
            ELSE 'Low Salary'
        END AS salary_category
    FROM employees
)
SELECT
    employee_id,
    first_name,
    salary,
    salary_category
FROM salary_details
ORDER BY salary DESC;
```

**Business purpose:** Categorize salaries for reporting and workforce analysis. The salary thresholds are illustrative and should be adjusted to the organization's policy.

---

## 8. Common Mistakes to Avoid

- Using `UNION` when you need to preserve every row. Use `UNION ALL` when duplicates must remain.
- Selecting different numbers of columns in the two sides of a `UNION`.
- Forgetting the relationship condition inside a correlated subquery.
- Using `=` with a subquery that returns multiple rows. Use `IN`, `EXISTS`, or another suitable comparison instead.
- Confusing `WHERE` with `HAVING`: `WHERE` filters rows before grouping, while `HAVING` filters groups after aggregation.
- Forgetting commas between multiple CTE definitions.
- Assuming that every CTE is stored permanently in the database.
- Calculating revenue without checking the business definition of revenue, discounts, refunds, and duplicate joins.

---

## 9. Quick Revision

- **UNION:** Combines query results and removes duplicate complete rows.
- **UNION ALL:** Combines query results and keeps duplicates.
- **Subquery:** A query inside another query.
- **Non-correlated subquery:** The inner query does not reference the outer query.
- **Correlated subquery:** The inner query refers to the outer query's columns.
- **CTE:** A named result set defined using `WITH` for one SQL statement.
- **Multiple CTEs:** Several named result sets defined in one `WITH` clause.
- **Business analysis:** Using SQL to answer business questions about employees, customers, products, revenue, and performance.

## 10. Practice Tasks

Try solving these yourself before looking up the answers.

1. Find employees whose salary is greater than the company's average salary.
2. Find employees whose salary is greater than their department's average salary.
3. Find the highest-paid employee in every department.
4. Combine employee and customer names using `UNION`.
5. Combine employee and customer names using `UNION ALL`.
6. Find customers who have never placed an order.
7. Find products that have never appeared in `order_items`.
8. Use a CTE to calculate the average salary of each department.
9. Use two CTEs to compare department average salary with company average salary.
10. Calculate total revenue by product and sort the results from highest to lowest.
11. Find customers whose total order-item spending exceeds ₹10,000.
12. Explain the difference between a correlated subquery and a CTE.
13. Explain why `UNION ALL` is generally faster than `UNION`.
14. Identify three business questions that could be answered using a subquery.

**Recommended learning order:** First practice `UNION` and `UNION ALL`, then ordinary subqueries, correlated subqueries, CTEs, multiple CTEs, and finally the business analysis problems.
