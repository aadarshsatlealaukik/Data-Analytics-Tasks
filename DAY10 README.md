# Data Analytics – Daily Task Update
## Day 10: Statistics Fundamentals & Measures of Central Tendency and Dispersion

### 1. Population

**Definition:** A Population is the entire group of people, objects, transactions, or observations that a researcher or analyst wants to study.

It includes every member of the group relevant to the research question.

**Example:** A company has 1,000 employees and wants to analyze their salaries. All 1,000 employees form the population.

**Business application:** Analyze the salary distribution of all employees, the total sales of all branches, or the satisfaction of all customers.

### 2. Sample

**Definition:** A Sample is a smaller group selected from a population to study its characteristics and draw conclusions about the larger group.

A sample is useful when collecting or analyzing data from the entire population is expensive, time-consuming, or impractical.

**Example:** Instead of surveying all 1,000 employees, a company selects 100 employees to understand employee satisfaction.

**Business application:** Conduct customer surveys, test products with selected customers, or examine a subset of transactions.

**Population vs. Sample:**
- Population: The entire group being studied.
- Sample: A subset of that group.

**Important:** A sample should be selected appropriately to reduce bias and represent the population as accurately as possible.

### 3. Variables

**Definition:** A Variable is a characteristic or attribute that can take different values across people, objects, or observations.

Variables are used to describe records and investigate relationships in data.

**Types of variables:**

**A. Qualitative Variables**

Represent categories or characteristics.

Examples:
- Department
- Product category
- Payment method
- Customer satisfaction level

**B. Quantitative Variables**

Represent numerical quantities.

Examples:
- Revenue
- Salary
- Number of orders
- Delivery time

Quantitative variables can also be classified as:

- **Discrete:** Countable values, such as the number of customers.
- **Continuous:** Measurable values, such as weight, distance, or time.

**Business application:** Analyze how sales vary by region, how salaries vary by department, or how delivery time affects customer satisfaction.

### 4. Mean

**Definition:** The Mean, commonly called the average, is calculated by adding all numerical values and dividing the total by the number of values.

**Formula:**

Mean = Sum of all values ÷ Number of values

\[
\bar{x}=\frac{\sum x_i}{n}
\]

Where:
- \(x_i\) represents each observation.
- \(n\) represents the number of observations.

**Example:** Daily sales are ₹100, ₹200, and ₹300.

Mean = (100 + 200 + 300) ÷ 3 = ₹200.

**Excel formula:**

`=AVERAGE(A2:A4)`

**Business application:** Calculate average revenue per order, average employee salary, or average daily website traffic.

**Important:** The mean is sensitive to extreme values, also called outliers.

### 5. Median

**Definition:** The Median is the middle value when numerical data is arranged in ascending or descending order.

It divides an ordered dataset into two halves.

**Example 1 — Odd Number of Values:**

Data: 10, 20, 30, 40, 50

Median = 30.

**Example 2 — Even Number of Values:**

Data: 10, 20, 30, 40

Median = (20 + 30) ÷ 2 = 25.

**Excel formula:**

`=MEDIAN(A2:A10)`

**Business application:** Calculate typical customer spending, salary levels, or delivery times when extreme values may distort the mean.

**Important:** Always arrange the values in order before finding the median manually. Excel's MEDIAN function handles the ordering automatically.

### 6. Mode

**Definition:** The Mode is the value that occurs most frequently in a dataset.

A dataset can have one mode, multiple modes, or no mode if no value occurs more frequently than the others.

**Example:**

Data: 10, 20, 20, 30, 40

Mode = 20 because it appears twice.

**Excel formula:**

`=MODE.SNGL(A2:A10)`

To find a mode in datasets that may contain multiple modes, use `MODE.MULT` where supported.

**Business application:** Identify the most frequently purchased product, most common customer complaint category, or most popular product size.

**Important:** For categorical data such as product names, use frequency counts to identify the most common category.

### 7. Range

**Definition:** Range measures the spread of numerical data by calculating the difference between the maximum and minimum values.

**Formula:**

Range = Maximum Value − Minimum Value

**Example:**

Data: 10, 20, 30, 40, 50

Range = 50 − 10 = 40.

**Excel formula:**

`=MAX(A2:A10)-MIN(A2:A10)`

**Business application:** Measure the difference between the highest and lowest sales amounts, salaries, or delivery times.

**Important:** Range is easy to calculate but depends only on the two extreme values, so it can be strongly affected by outliers.

### 8. Variance

**Definition:** Variance measures how widely numerical values are spread around their mean by calculating the average of their squared deviations from the mean.

A larger variance indicates greater spread, while a smaller variance indicates that values are closer to the mean.

**Population variance formula:**

\[
\sigma^2=\frac{\sum(x_i-\mu)^2}{N}
\]

**Sample variance formula:**

\[
s^2=\frac{\sum(x_i-\bar{x})^2}{n-1}
\]

Where:
- \(x_i\) represents each observation.
- \(\mu\) represents the population mean.
- \(\bar{x}\) represents the sample mean.
- \(N\) represents the population size.
- \(n\) represents the sample size.

**Example:**

Data: 2, 4, 6

Mean = 4.

Squared deviations:

- (2 − 4)² = 4
- (4 − 4)² = 0
- (6 − 4)² = 4

Population variance = (4 + 0 + 4) ÷ 3 = 2.67 approximately.

**Excel formulas:**

- Population variance: `=VAR.P(A2:A4)`
- Sample variance: `=VAR.S(A2:A4)`

**Business application:** Compare variability in sales, demand, investment returns, or manufacturing measurements.

**Important:** Variance is expressed in squared units, which can make it less intuitive to interpret than standard deviation.

### 9. Standard Deviation

**Definition:** Standard Deviation measures the typical spread of numerical values around their mean. It is the square root of variance and is expressed in the same units as the original data.

A smaller standard deviation indicates that values are generally closer to the mean, while a larger standard deviation indicates greater variability.

**Population formula:**

\[
\sigma=\sqrt{\frac{\sum(x_i-\mu)^2}{N}}
\]

**Sample formula:**

\[
s=\sqrt{\frac{\sum(x_i-\bar{x})^2}{n-1}}
\]

**Example:**

Data: 2, 4, 6

Population variance = 8 ÷ 3 ≈ 2.67.

Population standard deviation = √2.67 ≈ 1.63.

**Excel formulas:**

- Population standard deviation: `=STDEV.P(A2:A10)`
- Sample standard deviation: `=STDEV.S(A2:A10)`

**Business application:** Evaluate consistency in sales, variation in delivery times, and fluctuations in production measurements.

**Variance vs. Standard Deviation:**
- Variance measures spread using squared deviations.
- Standard deviation is the square root of variance and uses the original measurement units.

### 10. Percentiles

**Definition:** A Percentile is a cutoff value that indicates the position below which a specified percentage of observations falls in an ordered dataset, according to the percentile method used.

For example, the 75th percentile is a value at or below which approximately 75% of observations fall.

**Common percentiles:**
- 25th percentile: First quartile, Q1.
- 50th percentile: Median, or second quartile, Q2.
- 75th percentile: Third quartile, Q3.
- 90th percentile: A cutoff useful for examining high-end values.

**Example:** If the 90th percentile of delivery time is 5 days, approximately 90% of deliveries are completed within 5 days under the chosen percentile calculation.

**Excel formula:**

`=PERCENTILE.INC(A2:A100,0.75)`

This calculates the inclusive 75th percentile.

**Business application:** Analyze salary distributions, customer spending, examination scores, website response times, and delivery performance.

**Important:** Different percentile calculation methods can produce slightly different results, particularly for small datasets.

### 11. Quartiles

**Definition:** Quartiles are three cutoff values that divide an ordered dataset into four sections, each containing approximately 25% of the observations.

**The three quartiles:**

- **Q1 — First Quartile:** The 25th percentile; approximately 25% of observations fall at or below this value.
- **Q2 — Second Quartile:** The 50th percentile; the median.
- **Q3 — Third Quartile:** The 75th percentile; approximately 75% of observations fall at or below this value.

**Example:**

Data: 10, 20, 30, 40, 50, 60, 70

Using the common median-of-halves method:
- Q1 = 20
- Q2 = 40
- Q3 = 60

Quartile values can differ slightly depending on the calculation method used.

**Excel formulas:**

- First quartile: `=QUARTILE.INC(A2:A8,1)`
- Second quartile: `=QUARTILE.INC(A2:A8,2)`
- Third quartile: `=QUARTILE.INC(A2:A8,3)`

**Interquartile Range (IQR):**

The IQR measures the spread of the middle 50% of the data.

\[
IQR=Q3-Q1
\]

Using the example above:

IQR = 60 − 20 = 40.

**Excel formula:**

`=QUARTILE.INC(A2:A8,3)-QUARTILE.INC(A2:A8,1)`

**Business application:** Understand salary distributions, analyze customer spending, and identify potential outliers.

### 12. Day 10 Key Takeaways

- **Population:** The entire group being studied.
- **Sample:** A subset selected from the population.
- **Variables:** Characteristics or values that can vary across observations.
- **Mean:** The arithmetic average of numerical values.
- **Median:** The middle value of ordered data.
- **Mode:** The most frequently occurring value.
- **Range:** Maximum value minus minimum value.
- **Variance:** Measures spread using squared deviations from the mean.
- **Standard Deviation:** Measures spread in the original units of the data.
- **Percentiles:** Cutoff values representing positions in an ordered dataset.
- **Quartiles:** Three cutoff values dividing ordered data into four sections.
- **IQR:** The difference between Q3 and Q1, measuring the spread of the middle 50% of the data.

### Day 10 Learning Objective

Understand basic statistical concepts, calculate measures of central tendency and variability, interpret percentiles and quartiles, and apply these techniques to real-world business datasets using Excel.
