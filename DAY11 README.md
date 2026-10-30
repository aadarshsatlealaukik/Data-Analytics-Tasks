# Day 11 — Distribution, Outliers & Relationships
## Complete Study Notes for Data Analysts

### 1. Distribution

**Definition:** Distribution describes how data values are spread, how frequently they occur, where they are centered, and how much they vary.

**Example:** A company analyzes customer salaries to understand whether most customers earn ₹20,000–₹40,000 per month or whether salaries are spread across a wider range.

**Key concepts:**
- **Center:** The typical or central value of the data.
- **Spread:** How widely values are distributed.
- **Shape:** Whether the distribution is symmetric, skewed, or has multiple peaks.
- **Frequency:** How often values occur.

**Business application:** Understanding salary distributions, customer spending patterns, order values, and employee performance.

### 2. Normal Distribution

**Definition:** A normal distribution is a symmetric, bell-shaped distribution in which the mean, median, and mode are equal.

**Example:** If employees' test scores follow an approximately normal distribution, most scores are near the average, while very high and very low scores are less common.

**The 68–95–99.7 rule:**
- Approximately 68% of values fall within 1 standard deviation of the mean.
- Approximately 95% fall within 2 standard deviations.
- Approximately 99.7% fall within 3 standard deviations.

**Formula for a z-score:**

`z = (x − μ) / σ`

Where:
- `x` = observed value
- `μ` = population mean
- `σ` = population standard deviation

**Business application:** Understanding performance scores, quality-control measurements, and variation in business processes.

**Important:** Not every dataset follows a normal distribution. Sales amounts and customer spending, for example, may be right-skewed.

### 3. Skewness

**Definition:** Skewness measures the asymmetry of a distribution.

**Types of skewness:**

**Zero or approximately zero skewness**
- The distribution is approximately symmetric.
- The mean and median are often close.

**Positive skewness (right-skewed)**
- The tail extends toward higher values.
- A few unusually large values may pull the mean upward.
- Example: Customer spending when most customers spend modest amounts but a few spend a lot.

**Negative skewness (left-skewed)**
- The tail extends toward lower values.
- A few unusually small values may pull the mean downward.
- Example: Exam scores when most students score highly but a few score very poorly.

**Business application:** Skewness helps analysts decide whether the mean or median better represents a typical customer, employee, or transaction.

### 4. Outliers

**Definition:** Outliers are observations that are unusually far from most other values in a dataset.

**Example:** Most orders are worth ₹500–₹2,000, but one order is worth ₹50,000.

**Possible causes:**
- Data-entry errors
- Duplicate or incorrect records
- Fraudulent transactions
- Rare but genuine business events
- High-value customers or orders

**How to handle outliers:**
1. Verify whether the value is correct.
2. Investigate its business context.
3. Correct errors if the source confirms them.
4. Keep valid extreme values when they matter to the analysis.
5. Consider a separate analysis or an appropriate statistical method if they strongly affect results.

**Important:** Never remove an outlier automatically. An unusual value may contain important business information.

### 5. IQR — Interquartile Range

**Definition:** IQR measures the spread of the middle 50% of the data.

**Formula:**

`IQR = Q3 − Q1`

Where:
- `Q1` = first quartile, or 25th percentile
- `Q3` = third quartile, or 75th percentile

**Potential outlier boundaries:**
- Lower bound = `Q1 − 1.5 × IQR`
- Upper bound = `Q3 + 1.5 × IQR`

Values below the lower bound or above the upper bound are flagged as potential outliers under this rule.

**Example:**
- Q1 = ₹1,000
- Q3 = ₹2,000
- IQR = ₹2,000 − ₹1,000 = ₹1,000
- Lower bound = ₹1,000 − 1.5 × ₹1,000 = −₹500
- Upper bound = ₹2,000 + 1.5 × ₹1,000 = ₹3,500

Any order below −₹500 or above ₹3,500 would be flagged by this rule. Because order values cannot normally be negative, an order above ₹3,500 is the relevant potential outlier in this example.

**Excel formulas** (assuming data is in `A2:A101`):

- Q1: `=QUARTILE.INC(A2:A101,1)`
- Q3: `=QUARTILE.INC(A2:A101,3)`
- IQR: `=QUARTILE.INC(A2:A101,3)-QUARTILE.INC(A2:A101,1)`

**Business application:** Detecting unusually large orders, abnormal expenses, and unusual delivery times.

### 6. Correlation

**Definition:** Correlation measures the strength and direction of a linear relationship between two numerical variables.

**Correlation coefficient:** `r`, which ranges from −1 to +1.

- `r = +1`: Perfect positive linear relationship.
- `r` close to +1: Strong positive linear relationship.
- `r` close to 0: Weak or no linear relationship.
- `r` close to −1: Strong negative linear relationship.
- `r = −1`: Perfect negative linear relationship.

**Examples:**
- Positive correlation: Advertising spending and sales revenue may increase together.
- Negative correlation: Product price and quantity demanded may move in opposite directions.
- Near-zero correlation: Two variables may show little linear relationship.

**Excel formula:**

`=CORREL(A2:A101,B2:B101)`

**Business application:** Exploring relationships between advertising and revenue, discounts and sales volume, or training hours and employee performance.

**Important:** Correlation does not prove causation. Two variables can move together without one directly causing the other. Also, a correlation near zero does not rule out a nonlinear relationship.

### 7. Covariance

**Definition:** Covariance indicates whether two variables tend to move in the same direction or in opposite directions.

**Interpretation:**
- **Positive covariance:** The variables tend to move together.
- **Negative covariance:** When one tends to increase, the other tends to decrease.
- **Covariance near zero:** Little linear co-movement is indicated, though a nonlinear relationship may still exist.

**Excel formulas:**
- Sample covariance: `=COVARIANCE.S(A2:A101,B2:B101)`
- Population covariance: `=COVARIANCE.P(A2:A101,B2:B101)`

**Difference between covariance and correlation:**
- Covariance indicates the direction of co-movement, but its magnitude depends on the units and scales of the variables.
- Correlation standardizes the relationship, making its coefficient range from −1 to +1 and easier to compare across variable pairs.

**Business application:** Examining how advertising costs and revenue, or product demand and price, move together.

### 8. Scatter Plot

**Definition:** A scatter plot uses dots to show the relationship between two numerical variables.

**How to read it:**
- Each dot represents one observation.
- X-axis: The first numerical variable.
- Y-axis: The second numerical variable.
- Upward pattern: Positive relationship.
- Downward pattern: Negative relationship.
- Random-looking pattern: Little obvious linear relationship.
- Isolated dots: Possible outliers.

**Example:**
- X-axis: Advertising spend
- Y-axis: Sales revenue

If the dots generally move upward from left to right, higher advertising spending is associated with higher sales revenue in the observed data.

**Excel steps:**
1. Put the first variable in one column and the second variable in another.
2. Select both columns.
3. Go to **Insert → Scatter (X, Y)**.
4. Add a meaningful chart title and axis labels.
5. Inspect the pattern, unusual observations, and any possible relationship.

**Business application:** Visualizing advertising spend versus sales, price versus demand, or delivery distance versus delivery time.

### 9. Business Interpretation

**Definition:** Business interpretation means translating analytical findings into meaningful business insights and decisions.

**Example 1 — Outliers:**
Finding an unusually large order may indicate a bulk purchase, a recording error, or a transaction that requires investigation.

**Example 2 — Skewness:**
If customer spending is right-skewed, the median may describe typical spending better than the mean because a few high-spending customers can raise the average.

**Example 3 — Correlation:**
If advertising spend and revenue have a strong positive correlation, the company can investigate whether advertising is contributing to revenue growth. Correlation alone does not establish that advertising caused the increase.

**Example 4 — Distribution:**
If delivery times have a wide spread, the company may need to investigate inconsistent routes, staffing, or operational delays.

**A simple interpretation framework:**
1. **Observation:** What did the data show?
2. **Evidence:** Which statistic, chart, or pattern supports it?
3. **Business meaning:** Why does the finding matter?
4. **Action:** What should the business investigate or do next?

## Quick Revision

- **Distribution:** Describes how data values are spread and shaped.
- **Normal distribution:** A symmetric, bell-shaped distribution.
- **Skewness:** Measures the asymmetry of a distribution.
- **Outlier:** A value unusually far from most observations.
- **IQR:** The spread of the middle 50% of data; `Q3 − Q1`.
- **Correlation:** Measures the strength and direction of a linear relationship.
- **Covariance:** Indicates whether two variables tend to move together or oppositely.
- **Scatter plot:** Visualizes the relationship between two numerical variables.
- **Business interpretation:** Converts analytical findings into useful decisions.

## Day 11 Learning Objective

By the end of this lesson, you should be able to describe a data distribution, recognize skewness and potential outliers, calculate IQR, interpret correlation and covariance, create a scatter plot in Excel, and explain what your findings mean for a business.
