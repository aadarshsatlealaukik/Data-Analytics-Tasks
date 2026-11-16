# Student Marks Analysis System

# PYTHON + NUMPY + PANDAS

## 1. Project Overview

The **Student Marks Analysis System** is a Python-based data analysis project developed to manage and analyze student academic performance across multiple classes.

The project uses Python, Pandas, and NumPy to process student marks, calculate total scores and percentages, analyze subject-wise performance, identify class toppers, and generate automated Excel reports.

It provides a menu-driven interface that allows teachers to access student records and perform different academic analyses.

## 2. Project Objectives

- Analyze student academic performance.
- Calculate total marks and percentages.
- Display student counts across different classes.
- Identify class-wise toppers.
- Calculate subject-wise average marks.
- Perform pass/fail analysis.
- Generate class-wise Excel reports.
- Generate an overall academic performance report.

## 3. Tools & Technologies

- **Programming Language:** Python
- **Libraries:** Pandas, NumPy
- **File Handling:** CSV, Excel
- **Report Generation:** ExcelWriter
- **Python Modules:** OS

## 4. Dataset Description

The project uses a CSV dataset named `student.csv`.

The dataset contains student information and marks across five subjects:

| Column | Description |
|---|---|
| Student_ID | Unique student identification |
| Name | Student name |
| Class | Student's class |
| English | English marks |
| Maths | Mathematics marks |
| Science | Science marks |
| Social_Science | Social Science marks |
| Computer | Computer subject marks |

**Total Maximum Marks:** 500

**Passing Criteria:** At least 33 marks in every subject.

## 5. Project Features

### Student Management & Class Analysis
- Display welcome message and total student count.
- Display student counts for all classes.
- View student rosters for Classes 10-A, 10-B, and 10-C.
- Display student names and IDs.

### Marks Analysis
- Calculate total marks.
- Calculate percentage.
- Display student results class-wise.
- Validate minimum and maximum marks.
- Identify class-wise toppers.

### Subject-Wise Analysis
- Calculate average marks for each subject.
- Analyze subject averages for individual classes.
- Compare academic performance across subjects.

### Pass/Fail Analysis
- Check whether students meet the passing criteria in all five subjects.
- Calculate the total number of passed students.
- Calculate the total number of failed students.

### Automated Excel Reporting

**Class-Wise Report**

The program generates `class_wise_report.xlsx` with separate worksheets for:
- Class 10-A
- Class 10-B
- Class 10-C

**Overall Analysis Report**

The program generates `overall_analysis_report.xlsx` with four worksheets:
- All Students
- Overall Summary
- Subject Averages
- Class Counts

## 6. Python Concepts Demonstrated

- Variables and Data Structures
- Functions
- Conditional Statements
- Loops
- List Operations
- Pandas DataFrames
- Data Cleaning
- Data Type Conversion
- Data Filtering
- Data Aggregation
- Statistical Calculations
- CSV File Handling
- Excel Report Generation
- Directory and File Management
- Menu-Driven Programming

## 7. Project Workflow

```text
Student CSV Dataset
        |
        v
Import Dataset using Pandas
        |
        v
Clean Column Names
        |
        v
Convert Subject Marks to Numeric
        |
        v
Calculate Total & Percentage
        |
        v
Perform Student Analysis
        |
        v
Class-Wise & Subject-Wise Analysis
        |
        v
Topper and Pass/Fail Analysis
        |
        v
Generate Excel Reports
        |
        v
Final Analysis Reports
```

## 8. Project Structure

```text
Student-Marks-Analysis/
│
├── main.py
├── student.csv
│
├── report/
│   ├── class_wise_report.xlsx
│   └── overall_analysis_report.xlsx
│
└── README.md
```

## 9. How to Run the Project

### Step 1: Install Python

Download Python from:

https://www.python.org/downloads/

### Step 2: Install Required Libraries

Open the terminal and execute:

```bash
pip install pandas numpy openpyxl
```

### Step 3: Clone the Repository

```bash
git clone https://github.com/your-username/Student-Marks-Analysis.git
```

### Step 4: Navigate to the Project Folder

```bash
cd Student-Marks-Analysis
```

### Step 5: Run the Python Program

```bash
python main.py
```

### Step 6: Use the Menu

Select an option from the menu to:
- View class rosters and toppers.
- Check student results.
- Analyze subject averages.
- Perform pass/fail analysis.
- Export Excel reports.

Generated reports are saved inside the `report` folder.

## 10. Key Skills Demonstrated

- Python Programming
- Data Analysis using Pandas
- NumPy Fundamentals
- Data Cleaning and Preprocessing
- Statistical Analysis
- Data Aggregation
- Automated Excel Reporting
- File Handling
- Business Logic Implementation
- Problem Solving

## 11. Conclusion

The Student Marks Analysis System demonstrates how Python and Pandas can automate academic data analysis and reporting.

It converts raw student records into meaningful academic information, helping teachers evaluate student performance, identify toppers, understand subject-wise averages, and generate structured Excel reports.

**Project Name:** Student Marks Analysis System  
**Project Type:** Python Data Analysis & Automation  
**Programming Language:** Python  
**Libraries:** Pandas, NumPy  
**Input Format:** CSV  
**Output Format:** Excel


# NUMPY & PANDAS

# Python & Pandas for Data Analytics

## 1. Project Overview

This repository contains my practical learning and hands-on exercises in **Python, NumPy, and Pandas**, focused on developing data analysis skills.

The repository covers numerical operations using NumPy, data manipulation using Pandas, data cleaning, handling missing values, grouping and aggregation, merging datasets, working with dates, processing JSON files, and generating Excel reports.

The main objective is to understand how Python can be used to clean, transform, analyze, and organize raw datasets into meaningful information.

## 2. Tools & Technologies

- **Programming Language:** Python
- **Libraries:** NumPy, Pandas
- **File Formats:** CSV, JSON, Excel
- **Development Environment:** VS Code
- **Reporting:** Excel using Pandas ExcelWriter

## 3. Topics Covered

### Part 1 – NumPy Fundamentals

- Creating NumPy arrays
- One-dimensional and multidimensional arrays
- Array dimensions using `ndim`
- Array shape using `shape`
- Array size using `size`
- Array indexing and slicing
- Reshaping arrays
- Accessing elements from multidimensional arrays
- Vectorized mathematical operations
- Statistical operations:
  - Sum
  - Mean
  - Median
  - Maximum
  - Minimum
- Axis-based calculations
- Percentile calculations
- Conditional array operations

### Part 2 – Pandas Fundamentals

- Creating Pandas Series and DataFrames
- Reading CSV files
- Reading Excel files
- Inspecting datasets
- `head()` and `tail()`
- `info()` and `describe()`
- `shape` and `columns`
- Selecting rows and columns
- `loc` and `iloc`
- Filtering records
- Sorting data
- Renaming columns
- Identifying duplicate records

### Part 3 – Data Cleaning

- Identifying missing values
- `isnull()`
- `dropna()`
- `fillna()`
- Filling missing values using the mean
- Removing duplicate records
- Data type conversion
- Handling inconsistent data

### Part 4 – Grouping and Aggregation

- `groupby()`
- Grouping by single columns
- Grouping by multiple columns
- `sum()`
- `mean()`
- `min()`
- `max()`
- `count()`
- `agg()`
- Sorting grouped results
- Creating department-wise summaries
- Calculating revenue per employee

### Part 5 – Data Manipulation

- Combining DataFrames
- `merge()`
- Inner merge
- Left merge
- Right merge
- Outer merge
- `join()`
- `concat()`
- Row-wise concatenation
- Column-wise concatenation
- Understanding Pivot and Melt concepts

### Part 6 – Working with Values and Creating Features

- Using `apply()`
- Creating custom functions
- Creating salary categories
- Using `groupby().transform()`
- Calculating department average salary
- Creating annual salary
- Calculating bonuses
- Creating department salary cost
- Calculating profit
- Calculating profit margin
- Creating new columns from existing data

### Part 7 – Date and Time Analysis

- Converting strings into datetime
- `pd.to_datetime()`
- Extracting year and month
- Extracting month names
- Extracting day names
- Filtering records by date ranges
- Calculating delivery days

### Part 8 – File Handling and Reporting

- Reading CSV files
- Exporting cleaned datasets to CSV
- Reading JSON files
- Converting JSON into DataFrames
- Exporting DataFrames to JSON
- Reading and writing Excel files
- Creating Excel workbooks using `ExcelWriter`
- Exporting multiple DataFrames into separate worksheets
- Generating business reports

## 4. Practical Exercises

The repository includes hands-on exercises such as:

**NumPy Exercises**
- Sales calculations using arrays.
- Salary increment calculations.
- Array indexing and reshaping.
- Statistical analysis of numerical data.
- Percentile calculations.

**Pandas Exercises**
- Employee salary analysis.
- Department-wise revenue analysis.
- Missing-value handling.
- Duplicate record identification.
- Employee and sales DataFrame merging.
- Revenue per employee calculations.
- Date-based sales filtering.
- Creating new analytical columns.

**Reporting Exercises**
- Exporting employee data to CSV.
- Creating JSON files from DataFrames.
- Generating Excel reports with multiple worksheets.
- Creating business analysis reports.

## 5. Sample Business Analysis

One of the practical exercises uses employee and sales datasets.

The analysis includes:

- Employee salary analysis.
- Department-wise revenue calculation.
- Employee count by department.
- Average salary by department.
- Total revenue by department.
- Revenue per employee.

Example:

```python
result = df.groupby("Department").agg(
    Total_Revenue=("Revenue", "sum"),
    Employee_Count=("Employee", "count")
)

result["Revenue_Per_Employee"] = (
    result["Total_Revenue"] / result["Employee_Count"]
)

print(result.sort_values(
    "Revenue_Per_Employee",
    ascending=False
))
```

This analysis helps compare department performance using revenue generated per employee.

## 6. Project Structure

```text
Python-Data-Analytics/
│
├── NumPy/
│   └── numpy1.py
│
├── Pandas/
│   ├── panda.py
│   ├── pandas1.py
│   ├── pandas2.py
│   ├── pandas3.py
│   ├── pandas4.py
│   ├── adv_pandas.py
│   ├── data_manipulation.py
│   ├── DM2.py
│   └── groupby.py
│
├── Data/
│   ├── emp.json
│   ├── employees.json
│   ├── employees_cleaned.csv
│   └── output.json
│
├── Reports/
│   ├── report.xlsx
│   └── business_report.xlsx
│
└── README.md
```

## 7. Installation and Setup

### Step 1: Install Python

Download Python:

https://www.python.org/downloads/

### Step 2: Install Required Libraries

```bash
pip install numpy pandas openpyxl
```

### Step 3: Clone the Repository

```bash
git clone https://github.com/your-username/Python-Data-Analytics.git
```

### Step 4: Navigate to the Project Folder

```bash
cd Python-Data-Analytics
```

### Step 5: Run a Python File

```bash
python numpy1.py
```

You can also run individual Pandas exercise files.

## 8. Skills Demonstrated

- Python Programming
- NumPy
- Pandas
- Data Cleaning
- Data Manipulation
- Data Transformation
- Data Aggregation
- Exploratory Data Analysis Fundamentals
- Statistical Calculations
- Date and Time Processing
- CSV and JSON Processing
- Excel Report Automation
- Business Data Analysis

## 9. Learning Outcome

Through these practical exercises, I developed an understanding of how Python libraries can be used to process structured data, perform calculations, clean datasets, combine multiple sources, generate analytical summaries, and automate reporting tasks.

These concepts form an important foundation for performing real-world Data Analyst responsibilities.

---

**Project:** Python & Pandas for Data Analytics  
**Language:** Python  
**Libraries:** NumPy, Pandas  
**File Formats:** CSV, JSON, Excel  
**Focus:** Data Cleaning, Data Manipulation, Data Analysis & Reporting
