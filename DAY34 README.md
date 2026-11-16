# Day 34 — DAX Fundamentals

## 1. What is DAX?

DAX stands for **Data Analysis Expressions**.

It is a formula language used in Power BI, Excel Power Pivot, and Analysis Services.

DAX helps you:
- Calculate total revenue.
- Calculate total profit.
- Count orders and customers.
- Calculate profit margins.
- Analyze sales by month or region.
- Create dynamic KPIs.

### Example

Suppose your FACT_SALES table contains:

| Sales_ID | Quantity | Unit_Price | Revenue |
|---|---:|---:|---:|
| S001 | 5 | 200 | 1000 |
| S002 | 3 | 250 | 750 |
| S003 | 4 | 100 | 400 |

You want to calculate total revenue.

DAX:

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Result: ₹2,150.

---

## 2. Calculated Columns

### What is a Calculated Column?

A calculated column creates a new column in a table using a DAX formula.

It calculates a value for every row and stores that result in the data model.

### Example

Suppose your sales table contains:

| Sales_ID | Quantity | Unit_Price |
|---|---:|---:|
| S001 | 5 | 200 |
| S002 | 3 | 250 |
| S003 | 4 | 100 |

You want to calculate revenue for every transaction.

### DAX formula

```dax
Revenue =
FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
```

### Result

| Sales_ID | Quantity | Unit_Price | Revenue |
|---|---:|---:|---:|
| S001 | 5 | 200 | 1000 |
| S002 | 3 | 250 | 750 |
| S003 | 4 | 100 | 400 |

### How to create a calculated column

1. Open Power BI Desktop.
2. Go to Data View.
3. Select FACT_SALES.
4. Click Table Tools or Modeling.
5. Select New Column.
6. Enter your DAX formula.
7. Press Enter.

### When should you use calculated columns?

Use them when you need:
- Row-level calculations.
- Categories for slicers.
- Values for grouping.
- A calculated field for each record.

Example: Revenue, Profit, Order Category.

---

## 3. Measures

### What is a Measure?

A measure is a DAX calculation that produces an aggregated result based on the current filter context.

Unlike a calculated column, a measure does not store a result for every row.

### Example

Suppose your Revenue column contains:

| Sales_ID | Revenue |
|---|---:|
| S001 | 1000 |
| S002 | 750 |
| S003 | 400 |

You want to calculate total revenue.

### DAX formula

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Result: ₹2,150.

### How to create a measure

1. Open Power BI Desktop.
2. Go to Report View or Model View.
3. Select FACT_SALES.
4. Right-click and select New Measure.
5. Enter your formula.
6. Press Enter.

### Example measures

Total Profit:

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

Total Quantity:

```dax
Total Quantity =
SUM(FACT_SALES[Quantity])
```

Average Revenue:

```dax
Average Revenue =
AVERAGE(FACT_SALES[Revenue])
```

### Calculated Column vs Measure

**Calculated Column**
- Calculates row by row.
- Stores results in the model.
- Can be used in slicers and categories.
- Uses row context during its calculation.

**Measure**
- Calculates when used in a visual or query.
- Responds to filters and slicers.
- Commonly used in KPI cards and charts.
- Evaluates using filter context.

### Easy example

Calculated Column = Revenue of every individual order.

Measure = Total Revenue of all selected orders.

---

## 4. SUM Function

### What is SUM?

SUM adds all numeric values in a column.

### Syntax

```dax
SUM(Table[Column])
```

### Example

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Suppose:

| Revenue |
|---:|
| 1000 |
| 750 |
| 400 |

Result: 2,150.

### Business use

- Total Revenue
- Total Profit
- Total Cost
- Total Quantity

**Important:** SUM accepts a column reference, not an arbitrary row-by-row expression.

---

## 5. COUNT Function

### What is COUNT?

COUNT counts the number of non-blank values in a column that contain numeric values, dates, or other supported countable values.

### Syntax

```dax
COUNT(Table[Column])
```

### Example

Suppose your table contains:

| Quantity |
|---:|
| 5 |
| 3 |
| 4 |
| blank |

Formula:

```dax
Quantity Count =
COUNT(FACT_SALES[Quantity])
```

Result: 3.

### Important distinction

- COUNT: Counts non-blank numeric/date values.
- COUNTA: Counts non-blank values, including text.
- COUNTROWS: Counts rows in a table.

If you want to count sales records, COUNTROWS is often more appropriate.

Example:

```dax
Total Sales Records =
COUNTROWS(FACT_SALES)
```

---

## 6. DISTINCTCOUNT Function

### What is DISTINCTCOUNT?

DISTINCTCOUNT counts the number of unique values in a column.

It ignores blank values when counting distinct values, but a blank can be counted as a distinct value if you use DISTINCTCOUNTNOBLANK differently.

### Example

Customer_ID:

| Customer_ID |
|---|
| C01 |
| C02 |
| C01 |
| C03 |
| C02 |

Formula:

```dax
Unique Customers =
DISTINCTCOUNT(FACT_SALES[Customer_ID])
```

Result: 3.

Because there are three unique customer IDs:
- C01
- C02
- C03

### Business use

- Unique Customers
- Unique Products Sold
- Unique Orders
- Unique Regions

### COUNT vs DISTINCTCOUNT

COUNT counts non-blank numeric/date values.

DISTINCTCOUNT counts unique values.

Example:

Values: 10, 10, 20, 30.

- COUNT = 4
- DISTINCTCOUNT = 3

For counting all sales records, consider COUNTROWS. For counting unique customers, use DISTINCTCOUNT.

---

## 7. CALCULATE Function

### What is CALCULATE?

CALCULATE is one of the most important DAX functions.

It evaluates an expression under a modified filter context.

In simple language, it lets you calculate a metric after applying additional filters.

### Syntax

```dax
CALCULATE(
    Expression,
    Filter1,
    Filter2
)
```

### Example

You want to calculate revenue only for the Sweets category.

```dax
Sweet Revenue =
CALCULATE(
    SUM(FACT_SALES[Revenue]),
    DIM_PRODUCT[Category] = "Sweets"
)
```

This calculates revenue after applying the Sweets filter.

### Another example: Revenue for a specific year

```dax
Revenue 2026 =
CALCULATE(
    [Total Revenue],
    DIM_DATE[Year] = 2026
)
```

### Business use

- Revenue from a particular region.
- Profit from a specific product category.
- Sales in a particular year.
- Revenue from completed orders.

**Remember:** CALCULATE modifies filter context. It does not permanently change the underlying data.

---

## 8. FILTER Function

### What is FILTER?

FILTER returns a table containing only rows that satisfy a specified condition.

It is commonly used inside CALCULATE when you need more complex filtering logic.

### Syntax

```dax
FILTER(
    Table,
    Condition
)
```

### Example

You want revenue from sales where Quantity is greater than 3.

```dax
High Quantity Revenue =
CALCULATE(
    [Total Revenue],
    FILTER(
        FACT_SALES,
        FACT_SALES[Quantity] > 3
    )
)
```

This calculates revenue only for rows where Quantity is greater than 3.

### Another example

Calculate revenue from orders above ₹1,000:

```dax
High Value Revenue =
CALCULATE(
    [Total Revenue],
    FILTER(
        FACT_SALES,
        FACT_SALES[Revenue] > 1000
    )
)
```

### CALCULATE vs FILTER

- CALCULATE evaluates an expression under modified filters.
- FILTER returns a filtered table.
- FILTER can be used inside CALCULATE to apply row-level conditions.

For simple conditions, CALCULATE can often accept a direct Boolean filter without FILTER.

---

## 9. SUMX Function

### What is SUMX?

SUMX is an iterator function.

It evaluates an expression for each row of a table and then adds all the results.

### Syntax

```dax
SUMX(
    Table,
    Expression
)
```

### Example

Suppose your FACT_SALES table contains:

| Sales_ID | Quantity | Unit_Price |
|---|---:|---:|
| S001 | 5 | 200 |
| S002 | 3 | 250 |
| S003 | 4 | 100 |

You want to calculate total revenue without creating a separate Revenue column.

DAX:

```dax
Total Revenue =
SUMX(
    FACT_SALES,
    FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
)
```

Calculation:

- 5 × 200 = 1,000
- 3 × 250 = 750
- 4 × 100 = 400

Total = ₹2,150.

### SUM vs SUMX

SUM:

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

SUMX:

```dax
Total Revenue =
SUMX(
    FACT_SALES,
    FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
)
```

Difference:
- SUM adds values from an existing column.
- SUMX calculates an expression row by row and adds the results.

**Business use:** Total revenue, total cost, total profit, and other row-level calculations.

---

## 10. COUNTX Function

### What is COUNTX?

COUNTX evaluates an expression for each row of a table and counts the non-blank numeric results.

### Syntax

```dax
COUNTX(
    Table,
    Expression
)
```

### Example

Suppose FACT_SALES contains:

| Sales_ID | Quantity |
|---|---:|
| S001 | 5 |
| S002 | 3 |
| S003 | 4 |
| S004 | blank |

Formula:

```dax
Quantity Count =
COUNTX(
    FACT_SALES,
    FACT_SALES[Quantity]
)
```

Result: 3.

It evaluates Quantity for each row and counts the non-blank numeric results.

### Another example

Count the number of orders where calculated revenue is greater than ₹500:

```dax
High Revenue Order Count =
COUNTX(
    FILTER(
        FACT_SALES,
        FACT_SALES[Quantity] * FACT_SALES[Unit_Price] > 500
    ),
    FACT_SALES[Sales_ID]
)
```

This example assumes Sales_ID is a numeric value. If Sales_ID is text, COUNTX is not the right function to count it; use COUNTROWS with FILTER instead:

```dax
High Revenue Order Count =
COUNTROWS(
    FILTER(
        FACT_SALES,
        FACT_SALES[Quantity] * FACT_SALES[Unit_Price] > 500
    )
)
```

### COUNT vs COUNTX

- COUNT counts non-blank numeric/date values in a column.
- COUNTX evaluates an expression row by row and counts non-blank numeric results.

---

## 11. Context Concept in DAX

Context is one of the most important concepts in DAX.

There are two main types of context you should understand:

### A. Row Context

Row context means DAX evaluates a calculation for the current row.

It is commonly seen in:
- Calculated columns.
- Iterator functions such as SUMX and COUNTX.

Example:

```dax
Revenue =
FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
```

For each row, Power BI multiplies Quantity by Unit_Price.

Example:
- Row 1: 5 × 200 = 1,000
- Row 2: 3 × 250 = 750
- Row 3: 4 × 100 = 400

Each row gets its own result.

### B. Filter Context

Filter context means the data included in a calculation is restricted by filters.

Filters can come from:
- Slicers.
- Visuals.
- Page filters.
- Report filters.
- CALCULATE.

Example:

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Suppose total revenue is ₹10,000.

When you select the North region in a slicer, Power BI recalculates the measure using only the North region's sales.

The measure changes dynamically.

### C. Understanding both contexts

| Row Context | Filter Context |
|---|---|
| Works with the current row | Restricts the data being evaluated |
| Common in calculated columns | Common in measures |
| Used by iterators | Created by slicers and visual filters |
| Example: Quantity × Price | Example: Revenue for North region |

### D. Context Transition

Context transition occurs when CALCULATE converts an existing row context into filter context.

Example:

```dax
Customer Sales =
CALCULATE(
    SUM(FACT_SALES[Revenue])
)
```

When CALCULATE runs in an existing row context, it can transform that context into filters.

You will understand this more deeply when studying advanced DAX.

### Easy real-world example

Imagine your manager opens a dashboard.

The dashboard shows:
- Total Revenue = ₹10 lakh.
- Region slicer = North.
- Total Revenue changes to ₹3 lakh.

This is filter context in action.

The measure remains the same; the result changes because the selected data changes.

---

# Practical Project — Build DAX Measures

Use your Sweet Shop Star Schema.

### Step 1: Create calculated columns

In FACT_SALES:

```dax
Revenue =
FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
```

```dax
Profit =
FACT_SALES[Revenue] - (
    FACT_SALES[Quantity] * FACT_SALES[Unit_Cost]
)
```

### Step 2: Create basic measures

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

```dax
Total Sales Rows =
COUNTROWS(FACT_SALES)
```

```dax
Unique Customers =
DISTINCTCOUNT(FACT_SALES[Customer_ID])
```

### Step 3: Create CALCULATE measures

```dax
Sweet Revenue =
CALCULATE(
    [Total Revenue],
    DIM_PRODUCT[Category] = "Sweets"
)
```

```dax
North Region Revenue =
CALCULATE(
    [Total Revenue],
    DIM_REGION[Region_Name] = "North"
)
```

### Step 4: Create an iterator measure

```dax
Revenue Using SUMX =
SUMX(
    FACT_SALES,
    FACT_SALES[Quantity] * FACT_SALES[Unit_Price]
)
```

### Step 5: Create a conditional measure

```dax
High Value Sales =
COUNTROWS(
    FILTER(
        FACT_SALES,
        FACT_SALES[Revenue] > 1000
    )
)
```

### Step 6: Create visuals

Create these visuals in Power BI Report View:

1. Card → Total Revenue.
2. Card → Total Profit.
3. Card → Unique Customers.
4. Bar Chart → Revenue by Product.
5. Column Chart → Revenue by Region.
6. Line Chart → Monthly Revenue.
7. Slicer → Region.
8. Slicer → Product Category.

Test your slicers and observe how the measures change.

---

# Quick Revision

- Calculated Column → Creates a stored value for every row.
- Measure → Calculates dynamically based on filter context.
- SUM → Adds numeric column values.
- COUNT → Counts non-blank numeric/date values.
- DISTINCTCOUNT → Counts unique values.
- CALCULATE → Evaluates an expression under modified filter context.
- FILTER → Returns a table containing rows that satisfy a condition.
- SUMX → Evaluates an expression row by row and sums the results.
- COUNTX → Evaluates an expression row by row and counts non-blank numeric results.
- Row Context → Current-row calculation context.
- Filter Context → Context created by filters and selections.
- Context Transition → CALCULATE can convert row context into filter context.

## Important Interview Questions

1. What is DAX in Power BI?
2. What is the difference between a calculated column and a measure?
3. What is the difference between SUM and SUMX?
4. What is the difference between COUNT and DISTINCTCOUNT?
5. What is CALCULATE?
6. What is FILTER?
7. What is the difference between COUNT and COUNTX?
8. What is row context?
9. What is filter context?
10. What is context transition?
11. Why are measures useful in dashboards?
12. When would you use SUMX instead of SUM?

## Final Concept

**DAX = Calculations + Aggregations + Filtering + Context**

Do not just memorize formulas. Understand what each formula calculates, when it should be used, and how its result changes when users interact with a report.
