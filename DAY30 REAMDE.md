# Day 30 — Dashboard Design & Data Storytelling

## 1. Visual Hierarchy

**Meaning:** Visual hierarchy is the arrangement of dashboard elements so that users notice the most important information first.

A manager should quickly understand the business situation without examining every chart.

### How to create visual hierarchy

- **Position:** Place the most important KPIs at the top.
- **Size:** Make important numbers larger than supporting text.
- **Color:** Use color to highlight important changes or warnings.
- **Spacing:** Keep enough space between different sections.
- **Grouping:** Place related charts and KPIs together.

### Example

Imagine you are creating a sales dashboard.

At the top:
- Total Revenue: ₹12,00,000
- Total Sales: 150
- Win Rate: 65%
- Sales Target Achievement: 85%

Below these KPI cards:
- Revenue by Month
- Revenue by Region
- Salesperson Performance

At the bottom:
- Detailed sales table

This layout allows managers to see the overall performance first and then explore the details.

**Remember:** Important information should be easy to find, not hidden among too many charts.

---

## 2. KPI Cards

**Meaning:** A KPI (Key Performance Indicator) card displays an important business metric in a simple, easy-to-read format.

KPI cards are usually placed at the top of a dashboard.

### Common KPI cards for sales

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value
- Win Rate
- Profit Margin
- Target Achievement

### Example

Suppose a software company has these results:

- Total Revenue: ₹10,00,000
- Sales Target: ₹12,00,000
- Total Deals: 100
- Won Deals: 60

**Calculate target achievement:**

Target Achievement = (Actual Revenue / Target Revenue) × 100

If actual revenue is ₹10,00,000:

Target Achievement = (10,00,000 / 12,00,000) × 100 = 83.33%

**Calculate win rate:**

Win Rate = (Won Deals / Total Decided Deals) × 100

If all 100 deals have been decided, win rate = (60 / 100) × 100 = 60%.

If some deals are still open, exclude those from the denominator when measuring the win rate of decided deals.

### What makes a good KPI card?

A good KPI card contains:
1. **Metric name:** Total Revenue
2. **Current value:** ₹10,00,000
3. **Comparison:** Up 10% from last month
4. **Context:** Target ₹12,00,000

The comparison must use a valid, clearly defined reference period.

### Example using Python

```python
revenue = 1000000
target = 1200000

achievement = (revenue / target) * 100

print(f"Revenue: ₹{revenue:,.0f}")
print(f"Target Achievement: {achievement:.2f}%")
```

Output:

```text
Revenue: ₹1,000,000
Target Achievement: 83.33%
```

**Business interpretation:** The company has achieved 83.33% of its revenue target and needs to close the remaining gap.

---

## 3. Dashboard Principles

A dashboard is a visual summary of important information that helps people monitor performance and make decisions.

### Principle 1: Know your audience

Design the dashboard according to the person who will use it.

- **CEO:** Revenue, profit, growth, and business performance.
- **Sales Manager:** Sales targets, win rate, and salesperson performance.
- **Data Analyst:** Detailed metrics, trends, and data quality.

### Principle 2: Define the objective

Before creating a dashboard, ask:

- What business question am I answering?
- Who will use the dashboard?
- What decision should the dashboard support?

Example: "Why is monthly revenue below target?"

### Principle 3: Keep it simple

Avoid adding too many charts, colors, filters, and unnecessary details.

Every element should have a clear purpose.

### Principle 4: Maintain consistency

Use consistent:
- Fonts
- Colors
- Number formats
- Chart styles
- Spacing
- Date formats

For example, always use ₹ for revenue and percentages for win rate.

### Principle 5: Show useful comparisons

A number alone may not explain performance.

Instead of displaying only revenue of ₹10 lakh, compare it with:
- Last month's revenue
- The sales target
- The same month last year, if relevant

### Principle 6: Ensure readability

Use readable labels, appropriate text sizes, clear chart titles, and sufficient contrast.

### Principle 7: Make filters useful

Filters such as month, region, product, and salesperson help users explore the data. Avoid adding filters that do not support a meaningful question.

### Principle 8: Check data accuracy

Verify calculations, date ranges, missing data, duplicates, and metric definitions before publishing the dashboard.

---

## 4. Avoiding Misleading Charts

**Meaning:** A misleading chart presents data in a way that can cause people to draw the wrong conclusion.

A chart can be technically accurate but still create a false impression because of its design.

### Mistake 1: Truncated axis

Suppose two products have these sales figures:

- Product A: 95
- Product B: 100

If a bar chart starts at 90 instead of zero, the difference can look much larger than it really is.

**Solution:** Bar charts should generally start at zero. If a different scale is necessary, make the axis limits clear.

### Mistake 2: Using the wrong chart

A pie chart with 15 categories is difficult to read.

**Solution:** Use a bar chart when comparing many categories.

### Mistake 3: Too many colors

Using a different color for every bar can distract the viewer.

**Solution:** Use a consistent color for ordinary values and reserve accent colors for meaningful highlights.

### Mistake 4: Missing labels or units

Showing a value of "500" without explaining whether it means ₹500, 500 orders, or 500 customers is confusing.

**Solution:** Include clear labels and units.

### Mistake 5: Inconsistent time intervals

Comparing January, March, and April while omitting February can hide an important trend.

**Solution:** Show the relevant time period consistently and explain missing periods.

### Mistake 6: Confusing correlation with causation

If advertising expenditure and revenue increase together, that does not automatically prove that advertising caused the revenue increase.

**Solution:** Describe the relationship accurately and investigate other possible factors.

### Mistake 7: Using 3D effects unnecessarily

Three-dimensional charts can distort the apparent sizes of bars or slices.

**Solution:** Prefer clear, two-dimensional charts.

**Golden rule:** A chart should help people understand the data, not manipulate their perception of it.

---

## 5. Choosing the Right Chart

Different charts answer different business questions.

### Bar chart

**Use when:** Comparing categories.

Example:
- Revenue by region
- Sales by product
- Revenue by salesperson

Question answered: Which region generated the highest revenue?

### Line chart

**Use when:** Showing changes over time.

Example:
- Monthly revenue
- Daily website traffic
- Quarterly profit

Question answered: Is revenue increasing or decreasing over time?

### Pie or donut chart

**Use when:** Showing how a small number of categories contribute to a whole.

Example:
- Revenue share by region

Use only when the categories form a meaningful whole and the slices are easy to compare. For many categories, use a bar chart instead.

### Histogram

**Use when:** Understanding the distribution of numerical values.

Example:
- Distribution of employee salaries
- Distribution of order values

Question answered: Where do most values fall?

### Scatter plot

**Use when:** Examining the relationship between two numerical variables.

Example:
- Advertising expenditure versus revenue
- Product price versus units sold

Question answered: Do higher advertising expenses tend to occur alongside higher revenue?

### Box plot

**Use when:** Comparing distributions, medians, spread, and potential outliers.

Example:
- Salary distribution across departments
- Order values across regions

### Heatmap

**Use when:** Showing values or relationships through color intensity.

Example:
- Correlation matrix
- Sales performance by region and month

### Area chart

**Use when:** Showing how a quantity changes over time, especially when emphasizing the magnitude of a total.

Example:
- Monthly revenue over a year

### Quick chart selection guide

- Compare categories → Bar chart
- Show a trend over time → Line chart
- Show a distribution → Histogram
- Investigate two numerical variables → Scatter plot
- Examine spread and outliers → Box plot
- Show a small number of parts of a whole → Pie/donut chart
- Show a color-coded matrix → Heatmap
- Emphasize change in magnitude over time → Area chart

**Tip:** Start with the business question, then select the chart. Do not choose a chart merely because it looks attractive.

---

## 6. Story Structure

**Meaning:** Data storytelling is the process of explaining what the data says, why it matters, and what should happen next.

A good dashboard or presentation follows a logical sequence.

### The five-step structure

**Step 1: Business question**

What are we trying to understand?

Example: Why did revenue fall in March?

**Step 2: Context**

Explain the relevant background.

Example: February revenue was ₹10 lakh, while March revenue was ₹8 lakh.

**Step 3: Evidence**

Use charts and metrics to investigate the situation.

Example:
- Revenue fell by 20%.
- The North region experienced the largest decline.
- Two major deals were lost.

These are illustrative findings; actual conclusions must come from the dataset.

**Step 4: Insight**

Explain what the evidence suggests.

Example: The revenue decline appears to be concentrated in the North region and may be associated with lost deals.

**Step 5: Action**

Recommend a practical next step.

Example: Review the lost deals, identify recurring objections, and develop a recovery plan for the North region.

### The complete flow

Business Question → Context → Evidence → Insight → Action

This structure helps the audience understand not just the numbers but also their business significance.

---

## 7. Executive Communication

**Meaning:** Executive communication is presenting analytical findings clearly and briefly to senior decision-makers.

Executives usually need the main finding, its business impact, and the recommended action before they need detailed technical explanations.

### How to communicate effectively

- Start with the most important finding.
- Use simple, direct language.
- Focus on business impact.
- Support claims with relevant metrics.
- Avoid unnecessary technical terminology.
- Distinguish facts from assumptions.
- End with a clear recommendation.

### Weak communication

"After performing data cleaning, grouping, aggregation, and visualization using Python, we observed changes in the monthly revenue values."

This describes your work but does not clearly communicate the result.

### Strong communication

"Revenue declined by 20% in March, mainly due to weaker performance in the North region. We recommend reviewing lost deals and prioritizing recovery opportunities."

This communicates the result, its possible explanation, and the next step.

### The 30-second executive summary

Try to answer these four questions:

1. What happened?
2. Why does it matter?
3. What does the evidence suggest?
4. What should we do next?

Always be clear about how confident you are in the explanation. Do not claim a cause unless the evidence supports it.

---

## 8. Insight → Action

An insight becomes valuable when it helps someone make a better decision.

### Difference between observation and insight

**Observation:** Revenue decreased by 15%.

**Insight:** The decline is concentrated in one region, while other regions remained stable.

**Action:** Investigate the region's lost deals and prioritize corrective measures.

The insight explains what the pattern may mean; the action tells the business what to do about it.

### Example: Sales analysis

Suppose your analysis shows:

- Revenue is below target.
- The win rate has decreased.
- Most lost deals cite price as the reason.
- The problem is concentrated among a particular customer segment.

**Insight:** Pricing may be a barrier for that segment, although further investigation is needed to confirm the cause.

**Possible actions:**
- Review competitor pricing.
- Interview sales representatives about lost deals.
- Examine whether discounts improve conversion without harming profit.
- Test a revised pricing or packaging approach.

**Success measure:** Monitor win rate, revenue, and profit margin after the change.

### Use this framework

For every important finding, write:

- **Observation:** What does the data show?
- **Insight:** Why might this pattern matter?
- **Action:** What should the business do?
- **Metric:** How will success be measured?

A recommendation should be specific, realistic, linked to evidence, and measurable.

---

## Complete Dashboard Workflow

Use this sequence whenever you create a dashboard for a Data Analyst project:

1. Define the business question.
2. Identify the audience and their decisions.
3. Select the relevant KPIs.
4. Validate and clean the data.
5. Calculate metrics correctly.
6. Choose appropriate charts.
7. Arrange elements using visual hierarchy.
8. Build KPI cards and supporting visualizations.
9. Check for misleading scales, labels, and comparisons.
10. Identify the most important insights.
11. Recommend practical actions.
12. Communicate the results in an executive summary.



## Final Revision

Remember this formula:

**Good Dashboard = Accurate Data + Relevant KPIs + Appropriate Charts + Clear Visual Hierarchy + Actionable Insights**

Your goal as a Data Analyst is not just to create charts. It is to help the business understand its performance and make better decisions.
