# Data Analytics – Daily Task Update
## Day 5: Excel Functions, Logical Formulas & Error Handling

### 1. SUM Function

**Definition:** The SUM function adds multiple numbers or values from a selected range of cells and returns their total.

**Syntax:**
`=SUM(number1, [number2], ...)`

**Example:**
`=SUM(A2:A10)`

**Explanation:** Adds all numerical values from cells A2 to A10.

**Practical use:** Calculate total sales revenue, expenses, profit components, or product quantities.

### 2. AVERAGE Function

**Definition:** The AVERAGE function calculates the arithmetic mean of numerical values by dividing their total by the number of numerical values included.

**Syntax:**
`=AVERAGE(number1, [number2], ...)`

**Example:**
`=AVERAGE(A2:A10)`

**Explanation:** Calculates the average of the numerical values in cells A2 to A10. Blank cells and text values in referenced cells are generally ignored.

**Practical use:** Calculate average sales, marks, transaction value, or employee performance scores.

### 3. MIN and MAX Functions

**Definition:** MIN returns the smallest numerical value, while MAX returns the largest numerical value in a selected range.

**Syntax:**

- Minimum value: `=MIN(A2:A10)`
- Maximum value: `=MAX(A2:A10)`

**Example:** If the sales amounts are ₹1,000, ₹2,500, ₹4,000, and ₹1,500:

- `=MIN(A2:A5)` returns ₹1,000.
- `=MAX(A2:A5)` returns ₹4,000.

**Practical use:** Identify the lowest and highest sales amounts, prices, expenses, or performance scores.

### 4. COUNT Function

**Definition:** The COUNT function counts the number of cells containing numerical values in a selected range.

**Syntax:**
`=COUNT(A2:A10)`

**Example:** If cells A2:A10 contain seven numbers and two text entries, the formula returns `7`.

**Practical use:** Count numerical entries, recorded transaction amounts, or cells containing numeric dates.

**Important:** COUNT does not count text entries or blank cells.

### 5. COUNTA Function

**Definition:** The COUNTA function counts all non-empty cells in a selected range, including cells containing numbers, text, dates, logical values, and errors.

**Syntax:**
`=COUNTA(A2:A10)`

**Example:** If the range contains seven numerical values, one text entry, and one blank cell, the formula returns `8`.

**Practical use:** Count customer names, employee records, completed entries, or non-empty cells.

**COUNT vs. COUNTA:**
- COUNT counts numerical values.
- COUNTA counts non-empty cells.

### 6. IF Function

**Definition:** The IF function checks whether a condition is true or false and returns one result if true and another result if false.

**Syntax:**
`=IF(logical_test, value_if_true, value_if_false)`

**Example:**
`=IF(B2>=50,"Pass","Fail")`

**Explanation:**
- If B2 is 50 or higher, the result is `Pass`.
- If B2 is below 50, the result is `Fail`.

**Practical use:** Determine pass/fail status, eligibility, target achievement, bonus qualification, or sales performance categories.

### 7. AND Function

**Definition:** The AND function returns TRUE only when all specified conditions are true. If even one condition is false, it returns FALSE.

**Syntax:**
`=AND(logical1, [logical2], ...)`

**Example:**
`=AND(B2>=50,C2="Yes")`

**Explanation:** Returns TRUE only when:
- B2 is at least 50.
- C2 contains `Yes`.

If either condition is false, the result is FALSE.

**Practical use:** Check whether an employee meets multiple eligibility requirements or whether a sales transaction meets several criteria.

**Combined with IF:**
`=IF(AND(B2>=50,C2="Yes"),"Eligible","Not Eligible")`

This formula returns `Eligible` only when both conditions are satisfied.

### 8. OR Function

**Definition:** The OR function returns TRUE when at least one specified condition is true. It returns FALSE only when all conditions are false.

**Syntax:**
`=OR(logical1, [logical2], ...)`

**Example:**
`=OR(B2="D",B2="I")`

**Explanation:** Returns TRUE if B2 contains either `D` or `I`. Otherwise, it returns FALSE.

**Practical use:** Check whether a transaction belongs to one of several categories or whether an employee meets at least one qualifying condition.

**Combined with IF:**
`=IF(OR(B2="D",B2="I"),"Selected","Not Selected")`

This formula returns `Selected` if B2 contains either `D` or `I`.

### 9. Nested IF Function

**Definition:** A Nested IF uses one IF function inside another IF function to evaluate multiple conditions and return different results depending on which condition is satisfied.

**Syntax:**
`=IF(condition1,result1,IF(condition2,result2,result3))`

**Example:**
`=IF(B2>=80,"A+",IF(B2>=60,"A","Needs Improvement"))`

**Explanation:**
- If B2 is 80 or higher, the result is `A+`.
- Otherwise, if B2 is 60 or higher, the result is `A`.
- If neither condition is true, the result is `Needs Improvement`.

**Practical use:** Assign performance grades, categorize sales performance, calculate commission levels, or classify customers.

**Important:** Check conditions in the correct order, usually from the highest threshold to the lowest, to avoid assigning incorrect categories.

### 10. IFERROR Function

**Definition:** The IFERROR function returns a specified alternative result when a formula produces an error. If the formula does not produce an error, it returns the original result.

**Syntax:**
`=IFERROR(value, value_if_error)`

**Example:**
`=IFERROR(A2/B2,0)`

**Explanation:**
- If A2 divided by B2 produces a valid result, Excel returns the calculated value.
- If the calculation produces an error, such as division by zero, Excel returns `0`.

**Practical use:** Handle calculation errors in revenue-per-order calculations, ratios, lookups, and reports.

**Another example:**
`=IFERROR(XLOOKUP(E2,A2:A10,B2:B10),"Not Found")`

This returns the matching value when available and `Not Found` if the lookup formula returns an error.

**Important:** IFERROR can hide different types of errors, so use it carefully. A zero or alternative message should be appropriate for the business meaning of the calculation.

### 11. Quick Formula Revision

- **SUM:** Adds numerical values.  
  `=SUM(A2:A10)`

- **AVERAGE:** Calculates the arithmetic mean.  
  `=AVERAGE(A2:A10)`

- **MIN:** Returns the smallest numerical value.  
  `=MIN(A2:A10)`

- **MAX:** Returns the largest numerical value.  
  `=MAX(A2:A10)`

- **COUNT:** Counts cells containing numbers.  
  `=COUNT(A2:A10)`

- **COUNTA:** Counts non-empty cells.  
  `=COUNTA(A2:A10)`

- **IF:** Returns a result based on a condition.  
  `=IF(B2>=50,"Pass","Fail")`

- **AND:** Returns TRUE when all conditions are true.  
  `=AND(B2>=50,C2="Yes")`

- **OR:** Returns TRUE when at least one condition is true.  
  `=OR(B2="D",B2="I")`

- **Nested IF:** Evaluates multiple conditions.  
  `=IF(B2>=80,"A+",IF(B2>=60,"A","Needs Improvement"))`

- **IFERROR:** Returns an alternative result when a formula produces an error.  
  `=IFERROR(A2/B2,0)`

### 12. Day 5 Learning Objective

By the end of Day 5, you should be able to:

- Calculate totals, averages, minimums, and maximums.
- Count numerical values and non-empty cells.
- Apply conditional logic using IF, AND, and OR.
- Classify data using Nested IF.
- Handle formula errors using IFERROR.
- Combine logical functions to solve practical business problems.

**Recommended practice:** Create an Excel dataset containing student marks or sales records. Use SUM, AVERAGE, MIN, MAX, COUNT, COUNTA, IF, AND, OR, Nested IF, and IFERROR to calculate results and classify records.
