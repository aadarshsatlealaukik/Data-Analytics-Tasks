# Day 12 — Probability, Sampling & Hypothesis Testing
## Complete Study Notes for Data Analysts

### 1. Probability Basics

**Definition:** Probability measures how likely an event is to happen. Its value ranges from 0 to 1, where 0 means impossible and 1 means certain.

**Formula:**

`P(Event) = Number of favorable outcomes / Total number of equally likely outcomes`

**Example:** If a fair coin is tossed, the probability of getting heads is:

`P(Heads) = 1/2 = 0.5 = 50%`

**Important terms:**
- **Experiment:** An action that produces an outcome, such as rolling a die.
- **Outcome:** A possible result, such as getting a 4.
- **Event:** An outcome or group of outcomes of interest.
- **Probability:** The likelihood of that event occurring.

**Business example:** If 20 out of 100 orders are returned, the observed return rate is:

`20 / 100 = 0.20 = 20%`

This is the return rate in the observed data. It estimates the likelihood of a return for a future order only if the data is reasonably representative and conditions remain similar.

**Excel formula:**

`=20/100`

### 2. Sampling

**Definition:** Sampling is the process of selecting a smaller group of observations from a larger population to learn about the population.

**Example:** A company has 10,000 customers but surveys 500 customers to understand satisfaction.

- **Population:** All 10,000 customers.
- **Sample:** The 500 selected customers.

**Common sampling methods:**

- **Simple random sampling:** Every population member has an equal chance of being selected.
- **Systematic sampling:** Select every kth member after a starting point.
- **Stratified sampling:** Divide the population into groups and sample from each group.
- **Cluster sampling:** Divide the population into clusters, then select some clusters to study.

**Why sampling is useful:**
- Saves time and money.
- Makes large datasets easier to investigate.
- Allows analysts to estimate population characteristics.

**Business application:** Surveying a sample of customers instead of contacting every customer.

**Important:** A larger sample does not automatically guarantee accurate results. The sampling method and representativeness also matter.

### 3. Sampling Bias

**Definition:** Sampling bias occurs when the method used to select observations systematically makes some members of the population more likely to be included than others.

**Example:** A company sends a customer satisfaction survey only to customers who use its mobile app. Customers who rarely use the app are excluded, so the results may not represent all customers.

**Common types:**
- **Selection bias:** Some groups are more likely to be selected than others.
- **Nonresponse bias:** People who do not respond differ meaningfully from those who respond.
- **Undercoverage:** Important groups are missing or poorly represented.

**How to reduce sampling bias:**
1. Clearly define the target population.
2. Use an appropriate sampling method.
3. Include important customer or employee groups.
4. Follow up with nonrespondents where practical.
5. Compare the sample with known population characteristics.

**Business application:** Ensuring a customer survey represents customers across regions, age groups, and purchase frequencies.

**Remember:** Sampling bias is a systematic problem. Increasing the sample size alone does not necessarily fix it.

### 4. Confidence Intervals

**Definition:** A confidence interval is a range of plausible values used to estimate an unknown population parameter, such as the population mean or proportion.

**General formula for a confidence interval for a mean when the population standard deviation is known:**

`Confidence interval = Sample mean ± z × (Population SD / √n)`

Where:
- Sample mean = average calculated from the sample.
- `z` = critical value for the chosen confidence level.
- Population SD = population standard deviation.
- `n` = sample size.

For a 95% confidence interval, the commonly used z critical value is approximately 1.96 when the required assumptions are met.

**Example:**

Suppose a sample of customers has:
- Average spending = ₹1,000
- Population standard deviation = ₹200
- Sample size = 100

Standard error:

`200 / √100 = ₹20`

95% confidence interval:

`₹1,000 ± 1.96 × ₹20`

`= ₹1,000 ± ₹39.20`

`= ₹960.80 to ₹1,039.20`

Under the assumptions of this method, the interval estimates the population's average spending.

**Interpretation:** A 95% confidence level means that if we repeatedly took samples using the same method and built intervals in the same way, approximately 95% of those intervals would contain the true population parameter.

It does **not** mean there is a 95% probability that this particular fixed population mean lies inside the calculated interval.

**What affects interval width?**
- Larger samples generally produce narrower intervals.
- Greater variability generally produces wider intervals.
- Higher confidence levels produce wider intervals.

**Business application:** Estimating average customer spending, customer satisfaction rates, or average delivery times.

### 5. Hypothesis Testing

**Definition:** Hypothesis testing is a statistical method used to evaluate evidence about a claim concerning a population.

**Example:** A company claims that its average delivery time is 30 minutes. An analyst collects sample data to investigate whether the average delivery time differs from 30 minutes.

**Basic steps:**
1. Define the research question.
2. State the null and alternative hypotheses.
3. Choose a significance level, often `α = 0.05`.
4. Collect appropriate sample data.
5. Calculate a test statistic and p-value using a suitable test.
6. Compare the p-value with the significance level.
7. State the conclusion in business terms.

**Two possible decisions:**
- **Reject the null hypothesis:** The data provides sufficient evidence against the null at the chosen significance level.
- **Fail to reject the null hypothesis:** The data does not provide sufficient evidence against the null at that level.

**Important:** Failing to reject the null hypothesis does not prove that it is true.

**Business application:** Testing whether a new website design changes conversion rates or whether a training program affects employee performance.

### 6. Null Hypothesis (H₀)

**Definition:** The null hypothesis is the default statistical claim being tested. It often states that there is no difference, no effect, or that a population parameter equals a specified value.

**Example:**

`H₀: μ = 30 minutes`

This states that the population's average delivery time is 30 minutes.

**Another example:** When testing a website redesign, the null hypothesis may state that the conversion rate has not changed.

**Purpose:** The null hypothesis provides a reference claim against which the sample evidence is evaluated.

### 7. Alternative Hypothesis (H₁ or Hₐ)

**Definition:** The alternative hypothesis represents the difference, effect, or relationship that the analyst is investigating evidence for.

**Example:**

`H₁: μ ≠ 30 minutes`

This states that the population's average delivery time differs from 30 minutes.

**Common forms:**

- **Two-tailed:** `H₁: μ ≠ 30` — the mean could be higher or lower.
- **Right-tailed:** `H₁: μ > 30` — the mean is greater than 30.
- **Left-tailed:** `H₁: μ < 30` — the mean is less than 30.

**Business application:** Testing whether a new marketing campaign increases conversion rates or whether a process reduces delivery time.

**Important:** Choose the direction of the alternative hypothesis before analyzing the results, based on the research question.

### 8. p-value

**Definition:** A p-value is the probability, assuming the null hypothesis and the statistical model are correct, of obtaining a test statistic at least as extreme as the one observed.

**Simple interpretation:** A smaller p-value indicates that the observed result would be less compatible with the null hypothesis under the test's assumptions.

**Decision rule when α = 0.05:**
- If `p-value < 0.05`, reject the null hypothesis.
- If `p-value ≥ 0.05`, fail to reject the null hypothesis.

**Example:** Suppose a test comparing two website designs produces a p-value of 0.02.

Because `0.02 < 0.05`, the result is statistically significant at the 5% level, so the analyst rejects the null hypothesis.

**What a p-value does not mean:**
- It is not the probability that the null hypothesis is true.
- It is not the probability that the result happened purely by chance.
- It does not tell you how large or commercially valuable the effect is.

**Business application:** Evaluating evidence from A/B tests, marketing experiments, or process-improvement studies.

### 9. Statistical Significance

**Definition:** A result is statistically significant when it meets the predefined statistical decision threshold, commonly a p-value below the significance level `α`.

**Example:**

If `α = 0.05` and the p-value is `0.03`, the result is statistically significant at the 5% level.

If the p-value is `0.08`, the result is not statistically significant at that level.

**Why it matters:**
- Helps assess whether observed data is inconsistent with a null hypothesis.
- Supports structured decisions about experiments.
- Helps distinguish evidence from random variation under a statistical model.

**Important:** Statistical significance does not automatically mean that an effect is large, useful, or profitable. Results also depend on sample size, study design, data quality, and assumptions.

### 10. Practical Significance vs. Statistical Significance

**Statistical significance:** Asks whether the observed evidence is sufficiently inconsistent with the null hypothesis under a chosen statistical test.

**Practical significance:** Asks whether the size of the effect is large enough to matter in the real world.

**Example:**

A website experiment finds that a redesigned button increases conversion from 10.00% to 10.10%. With a very large sample, this small difference might be statistically significant.

However, the business must determine whether the 0.10 percentage-point increase creates enough additional revenue to justify development and maintenance costs.

**Another example:** A new process reduces average delivery time by 10 minutes. This may be both statistically significant and practically important if it reduces costs and improves customer satisfaction.

**Questions to ask:**
1. Is the result statistically significant?
2. How large is the effect?
3. Is the effect valuable to the business?
4. What are the implementation costs and risks?
5. Does the evidence support a real business decision?

**Remember:** A result can be statistically significant but practically unimportant, or practically meaningful but statistically inconclusive because the sample is too small or too variable.

## Quick Revision

- **Probability:** Measures how likely an event is to occur.
- **Sampling:** Selecting a subset of a population for analysis.
- **Sampling bias:** A systematic distortion caused by how observations are selected or represented.
- **Confidence interval:** A range produced by a method designed to capture a population parameter at a specified long-run rate.
- **Hypothesis testing:** Evaluates evidence about a population claim.
- **Null hypothesis (H₀):** The default claim being tested.
- **Alternative hypothesis (H₁):** The competing claim being investigated.
- **p-value:** Measures how extreme the observed result is under the null hypothesis and model assumptions.
- **Statistical significance:** Evidence meets a predefined statistical threshold.
- **Practical significance:** The effect is meaningful enough to matter in practice.

## Day 12 Learning Objective

By the end of this lesson, you should be able to explain probability and sampling, identify sampling bias, interpret confidence intervals, understand the steps of hypothesis testing, distinguish null and alternative hypotheses, interpret p-values, and explain why statistical significance is different from practical significance.
