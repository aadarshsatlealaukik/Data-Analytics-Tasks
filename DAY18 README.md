# Advanced SQL for Data Analysts — Short Notes

## 1. Window Functions

A window function performs calculations across related rows without combining them into a single row.

**Syntax:**
```sql
function_name() OVER (
    PARTITION BY column_name
    ORDER BY column_name
)
```

- `OVER()` defines the window.
- `PARTITION BY` divides rows into groups.
- `ORDER BY` defines the calculation order.

Example:

```sql
SELECT
    first_name,
    department_id,
    salary,
    AVG(salary) OVER (
        PARTITION BY department_id
    ) AS department_avg
FROM employees;
```

## 2. ROW_NUMBER()

Assigns a unique sequential number to each row.

```sql
SELECT
    first_name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_num
FROM employees;
```

**Use:** Select the top employee or remove duplicate records using a ranking query.

## 3. RANK()

Assigns the same rank to tied values and skips the next rank.

Example: ranks are `1, 2, 2, 4`.

```sql
SELECT
    first_name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

## 4. DENSE_RANK()

Assigns the same rank to tied values without skipping the next rank.

Example: ranks are `1, 2, 2, 3`.

```sql
SELECT
    first_name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

**Remember:** `ROW_NUMBER()` gives unique numbers, `RANK()` skips ranks, and `DENSE_RANK()` does not.

## 5. LAG() and LEAD()

- `LAG()` retrieves a value from a previous row.
- `LEAD()` retrieves a value from a following row.

```sql
SELECT
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        ORDER BY order_date
    ) AS previous_amount,
    LEAD(total_amount) OVER (
        ORDER BY order_date
    ) AS next_amount
FROM orders;
```

**Use:** Compare previous and upcoming transactions or reporting periods.

## 6. Running Totals

A running total calculates the cumulative sum up to the current row.

```sql
SELECT
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM orders;
```

**Use:** Track cumulative revenue or progress toward sales targets.

## 7. Moving Calculations

A moving calculation uses a rolling window, such as the current month and previous two months.

```sql
AVG(revenue) OVER (
    ORDER BY sales_month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
)
```

**Use:** Calculate moving averages to identify trends and smooth fluctuations. The example assumes `revenue` and `sales_month` are available in the query.

## 8. Month-over-Month (MoM) Analysis

MoM compares a metric with the previous month.

**Formula:**

\[
\text{MoM Growth \%} =
\frac{\text{Current}-\text{Previous}}
{\text{Previous}}\times100
\]

Example:

```sql
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
comparison AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY sales_month
        ) AS previous_revenue
    FROM monthly_revenue
)
SELECT
    sales_month,
    revenue,
    previous_revenue,
    ROUND(
        100.0 * (revenue - previous_revenue)
        / NULLIF(previous_revenue, 0),
        2
    ) AS mom_growth_percent
FROM comparison;
```

`NULLIF()` prevents division by zero. For accurate calendar-month comparisons, account for months without orders.

## 9. Top-N Analysis

Find the highest-performing records.

Example: Top five highest-paid employees.

```sql
SELECT
    first_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
```

For the top three employees **in each department**, use `ROW_NUMBER()` with `PARTITION BY department_id`.

## 10. Customer Segmentation

Customer segmentation groups customers based on spending or purchasing behavior.

```sql
WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(
            SUM(oi.quantity * oi.unit_price),
            0
        ) AS total_spent
    FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spent,
    CASE
        WHEN total_spent >= 50000 THEN 'High Value'
        WHEN total_spent >= 20000 THEN 'Medium Value'
        WHEN total_spent > 0 THEN 'Low Value'
        ELSE 'No Purchases'
    END AS customer_segment
FROM customer_spending;
```

**Use:** Identify valuable customers and plan targeted marketing campaigns. Adjust spending thresholds to suit the business.

## 11. SQL Optimization Basics

SQL optimization improves query performance without changing the intended results.

- Select only the columns you need instead of using `SELECT *`.
- Filter rows appropriately using `WHERE`.
- Use correct JOIN conditions.
- Avoid unnecessary `DISTINCT`.
- Use indexes where they help.
- Check execution plans using `EXPLAIN`.
- Measure performance before and after changes.

Example:

```sql
EXPLAIN
SELECT employee_id, salary
FROM employees
WHERE salary > 50000;
```

## 12. Index Fundamentals

An index helps the database find rows more efficiently, similar to an index in a book.

Create an index:

```sql
CREATE INDEX idx_employees_department
ON employees (department_id);
```

Check indexes in MySQL:

```sql
SHOW INDEX FROM employees;
```

Common types include:

- **Primary key index:** Supports unique row identification.
- **Unique index:** Prevents duplicate indexed key values.
- **Single-column index:** Indexes one column.
- **Composite index:** Indexes multiple columns.
- **Full-text index:** Supports specialized text searches.

**Important:** Indexes use storage and can slow down inserts, updates, and deletes. Create them based on query needs, and verify their usefulness with execution plans.

## Quick Revision

- `ROW_NUMBER()` — unique row numbers.
- `RANK()` — tied ranks with gaps.
- `DENSE_RANK()` — tied ranks without gaps.
- `LAG()` — previous row's value.
- `LEAD()` — next row's value.
- Running total — cumulative sum.
- Moving calculation — rolling sum or average.
- MoM — compares consecutive monthly metrics.
- Top-N — finds the highest-performing records.
- Customer segmentation — groups customers by behavior.
- SQL optimization — improves query efficiency.
- Index — helps locate rows efficiently.

## Practice Tasks

1. Rank employees by salary within each department.
2. Find the top three employees in every department.
3. Calculate running monthly revenue.
4. Find MoM revenue growth.
5. Calculate a three-month moving average.
6. Find the top five products by revenue.
7. Segment customers by spending.
8. Use `EXPLAIN` to inspect a query.
9. Create an index and evaluate its effect.
10. Explain why too many indexes can reduce performance.
