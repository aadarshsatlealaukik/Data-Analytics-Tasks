# Day 35 — Power BI Time Intelligence & KPI Calculations

## 1. Date Tables

### What is a Date Table?

A Date Table is a separate table containing a continuous list of dates and useful calendar information.

It helps Power BI perform time-based calculations such as:
- Monthly revenue
- MTD (Month-to-Date)
- YTD (Year-to-Date)
- Previous month revenue
- Year-over-year growth

### Example: DIM_DATE

| Date | Day | Month | Month Number | Quarter | Year |
|---|---:|---|---:|---|---:|
| 01-01-2026 | 1 | January | 1 | Q1 | 2026 |
| 02-01-2026 | 2 | January | 1 | Q1 | 2026 |
| 01-02-2026 | 1 | February | 2 | Q1 | 2026 |
| 01-03-2026 | 1 | March | 3 | Q1 | 2026 |

### Why do we need a Date Table?

Without a proper Date Table, time intelligence calculations may not work as expected.

A good Date Table should:
- Have one row per calendar date.
- Contain unique dates.
- Have no missing dates within the required date range.
- Cover the complete period needed for analysis.
- Be related to the fact table using its date column.

### Create a Date Table using DAX

Go to Modeling → New Table.

```dax
DIM_DATE =
ADDCOLUMNS(
    CALENDAR(
        DATE(2025,1,1),
        DATE(2027,12,31)
    ),
    "Year", YEAR([Date]),
    "Month Number", MONTH([Date]),
    "Month", FORMAT([Date], "MMMM"),
    "Quarter", "Q" & FORMAT([Date], "Q"),
    "Day", DAY([Date])
)
```

This creates a calendar table from 2025 through 2027.

### Important: Sort Month Names

Month names can appear alphabetically instead of chronologically.

To fix this:

1. Open Data View.
2. Select DIM_DATE[Month].
3. Go to Column Tools.
4. Select Sort by Column.
5. Choose Month Number.

### Mark as Date Table

1. Select DIM_DATE in the model.
2. Go to Table Tools.
3. Select Mark as date table.
4. Choose the Date column.
5. Confirm.

### Create Relationship

Connect:

`DIM_DATE[Date]` → `FACT_SALES[Order_Date]`

Relationship:
- Cardinality: One-to-Many.
- Filter direction: Single.
- Active: Yes.

Both columns should have the Date data type and compatible values.

---

## 2. MTD — Month-to-Date

### What is MTD?

MTD stands for Month-to-Date.

It calculates the total value from the beginning of the current month up to the current date in the evaluation context.

### Example

Suppose today's reporting date is 16 November 2026.

You have these sales:

| Date | Revenue |
|---|---:|
| 01 Nov | 1,000 |
| 05 Nov | 2,000 |
| 10 Nov | 1,500 |
| 15 Nov | 2,500 |

MTD Revenue:

1,000 + 2,000 + 1,500 + 2,500 = ₹7,000.

### DAX Measure

First create a basic measure:

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Now create MTD:

```dax
Revenue MTD =
TOTALMTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

### Business use

- Current month's revenue.
- Current month's orders.
- Current month's profit.
- Monthly sales performance.

**Remember:** MTD means cumulative performance from the beginning of the month through the selected date.

---

## 3. YTD — Year-to-Date

### What is YTD?

YTD stands for Year-to-Date.

It calculates the total value from the beginning of the year up to the selected date.

### Example

Suppose your company has these monthly revenues:

| Month | Revenue |
|---|---:|
| January | 50,000 |
| February | 60,000 |
| March | 70,000 |
| April | 80,000 |

If the selected date is 15 April, and the table contains the full monthly values shown, YTD revenue through April is:

50,000 + 60,000 + 70,000 + 80,000 = ₹2,60,000.

In an actual daily dataset, only transactions up to the selected date should be included.

### DAX Measure

```dax
Revenue YTD =
TOTALYTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

### Business use

- Total revenue this year.
- Total profit this year.
- Total sales this year.
- Annual target achievement.

### MTD vs YTD

MTD:
- Starts at the beginning of the month.
- Ends at the selected date.

YTD:
- Starts at the beginning of the year.
- Ends at the selected date.

---

## 4. Previous Period

### What is Previous Period?

Previous-period analysis compares the current period with an earlier period.

Common comparisons include:
- Current month vs previous month.
- Current quarter vs previous quarter.
- Current year vs previous year.

### Example

| Month | Revenue |
|---|---:|
| September | 80,000 |
| October | 1,00,000 |
| November | 1,20,000 |

If November is selected, the previous month's revenue is ₹1,00,000.

### DAX: Previous Month Revenue

```dax
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSMONTH(DIM_DATE[Date])
)
```

### Previous Year Revenue

```dax
Previous Year Revenue =
CALCULATE(
    [Total Revenue],
    SAMEPERIODLASTYEAR(DIM_DATE[Date])
)
```

### Previous Quarter Revenue

```dax
Previous Quarter Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSQUARTER(DIM_DATE[Date])
)
```

**Important:** These measures compare corresponding calendar periods based on the date context. They are not automatically equivalent to a custom rolling 30-day or 90-day comparison.

---

## 5. Growth Percentage

### What is Growth %?

Growth percentage measures how much a metric has increased or decreased compared with a previous period.

### Formula

Growth % =

(Current Period Value − Previous Period Value) / Previous Period Value × 100

### Example

Previous month revenue = ₹1,00,000.

Current month revenue = ₹1,20,000.

Growth:

(1,20,000 − 1,00,000) / 1,00,000 × 100

= 20%.

The business achieved 20% revenue growth.

### DAX Measure

```dax
Revenue Growth % =
DIVIDE(
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue],
    0
)
```

Format this measure as Percentage.

### Negative Growth Example

Previous month = ₹1,00,000.

Current month = ₹80,000.

Growth = -20%.

This means revenue declined by 20%.

### Business use

- Monthly revenue growth.
- Quarterly profit growth.
- Year-over-year sales growth.
- Customer growth.

**Important:** If previous-period revenue is zero, the growth percentage is undefined. DIVIDE's alternate result of zero is a display choice, not a mathematical growth value.

---

## 6. Time Intelligence

### What is Time Intelligence?

Time Intelligence is a set of DAX functions that helps analyze business metrics across different periods.

### Important Time Intelligence Functions

**TOTALMTD**

Calculates Month-to-Date.

```dax
Revenue MTD =
TOTALMTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

**TOTALQTD**

Calculates Quarter-to-Date.

```dax
Revenue QTD =
TOTALQTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

**TOTALYTD**

Calculates Year-to-Date.

```dax
Revenue YTD =
TOTALYTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

**PREVIOUSMONTH**

Returns the previous month's date period.

```dax
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSMONTH(DIM_DATE[Date])
)
```

**SAMEPERIODLASTYEAR**

Returns the corresponding period from the previous year.

```dax
Last Year Revenue =
CALCULATE(
    [Total Revenue],
    SAMEPERIODLASTYEAR(DIM_DATE[Date])
)
```

**DATEADD**

Shifts the selected date context by a specified number of intervals.

```dax
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    DATEADD(DIM_DATE[Date], -1, MONTH)
)
```

### Important requirements

- Use a proper Date Table.
- Use a continuous date column.
- Create an active relationship with the fact table.
- Mark the Date Table where appropriate.
- Make sure the selected dates and reporting periods match your business requirement.

---

## 7. Dynamic Measures

### What are Dynamic Measures?

Dynamic measures are calculations that change their results based on user selections, filters, slicers, or the current report context.

### Example 1: Revenue by Region

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

Create a bar chart:

- Axis: DIM_REGION[Region_Name]
- Values: [Total Revenue]

Power BI automatically calculates revenue for each region.

### Example 2: Dynamic Revenue Based on Slicer

Add a slicer using DIM_PRODUCT[Category].

When a user selects Sweets, the Total Revenue measure shows revenue for Sweets.

When the user selects Snacks, the same measure shows revenue for Snacks.

You do not need to write separate measures for each category.

### Example 3: Dynamic Metric Selection

You can allow users to switch between Revenue, Profit, and Quantity using a slicer.

Create a disconnected table:

```dax
Metric Selector =
DATATABLE(
    "Metric", STRING,
    {
        {"Revenue"},
        {"Profit"},
        {"Quantity"}
    }
)
```

Create a dynamic measure:

```dax
Selected Metric =
SWITCH(
    SELECTEDVALUE('Metric Selector'[Metric]),
    "Revenue", [Total Revenue],
    "Profit", [Total Profit],
    "Quantity", [Total Quantity],
    BLANK()
)
```

Add Metric Selector[Metric] to a slicer.

Add Selected Metric to a Card.

Now the card changes according to the selected metric.

**Business use:** Interactive dashboards that let managers explore different KPIs without creating separate visuals for every metric.

---

## 8. KPI Calculations

### What is a KPI?

KPI stands for Key Performance Indicator.

It measures how effectively a business is achieving a specific objective.

### Common Sales KPIs

1. Total Revenue
2. Total Profit
3. Profit Margin
4. Revenue Growth %
5. Total Orders
6. Average Order Value
7. Target Achievement %
8. Customer Count

### KPI 1: Total Revenue

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

### KPI 2: Total Profit

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

### KPI 3: Profit Margin

Formula:

Profit Margin = Total Profit / Total Revenue × 100

```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Revenue],
    0
)
```

### KPI 4: Average Order Value

Formula:

Average Order Value = Total Revenue / Total Orders

```dax
Total Orders =
DISTINCTCOUNT(FACT_SALES[Sales_ID])
```

```dax
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders],
    0
)
```

### KPI 5: Target Achievement

Suppose your sales target is ₹5,00,000.

Create a measure:

```dax
Sales Target =
500000
```

Then:

```dax
Target Achievement % =
DIVIDE(
    [Total Revenue],
    [Sales Target],
    0
)
```

Format as Percentage.

### KPI 6: Target Variance

```dax
Target Variance =
[Total Revenue] - [Sales Target]
```

A positive result means revenue is above target; a negative result means revenue is below target.

---

# Practical Project — Sales Performance Dashboard

Use your existing Sweet Shop Star Schema.

## Step 1: Check DIM_DATE

Make sure it contains:
- Date
- Day
- Month
- Month Number
- Quarter
- Year

Mark it as a Date Table.

## Step 2: Create Base Measures

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

## Step 3: Create Time Intelligence Measures

```dax
Revenue MTD =
TOTALMTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

```dax
Revenue YTD =
TOTALYTD(
    [Total Revenue],
    DIM_DATE[Date]
)
```

```dax
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSMONTH(DIM_DATE[Date])
)
```

```dax
Revenue Growth % =
DIVIDE(
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue],
    0
)
```

## Step 4: Create Business KPIs

```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Revenue],
    0
)
```

```dax
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders],
    0
)
```

## Step 5: Build Dashboard Visuals

Create the following visuals:

1. Card — Total Revenue.
2. Card — Revenue MTD.
3. Card — Revenue YTD.
4. Card — Revenue Growth %.
5. Card — Profit Margin %.
6. Line Chart — Monthly Revenue.
7. Column Chart — Current Month vs Previous Month Revenue.
8. Slicer — Year.
9. Slicer — Month.
10. Slicer — Region.

## Step 6: Test Your Dashboard

- Select different months.
- Select different regions.
- Check whether the KPIs update.
- Compare current and previous month revenue.
- Verify growth percentages.
- Check whether MTD and YTD calculations follow the selected dates.

---

# Quick Revision

- Date Table → A continuous calendar table for time analysis.
- MTD → Month-to-Date.
- QTD → Quarter-to-Date.
- YTD → Year-to-Date.
- Previous Period → Comparison with an earlier period.
- Growth % → Percentage increase or decrease.
- Time Intelligence → DAX functions for date-based analysis.
- Dynamic Measures → Measures that respond to filters and selections.
- KPI → Metric used to measure business performance.

## Important Interview Questions

1. What is a Date Table in Power BI?
2. Why do we mark a Date Table?
3. What is MTD?
4. What is YTD?
5. What is the difference between MTD and YTD?
6. What is TOTALYTD?
7. What is the purpose of SAMEPERIODLASTYEAR?
8. What is DATEADD?
9. How do you calculate monthly growth percentage?
10. What is a dynamic measure?
11. What is a KPI?
12. How do you calculate profit margin and average order value?

## Final Concept

**Time Intelligence = Date Table + DAX Functions + Period Comparison**

**Business Analysis = Current Performance + Previous Performance + Growth % + KPI + Action**

A Data Analyst should not only report how much revenue a company generated. They should also explain whether revenue is improving, declining, meeting targets, or requiring attention.
