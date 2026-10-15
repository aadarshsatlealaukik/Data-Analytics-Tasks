# Day 16 — SQL JOINs & Table Relationships

## 1. What is a JOIN?

**Definition:** A JOIN combines data from two or more tables using a related column.

In databases, information is often stored in separate tables. JOINs allow us to combine that information to answer business questions.

**Example:** Customer names are stored in the `CUSTOMERS` table, while purchase details are stored in the `ORDERS` table. A JOIN can display customer names alongside their orders.

**Basic syntax:**

```sql
SELECT column_names
FROM table1
JOIN table2
    ON table1.common_column = table2.common_column;
```

- `JOIN` specifies how the tables are combined.
- `ON` specifies the condition used to match records.
- A common column, such as `customer_id`, connects related records.

## 2. INNER JOIN

**Definition:** `INNER JOIN` returns only rows that have matching values in both tables.

**Example — Find customers who have placed orders:**

```sql
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

**How it works:**
1. SQL checks the `customer_id` in both tables.
2. It matches each customer with their orders.
3. Customers without orders are excluded.
4. A customer with multiple orders appears multiple times, once for each matching order.

**Business applications:**
- Finding customers who purchased products.
- Finding employees assigned to projects.
- Finding products that have sales.

**Remember:** `INNER JOIN` returns matching records only.

## 3. LEFT JOIN

**Definition:** `LEFT JOIN` returns every row from the left table and matching rows from the right table. If no match exists, the right-side columns contain `NULL`.

**Example — Find all customers, including customers who have never placed an order:**

```sql
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

**How it works:**
- Every customer is included.
- Customers with orders display their matching order IDs.
- Customers without orders display `NULL` for `order_id`.

**Business applications:**
- Finding customers who have never purchased anything.
- Finding employees who have not been assigned projects.
- Identifying records with missing related information.

**Example — Find customers who never placed an order:**

```sql
SELECT
    c.customer_id,
    c.customer_name
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

**Remember:** `LEFT JOIN` returns all rows from the left table, plus matching rows from the right table.

## 4. RIGHT JOIN

**Definition:** `RIGHT JOIN` returns every row from the right table and matching rows from the left table. If no match exists, the left-side columns contain `NULL`.

**Example — Return all orders, including orders without a matching customer record:**

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.customer_id
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

**How it works:**
- Every order is included.
- Matching customer details are displayed.
- If an order has no matching customer, the customer details are `NULL`.

**Business applications:**
- Keeping all transactions while checking for missing customer details.
- Auditing records from a transaction table.
- Investigating inconsistent data.

**Remember:** `RIGHT JOIN` returns all rows from the right table, plus matching rows from the left table.

A `RIGHT JOIN` can often be rewritten as a `LEFT JOIN` by reversing the order of the tables.

## 5. FULL OUTER JOIN

**Definition:** `FULL OUTER JOIN` returns all rows from both tables.

- Matching records are combined.
- Unmatched records from the left table are retained.
- Unmatched records from the right table are also retained.
- Missing values for the unmatched side appear as `NULL`.

**Example:**

```sql
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.customer_id AS order_customer_id
FROM customers AS c
FULL OUTER JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

**Business applications:**
- Comparing two datasets.
- Reconciling records from different systems.
- Finding missing or unmatched records on either side.

**Important database difference:**
- SQL Server supports `FULL OUTER JOIN`.
- PostgreSQL supports `FULL OUTER JOIN`.
- MySQL does not directly support `FULL OUTER JOIN`.

In MySQL, a full outer join can be emulated with `LEFT JOIN`, `RIGHT JOIN`, and `UNION ALL`, filtering out the duplicate matching rows.

**Remember:** `FULL OUTER JOIN` returns matching and non-matching rows from both tables.

## 6. SELF JOIN

**Definition:** A SELF JOIN joins a table to itself. It is useful when records in the same table are related.

**Example:** An Employees table contains `employee_id`, `employee_name`, and `manager_id`. The `manager_id` refers to another employee's `employee_id`.

```sql
SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.employee_id;
```

**How it works:**
- `e` represents the employee.
- `m` represents the manager.
- SQL matches the employee's `manager_id` to another employee's ID.
- Employees without managers remain in the result because we used `LEFT JOIN`.

**Business applications:**
- Displaying employees and their managers.
- Analyzing organizational hierarchies.
- Comparing records within the same table.

**Remember:** SELF JOIN joins the same table to itself using aliases.

## 7. One-to-One Relationship

**Definition:** A one-to-one relationship means one record in a table is associated with at most one record in another table, and vice versa.

**Example:** An employee has one separate employee profile.

The database may contain:
- `EMPLOYEES`: `employee_id`, `employee_name`
- `EMPLOYEE_PROFILES`: `profile_id`, `employee_id`, `address`

To enforce this relationship, `EMPLOYEE_PROFILES.employee_id` can be a foreign key referencing `EMPLOYEES.employee_id` and have a `UNIQUE` constraint.

**Business applications:**
- Separating employee details from profile information.
- Separating customer accounts from individual account settings.
- Keeping sensitive information in a separate table.

**Remember:** One employee ↔ one profile.

## 8. One-to-Many Relationship

**Definition:** A one-to-many relationship means one record in the first table can be associated with multiple records in the second table.

**Example:** One customer can place many orders.

- `CUSTOMERS` stores customer information.
- `ORDERS` stores individual orders.
- `customer_id` connects orders to their customer.

**Example query:**

```sql
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id;
```

A customer with three orders appears in three result rows.

**Business applications:**
- Analyzing purchase history.
- Calculating revenue by customer.
- Measuring order frequency.

**Remember:** One customer → many orders.

## 9. Many-to-Many Relationship

**Definition:** A many-to-many relationship means multiple records in one table can relate to multiple records in another table.

**Example:** One order can contain many products, and one product can appear in many orders.

A junction table called `ORDER_ITEMS` manages this relationship.

The tables contain:
- `ORDERS`: order information.
- `PRODUCTS`: product information.
- `ORDER_ITEMS`: connects orders with products and stores quantity and unit price.

Typical columns in `ORDER_ITEMS` include:
- `order_item_id`
- `order_id`
- `product_id`
- `quantity`
- `unit_price`

**Example query — Display products included in each order:**

```sql
SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items AS oi
INNER JOIN products AS p
    ON oi.product_id = p.product_id;
```

**Business applications:**
- Calculating product sales.
- Analyzing order contents.
- Identifying best-selling products.
- Calculating revenue by product.

**Remember:** Many orders ↔ many products, connected through `ORDER_ITEMS`.

## 10. Understanding the Database Relationship Diagram

Your database follows this structure:

```text
CUSTOMERS
    |
    | customer_id
    v
ORDERS
    |
    | order_id
    v
ORDER_ITEMS
    |
    | product_id
    v
PRODUCTS
```

**How the tables are connected:**

1. One customer can have many orders.
2. One order can contain many order items.
3. One product can appear in many order items.
4. `ORDER_ITEMS` connects `ORDERS` and `PRODUCTS`.

This design creates a many-to-many relationship between orders and products through the `ORDER_ITEMS` junction table.

The actual JOIN conditions are:

```sql
-- Customers to Orders
customers.customer_id = orders.customer_id

-- Orders to Order Items
orders.order_id = order_items.order_id

-- Order Items to Products
order_items.product_id = products.product_id
```

## 11. Business Analysis — Total Revenue by Product

**Business question:** Which products generate the most revenue?

Assume `ORDER_ITEMS` contains the quantity and unit price for each product in an order.

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

**How the query works:**

1. `PRODUCTS` provides product names.
2. `ORDER_ITEMS` provides quantity and unit price.
3. `INNER JOIN` matches products with their order items.
4. `SUM(quantity * unit_price)` calculates total revenue for each product.
5. `GROUP BY` summarizes revenue by product.
6. `ORDER BY` sorts products from highest revenue to lowest.

**Business insight:** This query helps identify the products contributing the most revenue.

This calculates item-level gross revenue from recorded quantities and unit prices. Cancellations, refunds, discounts, and taxes must be accounted for separately if they affect the business's definition of revenue.

## 12. Quick Revision

- **JOIN:** Combines related data from tables.
- **INNER JOIN:** Returns only matching rows.
- **LEFT JOIN:** Returns all left-side rows and matching right-side rows.
- **RIGHT JOIN:** Returns all right-side rows and matching left-side rows.
- **FULL OUTER JOIN:** Returns all rows from both tables.
- **SELF JOIN:** Joins a table to itself.
- **One-to-one:** One record relates to at most one record on the other side.
- **One-to-many:** One record relates to many records.
- **Many-to-many:** Multiple records relate to multiple records through a junction table.
- **Junction table:** Connects two tables in a many-to-many relationship.

## 13. Practice Tasks

Use your `CUSTOMERS`, `ORDERS`, `ORDER_ITEMS`, and `PRODUCTS` tables.

1. Display customer names with their order IDs using `INNER JOIN`.
2. Find customers who have never placed an order using `LEFT JOIN`.
3. Display all orders and their customer names using `RIGHT JOIN`.
4. Explain how `FULL OUTER JOIN` helps reconcile customer and order records.
5. Use a SELF JOIN to display employees and their managers.
6. Find the total quantity sold for each product.
7. Calculate total revenue by product.
8. Find customers who have spent more than ₹10,000.
9. Find products that have never been ordered.
10. Explain why `ORDER_ITEMS` is needed to connect `ORDERS` and `PRODUCTS`.

## Learning Objective

By the end of this lesson, you should be able to explain JOIN types, understand one-to-one, one-to-many, and many-to-many relationships, connect multiple tables using foreign keys, and use SQL JOINs to solve real business analysis problems.
