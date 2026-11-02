# Day 29 — Matplotlib and Seaborn

## 1. Chart Selection

Chart selection means choosing the correct chart for the question you want to answer.

- **Bar chart:** Compare categories, such as sales by region.
- **Line chart:** Show trends over time, such as monthly revenue.
- **Pie/Donut chart:** Show proportions of a whole, such as revenue share by region.
- **Histogram:** Understand the distribution of values, such as employee salaries.
- **Box plot:** Identify spread and potential outliers in salary data.
- **Scatter plot:** Examine relationships between two numerical variables.
- **Heatmap:** Show patterns or correlations using colors.
- **Area chart:** Show trends and magnitude over time.

## 2. Bar Chart

A bar chart compares values across categories.

```python
import matplotlib.pyplot as plt

regions = ["North", "South", "East", "West"]
revenue = [50000, 70000, 45000, 80000]

plt.bar(regions, revenue)
plt.xlabel("Region")
plt.ylabel("Revenue")
plt.title("Revenue by Region")
plt.show()
```

**Use case:** Find which region generates the most revenue.

For horizontal bars, use `plt.barh()`.

## 3. Line Chart

A line chart shows changes or trends over an ordered sequence, especially time.

```python
months = ["Jan", "Feb", "Mar", "Apr"]
revenue = [20000, 25000, 22000, 35000]

plt.plot(months, revenue, marker="o", label="Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.title("Monthly Revenue Trend")
plt.legend()
plt.show()
```

- `marker="o"` displays a marker at each data point.
- `label` names the data series for the legend.

**Use case:** Identify monthly growth, declines, or seasonal patterns.

## 4. Pie Chart and Donut Chart

A pie chart displays how categories contribute to a total. A donut chart is a pie chart with a hole in the center.

```python
regions = ["North", "South", "East", "West"]
revenue = [25, 35, 15, 25]

plt.pie(
    revenue,
    labels=regions,
    autopct="%1.1f%%",
    startangle=90
)
plt.title("Revenue Share by Region")
plt.show()
```

- `labels` — Names each category.
- `autopct` — Displays percentages.
- `startangle` — Rotates the starting position.

To create a donut chart:

```python
plt.pie(
    revenue,
    labels=regions,
    autopct="%1.1f%%",
    startangle=90
)

centre_circle = plt.Circle((0, 0), 0.60, color="white")
plt.gca().add_artist(centre_circle)

plt.title("Revenue Contribution by Region")
plt.show()
```

**Use case:** Show each region's percentage contribution.

Tip: Use pie or donut charts mainly when comparing a small number of categories that add up to a meaningful whole.

## 5. Histogram

A histogram shows the distribution of numerical data by grouping values into intervals called bins.

```python
salaries = [20000, 25000, 30000, 30000, 35000,
            40000, 45000, 45000, 50000, 60000]

plt.hist(salaries, bins=5, edgecolor="black")
plt.xlabel("Salary")
plt.ylabel("Frequency")
plt.title("Salary Distribution")
plt.show()
```

- `bins=5` divides the range into five intervals.
- `frequency` indicates how many observations fall into each interval.

**Use case:** Understand whether salaries are concentrated in lower, middle, or higher ranges.

## 6. Box Plot

A box plot summarizes the distribution of numerical data and helps identify potential outliers.

```python
salaries = [20000, 22000, 25000, 28000, 30000,
            32000, 35000, 40000, 100000]

plt.boxplot(salaries)
plt.ylabel("Salary")
plt.title("Salary Distribution and Outliers")
plt.show()
```

A box plot displays:
- Median — The middle value.
- Box — The interquartile range (IQR), from the 25th to the 75th percentile.
- Whiskers — The range within the plot's whisker rule.
- Individual points beyond the whiskers — Potential outliers.

**Use case:** Detect unusually high or low salaries. An outlier is not automatically an error; investigate it before removing it.

## 7. Scatter Plot

A scatter plot shows the relationship between two numerical variables.

```python
advertising = [1000, 2000, 3000, 4000, 5000]
sales = [10000, 15000, 22000, 28000, 35000]

plt.scatter(advertising, sales)
plt.xlabel("Advertising Spend")
plt.ylabel("Sales")
plt.title("Advertising Spend vs Sales")
plt.show()
```

**Use case:** Explore whether higher advertising spending is associated with higher sales.

A positive relationship means both variables tend to increase together; a negative relationship means one tends to decrease as the other increases. Correlation alone does not prove causation.

## 8. Heatmap

A heatmap uses colors to represent values in a matrix. Seaborn makes heatmaps easy to create.

```python
import seaborn as sns
import pandas as pd

df = pd.DataFrame({
    "Sales": [100, 200, 300, 400],
    "Profit": [20, 50, 70, 100],
    "Advertising": [10, 30, 40, 60]
})

correlation = df.corr(numeric_only=True)

sns.heatmap(correlation, annot=True, cmap="coolwarm")
plt.title("Correlation Heatmap")
plt.show()
```

- `df.corr()` calculates correlations between numerical columns.
- `annot=True` displays values inside cells.
- `cmap` specifies the color palette.

**Use case:** Quickly identify which numerical variables have stronger positive or negative linear relationships.

## 9. Area Chart

An area chart is similar to a line chart, but the area below the line is filled.

```python
months = ["Jan", "Feb", "Mar", "Apr"]
revenue = [20000, 25000, 22000, 35000]

plt.fill_between(months, revenue, alpha=0.4)
plt.plot(months, revenue, marker="o")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.title("Monthly Revenue Area Chart")
plt.show()
```

**Use case:** Show how revenue or another measure changes over time, emphasizing its magnitude.

## 10. Figure Customization

Figure customization improves chart readability and presentation.

```python
plt.figure(figsize=(8, 5))

plt.bar(regions, [50000, 70000, 45000, 80000])

plt.grid(axis="y", linestyle="--", alpha=0.4)
plt.tight_layout()
plt.show()
```

Useful options:
- `figsize=(8, 5)` — Set figure width and height in inches.
- `grid()` — Add reference gridlines.
- `tight_layout()` — Reduce overlap between chart elements.
- `plt.xlim()` / `plt.ylim()` — Set axis limits.
- `plt.xticks(rotation=45)` — Rotate x-axis labels.

## 11. Labels

Labels explain what the axes represent and help viewers interpret values.

```python
plt.bar(regions, revenue)

plt.xlabel("Region")
plt.ylabel("Revenue (₹)")
plt.show()
```

- `xlabel()` — Label the horizontal axis.
- `ylabel()` — Label the vertical axis.
- `xticks()` / `yticks()` — Customize tick positions or labels.

Always include units when relevant, such as Revenue (₹), Sales (Units), or Time (Days).

## 12. Titles and Legends

A title explains the chart's main subject. A legend identifies multiple data series.

```python
months = ["Jan", "Feb", "Mar", "Apr"]
revenue = [20000, 25000, 22000, 35000]
profit = [5000, 7000, 6000, 10000]

plt.plot(months, revenue, marker="o", label="Revenue")
plt.plot(months, profit, marker="s", label="Profit")

plt.title("Monthly Revenue and Profit")
plt.xlabel("Month")
plt.ylabel("Amount (₹)")
plt.legend()
plt.show()
```

- `title()` — Add a chart title.
- `legend()` — Display labels for plotted series.
- `label` — Assign a name to each series.

## Complete Data Analyst Workflow

1. Identify the business question.
2. Select the appropriate chart.
3. Prepare and validate the data.
4. Create the chart.
5. Add a meaningful title, labels, and legend where needed.
6. Check readability and avoid misleading scales.
7. Explain the business insight and recommend an action.


## Quick Revision

- Bar chart — Compare categories.
- Line chart — Show trends over time.
- Pie/donut — Show parts of a whole.
- Histogram — Show numerical distributions.
- Box plot — Show spread and potential outliers.
- Scatter plot — Explore relationships.
- Heatmap — Display matrix values using colors.
- Area chart —
