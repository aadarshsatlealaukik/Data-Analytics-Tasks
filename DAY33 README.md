# Day 33 — Power BI Data Modeling

## 1. Fact Tables

### What is a Fact Table?

A Fact Table stores measurable business transactions and numerical information.

It generally contains:
- Transaction IDs
- Foreign keys
- Quantity
- Revenue
- Cost
- Profit
- Discount

### Example: FACT_SALES

| Sales_ID | Customer_ID | Product_ID | Date_ID | Quantity | Revenue |
|---|---|---|---|---:|---:|
| S001 | C01 | P01 | D01 | 5 | 1000 |
| S002 | C02 | P02 | D02 | 3 | 750 |
| S003 | C01 | P03 | D03 | 4 | 400 |
| S004 | C03 | P01 | D04 | 2 | 400 |

This table stores individual sales transactions.

### Important concepts

**Grain:** Grain defines exactly what one row in a fact table represents.

Example: One row represents one product line in one sales order.

**Measures:** Numerical values that can be analyzed.

Examples:
- Total Revenue
- Total Quantity
- Total Profit
- Total Discount

### DAX example

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

```dax
Total Quantity =
SUM(FACT_SALES[Quantity])
```

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

**Remember:** A fact table answers questions such as how much, how many, and how often.

---

## 2. Dimension Tables

### What is a Dimension Table?

A Dimension Table stores descriptive information that helps explain and categorize the facts.

It generally contains:
- Names
- Categories
- Locations
- Dates
- Descriptions
- Customer details

### Example 1: DIM_CUSTOMER

| Customer_ID | Customer_Name | Gender | City |
|---|---|---|---|
| C01 | Rahul | Male | Indore |
| C02 | Amit | Male | Bhopal |
| C03 | Priya | Female | Khandwa |

### Example 2: DIM_PRODUCT

| Product_ID | Product_Name | Category |
|---|---|---|
| P01 | Gulab Jamun | Sweets |
| P02 | Rasmalai | Sweets |
| P03 | Jalebi | Snacks |

### Example 3: DIM_DATE

| Date_ID | Date | Month | Year |
|---|---|---|---:|
| D01 | 01-01-2026 | January | 2026 |
| D02 | 02-01-2026 | January | 2026 |
| D03 | 03-01-2026 | January | 2026 |

### Example 4: DIM_REGION

| Region_ID | Region_Name | State |
|---|---|---|
| R01 | Central | Madhya Pradesh |
| R02 | West | Gujarat |
| R03 | North | Rajasthan |

### Why do we need dimension tables?

Suppose your manager asks:

- Which product generated the highest revenue?
- Which city has the most customers?
- Which month had the highest sales?
- Which region performed best?

Dimension tables provide the descriptive information needed to answer these questions.

**Remember:** Fact tables store measurements; dimension tables describe those measurements.

---

## 3. Relationships

### What is a Relationship?

A relationship connects two tables using a common column.

Example:

FACT_SALES contains Customer_ID.

DIM_CUSTOMER also contains Customer_ID.

We connect these tables using Customer_ID.

### Example

DIM_CUSTOMER:

| Customer_ID | Customer_Name |
|---|---|
| C01 | Rahul |
| C02 | Amit |
| C03 | Priya |

FACT_SALES:

| Sales_ID | Customer_ID | Revenue |
|---|---|---:|
| S001 | C01 | 1000 |
| S002 | C02 | 750 |
| S003 | C01 | 400 |

When connected, Power BI can analyze revenue by customer name.

### How to create a relationship

1. Open Power BI Desktop.
2. Go to Model View.
3. Drag DIM_CUSTOMER[Customer_ID].
4. Drop it onto FACT_SALES[Customer_ID].
5. Check the relationship settings.
6. Click OK.

Repeat for the other dimensions.

### Recommended relationship structure

- DIM_CUSTOMER → FACT_SALES
- DIM_PRODUCT → FACT_SALES
- DIM_DATE → FACT_SALES
- DIM_REGION → FACT_SALES

**Important:** The dimension-side key should generally contain unique values. The fact-side foreign key can contain repeated values.

---

## 4. Cardinality

### What is Cardinality?

Cardinality defines how records in one table relate to records in another table.

There are four main relationship types.

### A. One-to-Many (1:*)

One record in the first table can connect to multiple records in the second table.

Example:

One customer can make many sales.

DIM_CUSTOMER (1) → FACT_SALES (*)

This is the most common relationship in a star schema.

### B. Many-to-One (*:1)

Many records in the first table connect to one record in the second table.

Example:

Many sales transactions can belong to one customer.

FACT_SALES (*) → DIM_CUSTOMER (1)

This is the same relationship viewed from the opposite direction.

### C. One-to-One (1:1)

Each record in one table matches at most one record in the other table.

Example:

Two tables containing different attributes for the same unique employee IDs.

### D. Many-to-Many (*:*)

Multiple records in one table can connect to multiple records in another table.

Example:

Students can enroll in multiple courses, and each course can have multiple students.

Many-to-many relationships require careful design to avoid ambiguous filtering and incorrect totals.

### Power BI cardinality settings

| Type | Meaning |
|---|---|
| One-to-Many | One record matches multiple records |
| Many-to-One | Multiple records match one record |
| One-to-One | One record matches one record |
| Many-to-Many | Multiple records match multiple records |

**Interview tip:** In a typical sales star schema, dimension tables are on the ONE side and the fact table is on the MANY side.

---

## 5. Star Schema

### What is a Star Schema?

A Star Schema is a data-model design in which one central fact table is connected directly to multiple dimension tables.

It looks like a star.

### Example

```text
             DIM_CUSTOMER
                   |
                   |
DIM_PRODUCT --- FACT_SALES --- DIM_DATE
                   |
                   |
               DIM_REGION
```

### Components

**Central table: FACT_SALES**

Contains:
- Sales_ID
- Customer_ID
- Product_ID
- Date_ID
- Region_ID
- Quantity
- Revenue
- Profit

**Dimension tables:**

DIM_CUSTOMER:
- Customer_ID
- Customer_Name
- City

DIM_PRODUCT:
- Product_ID
- Product_Name
- Category

DIM_DATE:
- Date_ID
- Date
- Month
- Quarter
- Year

DIM_REGION:
- Region_ID
- Region_Name
- State

### Advantages of Star Schema

1. Easy to understand.
2. Easier to create relationships.
3. Supports efficient filtering.
4. Makes reporting easier.
5. Supports reusable DAX measures.
6. Helps avoid unnecessarily complicated models.

### Star Schema vs Flat Table

**Flat Table:** All information is stored in one large table.

**Star Schema:** Information is organized into a fact table and separate dimension tables.

Star schemas are generally preferred for analytical reporting.

---

## 6. Data-Model Design

### What is Data-Model Design?

Data-model design means organizing tables, relationships, and keys so that data can be analyzed correctly and efficiently.

### Six important rules

**Rule 1: Define the grain**

Decide what one row in your fact table represents.

Example: One row per product per sales order.

**Rule 2: Identify the fact table**

Find the table containing business transactions and measurable values.

Example: FACT_SALES.

**Rule 3: Identify dimension tables**

Find descriptive tables.

Example: Customer, Product, Date, Region.

**Rule 4: Create primary keys**

A primary key uniquely identifies a record in a dimension table.

Example: Customer_ID in DIM_CUSTOMER.

**Rule 5: Create foreign keys**

A foreign key refers to a key in another table.

Example: Customer_ID in FACT_SALES refers to Customer_ID in DIM_CUSTOMER.

**Rule 6: Use appropriate relationships**

Use one-to-many relationships wherever the business structure supports them.

Prefer single-direction filtering from dimensions to the fact table unless a different design is genuinely required.

### Primary Key vs Foreign Key

Primary Key:
- Uniquely identifies a record.
- Does not contain duplicate values.
- Example: DIM_PRODUCT[Product_ID].

Foreign Key:
- Refers to a key in another table.
- Can contain repeated values.
- Example: FACT_SALES[Product_ID].

---

# Practical Project — Build a Star Schema in Power BI

Use your Sweet Shop Sales project.

## Step 1: Create FACT_SALES

Your fact table should contain:

- Sales_ID
- Customer_ID
- Product_ID
- Date_ID
- Region_ID
- Quantity
- Revenue
- Cost
- Profit

## Step 2: Create DIM_CUSTOMER

Columns:
- Customer_ID
- Customer_Name
- Gender
- City

## Step 3: Create DIM_PRODUCT

Columns:
- Product_ID
- Product_Name
- Category
- Unit_Price
- Unit_Cost

## Step 4: Create DIM_DATE

Columns:
- Date_ID
- Date
- Day
- Month
- Quarter
- Year

## Step 5: Create DIM_REGION

Columns:
- Region_ID
- Region_Name
- State

## Step 6: Create Relationships

Connect:

- DIM_CUSTOMER[Customer_ID] → FACT_SALES[Customer_ID]
- DIM_PRODUCT[Product_ID] → FACT_SALES[Product_ID]
- DIM_DATE[Date_ID] → FACT_SALES[Date_ID]
- DIM_REGION[Region_ID] → FACT_SALES[Region_ID]

For each relationship:
- Cardinality: One-to-Many (1:*)
- Cross-filter direction: Single
- Active relationship: Yes

## Step 7: Create DAX Measures

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

```dax
Total Orders =
DISTINCTCOUNT(FACT_SALES[Sales_ID])
```

```dax
Total Quantity =
SUM(FACT_SALES[Quantity])
```

```dax
Profit Margin =
DIVIDE([Total Profit], [Total Revenue], 0)
```

Format Profit Margin as Percentage.

## Step 8: Test Your Data Model

Create these visuals in Report View:

1. Total Revenue by Product Name.
2. Total Profit by Region Name.
3. Total Orders by Customer Name.
4. Monthly Revenue by Month.
5. Total Quantity by Product Category.

If the relationships are correct, dimension fields should filter the fact-table measures correctly.

---

# Quick Revision

- Fact Table: Stores business transactions and numerical measurements.
- Dimension Table: Stores descriptive information.
- Relationship: Connects tables using common columns.
- Cardinality: Defines how records relate between tables.
- Primary Key: Uniquely identifies a record.
- Foreign Key: Refers to a key in another table.
- Star Schema: One fact table connected to multiple dimension tables.
- Data-Model Design: Organizes data for accurate and efficient analysis.

## Important Interview Questions

1. What is data modeling in Power BI?
2. What is a fact table?
3. What is a dimension table?
4. What is the difference between fact and dimension tables?
5. What is cardinality?
6. Explain one-to-many relationships.
7. What is a primary key?
8. What is a foreign key?
9. What is a Star Schema?
10. Why is Star Schema preferred in Power BI?
11. What is the difference between Star Schema and a flat table?
12. What is cross-filter direction?

## Final Concept

**Good Data Model = Correct Grain + Fact Table + Dimension Tables + Proper Keys + Correct Relationships**

A strong data model is the foundation of an accurate and reliable Power BI dashboard.
