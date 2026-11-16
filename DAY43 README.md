# 🌾 Grain & Pulses Store – Business Performance Dashboard

## 📊 Project Overview

The **Grain & Pulses Store Business Performance Dashboard** is an interactive business intelligence project developed using Microsoft Power BI.

The purpose of this dashboard is to analyze sales performance, revenue, profitability, product categories, store performance, and sales channels. It transforms raw Excel data into meaningful business insights through interactive visualizations and DAX calculations.

This project demonstrates practical skills in data cleaning, data modeling, DAX, data visualization, and business intelligence reporting.

## 🎯 Project Objectives

- Analyze overall business revenue and profitability.
- Monitor total sales orders and quantity sold.
- Identify top-performing product categories.
- Compare revenue across different store locations.
- Analyze sales performance across different channels.
- Track monthly revenue trends.
- Support data-driven business decisions.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Source dataset |
| Power BI Desktop | Dashboard development |
| Power Query | Data cleaning and transformation |
| DAX | Measures and calculations |
| Data Modeling | Relationships between tables |
| Data Visualization | Interactive charts and KPIs |

## 📁 Dataset & Data Model

The project uses an Excel workbook containing multiple related datasets.

The Power BI data model includes the following tables:

- **Sales:** Transaction-level sales information.
- **Products:** Product names, categories, brands, and pricing.
- **Customers:** Customer details and segmentation.
- **Stores:** Store locations and details.
- **Employees:** Employee information.
- **Returns:** Product return information.
- **Targets:** Sales targets by store and category.

These tables are connected through relationships to support cross-table analysis.

## 📈 Dashboard Features

### 1. Key Performance Indicators (KPIs)

The dashboard includes five major KPIs:

| KPI | Description |
|---|---|
| Total Revenue | Total sales revenue after discounts |
| Total Profit | Revenue minus product cost |
| Total Orders | Unique number of orders |
| Total Quantity | Total quantity sold in kilograms |
| Profit Margin | Profit as a percentage of revenue |

### 2. Monthly Revenue Trend
- Tracks revenue performance over time.
- Helps identify monthly sales patterns.
- Highlights revenue fluctuations.

### 3. Revenue by Product Category
- Compares revenue across product categories.
- Identifies high-performing categories.
- Supports product-level business decisions.

### 4. Revenue by Store
- Compares revenue across store locations.
- Helps evaluate individual store performance.
- Identifies top-performing branches.

### 5. Revenue by Sales Channel
- Analyzes sales through different channels.
- Compares Walk-in, Online, and Phone sales.

### 6. Interactive Filtering
The report is designed to support filtering and interactive analysis by relevant business dimensions, including store, product category, and order date.

## 🧮 DAX Measures

The following DAX measures were developed:

**Total Revenue**
```dax
Total Revenue =
SUMX(
    Sales,
    Sales[QuantityKg] *
    Sales[UnitSellingPrice] *
    (1 - Sales[DiscountPct])
)
```

**Total Cost**
```dax
Total Cost =
SUMX(
    Sales,
    Sales[QuantityKg] * Sales[UnitCost]
)
```

**Total Profit**
```dax
Total Profit =
[Total Revenue] - [Total Cost]
```

**Total Orders**
```dax
Total Orders =
DISTINCTCOUNT(Sales[OrderID])
```

**Total Quantity**
```dax
Total Quantity =
SUM(Sales[QuantityKg])
```

**Profit Margin**
```dax
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Revenue],
    0
)
```

**Total Customers**
```dax
Total Customers =
DISTINCTCOUNT(Sales[CustomerID])
```

**Average Order Value**
```dax
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders],
    0
)
```

## 💡 Business Insights

The dashboard helps business stakeholders:

- Understand overall sales and profitability.
- Identify the most profitable business areas.
- Compare store-level performance.
- Evaluate customer demand across product categories.
- Understand sales channel contributions.
- Monitor revenue trends for better planning.

## 🚀 Learning Outcomes

Through this project, I gained practical experience in:

- Importing Excel datasets into Power BI.
- Cleaning and transforming data using Power Query.
- Understanding relational data models.
- Creating one-to-many relationships.
- Writing DAX measures.
- Developing KPI cards and interactive charts.
- Building business performance dashboards.
- Translating raw data into actionable insights.

## 📂 Project Files

```text
Grain-and-Pulses-Dashboard/
│
├── Grain_and_Pulses_Dashboard.pbix
├── Grain_and_Pulses_Data.xlsx
└── README.md
```


⭐ If you find this project useful, feel free to explore the repository and share your feedback.

**Built with Microsoft Power BI.**
