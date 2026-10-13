## 1. UNION

**Definition:** `UNION` combines the results of two or more `SELECT` queries and removes duplicate rows.

**Syntax:**

```sql
SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;
```

**Example:**

Suppose a company stores current customers and previous customers in separate tables.

```sql
SELECT email
FROM current_customers

UNION

SELECT email
FROM previous_customers;
```

**What happens?**
- Emails from both tables are combined.
- Duplicate email values are removed.
- The result contains unique email values.

**Rules of UNION:**
- Both queries must return the same number of columns.
- Corresponding columns must have compatible data types.
- Column names in the final result generally come from the first query.
- `UNION` removes duplicate result rows.

**Business application:** Combining customer lists from different branches without repeating identical records.

## 2. UNION ALL

**Definition:** `UNION ALL` combines the results of multiple `SELECT` queries and keeps duplicate rows.

**Syntax:**

```sql
SELECT column_name FROM table1
UNION ALL
SELECT column_name FROM table2;
```

**Example:**

```sql
SELECT employee_name
FROM employees_2025

UNION ALL

SELECT employee_name
FROM employees_2026;
```

This combines employee names from both tables, including duplicates.

**Difference between UNION and UNION ALL:**

- `UNION` removes duplicate result rows.
- `UNION ALL` keeps all result rows, including duplicates.
- `UNION ALL` is generally faster because it does not need to eliminate duplicates.

**Business application:** Combining monthly sales records when every transaction must be retained.

**Remember:** Use `UNION` for unique results and `UNION ALL` when you need all records.

## 3. Subqueries

**Definition:** A subquery is a query written inside another SQL query.

A subquery is also called an inner query or nested query.

**Example business question:** Find employees whose salaries are greater than the company's average salary.

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

**How it works:**

1. The inner query calculates the average salary.
2. The outer query retrieves employees earning more than that average.

Suppose the average salary is ₹35,000. The outer query returns employees whose salaries exceed ₹35,000.

**Common types of subqueries:**

- **Scalar subquery:** Returns a single value, such as an average salary.
- **Single-row subquery:** Returns one row.
- **Multiple-row subquery:** Returns multiple rows, often used with `IN`, `ANY`, or `ALL`.
- **Correlated subquery:** Refers to a column from the outer query.

**Example using IN:**

Find employees who work in departments located in Indore.

```sql
SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Indore'
);
```

The inner query finds department IDs for Indore. The outer query retrieves employees belonging to those departments.

**Business application:** Finding employees above average salary, customers who placed orders, or products priced above the average price.

## 4. Correlated Subquery Concept

**Definition:** A correlated subquery is an inner query that depends on a value from the outer query.

Unlike a simple subquery, its result depends on the current row being examined by the outer query.

**Example business question:** Find employees who earn more than the average salary of their own department.

```sql
SELECT e.employee_name,
       e.department_id,
       e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
```

**How it works:**

1. The outer query examines an employee.
2. The inner query calculates the average salary for that employee's department.
3. The employee's salary is compared with that departmental average.
4. Employees earning more than their department average are returned.

**Simple example:**

If the average salary in Sales is ₹30,000, a Sales employee earning ₹40,000 qualifies. An employee earning ₹25,000 does not qualify.

The average is recalculated logically for each department represented in the outer query.

**Important:** A correlated subquery is not necessarily executed from scratch for every row; the database optimizer may transform or optimize it.

**Business application:** Identifying employees earning above their department average or products priced above the average for their category.

## 5. CTE — Common Table Expression

**Definition:** A CTE is a temporary named result set defined using `WITH`. It can be referenced by the main query that follows it.

A CTE helps make complex SQL queries easier to read and organize.

**Syntax:**

```sql
WITH cte_name AS (
    SELECT column_name
    FROM table_name
)
SELECT *
FROM cte_name;
```

**Example business question:** Find employees whose salaries are above the average salary.

```sql
WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT avg_salary
    FROM average_salary
);
```

**How it works:**

1. `WITH average_salary AS (...)` defines the CTE.
2. The CTE calculates the average salary.
3. The main query uses that calculated value to find employees earning above average.

**Why use a CTE?**
- Makes queries easier to understand.
- Separates calculations from the main query.
- Helps organize complex analysis into logical steps.
- Can be referenced multiple times within the statement.

**Important:** A normal CTE is available only to the single SQL statement immediately following its definition. It is not automatically a permanent table or a stored result.

**Business application:** Calculating monthly revenue, identifying top-performing employees, and preparing reports.

## 6. Multiple CTEs

**Definition:** Multiple CTEs means defining two or more CTEs in the same `WITH` clause.

This is useful when a business problem requires several calculation steps.

**Example business question:** Find departments whose total salary expense is greater than the company's average departmental salary expense.

```sql
WITH department_salary AS (
    SELECT department_id,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
),
average_department_salary AS (
    SELECT AVG(total_salary) AS avg_salary
    FROM department_salary
)
SELECT ds.department_id,
       ds.total_salary
FROM department_salary ds
CROSS JOIN average_department_salary ads
WHERE ds.total_salary > ads.avg_salary;
```

**How it works:**

**First CTE — `department_salary`**
- Groups employees by department.
- Calculates total salary expense for each department.

**Second CTE — `average_department_salary`**
- Calculates the average of those departmental totals.
- Uses the first CTE as its input.

**Final query**
- Compares each department's total salary expense with the average departmental total.
- Returns departments above that average.

**Why use multiple CTEs?**

Instead of writing one long and difficult query, you divide the problem into smaller steps.

**Business application:** Sales performance analysis, departmental cost analysis, customer segmentation, and monthly KPI reporting.

## 7. Business Analysis Problems

SQL becomes useful when you use it to answer real business questions.

### Problem 1 — Find employees earning above average

**Business question:** Which employees earn more than the company's average salary?

```sql
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```

**Insight:** Identifies employees earning above the overall company average.

### Problem 2 — Find employees earning above their department average

**Business question:** Which employees earn more than the average salary of their own department?

```sql
SELECT e.employee_name,
       e.department_id,
       e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
```

**Insight:** Compares employees fairly within their own departments.

### Problem 3 — Combine sales from two years

**Business question:** Combine all sales transactions from 2025 and 2026.

```sql
SELECT order_id, revenue
FROM sales_2025

UNION ALL

SELECT order_id, revenue
FROM sales_2026;
```

**Insight:** Combines transaction records while preserving duplicate rows.

Use `UNION ALL` when every transaction needs to be retained. Ensure the selected columns have compatible meanings and data types.

### Problem 4 — Find customers who placed orders

**Business question:** Which customers have placed at least one order?

```sql
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
```

**Insight:** Identifies customers who have made a purchase.

### Problem 5 — Find departments with high salary expenses

**Business question:** Which departments spend more on salaries than the average departmental total?

```sql
WITH department_salary AS (
    SELECT department_id,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, total_salary
FROM department_salary
WHERE total_salary > (
    SELECT AVG(total_salary)
    FROM department_salary
);
```

**Insight:** Highlights departments with higher-than-average total salary costs.

### Problem 6 — Find products priced above their category average

**Business question:** Which products cost more than the average price of products in the same category?

Assume the `products` table contains `product_name`, `category_id`, and `price`.

```sql
SELECT p.product_name,
       p.category_id,
       p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category_id = p.category_id
);
```

**Insight:** Identifies relatively expensive products within each category.

## Quick Revision

- **UNION:** Combines query results and removes duplicate result rows.
- **UNION ALL:** Combines query results and retains duplicate rows.
- **Subquery:** A query inside another query.
- **Correlated subquery:** An inner query that references a value from the outer query.
- **CTE:** A named query result defined using `WITH`.
- **Multiple CTEs:** Several named query results organized in one statement.
- **Business analysis:** Using SQL to answer business questions and support decisions.

## Day 14 Learning Objective

By the end of this lesson, you should be able to combine results from multiple queries, write simple and correlated subqueries, organize SQL using one or more CTEs, and solve practical business problems involving salaries, sales, customers, and products.
