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


