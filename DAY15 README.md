DAY 15 

## 1. String Functions

**Definition:** String functions are SQL functions used to work with text, such as names, email addresses, product names, and locations.

### A. UPPER()

Converts text into uppercase letters.

```sql
SELECT UPPER(employee_name) AS name_uppercase
FROM employees;
```

Example: `rahul` becomes `RAHUL`.

**Business use:** Standardizing text for reporting.

### B. LOWER()

Converts text into lowercase letters.

```sql
SELECT LOWER(email) AS lowercase_email
FROM employees;
```

Example: `RAHUL@GMAIL.COM` becomes `rahul@gmail.com`.

**Business use:** Standardizing email addresses for comparisons.

### C. LENGTH() / LEN()

Returns the length of a string, with differences between SQL systems.

**MySQL:**

```sql
SELECT LENGTH(employee_name) AS name_length
FROM employees;
```

In MySQL, `LENGTH()` counts bytes. Use `CHAR_LENGTH()` to count characters.

**SQL Server:**

```sql
SELECT LEN(employee_name) AS name_length
FROM employees;
```

In SQL Server, `LEN()` excludes trailing spaces.

**Business use:** Identifying unusually short or long names and validating text fields.

### D. TRIM()

Removes leading and trailing spaces.

```sql
SELECT TRIM(employee_name) AS cleaned_name
FROM employees;
```

Example: `'  Rahul  '` becomes `'Rahul'`.

**Business use:** Cleaning imported data that contains unwanted spaces.

### E. CONCAT()

Combines two or more strings.

```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;
```

Example: `Rahul` and `Sharma` become `Rahul Sharma`.

**Business use:** Creating full names, labels, or readable customer details.

### F. SUBSTRING()

Extracts part of a string.

**MySQL:**

```sql
SELECT SUBSTRING(employee_name, 1, 3) AS short_name
FROM employees;
```

This extracts three characters starting at position 1.

**SQL Server:**

```sql
SELECT SUBSTRING(employee_name, 1, 3) AS short_name
FROM employees;
```

The syntax is the same in this example.

**Business use:** Extracting codes, prefixes, or parts of product IDs.

### G. REPLACE()

Replaces one text value with another.

```sql
SELECT REPLACE(phone_number, '-', '') AS cleaned_phone
FROM customers;
```

This removes hyphens from phone numbers.

**Business use:** Standardizing phone numbers and product codes.

**Important:** String functions can help clean text, but always verify that the transformation preserves the information you need.

## 2. Date Functions

**Definition:** Date functions help analysts extract, compare, calculate, and format dates.

These functions are useful for monthly reports, employee tenure, order analysis, and sales trends.

### A. CURRENT_DATE / GETDATE()

Returns the current date or date and time, depending on the function and database.

**MySQL — Current date:**

```sql
SELECT CURRENT_DATE;
```

**MySQL — Current date and time:**

```sql
SELECT NOW();
```

**SQL Server — Current date and time:**

```sql
SELECT GETDATE();
```

**Business use:** Checking today's date or recording when a report is generated.

### B. YEAR(), MONTH(), DAY()

Extract the year, month, or day from a date.

```sql
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;
```

These functions are supported in both MySQL and SQL Server.

**Business use:** Grouping transactions by year or month for reporting.

### C. DATEDIFF()

Calculates the difference between dates. The syntax differs between SQL systems.

**MySQL:**

```sql
SELECT DATEDIFF(end_date, start_date) AS days_difference
FROM projects;
```

MySQL returns the number of days between the two dates.

**SQL Server:**

```sql
SELECT DATEDIFF(DAY, start_date, end_date) AS days_difference
FROM projects;
```

SQL Server uses a date part, such as `DAY`, as its first argument.

**Business use:** Calculating delivery duration, project length, or days between orders.

### D. DATE_ADD() / DATEADD()

Adds a time interval to a date.

**MySQL:**

```sql
SELECT DATE_ADD(order_date, INTERVAL 7 DAY) AS date_after_seven_days
FROM orders;
```

**SQL Server:**

```sql
SELECT DATEADD(DAY, 7, order_date) AS date_after_seven_days
FROM orders;
```

**Business use:** Calculating due dates, delivery estimates, or follow-up dates.

### E. Filtering by Date Range

**Example — Find orders placed during January 2026:**

```sql
SELECT *
FROM orders
WHERE order_date >= '2026-01-01'
  AND order_date < '2026-02-01';
```

This approach works well when `order_date` contains a date and time, because it includes all times in January without accidentally excluding records on January 31.

**Business use:** Monthly sales reports, quarterly analysis, and tracking order activity over time.

## 3. NULL Handling

**Definition:** `NULL` represents a missing, unknown, or unavailable value. It is not the same as zero or an empty string.

**Example:** An employee's bonus may be `NULL` because the bonus has not yet been recorded.

### A. IS NULL

Finds rows where a value is missing.

```sql
SELECT *
FROM employees
WHERE bonus IS NULL;
```

### B. IS NOT NULL

Finds rows where a value is present.

```sql
SELECT *
FROM employees
WHERE bonus IS NOT NULL;
```

**Important:** Do not use `bonus = NULL` or `bonus <> NULL`. Use `IS NULL` and `IS NOT NULL`.

### C. Why NULL matters in calculations

Consider a salary of ₹30,000 and a bonus of `NULL`.

```sql
SELECT salary + bonus AS total_compensation
FROM employees;
```

In common SQL systems, the result is `NULL` because the bonus is unknown.

If you treat a missing bonus as zero for a particular business rule, you can use `COALESCE()`.

**Business use:** Identifying missing salaries, incomplete customer records, or orders with unavailable delivery dates.

## 4. COALESCE()

**Definition:** `COALESCE()` returns the first non-NULL value from a list of expressions.

**Syntax:**

```sql
COALESCE(value1, value2, value3, ...)
```

### Example A — Replace a missing bonus with zero

```sql
SELECT
    employee_name,
    salary,
    COALESCE(bonus, 0) AS bonus
FROM employees;
```

If the bonus is `NULL`, the result displays `0`.

### Example B — Calculate total compensation

```sql
SELECT
    employee_name,
    salary + COALESCE(bonus, 0) AS total_compensation
FROM employees;
```

If the bonus is missing, this calculation treats it as zero.

**Important:** Only replace `NULL` with zero when that matches the business meaning. An unknown bonus is not necessarily a confirmed zero bonus.

### Example C — Use a fallback value

```sql
SELECT
    customer_name,
    COALESCE(phone_number, email, 'No Contact Available') AS contact
FROM customers;
```

The query returns the phone number if available; otherwise, the email; otherwise, the fallback text.

**Business use:** Handling missing values in reports and creating readable output.

## 5. Conditional Logic

**Definition:** Conditional logic allows SQL to produce different results depending on whether a condition is true or false.

The most common tool is `CASE`.

### A. CASE WHEN

**Example — Classify sales performance:**

```sql
SELECT
    salesperson_id,
    revenue,
    CASE
        WHEN revenue >= 100000 THEN 'Excellent'
        WHEN revenue >= 50000 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance
FROM sales;
```

**How it works:**
- Revenue of ₹1,00,000 or more → Excellent.
- Revenue from ₹50,000 to below ₹1,00,000 → Good.
- Revenue below ₹50,000 → Needs Improvement.

SQL evaluates the conditions in order and returns the result for the first matching condition.

### B. Conditional aggregation

You can combine `CASE` with aggregate functions to calculate business metrics.

**Example — Count Won deals:**

```sql
SELECT
    SUM(
        CASE
            WHEN status = 'Won' THEN 1
            ELSE 0
        END
    ) AS won_deals
FROM sales;
```

This counts rows where the status is `Won`.

**Example — Calculate Won revenue:**

```sql
SELECT
    SUM(
        CASE
            WHEN status = 'Won' THEN revenue
            ELSE 0
        END
    ) AS won_revenue
FROM sales;
```

This calculates total revenue from Won deals. If the table can contain `NULL` revenue values, handle them according to the business rules.

**Business use:** Calculating sales targets, win rates, customer categories, and performance indicators.

## 6. Business Calculations

SQL helps turn raw data into business metrics that support decisions.

### A. Total Revenue

**Business question:** What is the total revenue?

```sql
SELECT SUM(revenue) AS total_revenue
FROM sales;
```

### B. Average Order Value

**Business question:** How much does a customer spend per order on average?

```sql
SELECT AVG(order_amount) AS average_order_value
FROM orders;
```

This calculates the average of non-NULL order amounts. If the business defines average order value as total revenue divided by the number of valid orders, confirm which orders and revenue values should be included.

### C. Win Rate

**Business question:** What percentage of decided deals were Won?

```sql
SELECT
    100.0 * SUM(
        CASE WHEN status = 'Won' THEN 1 ELSE 0 END
    ) /
    NULLIF(
        SUM(
            CASE WHEN status IN ('Won', 'Lost') THEN 1 ELSE 0 END
        ),
        0
    ) AS win_rate_percentage
FROM sales;
```

This defines win rate as Won deals divided by all Won and Lost deals. It excludes other statuses, such as Open, and avoids division by zero.

### D. Days Taken to Deliver an Order

**Business question:** How many days did each order take to deliver?

**MySQL:**

```sql
SELECT
    order_id,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders
WHERE order_date IS NOT NULL
  AND delivery_date IS NOT NULL;
```

**SQL Server:**

```sql
SELECT
    order_id,
    DATEDIFF(DAY, order_date, delivery_date) AS delivery_days
FROM orders
WHERE order_date IS NOT NULL
  AND delivery_date IS NOT NULL;
```

### E. Monthly Revenue

**Business question:** How much revenue did the company generate each month?

```sql
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(revenue) AS monthly_revenue
FROM sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;
```

This query groups transactions by year and month, calculates revenue totals, and sorts the results chronologically.

### F. Customer Contact Completeness

**Business question:** Which customers have no phone number or email address?

```sql
SELECT customer_id, customer_name
FROM customers
WHERE phone_number IS NULL
  AND email IS NULL;
```

This helps identify customer records that need updating.

## Quick Revision

- **String functions:** Clean, transform, and combine text.
- **Date functions:** Extract dates, compare dates, and calculate time intervals.
- **NULL handling:** Identify and manage missing or unknown values.
- **COALESCE():** Returns the first non-NULL expression.
- **Conditional logic:** Produces results based on conditions, commonly using `CASE`.
- **Business calculations:** Turn raw records into metrics such as revenue, average order value, win rate, and delivery time.

## Day 16 Learning Objective

By the end of this lesson, you should be able to clean text, work with dates, identify missing values, use `COALESCE()`, apply conditional logic, and calculate practical business metrics using SQL.
