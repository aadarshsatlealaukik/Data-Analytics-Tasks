# Day 36 — Dashboard DAX Measure Library

## A. Basic Measures

```dax
Total Revenue =
SUM(FACT_SALES[Revenue])
```

```dax
Total Profit =
SUM(FACT_SALES[Profit])
```

```dax
Total Quantity =
SUM(FACT_SALES[Quantity])
```

```dax
Total Orders =
DISTINCTCOUNT(FACT_SALES[Sales_ID])
```

```dax
Total Customers =
DISTINCTCOUNT(FACT_SALES[Customer_ID])
```

```dax
Total Products =
DISTINCTCOUNT(FACT_SALES[Product_ID])
```

## B. Profitability Measures

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

## C. Time Intelligence Measures

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
    BLANK()
)
```

## D. Target Measures

For a practice dashboard, you can use an illustrative target of ₹5,00,000. Replace this with your actual business target when available.

```dax
Sales Target =
500000
```

```dax
Target Achievement % =
DIVIDE(
    [Total Revenue],
    [Sales Target],
    0
)
```

```dax
Target Variance =
[Total Revenue] - [Sales Target]
```

## E. Customer Measures

```dax
Revenue Per Customer =
DIVIDE(
    [Total Revenue],
    [Total Customers],
    0
)
```

## F. Product Measures

```dax
Average Selling Price =
DIVIDE(
    [Total Revenue],
    [Total Quantity],
    0
)
```

## G. Ranking Measures

```dax
Product Rank =
RANKX(
    ALL(DIM_PRODUCT[Product_Name]),
    [Total Revenue],
    ,
    DESC,
    DENSE
)
```

```dax
Customer Rank =
RANKX(
    ALL(DIM_CUSTOMER[Customer_Name]),
    [Total Revenue],
    ,
    DESC,
    DENSE
)
```

**Formatting:**
- Revenue, Profit, AOV: Currency (₹).
- Profit Margin: Percentage.
- Growth: Percentage.
- Quantity and Orders: Whole number.
- Target Achievement: Percentage.
