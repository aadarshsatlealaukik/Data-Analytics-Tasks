# Day 32 — Power Query: Data Cleaning & Transformation

## 1. Data Cleaning

### What is Data Cleaning?

Data cleaning is the process of identifying and correcting errors, inconsistencies, duplicates, and missing values in a dataset.

Raw data is not always ready for analysis.

### Example: Raw Sweet Shop Data

| Order_ID | Customer | Product | Quantity | Price |
|---|---|---|---:|---:|
| 101 | Rahul | Gulab Jamun | 5 | 200 |
| 102 | Amit | Rasmalai | 3 | 250 |
| 103 | Rahul | Gulab Jamun | 5 | 200 |
| 104 | Priya | Jalebi | null | 100 |
| 105 | amit | Rasmalai | 2 | 250 |

Problems:
- Duplicate order records.
- Missing quantity.
- Inconsistent customer names (Amit and amit).
- Potentially incorrect data types.

### Data Cleaning Process

1. Understand the dataset.
2. Identify missing values.
3. Remove duplicate records where appropriate.
4. Correct inconsistent values.
5. Fix data types.
6. Remove unnecessary columns.
7. Validate the cleaned dataset.

**Business importance:** Clean data helps produce more reliable revenue reports, profit calculations, and business decisions.

---

## 2. Remove Duplicates

### What are duplicates?

Duplicates are repeated records in a dataset.

Example:

| Order_ID | Customer | Product |
|---|---|---|
| 101 | Rahul | Gulab Jamun |
| 102 | Amit | Rasmalai |
| 101 | Rahul | Gulab Jamun |

Order 101 appears twice.

### How to remove duplicates in Power Query

1. Open Power BI Desktop.
2. Click Home → Transform Data.
3. Select the required table.
4. Select the column or columns that define a duplicate.
5. Go to Home → Remove Rows → Remove Duplicates.

### Important concept

You can remove duplicates based on:
- One column.
- Multiple selected columns.
- All columns.

Example:

If Order_ID uniquely identifies an order, select Order_ID before removing duplicates.

**Important:** Do not remove records simply because two rows look similar. Two genuine orders can contain the same customer, product, and quantity. Always understand what uniquely identifies a record.

---

## 3. Replace Values

### What is Replace Values?

Replace Values is used to replace an existing value with another value.

It helps correct inconsistent or incorrect data.

### Example

Original data:

| Customer | Region |
|---|---|
| Rahul | N |
| Amit | S |
| Priya | N |
| Karan | E |

You want to replace abbreviations:

- N → North
- S → South
- E → East

### Steps

1. Open Power Query Editor.
2. Select the Region column.
3. Right-click the column.
4. Select Replace Values.
5. Enter the value to find.
6. Enter the replacement value.
7. Click OK.

### Another example

Suppose your dataset contains:

| Product |
|---|
| Gulabjamun |
| Gulab Jamun |
| Rasmalai |

You can replace Gulabjamun with Gulab Jamun to maintain consistency, after verifying that both represent the same product.

**Business use:** Standardizing product names, regions, customer categories, and status values.

---

## 4. Split Columns

### What is Split Column?

Split Column divides one column into two or more columns based on a delimiter or position.

A delimiter is a character that separates information, such as:
- Space
- Comma
- Hyphen
- Underscore

### Example 1: Split Customer Name

Original:

| Customer_Name |
|---|
| Rahul Sharma |
| Amit Verma |
| Priya Patel |

You want to create First_Name and Last_Name.

Result:

| First_Name | Last_Name |
|---|---|
| Rahul | Sharma |
| Amit | Verma |
| Priya | Patel |

### Steps

1. Select Customer_Name.
2. Go to Transform.
3. Click Split Column.
4. Select By Delimiter.
5. Choose Space.
6. Select the appropriate splitting option.
7. Click OK.

### Example 2: Split Product Code

Original:

| Product_Code |
|---|
| SWEET-101 |
| SWEET-102 |
| SWEET-103 |

Split using the hyphen (-).

Result:

| Category | Product_Number |
|---|---|
| SWEET | 101 |
| SWEET | 102 |
| SWEET | 103 |

**Business use:** Separating customer names, product codes, addresses, and other combined information.

---

## 5. Merge Queries

### What is Merge Queries?

Merge Queries combines two tables horizontally by matching values in one or more common columns.

It is similar to JOIN operations in SQL.

### Example

Suppose you have two tables.

**Orders Table**

| Order_ID | Product_ID | Quantity |
|---|---|---:|
| 101 | P01 | 5 |
| 102 | P02 | 3 |
| 103 | P03 | 4 |

**Products Table**

| Product_ID | Product_Name | Unit_Price |
|---|---|---:|
| P01 | Gulab Jamun | 200 |
| P02 | Rasmalai | 250 |
| P03 | Jalebi | 100 |

You want to bring Product_Name and Unit_Price into the Orders table.

### Steps

1. Open Power Query Editor.
2. Select the Orders query.
3. Go to Home → Merge Queries.
4. Select the Products table.
5. Select Product_ID in both tables.
6. Choose the appropriate join type.
7. Click OK.
8. Expand the new column.
9. Select Product_Name and Unit_Price.
10. Click OK.

### Types of Merge Joins

**1. Left Outer Join**

Returns all rows from the first table and matching rows from the second table.

Unmatched second-table values appear as null.

**2. Right Outer Join**

Returns all rows from the second table and matching rows from the first table.

**3. Full Outer Join**

Returns all rows from both tables, matching where possible.

**4. Inner Join**

Returns only rows that have matching values in both tables.

**5. Left Anti Join**

Returns rows from the first table that do not have a match in the second table.

**6. Right Anti Join**

Returns rows from the second table that do not have a match in the first table.

### SQL comparison

Power Query Left Outer Merge is similar to:

```sql
SELECT *
FROM Orders o
LEFT JOIN Products p
ON o.Product_ID = p.Product_ID;
```

**Business use:** Combining customer information with orders, product details with sales, or employee information with attendance.

---

## 6. Append Queries

### What is Append Queries?

Append Queries combines two or more tables vertically by adding rows from one table below another.

It is similar to UNION or UNION ALL in SQL.

### Example

**January Sales**

| Order_ID | Revenue |
|---|---:|
| 101 | 500 |
| 102 | 700 |

**February Sales**

| Order_ID | Revenue |
|---|---:|
| 103 | 600 |
| 104 | 900 |

After appending:

| Order_ID | Revenue |
|---|---:|
| 101 | 500 |
| 102 | 700 |
| 103 | 600 |
| 104 | 900 |

### Steps

1. Open Power Query Editor.
2. Go to Home.
3. Select Append Queries.
4. Choose Two Tables or Three or More Tables.
5. Select the tables.
6. Click OK.

### Important: Merge vs Append

**Merge Queries**
- Combines tables horizontally.
- Matches rows using common columns.
- Similar to SQL JOIN.

**Append Queries**
- Combines tables vertically.
- Adds rows from different tables.
- Similar to SQL UNION ALL.

### Easy way to remember

- Merge = Add columns.
- Append = Add rows.

**Business use:** Combining monthly sales files, yearly transaction records, or sales data from multiple store locations.

---

## 7. Data Types

### What are Data Types?

Data types define what kind of information a column contains.

Every column should have an appropriate data type for accurate calculations and analysis.

### Common Power Query data types

**1. Text**

Used for names, categories, product IDs, and descriptions.

Example: "Rahul", "Gulab Jamun", "P01".

**2. Whole Number**

Used for numbers without decimal values.

Example: Quantity = 5.

**3. Decimal Number**

Used for numerical values that can contain decimals.

Example: 125.75.

**4. Fixed Decimal Number**

Useful for financial calculations where four decimal places of precision are supported.

**5. Date**

Used for calendar dates.

Example: 04-11-2026.

**6. Date/Time**

Used for dates and times together.

**7. Time**

Used for time values.

**8. Percentage**

A percentage-formatted decimal value.

Example: 0.25 represents 25% when formatted as a percentage.

### How to change data types

1. Open Power Query Editor.
2. Select the column.
3. Click the data type icon near the column name.
4. Choose the correct type.

### Example

| Column | Correct Data Type |
|---|---|
| Order_ID | Text or Whole Number |
| Order_Date | Date |
| Product_Name | Text |
| Quantity | Whole Number |
| Unit_Price | Fixed Decimal Number |
| Revenue | Fixed Decimal Number |
| Profit_Margin | Percentage or Decimal Number |

**Important:** IDs are often best stored as Text if they contain letters or leading zeros. A product ID such as 0012 should not become 12.

---

## 8. Conditional Columns

### What is a Conditional Column?

A Conditional Column creates a new column based on specified conditions.

It works similarly to IF and ELSE IF logic in programming.

### Example

Suppose you have sales revenue:

| Order_ID | Revenue |
|---|---:|
| 101 | 500 |
| 102 | 1500 |
| 103 | 3000 |
| 104 | 800 |

You want to categorize orders:

- Revenue greater than or equal to 2000 → High Value.
- Revenue greater than or equal to 1000 → Medium Value.
- Otherwise → Low Value.

### Steps

1. Open Power Query Editor.
2. Go to Add Column.
3. Select Conditional Column.
4. Enter the new column name: Order_Category.
5. Add the conditions.
6. Set the Else value.
7. Click OK.

### Example of the logic

```text
IF Revenue >= 2000
    THEN "High Value"

ELSE IF Revenue >= 1000
    THEN "Medium Value"

ELSE
    "Low Value"
```

### Result

| Order_ID | Revenue | Order_Category |
|---|---:|---|
| 101 | 500 | Low Value |
| 102 | 1500 | Medium Value |
| 103 | 3000 | High Value |
| 104 | 800 | Low Value |

### Another business example

Categorize profit margins:

- Margin >= 30% → High Profit.
- Margin >= 15% → Moderate Profit.
- Otherwise → Low Profit.

**Business use:** Customer segmentation, order classification, sales performance categories, and profit analysis.

---

## 9. Query Refresh

### What is Query Refresh?

Query Refresh means retrieving data again from the connected source and applying the saved Power Query transformation steps.

It helps keep reports updated when source data changes.

### Example

Suppose you have an Excel file containing January sales:

| Order_ID | Revenue |
|---|---:|
| 101 | 500 |
| 102 | 700 |

You import it into Power BI and clean the data.

Later, you add a new order to the Excel file:

| Order_ID | Revenue |
|---|---:|
| 103 | 900 |

When you refresh Power BI, it can retrieve the updated source data and apply your saved transformations again.

### How to refresh data in Power BI Desktop

1. Save changes to the source file.
2. Open Power BI Desktop.
3. Go to Home.
4. Click Refresh.
5. Wait for the refresh process to finish.
6. Verify that the new records appear.

### What happens during refresh?

```text
SOURCE DATA CHANGES
        |
        v
CLICK REFRESH
        |
        v
POWER QUERY RUNS AGAIN
        |
        v
SAVED TRANSFORMATIONS APPLY
        |
        v
DATA MODEL UPDATES
        |
        v
REPORTS SHOW UPDATED DATA
```

### Important concepts

**Manual Refresh:** You click Refresh yourself.

**Scheduled Refresh:** In Power BI Service, you can configure automatic refresh for supported data sources and connection setups.

**Refresh limitations:** Scheduled refresh may require credentials, an on-premises data gateway, supported licensing, and correct source configuration.

**Important:** Refresh does not automatically fix incorrect source data or change your transformation logic. It reruns the saved steps against the available source data.

---

# Practical Project — Sweet Shop Data Cleaning

Use your existing Sweet Shop workbook with two sheets:

**Sheet 1: Orders**

- Order_ID
- Order_Date
- Product_ID
- Quantity

**Sheet 2: Products**

- Product_ID
- Product_Name
- Unit_Price
- Unit_Cost



# Quick Revision

- Data Cleaning → Correcting errors and inconsistencies.
- Remove Duplicates → Removing repeated records.
- Replace Values → Replacing incorrect or inconsistent values.
- Split Columns → Dividing one column into multiple columns.
- Merge Queries → Combining tables horizontally using matching columns.
- Append Queries → Combining tables vertically by adding rows.
- Data Types → Defining the type of information in each column.
- Conditional Columns → Creating new columns based on conditions.
- Query Refresh → Retrieving updated source data and rerunning transformations.



## Final Concept

**Raw Data → Data Cleaning → Data Transformation → Data Validation → Refresh → Data Model → Dashboard**

A Data Analyst should make sure the data is accurate, consistent, and ready for analysis before building visualizations.
