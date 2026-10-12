# Data Analytics – Data Storage & Data Management Fundamentals

## 1. Files

**Definition:** Files are digital containers used to store data in different formats, such as CSV, Excel, JSON, TXT, and XML.

Files allow analysts to collect, share, import, export, and process data using analytical tools.

**Examples:**
- `sales.csv` — Sales records stored in a text-based tabular format.
- `employees.xlsx` — Employee information stored in an Excel workbook.
- `customers.json` — Customer information stored in JSON format.

**Use in Data Analytics:** Data Analysts frequently import files into Excel, SQL databases, Python, Power BI, and Tableau for cleaning, analysis, and reporting.

## 2. Excel

**Definition:** Microsoft Excel is a spreadsheet application used to organize, calculate, analyze, and visualize data in rows and columns.

**Key features:**
- Formulas and functions such as SUM, IF, and XLOOKUP.
- Sorting, filtering, and data validation.
- Pivot Tables and Pivot Charts.
- Data cleaning using Power Query.
- Charts, dashboards, and reports.

**Example:** An analyst uses Excel to calculate monthly revenue, compare sales performance, and identify the best-performing products.

**Use in Data Analytics:** Excel is commonly used for data preparation, calculations, exploratory analysis, and business reporting.

## 3. CSV (Comma-Separated Values)

**Definition:** CSV is a plain-text file format used to store tabular data, where commas typically separate individual values within a record.

**Example:**

```csv
OrderID,Product,Revenue
101,Laptop,50000
102,Mobile,20000
103,Tablet,15000
```

**Key characteristics:**
- Lightweight and easy to exchange.
- Supported by Excel, Python, databases, and BI tools.
- Stores tabular values as text rather than preserving Excel formulas or formatting.
- Does not support multiple worksheets like an Excel workbook.

**Use in Data Analytics:** CSV files are frequently used to import and export datasets between different applications.

## 4. Database

**Definition:** A database is an organized collection of data managed by a database management system (DBMS), which enables users and applications to store, retrieve, update, and manage information.

**Examples:**
- MySQL
- Microsoft SQL Server
- PostgreSQL
- Oracle Database

**Example:** An e-commerce database may contain customer, product, order, and payment tables connected through unique identifiers.

**Use in Data Analytics:** Analysts use SQL to retrieve, filter, join, aggregate, and analyze data stored in databases.

**Important distinction:** A database stores and manages data, while a DBMS is the software used to manage that database.

## 5. Data Warehouse

**Definition:** A Data Warehouse is a centralized data storage system designed primarily for analytical queries, historical analysis, business intelligence, and reporting.

It often combines data from multiple business systems into a consistent structure for analysis.

**Examples:**
- Amazon Redshift
- Google BigQuery
- Snowflake
- Microsoft Fabric Warehouse

**Example:** A retail company combines sales, customer, inventory, and marketing data in a warehouse to analyze business performance across multiple years.

**Use in Data Analytics:** Data Analysts use data warehouses to create reports, calculate KPIs, compare historical performance, and build dashboards.

## 6. Data Lake

**Definition:** A Data Lake is a storage environment designed to hold large amounts of data in its original or minimally processed form, including structured, semi-structured, and unstructured data.

**Examples:**
- Amazon S3 used as a data lake storage layer.
- Azure Data Lake Storage.
- Google Cloud Storage used for data lake workloads.

**Types of data stored:**
- CSV and Excel files.
- JSON and XML documents.
- Images, videos, and audio files.
- Application logs and sensor data.

**Example:** A company stores sales transactions, website clickstream events, customer reviews, and product images in a data lake for future analysis.

**Use in Data Analytics:** Data lakes support flexible data exploration, large-scale processing, and advanced analytics.

**Key difference:** A data warehouse is optimized for structured analysis and reporting, whereas a data lake can retain data in a wider range of formats for different processing needs.

## 7. ETL (Extract, Transform, Load)

**Definition:** ETL is a data integration process in which data is extracted from source systems, transformed into the required format, and then loaded into a target system.

**Steps:**

1. **Extract:** Collect data from databases, files, APIs, or other sources.
2. **Transform:** Clean, validate, standardize, and reshape the data.
3. **Load:** Store the prepared data in a target database or data warehouse.

**Example:** A company extracts sales data from multiple branches, standardizes dates and currency formats, removes duplicate records, and loads the cleaned data into a data warehouse.

**Use in Data Analytics:** ETL helps ensure that data is prepared consistently before it is used for reporting and analysis.

## 8. ELT (Extract, Load, Transform)

**Definition:** ELT is a data integration process in which data is extracted from source systems, loaded into the target platform, and transformed afterward.

**Steps:**

1. **Extract:** Collect data from the source systems.
2. **Load:** Transfer the data into a data warehouse or data platform.
3. **Transform:** Clean, combine, and prepare the data within the target platform.

**Example:** A company loads raw sales data into a cloud data warehouse and then uses SQL to clean and combine the records for reporting.

**Use in Data Analytics:** ELT is common in modern cloud data platforms that provide scalable storage and processing capabilities.

**ETL vs. ELT:** ETL transforms data before loading it into the target system; ELT loads data first and transforms it afterward.

## 9. API (Application Programming Interface)

**Definition:** An API is a defined interface that allows software applications to communicate and exchange data according to specified rules.

APIs often allow applications to request information from a server and receive responses in formats such as JSON.

**Example:** A Data Analyst retrieves product prices and order information from an e-commerce API to analyze sales performance.

**Common API concepts:**
- **Endpoint:** The URL or address of a particular API resource.
- **Request:** The message sent to an API.
- **Response:** The information returned by the API.
- **Authentication:** The process of verifying access permissions or identity.
- **HTTP methods:** GET, POST, PUT, PATCH, and DELETE, each with a defined purpose.

**Use in Data Analytics:** APIs help analysts collect data from business applications, online services, and external platforms.

## 10. JSON (JavaScript Object Notation)

**Definition:** JSON is a lightweight text-based data format used to represent and exchange structured information between applications.

JSON stores information using key-value pairs and supports objects, arrays, strings, numbers, booleans, and null values.

**Example:**

```json
{
  "customer_id": 101,
  "name": "Rahul",
  "city": "Indore",
  "total_orders": 5,
  "active": true
}
```

**Key characteristics:**
- Easy for humans to read and machines to process.
- Commonly used in API requests and responses.
- Supports nested objects and arrays.
- Can represent structured and semi-structured information.

**Use in Data Analytics:** Analysts can extract JSON data from APIs, transform it into tabular form, and analyze it using Python, SQL, or BI tools.

## 11. Data Pipeline

**Definition:** A Data Pipeline is a sequence of automated processes that moves data from one or more source systems to a destination while performing required processing, validation, or transformation.

**Typical stages:**

1. Collect data from sources.
2. Transfer data to a destination.
3. Validate and transform the data.
4. Store the processed data.
5. Make it available for analysis and reporting.
6. Monitor pipeline performance and failures.

**Example:** Every morning, a pipeline retrieves sales data from an API, cleans the records, loads them into a database, and refreshes a Power BI dashboard.

**Use in Data Analytics:** Data pipelines reduce manual work, improve consistency, and help deliver updated data for reporting.

**Important distinction:** ETL and ELT describe specific data integration patterns; a data pipeline is the broader workflow that may include ETL, ELT, validation, scheduling, and monitoring.

## 12. Data Quality

**Definition:** Data Quality refers to how well data meets the requirements of its intended use. High-quality data supports reliable analysis and trustworthy business decisions.

**Six important dimensions of Data Quality:**

1. **Accuracy:** Does the data correctly represent the real-world value?
   
   Example: A product price is recorded as ₹1,500 when the actual price is ₹1,500.

2. **Completeness:** Are all required values available?
   
   Example: Every required sales record contains an order date and revenue amount.

3. **Consistency:** Does the same information agree across different records or systems?
   
   Example: A customer has the same customer ID in the sales and customer databases.

4. **Validity:** Does the data follow the required rules and formats?
   
   Example: An order date uses a valid date format.

5. **Uniqueness:** Are unwanted duplicate records absent?
   
   Example: The same order is not recorded twice.

6. **Timeliness:** Is the data sufficiently up to date for its intended purpose?
   
   Example: A daily sales dashboard uses data refreshed according to the business reporting schedule.

**Use in Data Analytics:** Analysts validate and improve data quality before performing calculations, creating dashboards, or presenting business recommendations.

**Why it matters:** Poor-quality data can lead to inaccurate KPIs, misleading reports, and incorrect business decisions.

## Final Revision

- **Files:** Digital containers for storing data in different formats.
- **Excel:** A spreadsheet application for organizing and analyzing data.
- **CSV:** A plain-text format for tabular data.
- **Database:** An organized collection of data managed by a DBMS.
- **Data Warehouse:** A platform optimized for analytical queries and reporting.
- **Data Lake:** Storage for large volumes of data in varied formats.
- **ETL:** Extract, Transform, Load.
- **ELT:** Extract, Load, Transform.
- **API:** An interface that enables software applications to communicate.
- **JSON:** A text-based format for representing and exchanging structured information.
- **Data Pipeline:** An automated workflow for moving and processing data.
- **Data Quality:** The degree to which data is suitable, reliable, and fit for its intended use.
