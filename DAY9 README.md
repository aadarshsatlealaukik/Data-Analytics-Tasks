# Data Analytics – Daily Task Update
## Day 9: Dashboard Principles, KPI Cards, Power Query & Data Preparation

### 1. Dashboard Principles

**Definition:** Dashboard Principles are guidelines for designing clear, accurate, and user-friendly dashboards that communicate important business information quickly and support decision-making.

A dashboard should help users understand business performance without requiring them to examine large amounts of raw data.

**Key principles:**

- **Simplicity:** Display only relevant information and avoid unnecessary elements.
- **Clear Visual Hierarchy:** Place the most important KPIs and insights where users can notice them quickly.
- **Consistency:** Use consistent fonts, colors, number formats, and chart styles.
- **Appropriate Charts:** Select chart types based on the question being answered.
- **Readable Labels:** Use clear titles, meaningful labels, and understandable units.
- **Accuracy:** Ensure that metrics, calculations, and data sources are reliable.
- **Relevant Colors:** Use colors consistently to communicate categories, comparisons, or important exceptions.
- **Purpose-Driven Design:** Every chart or KPI should help answer a business question.
- **Limited Clutter:** Avoid excessive colors, unnecessary borders, 3D effects, and too many visualizations.
- **Useful Interactivity:** Include filters and slicers when they help users explore the data.

**Example:** A sales dashboard may display total revenue, total profit, monthly sales trends, regional performance, and top-selling products.

**Business application:** Help managers identify performance gaps and make informed decisions quickly.

### 2. KPI Cards

**Definition:** KPI Cards are visual elements that display important business metrics prominently on a dashboard. They help users understand key performance indicators at a glance.

**Common KPI examples:**

- Total Revenue
- Total Profit
- Total Orders
- Average Order Value
- Customer Count
- Sales Growth Rate
- Profit Margin
- Target Achievement Percentage

**Example:**

A sales dashboard displays:
- Total Revenue = ₹10,00,000
- Total Profit = ₹2,00,000
- Total Orders = 500
- Profit Margin = 20%

These values provide a quick overview of business performance.

**Common KPI calculations:**

**Total Revenue**

`=SUM(Revenue_Range)`

**Total Profit**

`=Total Revenue-Total Cost`

**Profit Margin**

`=(Total Profit/Total Revenue)*100`

**Sales Growth Rate**

`=((Current Sales-Previous Sales)/Previous Sales)*100`

**Best practices for KPI Cards:**

- Use clear metric names.
- Display values with appropriate currency and percentage formats.
- Include a comparison with a target or previous period when useful.
- Avoid showing too many KPIs on one screen.
- Make sure the displayed value responds correctly to relevant filters.

**Business application:** Monitor performance against targets and identify areas requiring attention.

### 3. Charts and Data Visualization

**Definition:** Charts are graphical representations of data that help users identify trends, patterns, relationships, distributions, and comparisons.

They convert numerical information into visual formats that are easier to understand.

**Common chart types and their uses:**

**A. Bar Chart**

Compares values across categories.

Example: Compare revenue across different products or regions.

**B. Column Chart**

Uses vertical bars to compare categories.

Example: Compare quarterly revenue across different years.

**C. Line Chart**

Shows changes and trends over time.

Example: Track monthly sales growth throughout the year.

**D. Pie or Doughnut Chart**

Shows how categories contribute to a whole.

Example: Display each product category's share of total sales when there are only a few categories.

**E. Scatter Plot**

Shows the relationship between two numerical variables.

Example: Examine the relationship between advertising expenditure and revenue.

**F. Histogram**

Shows the distribution of numerical values across intervals.

Example: Analyze the distribution of customer purchase amounts.

**G. Combo Chart**

Combines two chart types, such as columns and a line, to compare related measures.

Example: Display monthly revenue as columns and profit margin as a line.

**Chart selection principles:**

- Use line charts for time-based trends.
- Use bar or column charts for category comparisons.
- Use scatter plots to explore relationships.
- Use histograms to understand distributions.
- Use pie or doughnut charts sparingly when showing a small number of parts of a whole.

**Business application:** Communicate analytical findings and make patterns easier to identify.

### 4. Interactive Reports

**Definition:** Interactive Reports allow users to explore data dynamically through filters, slicers, drill-downs, and other interactive features rather than viewing only fixed results.

They help users investigate performance from different perspectives.

**Common interactive features:**

- **Filters:** Restrict the data shown based on selected conditions.
- **Slicers:** Provide visible controls for selecting categories such as region, product, or year.
- **Drill-Down:** Move from summarized information to more detailed levels of a hierarchy.
- **Drill-Through:** Open a separate report page containing details related to a selected data point.
- **Tooltips:** Display additional information when users hover over a visual.
- **Cross-Filtering:** Selecting data in one visual filters or highlights related information in other visuals.

**Example:** A manager selects the Indore region in a sales dashboard. The KPI Cards, product chart, and monthly trend update to reflect Indore's sales performance, depending on the report's filter configuration.

**Business application:** Help stakeholders investigate performance by region, product, salesperson, customer segment, or time period.

**Important:** Interactive reports must be tested to ensure that filters behave correctly and do not produce misleading results.

### 5. Power Query

**Definition:** Power Query is a data connection and preparation technology available in tools such as Excel and Power BI. It allows users to import, clean, combine, and transform data before loading it for analysis.

It records transformation steps so they can be applied again when the data is refreshed.

**Key capabilities:**

- Import data from files, databases, and supported online sources.
- Remove duplicates and unnecessary columns.
- Handle missing values and errors.
- Change data types.
- Split or merge columns.
- Replace values.
- Append rows from multiple datasets.
- Merge datasets using matching columns.
- Pivot and unpivot data.
- Rename columns and standardize formats.

**Example:** A company receives separate sales files from three branches. Power Query imports the files, standardizes column names, removes duplicate records, combines the datasets, and loads the prepared data into Power BI.

**Business application:** Reduce repetitive manual data-cleaning work and prepare consistent datasets for reporting.

**Important:** Power Query is primarily used for data preparation. DAX measures and calculated columns are generally used for calculations within a Power BI data model.

### 6. Importing Data

**Definition:** Importing Data means bringing information from an external source into an analytical tool, such as Power BI or Excel, so it can be prepared, analyzed, and visualized.

**Common data sources:**

- Excel workbooks
- CSV and text files
- SQL Server
- MySQL and other supported databases
- Web APIs
- SharePoint and other supported services
- Cloud data platforms

**How to import data into Power BI Desktop:**

1. Open Power BI Desktop.
2. Select Home → Get Data.
3. Choose the required source, such as Excel, Text/CSV, or SQL Server.
4. Provide the file path or connection details.
5. Select the required tables or worksheets.
6. Choose Transform Data to inspect and prepare the dataset in Power Query, or Load to load it directly.
7. Validate the imported data before building visuals.

**Example:** Import a sales CSV file containing Order ID, Order Date, Product, Region, and Revenue.

**Business application:** Connect data from different business systems to create reports and dashboards.

**Important:** Choose an appropriate storage mode in Power BI based on the data source and reporting requirements. Import mode stores a copy of data in the model, while DirectQuery queries the source for supported operations.

### 7. Cleaning Data

**Definition:** Data Cleaning is the process of identifying and correcting or handling inaccurate, incomplete, duplicated, inconsistent, or invalid data to improve its quality and reliability.

Poor data quality can lead to incorrect calculations, misleading KPIs, and unreliable business decisions.

**Common data-cleaning tasks:**

**A. Handle Missing Values**

Identify blank or missing entries and decide whether to replace them, retain them, or exclude affected records based on the business context.

**B. Remove Duplicates**

Identify duplicate records and remove them when they represent unintended repeated entries.

**C. Correct Data Types**

Ensure that numbers, dates, text, and percentages are stored in appropriate data types.

**D. Standardize Formats**

Make values consistent across records.

Example: Standardize `Indore`, `indore`, and `INDORE` into one consistent category.

**E. Handle Errors**

Investigate invalid values, failed calculations, and incorrect records before deciding how to correct them.

**F. Validate Values**

Check whether values fall within expected ranges and follow business rules.

Example: Confirm that order quantities are positive and transaction dates are valid.

**G. Standardize Text**

Remove unnecessary spaces, correct inconsistent spelling, and normalize text when appropriate.

**Business application:** Prepare reliable datasets before calculating KPIs, building dashboards, or sharing reports.

**Important:** Do not automatically replace all missing numerical values with zero. A missing value may mean unknown, unavailable, or not applicable rather than zero.

### 8. Data Transformations

**Definition:** Data Transformation is the process of changing the structure, format, or values of data to make it suitable for analysis and reporting.

Transformations can include cleaning, restructuring, combining, aggregating, and calculating new fields.

**Common transformations:**

- **Change Data Types:** Convert text-formatted dates into valid date values.
- **Rename Columns:** Change unclear field names into meaningful labels.
- **Remove Columns:** Exclude irrelevant fields.
- **Split Columns:** Separate a full name into first name and last name.
- **Merge Columns:** Combine related fields into one column.
- **Replace Values:** Standardize inconsistent labels.
- **Merge Queries:** Combine datasets using matching keys.
- **Append Queries:** Stack records from multiple datasets with compatible structures.
- **Pivot Columns:** Turn distinct values into separate columns.
- **Unpivot Columns:** Convert multiple columns into attribute-value rows.
- **Add Calculated Columns:** Create additional fields based on existing data.

**Example:** A dataset contains separate Year, Month, and Day columns. A transformation combines them into a valid Order Date field.

**Business application:** Organize data into a consistent structure so it can be analyzed accurately and efficiently.

**Cleaning vs. Transformation:**

- Data Cleaning focuses on improving data quality.
- Data Transformation focuses on changing data into a useful structure or format.

Cleaning is often one part of the broader data transformation process.

### 9. Refresh Concept

**Definition:** Refreshing Data updates the report's data from its connected source and reapplies the relevant query or model processing steps, depending on the tool and connection configuration.

It helps keep reports aligned with the latest available source information.

**Example:** A sales dashboard was created using data from Monday. New sales transactions are added on Tuesday. Refreshing the report brings in the new records, subject to the source connection and refresh configuration.

**Common refresh concepts in Power BI:**

- **Manual Refresh:** The user initiates a refresh.
- **Scheduled Refresh:** Power BI Service refreshes supported imported data according to a configured schedule.
- **Data Source Updates:** New or changed source records become available to the report after a successful refresh.
- **Query Refresh:** Power Query transformations are reapplied during data loading.
- **Visual Updates:** Visuals recalculate and update based on the refreshed data model.

**How to refresh in Power BI Desktop:**

1. Open the report.
2. Select Home → Refresh.
3. Wait for the refresh to complete.
4. Check for errors or missing data.
5. Verify that important KPIs and charts reflect the updated records.

**Business application:** Keep sales dashboards, inventory reports, and performance monitoring up to date.

**Important:** Refresh does not guarantee that the source data itself is current. The report depends on source availability, permissions, connection settings, and refresh configuration. Scheduled refresh in Power BI Service may require a gateway for certain on-premises sources.

### 10. Day 9 Key Takeaways

- **Dashboard Principles:** Design dashboards that are clear, accurate, consistent, and easy to understand.
- **KPI Cards:** Highlight the most important business performance measures.
- **Charts:** Visualize trends, comparisons, distributions, and relationships.
- **Interactive Reports:** Allow users to explore information using filters, slicers, and drill-downs.
- **Power Query:** Import, clean, combine, and transform data.
- **Importing Data:** Connect Excel, CSV, databases, APIs, and other supported sources.
- **Cleaning Data:** Improve data quality by handling missing values, duplicates, errors, and inconsistent formats.
- **Transformations:** Restructure and modify data to make it suitable for analysis.
- **Refresh Concept:** Update reports with the latest available data from connected sources.

### Day 9 Learning Objective

Learn how to prepare data using Power Query, connect data sources, clean and transform datasets, create effective dashboards, use KPI Cards and interactive visualizations, and refresh reports to support reliable business decision-making.
