# Day 31 — Power BI Fundamentals

## 1. Power BI Ecosystem

### What is Power BI?

Power BI is a Business Intelligence (BI) and data visualization tool developed by Microsoft.

It helps organizations:
- Connect data from different sources.
- Clean and transform raw data.
- Analyze business performance.
- Create interactive reports and dashboards.
- Share insights with decision-makers.

### Example

Imagine you work as a Data Analyst in a sweet shop.

The shop maintains data in Excel files:
- Customer Orders
- Product Details
- Product Pricing
- Profit Details
- Store Locations

Using Power BI, you can connect these files, combine the data, calculate revenue and profit, and create a sales dashboard.

### Main components of the Power BI ecosystem

**1. Power BI Desktop**

A Windows application used to connect, transform, model, and visualize data.

**2. Power BI Service**

A cloud-based platform used to publish, share, manage, and collaborate on Power BI reports.

Website: https://app.powerbi.com/

**3. Power BI Mobile**

Mobile applications that allow users to view and interact with reports and dashboards.

**4. Power BI Report Server**

An on-premises reporting solution for organizations that need to host Power BI reports on their own servers.

### Power BI workflow

```text
DATA SOURCES
     |
     v
POWER BI DESKTOP
     |
     v
POWER QUERY
(Clean and Transform Data)
     |
     v
DATA MODEL
(Relationships and Calculations)
     |
     v
REPORTS
(Charts and Visualizations)
     |
     v
POWER BI SERVICE
(Publish and Share)
     |
     v
BUSINESS DECISIONS
```

**Remember:** Power BI Desktop is primarily used to build reports, while Power BI Service is used to publish, share, and manage them.

---

## 2. Power BI Desktop

### What is Power BI Desktop?

Power BI Desktop is a free Windows application that allows Data Analysts to create reports and perform data analysis.

It provides three major views:

### A. Report View

Used to create visualizations and design reports.

You can add:
- Bar charts
- Line charts
- Pie charts
- KPI cards
- Tables
- Slicers
- Maps

Example: Create a sales dashboard showing total revenue, monthly revenue, and profit by region.

### B. Table View (Data View)

Used to inspect the data loaded into your Power BI model.

You can:
- View rows and columns.
- Inspect column data types.
- Create calculated columns.
- Check transformed data.

### C. Model View

Used to manage relationships between different tables.

Example:

Suppose you have two tables:

**Orders Table**

| Order_ID | Product_ID | Quantity |
|---|---|---:|
| 101 | P01 | 5 |
| 102 | P02 | 3 |

**Products Table**

| Product_ID | Product_Name |
|---|---|
| P01 | Gulab Jamun |
| P02 | Rasmalai |

Here, `Product_ID` connects both tables.

You can create a relationship between these tables using Model View.

### Important Power BI Desktop features

- Get Data: Connect to data sources.
- Transform Data: Open Power Query Editor.
- Refresh: Reload data from connected sources.
- Visualizations: Create charts and other visuals.
- Fields/Data pane: Access model tables and columns.
- Filters: Filter report data.
- Publish: Publish reports to Power BI Service.

---

## 3. Importing Data

### What does importing data mean?

Importing data means bringing information from an external source into Power BI so that you can analyze it.

### Steps to import an Excel file

1. Open Power BI Desktop.
2. Click **Home**.
3. Select **Get Data**.
4. Choose **Excel Workbook**.
5. Browse and select your Excel file.
6. Select the required worksheets or tables.
7. Click **Transform Data** to clean the data first, or **Load** to load it directly.

### Example

Suppose you have an Excel workbook containing:

- Sheet 1: Orders
- Sheet 2: Products
- Sheet 3: Profit

You can select all three sheets and load them into Power BI.

### Import vs DirectQuery

**Import Mode**

- Data is loaded into the Power BI model.
- Reports generally perform quickly.
- Data needs to be refreshed to reflect source changes.

**DirectQuery Mode**

- Data remains in the original supported data source.
- Power BI queries the source when visuals need data.
- Performance depends on the source system and query design.
- Some modeling and transformation features have limitations.

### Which should beginners use?

Start with **Import Mode** when working with Excel, CSV, or practice datasets. It is generally easier for learning and small projects.

---

## 4. Data Sources

### What are data sources?

A data source is the location from which Power BI retrieves information.

Power BI supports many types of data sources.

### A. File-based sources

- Excel (.xlsx)
- CSV (.csv)
- Text files (.txt)
- XML
- JSON
- PDF

Example: Import monthly sales data from an Excel workbook.

### B. Database sources

- Microsoft SQL Server
- MySQL
- PostgreSQL
- Oracle Database
- Microsoft Access

Example: Connect Power BI to a company's SQL Server database to analyze customer transactions.

### C. Online sources

- SharePoint
- OneDrive
- Web pages
- Online services and supported APIs

Example: Connect to a supported online source to retrieve business data.

### D. Cloud data sources

- Azure SQL Database
- Azure Synapse Analytics
- Google BigQuery
- Snowflake

### How to connect to a data source

1. Open Power BI Desktop.
2. Select Get Data.
3. Choose your data source.
4. Enter the file path or connection details.
5. Provide authentication if required.
6. Select the required tables or data.
7. Load or transform the data.

**Important:** Some connectors require credentials, permissions, gateways, or additional configuration.

---

## 5. Power Query Introduction

### What is Power Query?

Power Query is a data connection and transformation tool available in Power BI and Excel.

It helps you clean and prepare raw data before loading it into the data model.

It follows the ETL process:

**ETL = Extract → Transform → Load**

### Step 1: Extract

Retrieve data from different sources.

Example: Import sales records from Excel.

### Step 2: Transform

Clean and modify the data.

Examples:
- Remove duplicate rows.
- Handle missing values.
- Change column data types.
- Rename columns.
- Split columns.
- Remove unnecessary columns.

### Step 3: Load

Load the transformed data into the Power BI data model.

### How to open Power Query Editor

1. Open Power BI Desktop.
2. Import your dataset.
3. Go to the Home tab.
4. Click **Transform Data**.
5. Power Query Editor will open.

### Important areas of Power Query Editor

**1. Queries Pane**

Displays the imported tables and queries.

**2. Data Preview**

Displays rows and columns of the selected query.

**3. Applied Steps**

Shows the transformations applied to the data.

**4. Query Settings**

Displays query properties and applied steps.

**5. Ribbon**

Contains tools for removing columns, filtering rows, changing data types, splitting columns, and more.

### What is Applied Steps?

Every transformation you perform is recorded as a step.

Example:

```text
Source
  |
  v
Navigation
  |
  v
Promoted Headers
  |
  v
Changed Type
  |
  v
Removed Duplicates
  |
  v
Filtered Rows
```

You can select an earlier step to see how the data looked at that stage.

Power Query records these operations and applies them again when the query is refreshed.

---

## 6. Basic Transformations in Power Query

Data transformation means modifying raw data into a clean and usable format.

Let's understand the most important transformations.

### A. Remove Columns

Used to remove unnecessary columns.

Example:

Original data:

| Order_ID | Customer | Phone | Email | Revenue |
|---|---|---|---|---:|
| 101 | Rahul | 9999999999 | rahul@email.com | 500 |

If Phone and Email are not required for your analysis, remove those columns.

Steps:
1. Select the unwanted column.
2. Right-click.
3. Select Remove.

### B. Rename Columns

Used to change column names.

Example:

- `Order_ID` → `Order ID`
- `Cust_Name` → `Customer Name`
- `Rev` → `Revenue`

Steps:
1. Double-click the column heading.
2. Enter the new name.
3. Press Enter.

### C. Remove Duplicates

Used to remove repeated records.

Example:

| Order_ID | Customer |
|---|---|
| 101 | Rahul |
| 102 | Amit |
| 101 | Rahul |

Steps:
1. Select the relevant columns.
2. Go to Home.
3. Select Remove Rows.
4. Click Remove Duplicates.

**Important:** Select the columns that define a duplicate. Selecting all columns checks for identical rows; selecting only Order_ID checks for repeated order IDs.

### D. Handle Missing Values

Missing values are empty or null cells.

Example:

| Product | Price |
|---|---:|
| Gulab Jamun | 200 |
| Rasmalai | null |
| Jalebi | 150 |

Possible actions:
- Replace null with a suitable value.
- Remove rows if appropriate.
- Keep null values when the missing information is meaningful.

Do not automatically replace every missing value with zero. Zero and missing are not always the same.

### E. Change Data Types

Every column should have an appropriate data type.

Examples:

- Order_ID → Text or Whole Number, depending on its use.
- Order_Date → Date.
- Revenue → Decimal Number or Fixed Decimal Number.
- Quantity → Whole Number.
- Profit Margin → Percentage or Decimal Number.

Steps:
1. Select the column.
2. Click the data type icon near the column name.
3. Select the correct data type.

### F. Filter Rows

Used to display only records matching specific conditions.

Example:

Suppose you want only orders where Revenue is greater than ₹500.

Steps:
1. Click the filter icon on Revenue.
2. Select Number Filters.
3. Choose Greater Than.
4. Enter 500.
5. Click OK.

### G. Split Columns

Used to divide one column into multiple columns.

Example:

Original:

| Customer_Name |
|---|
| Rahul Sharma |
| Amit Verma |

After splitting by space:

| First Name | Last Name |
|---|---|
| Rahul | Sharma |
| Amit | Verma |

Steps:
1. Select the column.
2. Go to Transform.
3. Click Split Column.
4. Choose By Delimiter.
5. Select Space.
6. Click OK.

### H. Replace Values

Used to replace one value with another.

Example:

Original:

| Region |
|---|
| N |
| S |
| E |

Replace:
- N → North
- S → South
- E → East

Steps:
1. Select the column.
2. Right-click.
3. Select Replace Values.
4. Enter the old and new values.

### I. Add Custom Column

Used to create a new column using a formula.

Example:

Suppose you have:

| Quantity | Unit Price |
|---:|---:|
| 5 | 100 |
| 3 | 200 |

You want to calculate Revenue.

Formula:

```powerquery
[Quantity] * [Unit Price]
```

Steps:
1. Open Add Column.
2. Select Custom Column.
3. Enter the column name: Revenue.
4. Enter the formula.
5. Click OK.

Result:

| Quantity | Unit Price | Revenue |
|---:|---:|---:|
| 5 | 100 | 500 |
| 3 | 200 | 600 |

### J. Close & Apply

After completing transformations:

1. Go to Home.
2. Click Close & Apply.
3. Power Query applies the steps.
4. The transformed data loads into Power BI Desktop.

---

## Important Difference: Power Query vs DAX

**Power Query**
- Used for cleaning and transforming data.
- Works before data is loaded into the model.
- Uses the M language.

**DAX (Data Analysis Expressions)**
- Used for calculations and analysis in the data model.
- Creates measures and calculated columns.
- Commonly used for KPIs and business calculations.

Example:

Power Query custom column:

```powerquery
[Quantity] * [Unit Price]
```

DAX measure:

```dax
Total Revenue =
SUM(Orders[Revenue])
```

Remember: Power Query prepares the data; DAX helps analyze the data.

---

## Practical Project — Sweet Shop Sales Dataset

Create an Excel workbook with two sheets.

**Sheet 1: Orders**

| Order_ID | Order_Date | Product_ID | Quantity |
|---|---|---|---:|
| 101 | 01-11-2026 | P01 | 5 |
| 102 | 02-11-2026 | P02 | 3 |
| 103 | 03-11-2026 | P03 | 4 |

**Sheet 2: Products**

| Product_ID | Product_Name | Unit_Price | Unit_Cost |
|---|---|---:|---:|
| P01 | Gulab Jamun | 200 | 120 |
| P02 | Rasmalai | 250 | 150 |
| P03 | Jalebi | 100 | 60 |


### Expected outcome

You should have clean Orders and Products tables, with a relationship between them, ready for dashboard creation.

---

## Quick Revision

- **Power BI:** Business Intelligence and data visualization tool.
- **Power BI Desktop:** Used to build reports and data models.
- **Power BI Service:** Used to publish and share reports.
- **Get Data:** Connects Power BI to data sources.
- **Data Sources:** Excel, CSV, SQL Server, MySQL, and more.
- **Power Query:** Used to clean and transform data.
- **ETL:** Extract, Transform, Load.
- **Applied Steps:** Records transformation operations.
- **Close & Apply:** Loads transformed data into the model.
- **DAX:** Used for calculations and analysis.

**Key learning:** A Data Analyst should never blindly visualize raw data. First understand the source, validate the records, clean the data, and then begin analysis.
