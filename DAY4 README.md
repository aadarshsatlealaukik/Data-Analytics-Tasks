# Data Analytics – Daily Task Update
## Day 4: Excel Fundamentals, Data Organization & Basic Formulas

### 1. Workbook
A **Workbook** is an Excel file that can contain multiple worksheets. It is used to organize related data, calculations, and reports in one file.

**Example:** A sales workbook may contain Sales Data, Customer Details, Monthly Report, and Dashboard worksheets.

**File extensions:** `.xlsx`, `.xls`, `.xlsm`

### 2. Worksheet
A **Worksheet** is an individual spreadsheet within a workbook, consisting of rows, columns, and cells.

**Example:** A worksheet named `Sales` may contain order IDs, product names, quantities, prices, and revenue.

**Use:** Worksheets help organize different categories of information within the same workbook.

### 3. Rows
**Rows** are horizontal arrangements of cells in an Excel worksheet. Each row is identified by a number, such as 1, 2, 3, and so on.

**Example:** Row 2 may contain the first sales record, with its order ID, product name, quantity, and revenue.

**Shortcut:** `Shift + Space` selects the entire row.

### 4. Columns
**Columns** are vertical arrangements of cells identified by letters, such as A, B, C, and so on.

**Example:**
- Column A: Order ID
- Column B: Product Name
- Column C: Quantity
- Column D: Revenue

**Shortcut:** `Ctrl + Space` selects the entire column.

### 5. Cells
A **Cell** is the individual box formed by the intersection of a row and a column. Each cell has a unique address consisting of its column letter and row number.

**Examples:**
- `A1`: Column A, Row 1
- `B5`: Column B, Row 5
- `D10`: Column D, Row 10

Cells can contain text, numbers, dates, formulas, and other supported values.

**Example:** Entering `5000` into cell `D2` stores a numerical value in that cell.

### 6. Data Types
**Data Types** refer to the different kinds of values stored in Excel cells. Understanding them helps ensure correct calculations, sorting, filtering, and analysis.

- **Text:** Names, categories, and labels. Example: `Laptop`
- **Number:** Numerical values used in calculations. Example: `2500`
- **Date:** Calendar dates recognized by Excel. Example: `12-Oct-2026`
- **Percentage:** Values displayed as percentages. Example: `15%`
- **Currency:** Monetary values displayed using a currency format. Example: `₹5,000`
- **Logical Values:** `TRUE` or `FALSE`, often used in conditions.

**Important:** Formatting a cell as a date or currency changes how its value is displayed; it does not necessarily change the underlying value. Numbers stored as text may also behave differently in calculations.

### 7. Excel Tables
An **Excel Table** is a structured data range that makes organizing, managing, and analyzing data easier.

**Key features:**
- Automatically adds filter buttons to column headings.
- Expands when new rows are added directly to the table.
- Applies consistent formatting.
- Supports structured references in formulas.
- Makes sorting and filtering easier.

**Example:** Convert a sales dataset containing Order ID, Product, Quantity, and Revenue into an Excel Table.

**Shortcut:** `Ctrl + T`

**Use in Data Analytics:** Tables make datasets easier to manage and help formulas and reports adapt when new records are added.

### 8. Formatting
**Formatting** means changing the appearance of data to improve readability and communicate information clearly.

**Common formatting options:**
- Font size, font style, and font color.
- Cell borders and background colors.
- Number, date, percentage, and currency formats.
- Text alignment and wrapping.
- Conditional Formatting to highlight values based on rules.

**Example:** Format sales revenue as currency, display profit margins as percentages, and highlight sales below a target in red.

**Use in Data Analytics:** Proper formatting improves the readability and professionalism of reports and dashboards.

### 9. Sorting
**Sorting** arranges data in a specific order based on one or more columns.

**Common sorting options:**
- A to Z: Alphabetical ascending order.
- Z to A: Alphabetical descending order.
- Smallest to Largest: Numerical ascending order.
- Largest to Smallest: Numerical descending order.
- Oldest to Newest: Date ascending order.
- Newest to Oldest: Date descending order.

**Example:** Sort a sales dataset by Revenue from largest to smallest to identify the highest-revenue transactions.

**Use in Data Analytics:** Sorting helps identify top-performing products, highest-value orders, earliest dates, and other important records.

**Important:** Sort the complete dataset together so that values in different columns remain associated with the correct records.

### 10. Filtering
**Filtering** displays only the records that meet selected conditions while temporarily hiding the other rows.

**Examples:**
- Show only sales from January.
- Display only orders with a status of `Won`.
- Show products with revenue greater than ₹10,000.
- Display records from a specific region.

**Shortcut:** `Ctrl + Shift + L` toggles AutoFilter on or off for a suitable data range.

**Use in Data Analytics:** Filtering helps focus on relevant records without deleting the remaining data.

**Sorting vs. Filtering:**
- Sorting changes the order of records.
- Filtering displays only records that match selected criteria.

### 11. Freeze Panes
**Freeze Panes** keeps selected rows or columns visible while you scroll through a worksheet.

**Common options:**
- **Freeze Top Row:** Keeps the first row visible.
- **Freeze First Column:** Keeps the first column visible.
- **Freeze Panes:** Keeps selected rows and columns visible based on the active cell.

**Example:** If a sales dataset has hundreds of rows, freeze the header row so that column names remain visible while scrolling.

**How to use it:** Select the cell below the rows and to the right of the columns you want to keep visible, then choose View → Freeze Panes → Freeze Panes.

**Use in Data Analytics:** It makes large datasets easier to navigate and reduces confusion when reading records.

### 12. Basic Calculations and Excel Formulas
Excel formulas perform mathematical calculations and analyze data. Every formula begins with an equal sign (`=`).

**A. SUM — Calculate the Total**

Adds numerical values in a range.

Syntax:
`=SUM(number1, [number2], ...)`

Example:
`=SUM(D2:D10)`

Purpose: Calculate total sales revenue.

**B. AVERAGE — Calculate the Mean**

Calculates the arithmetic mean of numerical values.

Syntax:
`=AVERAGE(number1, [number2], ...)`

Example:
`=AVERAGE(D2:D10)`

Purpose: Calculate average revenue per transaction.

**C. MAX — Find the Highest Value**

Returns the largest numerical value in a range.

Syntax:
`=MAX(number1, [number2], ...)`

Example:
`=MAX(D2:D10)`

Purpose: Identify the highest sales amount.

**D. MIN — Find the Lowest Value**

Returns the smallest numerical value in a range.

Syntax:
`=MIN(number1, [number2], ...)`

Example:
`=MIN(D2:D10)`

Purpose: Identify the lowest sales amount.

**E. Addition**

Adds two or more values.

Syntax:
`=A2+B2`

Example: If A2 contains 100 and B2 contains 50, the result is 150.

**F. Subtraction**

Subtracts one value from another.

Syntax:
`=A2-B2`

Example: If revenue is ₹5,000 and expenses are ₹2,000, the result is ₹3,000.

**G. Multiplication**

Multiplies values.

Syntax:
`=A2*B2`

Example: If quantity is 5 and unit price is ₹200, the total is ₹1,000.

**H. Division**

Divides one value by another.

Syntax:
`=A2/B2`

Example: If total revenue is ₹10,000 and the number of orders is 20, average revenue per order is ₹500.

**Important:** Division by zero produces a `#DIV/0!` error.

### 13. Relative Cell Reference
A **Relative Reference** is a cell reference that changes automatically when a formula is copied or moved to another cell.

**Example:**

Enter this formula in cell C2:

`=A2+B2`

When copied to C3, Excel adjusts it to:

`=A3+B3`

When copied to C4, it becomes:

`=A4+B4`

**Use:** Relative references are useful when applying the same calculation to multiple rows, such as calculating revenue for every sales transaction.

### 14. Absolute Cell Reference
An **Absolute Reference** is a cell reference that keeps both the column and row fixed when a formula is copied.

It uses a dollar sign (`$`) before the column letter and row number.

**Example:** `$A$1`

If a tax rate is stored in cell B1 and the amount is in A2, use:

`=A2*$B$1`

When copied down to the next row, the formula becomes:

`=A3*$B$1`

The amount reference changes, but the tax-rate reference remains fixed at B1.

**Use:** Absolute references are useful when calculations depend on a fixed value, such as a tax rate, commission rate, or discount percentage.

**Shortcut:** Select a cell reference within a formula and press `F4` to cycle through relative, absolute, and mixed references in desktop Excel.

### 15. Relative vs. Absolute References

**Relative Reference — `A1`**
- Changes its row and column references when copied.
- Useful for repeating calculations across rows or columns.
- Example: `=A2*B2`

**Absolute Reference — `$A$1`**
- Keeps the referenced row and column fixed.
- Useful when formulas depend on a constant value.
- Example: `=B2*$A$1`

**Additional concept: Mixed References**

A mixed reference locks either the column or the row, but not both.

- `$A1`: Column A remains fixed; the row can change.
- `A$1`: Row 1 remains fixed; the column can change.

### 16. Day 4 Key Takeaways

- **Workbook:** An Excel file containing one or more worksheets.
- **Worksheet:** An individual spreadsheet within a workbook.
- **Rows:** Horizontal arrangements identified by numbers.
- **Columns:** Vertical arrangements identified by letters.
- **Cells:** Individual boxes identified by cell addresses.
- **Data Types:** Different kinds of values, such as text, numbers, dates, and percentages.
- **Excel Tables:** Structured data ranges that simplify sorting, filtering, and formula management.
- **Formatting:** Changes the appearance and display of data.
- **Sorting:** Arranges records in a specified order.
- **Filtering:** Displays records that match selected conditions.
- **Freeze Panes:** Keeps selected rows or columns visible while scrolling.
- **Basic Calculations:** Uses formulas and mathematical operators to calculate results.
- **Relative Reference:** Adjusts cell references when a formula is copied.
- **Absolute Reference:** Keeps a cell reference fixed when a formula is copied.

**Day 4 Learning Objective:** Understand Excel's worksheet structure, organize datasets effectively, perform basic calculations, and use cell references correctly to prepare for data cleaning, formula-based analysis, and business reporting.
