# Data Analytics – Daily Task Update
## Day 7: Lookup Functions, Text Manipulation, Date Functions & Error Handling

### 1. XLOOKUP Function

**Definition:** XLOOKUP searches for a value in one range and returns the corresponding value from another range. It can search vertically or horizontally and supports custom results when a match is not found.

**Syntax:**

`=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])`

**Parameters:**
- `lookup_value`: The value you want to find.
- `lookup_array`: The range where Excel searches.
- `return_array`: The range containing the value to return.
- `if_not_found`: Optional result if no match exists.
- `match_mode`: Specifies exact match or other supported matching options.
- `search_mode`: Specifies the search direction and method.

**Example:**

`=XLOOKUP(E2,A2:A10,B2:B10,"Not Found")`

**Explanation:** Searches for the value in E2 within A2:A10 and returns the corresponding value from B2:B10. If there is no match, it returns `Not Found`.

**Practical use:** Retrieve employee names using employee IDs, product prices using product codes, or salesperson names using salesperson IDs.

**Important:** XLOOKUP is unavailable in some older Excel versions.

### 2. INDEX and MATCH Functions

INDEX and MATCH can be combined to perform flexible lookups.

**A. INDEX Function**

**Definition:** INDEX returns a value from a specified position within a range or array.

**Syntax:**

`=INDEX(array, row_num, [column_num])`

**Example:**

`=INDEX(B2:B10,3)`

Returns the third value in the range B2:B10.

**B. MATCH Function**

**Definition:** MATCH returns the relative position of a value within a specified range.

**Syntax:**

`=MATCH(lookup_value, lookup_array, [match_type])`

**Example:**

`=MATCH(105,A2:A10,0)`

Returns the position of the first exact match for 105 in A2:A10. The result is a position within the range, not necessarily the worksheet row number.

**C. INDEX + MATCH Combination**

**Syntax:**

`=INDEX(return_range,MATCH(lookup_value,lookup_range,0))`

**Example:**

`=INDEX(B2:B10,MATCH(E2,A2:A10,0))`

**Explanation:** MATCH finds the position of the value in E2 within A2:A10. INDEX then returns the value at that same position from B2:B10.

**Practical use:** Retrieve salesperson names, employee departments, product prices, or customer details using an ID.

**XLOOKUP vs. INDEX + MATCH:**
- XLOOKUP offers a simpler formula in modern Excel versions.
- INDEX + MATCH is useful for compatibility with older Excel versions and flexible lookup arrangements.

### 3. LEFT Function

**Definition:** LEFT extracts a specified number of characters from the beginning (left side) of a text string.

**Syntax:**

`=LEFT(text,[num_chars])`

**Example:**

`=LEFT(A2,3)`

If A2 contains `INDORE123`, the result is `IND`.

**Practical use:** Extract area codes, product prefixes, country codes, or the first characters of an ID.

### 4. RIGHT Function

**Definition:** RIGHT extracts a specified number of characters from the end (right side) of a text string.

**Syntax:**

`=RIGHT(text,[num_chars])`

**Example:**

`=RIGHT(A2,3)`

If A2 contains `INDORE123`, the result is `123`.

**Practical use:** Extract the last digits of an order ID, account code, or product identifier.

### 5. MID Function

**Definition:** MID extracts a specified number of characters from the middle of a text string, starting at a defined position.

**Syntax:**

`=MID(text,start_num,num_chars)`

**Example:**

`=MID(A2,4,3)`

If A2 contains `INDORE123`, the result is `ORE`.

**Explanation:** Starts at the fourth character and extracts three characters.

**Practical use:** Extract specific sections of product codes, employee IDs, or structured text values.

### 6. LEN Function

**Definition:** LEN returns the total number of characters in a text string, including spaces and punctuation.

**Syntax:**

`=LEN(text)`

**Example:**

`=LEN(A2)`

If A2 contains `Data Analyst`, the result is `12`, including the space.

**Practical use:** Check the length of IDs, identify unusually short or long entries, and validate text fields.

### 7. TRIM Function

**Definition:** TRIM removes leading and trailing spaces and reduces repeated ordinary spaces between words to a single space.

**Syntax:**

`=TRIM(text)`

**Example:**

`=TRIM(A2)`

If A2 contains `  Data    Analyst  `, the result is `Data Analyst`.

**Practical use:** Clean customer names, product names, and other text fields before matching or analyzing data.

**Important:** TRIM does not remove every type of whitespace, such as nonbreaking spaces commonly found in copied web data. These may require additional cleaning.

### 8. CLEAN Function

**Definition:** CLEAN removes many non-printing control characters from text.

**Syntax:**

`=CLEAN(text)`

**Example:**

`=CLEAN(A2)`

Returns the text in A2 with supported non-printing characters removed.

**Practical use:** Clean imported text from external files or systems that may contain unwanted control characters.

**Important:** CLEAN does not remove every unwanted symbol or all types of whitespace. For ordinary extra spaces, use TRIM as well.

**Combined cleaning formula:**

`=TRIM(CLEAN(A2))`

This removes supported non-printing characters and cleans ordinary extra spaces.

### 9. CONCAT Function

**Definition:** CONCAT combines text from multiple cells or text strings into a single text string.

**Syntax:**

`=CONCAT(text1,[text2],...)`

**Example:**

`=CONCAT(A2," ",B2)`

If A2 contains `Aadarsh` and B2 contains `Satle`, the result is `Aadarsh Satle`.

**Practical use:** Combine first and last names, join product codes, or create labels.

**Important:** CONCAT does not automatically insert spaces or other separators; include them explicitly in the formula.

### 10. TEXTJOIN Function

**Definition:** TEXTJOIN combines text from multiple cells or strings using a specified delimiter, with an option to ignore empty cells.

**Syntax:**

`=TEXTJOIN(delimiter,ignore_empty,text1,[text2],...)`

**Parameters:**
- `delimiter`: The separator between values, such as a comma, space, or hyphen.
- `ignore_empty`: TRUE to ignore empty cells; FALSE to preserve empty positions.
- `text1`, `text2`, etc.: The text values or ranges to combine.

**Example:**

`=TEXTJOIN(", ",TRUE,A2:A5)`

If A2:A5 contains `Excel`, `SQL`, a blank cell, and `Power BI`, the result is `Excel, SQL, Power BI`.

**Practical use:** Combine skills, product categories, city names, or multiple values into a single cell with a separator.

**CONCAT vs. TEXTJOIN:**
- CONCAT combines text without automatically adding a delimiter.
- TEXTJOIN combines text using a specified delimiter and can ignore empty cells.

### 11. Date and Time Functions

Date and time functions help Data Analysts calculate durations, extract date components, and prepare time-based reports.

**A. DATE Function**

**Definition:** Creates a valid Excel date from separate year, month, and day values.

**Syntax:**

`=DATE(year,month,day)`

**Example:**

`=DATE(2026,10,12)`

Returns the date October 12, 2026, displayed according to the cell's date format.

**Practical use:** Construct dates from separate year, month, and day columns.

**B. TODAY Function**

**Definition:** Returns the current date according to the computer's date settings.

**Syntax:**

`=TODAY()`

**Example:** Use it to calculate the number of days remaining until a deadline.

`=A2-TODAY()`

If A2 contains a future due date, the formula calculates the number of days from today to that date.

**C. NOW Function**

**Definition:** Returns the current date and time according to the computer's date and time settings.

**Syntax:**

`=NOW()`

**Practical use:** Calculate elapsed time or display the latest recalculated date and time in a workbook.

**Important:** TODAY and NOW are volatile functions; their results can update when Excel recalculates.

**D. YEAR Function**

**Definition:** Extracts the year from a valid Excel date.

**Syntax:**

`=YEAR(date)`

**Example:**

`=YEAR(A2)`

If A2 contains `12-Oct-2026`, the result is `2026`.

**E. MONTH Function**

**Definition:** Extracts the month number from a valid Excel date.

**Syntax:**

`=MONTH(date)`

**Example:**

`=MONTH(A2)`

If A2 contains `12-Oct-2026`, the result is `10`.

**F. DAY Function**

**Definition:** Extracts the day of the month from a valid Excel date.

**Syntax:**

`=DAY(date)`

**Example:**

`=DAY(A2)`

If A2 contains `12-Oct-2026`, the result is `12`.

**G. DAYS Function**

**Definition:** Calculates the number of days between two dates.

**Syntax:**

`=DAYS(end_date,start_date)`

**Example:**

`=DAYS(B2,A2)`

If A2 contains October 1, 2026, and B2 contains October 12, 2026, the result is `11`.

**Practical use:** Calculate delivery duration, project timelines, employee tenure in days, or the number of days between transactions.

### 12. Error Handling with IFERROR

**Definition:** IFERROR returns a specified alternative result when a formula produces an error. Otherwise, it returns the formula's original result.

**Syntax:**

`=IFERROR(value,value_if_error)`

**Example 1: Handle Division Errors**

`=IFERROR(A2/B2,0)`

If B2 is zero and the division produces `#DIV/0!`, the formula returns `0`.

**Example 2: Customize a Lookup Error**

`=IFERROR(XLOOKUP(E2,A2:A10,B2:B10),"Not Found")`

If the lookup formula returns an error, the formula displays `Not Found`.

**Practical use:** Make reports easier to read by replacing expected formula errors with meaningful messages or alternative values.

**Important:** XLOOKUP already supports a custom not-found result through its fourth argument, so you can also write:

`=XLOOKUP(E2,A2:A10,B2:B10,"Not Found")`

Use IFERROR carefully because it can hide errors other than missing matches, including problems in the underlying data or formula.

### 13. Day 7 Key Takeaways

- **XLOOKUP:** Finds a value and returns corresponding information from another range.
- **INDEX:** Returns a value from a specified position in a range.
- **MATCH:** Returns the position of a matching value.
- **LEFT:** Extracts characters from the beginning of text.
- **RIGHT:** Extracts characters from the end of text.
- **MID:** Extracts characters from a specified position.
- **LEN:** Counts the characters in text.
- **TRIM:** Removes unnecessary ordinary spaces.
- **CLEAN:** Removes supported non-printing control characters.
- **CONCAT:** Combines text values.
- **TEXTJOIN:** Combines text values using a delimiter.
- **DATE:** Creates a date from year, month, and day.
- **TODAY:** Returns the current date.
- **NOW:** Returns the current date and time.
- **YEAR:** Extracts the year.
- **MONTH:** Extracts the month number.
- **DAY:** Extracts the day of the month.
- **DAYS:** Calculates the difference between two dates in days.
- **IFERROR:** Returns a customized alternative when a formula produces an error.

### Day 7 Learning Objective

Learn to retrieve information using lookup functions, clean and manipulate text, work with dates, and handle formula errors. These skills are essential for preparing real-world datasets and performing accurate analysis in Excel.
