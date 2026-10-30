# Python Control Flow and Functions — Quick Summary

## 1. if / elif / else

Decision-making statements execute code based on conditions.

```python
marks = 75

if marks >= 90:
    print("Grade A")
elif marks >= 60:
    print("Grade B")
else:
    print("Grade C")
```

- `if` checks the first condition.
- `elif` checks another condition if earlier conditions are false.
- `else` executes when no previous condition is true.

## 2. for Loops

A `for` loop repeats code for each item in a sequence, such as a list or a range of numbers.

```python
for i in range(1, 6):
    print(i)
```

Output: `1 2 3 4 5`

Example: Calculate the total of salaries.

```python
salaries = [20000, 30000, 40000]
total = 0

for salary in salaries:
    total += salary

print(total)  # 90000
```

`range(start, stop, step)` generates a sequence of numbers. The `stop` value is excluded.

## 3. while Loops

A `while` loop repeats code as long as its condition is `True`.

```python
count = 1

while count <= 5:
    print(count)
    count += 1
```

Use `while` when repetition depends on a condition rather than a fixed sequence.

**Important:** Update the condition variable to avoid an infinite loop.

## 4. Functions

A function is a reusable block of code that performs a specific task. Define it using `def`.

```python
def greet():
    print("Hello, Python!")

greet()
```

Functions reduce repetition and make programs easier to maintain.

## 5. Parameters

Parameters are variables listed in a function definition. Arguments are the actual values passed when calling the function.

```python
def greet(name):
    print("Hello", name)

greet("Aadarsh")
```

Here, `name` is the parameter and `"Aadarsh"` is the argument.

Functions can accept multiple parameters:

```python
def add(a, b):
    print(a + b)

add(10, 20)
```

## 6. Return Values

The `return` statement sends a result back to the caller so it can be stored or reused.

```python
def add(a, b):
    return a + b

result = add(10, 20)
print(result)  # 30
```

**Difference:** `print()` displays a value, while `return` gives the value back to the calling code.

## 7. Lambda Functions

A lambda is a small anonymous function written in one expression.

```python
square = lambda x: x * x

print(square(5))  # 25
```

Example with `sorted()`:

```python
employees = [
    {"name": "Aman", "salary": 30000},
    {"name": "Riya", "salary": 25000}
]

result = sorted(employees, key=lambda e: e["salary"])
print(result)
```

This sorts employees by salary in ascending order.

## 8. List Comprehension

List comprehension creates a new list in a concise way.

**Normal loop:**

```python
squares = []

for n in range(1, 6):
    squares.append(n * n)

print(squares)
```

**List comprehension:**

```python
squares = [n * n for n in range(1, 6)]
print(squares)  # [1, 4, 9, 16, 25]
```

You can also filter values using a condition:

```python
even_numbers = [n for n in range(1, 11) if n % 2 == 0]
print(even_numbers)
```

Output: `[2, 4, 6, 8, 10]`


## Quick Revision

- `if/elif/else` — Make decisions.
- `for` — Iterate over a sequence.
- `while` — Repeat while a condition is true.
- `def` — Define a function.
- Parameters — Receive input in a function.
- `return` — Send a result back.
- `lambda` — Create a small anonymous function.
- List comprehension — Create lists concisely.
