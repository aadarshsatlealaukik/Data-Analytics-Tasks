# Pandas — Data Manipulation and Analysis

## 1. Selecting Data

Selecting means retrieving specific columns or rows from a DataFrame.

```python
import pandas as pd

df = pd.DataFrame({
    "Employee": ["Aman", "Riya", "Rahul", "Neha"],
    "Department": ["IT", "HR", "IT", "Sales"],
    "Salary": [30000, 40000, 25000, 50000]
})

# Select one column
print(df["Salary"])

# Select multiple columns
print(df[["Employee", "Salary"]])

# Select rows by position
print(df.iloc[0:2])

# Select rows using labels
print(df.loc[0:2, ["Employee", "Salary"]])
```

- `df["Salary"]` — Select one column.
- `df[["Employee", "Salary"]]` — Select multiple columns.
- `iloc` — Select using integer positions.
- `loc` — Select using labels and conditions.

## 2. Filtering Data

Filtering selects rows that satisfy a condition.

```python
# Employees earning more than 30,000
print(df[df["Salary"] > 30000])

# Employees in IT
print(df[df["Department"] == "IT"])

# Multiple conditions: use & for AND and | for OR
result = df[
    (df["Department"] == "IT") |
    (df["Salary"] < 30000)
]
print(result)
```

Remember to put each condition inside parentheses when using `&` or `|`.

## 3. Sorting Data

Sorting arranges rows in ascending or descending order.

```python
# Lowest to highest salary
print(df.sort_values("Salary"))

# Highest to lowest salary
print(df.sort_values("Salary", ascending=False))

# Sort by multiple columns
print(df.sort_values(
    ["Department", "Salary"],
    ascending=[True, False]
))
```

- `ascending=True` — Smallest to largest.
- `ascending=False` — Largest to smallest.

## 4. Missing Values

Missing values are absent or unavailable data, commonly represented by `NaN` or `None`.

```python
# Check missing values
print(df.isnull())
print(df.isnull().sum())

# Remove rows containing missing values
df.dropna(inplace=True)

# Fill missing salaries with the average
df["Salary"] = df["Salary"].fillna(df["Salary"].mean())
```

- `isnull()` — Identify missing values.
- `isnull().sum()` — Count missing values per column.
- `dropna()` — Remove rows or columns containing missing values.
- `fillna()` — Replace missing values.

**Important:** Choose whether to remove or fill missing values based on the business context. Do not automatically replace every missing value with zero.

## 5. Duplicates

Duplicates are repeated records in a dataset.

```python
# Identify duplicate rows
print(df.duplicated())

# Count duplicate rows
print(df.duplicated().sum())

# Remove duplicate rows
df = df.drop_duplicates()
```

To identify duplicates using a specific column:

```python
print(df.duplicated(subset=["Employee"]))
```

Use `subset` when a particular field or combination of fields should be unique.

## 6. Type Conversion

Type conversion changes a column's data type so calculations and analysis work correctly.

```python
df["Salary"] = df["Salary"].astype("float64")
```

Convert messy numeric data safely:

```python
df["Salary"] = pd.to_numeric(
    df["Salary"],
    errors="coerce"
)
```

- `astype()` — Convert to a specified data type.
- `pd.to_numeric()` — Convert values to numeric data.
- `errors="coerce"` — Convert invalid values to missing values (`NaN`).

## 7. String Operations

Pandas provides the `.str` accessor for cleaning and transforming text columns.

```python
df["Employee"] = df["Employee"].str.strip()

# Convert to uppercase
df["Employee"] = df["Employee"].str.upper()

# Replace text
df["Department"] = df["Department"].str.replace(
    "Sales", "Marketing"
)

# Check whether text contains a value
print(df["Department"].str.contains("IT", na=False))
```

Common string methods:
- `.str.lower()` — Convert to lowercase.
- `.str.upper()` — Convert to uppercase.
- `.str.strip()` — Remove surrounding whitespace.
- `.str.replace()` — Replace text.
- `.str.contains()` — Find matching text.
- `.str.len()` — Count characters.

## 8. Date and Time

Date conversion allows you to filter records by date and analyze trends over time.

```python
df = pd.DataFrame({
    "Order_Date": ["2026-01-10", "2026-02-15", "2026-03-20"]
})

df["Order_Date"] = pd.to_datetime(df["Order_Date"])

print(df["Order_Date"].dt.year)
print(df["Order_Date"].dt.month)
print(df["Order_Date"].dt.day)
```

Filter dates:

```python
result = df[df["Order_Date"] >= "2026-02-01"]
print(result)
```

Useful date properties:
- `.dt.year` — Extract the year.
- `.dt.month` — Extract the month.
- `.dt.day` — Extract the day.
- `.dt.day_name()` — Get the weekday name.

For invalid date values, use `pd.to_datetime(column, errors="coerce")`.

## 9. GroupBy

`groupby()` divides data into groups so you can analyze each group separately.

```python
df = pd.DataFrame({
    "Department": ["IT", "HR", "IT", "HR", "Sales"],
    "Salary": [30000, 40000, 35000, 45000, 50000]
})

print(df.groupby("Department")["Salary"].mean())
```

This calculates the average salary for each department.

Multiple grouping columns:

```python
df.groupby(["Department"])["Salary"].sum()
```

You can group by multiple columns by passing a list, for example `groupby(["Department", "Year"])`, when both columns exist.

## 10. Aggregation

Aggregation summarizes data using calculations such as sum, mean, count, minimum, and maximum.

```python
print(df["Salary"].sum())
print(df["Salary"].mean())
print(df["Salary"].min())
print(df["Salary"].max())
print(df["Salary"].count())
```

Multiple aggregations:

```python
summary = df.groupby("Department")["Salary"].agg(
    ["count", "sum", "mean", "min", "max"]
)

print(summary)
```

- `sum` — Total.
- `mean` — Average.
- `count` — Number of non-missing values.
- `min` / `max` — Lowest and highest values.
- `agg()` — Apply multiple summary functions.


## Quick Revision

- **Selecting:** Choose columns or rows.
- **Filtering:** Keep rows matching conditions.
- **Sorting:** Arrange data in order.
- **Missing values:** Detect, remove, or fill absent values.
- **Duplicates:** Find and remove repeated records.
- **Type conversion:** Change data types.
- **String operations:** Clean and search text.
- **Date/time:** Convert and analyze dates.
- **GroupBy:** Split data into groups.
- **Aggregation:** Calculate summary metrics.
