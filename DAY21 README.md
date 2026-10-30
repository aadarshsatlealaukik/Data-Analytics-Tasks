# Python File Handling and Practical Coding — Quick Summary

## 1. Exception Handling

Exception handling prevents a program from crashing unexpectedly when an error occurs. Python uses `try`, `except`, `else`, and `finally`.

```python
try:
    number = int(input("Enter a number: "))
    print(100 / number)

except ValueError:
    print("Please enter a valid number.")

except ZeroDivisionError:
    print("Cannot divide by zero.")

else:
    print("Calculation successful.")

finally:
    print("Program completed.")
```

- `try` — Code that might cause an error.
- `except` — Handles an error.
- `else` — Runs if no exception occurs.
- `finally` — Runs whether an exception occurs or not.

**Analytics use case:** Handle missing values, invalid input, or incorrect data formats.

## 2. File Handling

File handling allows you to read data from files and write results to them.

```python
# Write to a file
with open("report.txt", "w") as file:
    file.write("Sales Report\nTotal Revenue: 50000")

# Read from a file
with open("report.txt", "r") as file:
    content = file.read()
    print(content)
```

Common file modes:
- `"r"` — Read a file.
- `"w"` — Write; overwrites existing content.
- `"a"` — Append content.
- `"x"` — Create a new file; raises an error if it already exists.

Using `with open()` automatically closes the file when the block finishes.

## 3. CSV Files

CSV stands for **Comma-Separated Values**. It is a common format for storing tabular data, such as employee records and sales transactions.

```python
import csv

# Write CSV data
with open("sales.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Product", "Revenue"])
    writer.writerow(["Laptop", 50000])
    writer.writerow(["Mouse", 1000])

# Read CSV data
with open("sales.csv", "r", newline="") as file:
    reader = csv.reader(file)

    for row in reader:
        print(row)
```

For data analysis, you can also use Pandas:

```python
import pandas as pd

df = pd.read_csv("sales.csv")
print(df.head())
print(df["Revenue"].sum())
```

- `read_csv()` — Loads CSV data.
- `head()` — Displays the first five rows by default.
- `sum()` — Calculates the total.

## 4. Modules

A module is a Python file containing reusable code, such as functions and variables.

Python's built-in modules include `math`, `random`, and `statistics`.

```python
import math

print(math.sqrt(64))  # 8.0
```

You can import a specific function:

```python
from statistics import mean

print(mean([10, 20, 30]))  # 20
```

You can also create your own module by saving functions in a `.py` file and importing them into another Python file.

## 5. Packages

A package organizes related Python modules into a reusable structure.

Common Data Analytics packages:
- **NumPy** — Numerical calculations.
- **Pandas** — Data manipulation and analysis.
- **Matplotlib** — Data visualization.
- **Seaborn** — Statistical visualization.

Install packages using pip:

```bash
pip install numpy pandas matplotlib seaborn
```

Import and use a package:

```python
import pandas as pd

data = {"Sales": [100, 200, 300]}
df = pd.DataFrame(data)

print(df["Sales"].mean())
```

## 6. Virtual Environments

A virtual environment creates an isolated Python environment for a project, helping manage dependencies separately.

Create one:

```bash
python -m venv .venv
```

Activate on Windows:

```bash
.venv\Scripts\activate
```

Install packages inside the activated environment:

```bash
pip install pandas numpy
```

Save installed dependencies:

```bash
pip freeze > requirements.txt
```

Install them later:

```bash
pip install -r requirements.txt
```

**Why use it?** Different projects may require different package versions. Virtual environments help avoid dependency conflicts.

## 7. Analytics-Oriented Coding Exercises

Practice these exercises before moving to Pandas and NumPy.

**Exercise 1 — Sales Total**

```python
sales = [1200, 2500, 1800, 3000, 1500]

total = sum(sales)
average = total / len(sales)

print("Total:", total)
print("Average:", average)
```

**Exercise 2 — Find High Sales**

```python
sales = [1200, 2500, 1800, 3000, 1500]

high_sales = [s for s in sales if s > 2000]
print(high_sales)
```

**Exercise 3 — Employee Salary Analysis**

```python
salaries = [25000, 35000, 45000, 30000, 50000]

print("Highest:", max(salaries))
print("Lowest:", min(salaries))
print("Average:", sum(salaries) / len(salaries))
```

**Exercise 4 — Handle Invalid Data**

```python
values = ["100", "200", "abc", "300"]
clean_values = []

for value in values:
    try:
        clean_values.append(float(value))
    except ValueError:
        print("Invalid value:", value)

print("Clean data:", clean_values)
print("Total:", sum(clean_values))
```

**Exercise 5 — Read a CSV and Calculate Revenue**

Create a `sales.csv` file with columns `Product` and `Revenue`, then run:

```python
import pandas as pd

df = pd.read_csv("sales.csv")

print(df.head())
print("Total revenue:", df["Revenue"].sum())
print("Average revenue:", df["Revenue"].mean())
print("Highest revenue:", df["Revenue"].max())
```

**Exercise 6 — Count Categories**

```python
departments = [
    "IT", "HR", "IT", "Sales", "HR", "IT"
]

counts = {}

for department in departments:
    counts[department] = counts.get(department, 0) + 1

print(counts)
```

Expected result:

```python
{"IT": 3, "HR": 2, "Sales": 1}
```

## Quick Revision

- Exception handling — Manage runtime errors.
- File handling — Read and write files.
- CSV — Store and exchange tabular data.
- Modules — Reuse Python code.
- Packages — Organize and distribute related modules.
- Virtual environments — Isolate project dependencies.
- Analytics exercises — Calculate totals, averages, filter data, clean invalid values, and summarize categories.

**Recommended next step:** Practice reading CSV files, handling missing or invalid values, and calculating basic statistics. Then move to Pandas for real-world data analysis.
