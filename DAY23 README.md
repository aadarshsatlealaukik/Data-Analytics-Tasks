# Pandas — Quick Summary Notes

## 1. Pandas

Pandas is a Python library used to load, clean, manipulate, and analyze structured data.

```python
import pandas as pd
```

It is commonly used for working with employee records, sales reports, customer data, CSV files, and Excel datasets.

## 2. Series

A Series is a **one-dimensional labeled array** that stores data.

```python
import pandas as pd

sales = pd.Series([1000, 2000, 3000])

print(sales)
print(sales[0])  # 1000
```

You can also assign custom indexes:

```python
sales = pd.Series(
    [1000, 2000, 3000],
    index=["Jan", "Feb", "Mar"]
)

print(sales["Feb"])  # 2000
```

**Use case:** Store and analyze a single column, such as monthly sales.

## 3. DataFrame

A DataFrame is a **two-dimensional labeled data structure** with rows and columns.

```python
data = {
    "Employee": ["Aman", "Riya", "Rahul"],
    "Salary": [30000, 40000, 35000],
    "Department": ["IT", "HR", "IT"]
}

df = pd.DataFrame(data)

print(df)
```

Access a column:

```python
print(df["Salary"])
```

Access a row by position:

```python
print(df.iloc[0])
```

**Use case:** Analyze complete employee, sales, or customer datasets.

## 4. CSV Files

CSV stands for Comma-Separated Values. It is commonly used to store tabular data.

Read a CSV file:

```python
df = pd.read_csv("sales.csv")
print(df)
```

Save a DataFrame to CSV:

```python
df.to_csv("cleaned_sales.csv", index=False)
```

- `read_csv()` loads data.
- `to_csv()` exports data.
- `index=False` prevents Pandas from adding the row index as an extra column.

## 5. Excel Files

Pandas can read and write Excel spreadsheets.

Read an Excel file:

```python
df = pd.read_excel("sales.xlsx", sheet_name="Sales")
```

Write to Excel:

```python
df.to_excel("report.xlsx", index=False)
```

For Excel support, install `openpyxl` if required:

```bash
pip install openpyxl
```

You can load a specific worksheet using `sheet_name`.

## 6. JSON Files

JSON stands for JavaScript Object Notation. It is a common format for storing structured data and exchanging data through APIs.

Read JSON:

```python
df = pd.read_json("employees.json")
```

Export JSON:

```python
df.to_json("employees_output.json", orient="records", indent=2)
```

`orient="records"` stores each row as an individual JSON object.

## 7. Dataset Inspection

Dataset inspection means examining data before analyzing it. It helps you understand the number of rows and columns, data types, missing values, and statistical summaries.

Example dataset:

```python
import pandas as pd

df = pd.DataFrame({
    "Employee": ["Aman", "Riya", "Rahul", "Neha"],
    "Salary": [30000, 40000, 35000, 45000],
    "Age": [24, 27, 25, 29]
})
```

## 8. `head()`

Displays the first five rows by default.

```python
df.head()
df.head(10)  # First 10 rows
```

**Use:** Quickly preview the beginning of a dataset.

## 9. `tail()`

Displays the last five rows by default.

```python
df.tail()
df.tail(3)  # Last 3 rows
```

**Use:** Check the end of a dataset or identify unusual final records.

## 10. `info()`

Displays structural information, including column names, non-null counts, data types, and memory usage.

```python
df.info()
```

**Use:** Identify possible missing values and incorrect data types.

Note: `info()` prints its summary and typically returns `None`.

## 11. `describe()`

Generates descriptive statistics for numerical columns by default.

```python
df.describe()
```

It typically includes:
- `count` — Number of non-missing values.
- `mean` — Average.
- `std` — Standard deviation.
- `min` — Minimum.
- `25%`, `50%`, `75%` — Quartiles.
- `max` — Maximum.

Include all column types:

```python
df.describe(include="all")
```

## 12. `shape`

Returns the number of rows and columns as a tuple.

```python
print(df.shape)
```

Example output:

```text
(4, 3)
```

This means 4 rows and 3 columns.

```python
print(df.shape[0])  # Number of rows
print(df.shape[1])  # Number of columns
```

## 13. `columns`

Returns the column labels of a DataFrame.

```python
print(df.columns)
```

Rename columns:

```python
df.columns = ["Employee", "Monthly_Salary", "Age"]
```

This assignment requires the new list to contain the same number of column names as the DataFrame.

## 14. `dtypes`

Shows the data type of each column.

```python
print(df.dtypes)
```

Common Pandas data types:
- `int64` — Integers.
- `float64` — Decimal numbers.
- `object` — Often text or mixed values.
- `bool` — True/False values.
- `datetime64[ns]` — Date and time values.
- `string` — Pandas string data type.

Convert a column:

```python
df["Salary"] = df["Salary"].astype("float64")
```

Conversion can fail if a column contains incompatible values. For messy data, `pd.to_numeric(df["Salary"], errors="coerce")` converts invalid entries to missing values (`NaN`).

## Recommended Inspection Workflow

```python
df = pd.read_csv("sales.csv")

print(df.head())
print(df.tail())
df.info()
print(df.describe())
print(df.shape)
print(df.columns)
print(df.dtypes)
```


## Quick Revision

- **Pandas:** Library for data analysis.
- **Series:** One-dimensional labeled data.
- **DataFrame:** Two-dimensional tabular data.
- **CSV / Excel / JSON:** Common data import and export formats.
- `head()` / `tail()` — Preview rows.
- `info()` — Inspect structure and non-null counts.
- `describe()` — Summarize statistics.
- `shape` — Count rows and columns.
- `columns` — Inspect column labels.
- `dtypes` — Inspect column data types.
