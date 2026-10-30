# Python Fundamentals — Quick Summary

## 1. Python Environment
A Python environment is the setup required to write and execute Python code.

- **Python interpreter:** Executes Python code.
- **IDE:** Software used to write and run code, such as VS Code or PyCharm.
- **Libraries:** Pre-written code used for specific tasks, such as Pandas and NumPy.
- **pip:** Python's package installer.

Example installation command:

```bash
pip install pandas numpy matplotlib
```

## 2. Jupyter Notebook
Jupyter Notebook lets you write and run Python code in separate cells. It is useful for data analysis, visualization, and experimentation.

- **Code cells:** Execute Python code.
- **Markdown cells:** Write notes and explanations.
- **Output:** Displays results below a cell.

```python
name = "Python"
print(name)
```

Useful shortcuts:
- `Shift + Enter` — Run the current cell.
- `Esc`, then `A` — Insert a cell above.
- `Esc`, then `B` — Insert a cell below.
- `Esc`, then `M` — Change a cell to Markdown.

## 3. Variables
Variables store values and allow you to reuse them.

```python
name = "Aadarsh"
age = 22
salary = 25000

print(name)
print(age)
```

Rules:
- A variable cannot start with a number.
- Variable names are case-sensitive.
- Use meaningful names, preferably in `snake_case`.
- Python determines the type automatically.

## 4. Data Types
Data types describe the kind of value stored in a variable.

- `int` — `10`
- `float` — `10.5`
- `str` — `"Hello"`
- `bool` — `True`, `False`
- `list` — `[1, 2, 3]`
- `tuple` — `(1, 2, 3)`
- `dict` — `{"name": "Aadarsh"}`
- `set` — `{1, 2, 3}`
- `NoneType` — `None`

```python
age = 22
print(type(age))
```

## 5. Operators
Operators perform calculations and comparisons.

- **Arithmetic:** `+`, `-`, `*`, `/`, `//`, `%`, `**`
- **Comparison:** `==`, `!=`, `>`, `<`, `>=`, `<=`
- **Assignment:** `=`, `+=`, `-=`
- **Logical:** `and`, `or`, `not`
- **Membership:** `in`, `not in`
- **Identity:** `is`, `is not`

```python
a = 10
b = 3

print(a + b)   # 13
print(a // b)  # 3
print(a % b)   # 1
print(a > b)   # True
```

## 6. Strings
Strings represent text and are written inside quotes. They are immutable, meaning individual characters cannot be changed directly.

```python
name = "Python"

print(name[0])       # P
print(name.upper())  # PYTHON
print(name.lower())  # python
print(len(name))     # 6
print(name[0:3])     # Pyt
```

Useful methods:
- `strip()` — Remove surrounding whitespace.
- `replace()` — Replace text.
- `split()` — Split a string into a list.
- `find()` — Find a substring's position.
- `lower()` and `upper()` — Change letter case.

## 7. Lists
Lists store multiple items in an ordered, mutable collection. They allow duplicate values and different data types.

```python
numbers = [10, 20, 30, 20]

print(numbers[0])  # 10

numbers.append(40)
numbers.remove(20)

print(numbers)
```

Useful methods:
- `append()` — Add one item.
- `insert()` — Add an item at a position.
- `remove()` — Remove the first matching item.
- `pop()` — Remove and return an item.
- `sort()` — Sort the list.
- `len()` — Count the items.

## 8. Tuples
Tuples store multiple items in an ordered, immutable collection. They allow duplicates.

```python
coordinates = (10, 20, 30)

print(coordinates[0])
print(len(coordinates))
```

Use tuples when values should not be changed, such as fixed coordinates or configuration values.

## 9. Dictionaries
Dictionaries store data as key-value pairs. Keys must be unique and hashable.

```python
employee = {
    "name": "Aadarsh",
    "age": 22,
    "salary": 25000
}

print(employee["name"])

employee["salary"] = 30000
employee["city"] = "Indore"

print(employee)
```

Useful methods:
- `keys()` — Get all keys.
- `values()` — Get all values.
- `items()` — Get key-value pairs.
- `get()` — Retrieve a value safely.
- `update()` — Add or update entries.
- `pop()` — Remove an entry.

## 10. Sets
Sets store unique elements in an unordered collection. Duplicate values are automatically removed.

```python
numbers = {10, 20, 20, 30}

print(numbers)  # Contains 10, 20, 30

numbers.add(40)
numbers.discard(10)

print(numbers)
```

Useful operations:
- `add()` — Add an item.
- `discard()` — Remove an item if present.
- `union()` — Combine unique elements.
- `intersection()` — Find common elements.
- `difference()` — Find elements in one set but not the other.

Example:

```python
a = {1, 2, 3}
b = {3, 4, 5}

print(a.union(b))
print(a.intersection(b))
print(a.difference(b))
```

## Practice Tasks

1. Create variables for an employee's name, age, salary, and department.
2. Take two numbers as input and perform all arithmetic operations.
3. Count the characters in a string and convert it to uppercase.
4. Extract the first three characters of a string.
5. Create a list of five salaries and calculate the total and average.
6. Add, remove, and sort items in a list.
7. Create a tuple containing five numbers and access the second element.
8. Create an employee dictionary and update the salary.
9. Count the number of unique values in a list using a set.
10. Find the common values between two lists using sets.

## Key Takeaway

- **List:** Ordered and changeable.
- **Tuple:** Ordered and unchangeable.
- **Dictionary:** Key-value pairs.
- **Set:** Unique elements.
- **String:** Immutable text.
- **Variable:** A name that refers to a value.

These fundamentals are the foundation for data analysis with Pandas, NumPy, and Matplotlib.
