# Day 39 — Git, GitHub & Career Readiness

## 1. Git Fundamentals

### What is Git?
Git is a version control system that helps developers and data analysts track changes in their project files.

For example, suppose you create a Power BI dashboard. Later, you modify some charts and accidentally delete an important measure. Git helps you track previous versions and recover your work.

**Why use Git?**
- Track project changes.
- Restore previous versions.
- Collaborate with other people.
- Maintain a history of your work.
- Manage projects professionally.

### What is a Repository?
A repository (repo) is a project folder that Git tracks.

Example:
`Sweet-Shop-Sales-Analysis`

It may contain:
- Excel datasets
- Python scripts
- SQL queries
- Power BI files
- README documentation

### What is Clone?
Clone means downloading an existing GitHub repository to your computer.

```bash
git clone https://github.com/username/project-name.git
```

### What is Commit?
A commit is a saved snapshot of your project changes.

```bash
git add .
git commit -m "Added sales analysis dashboard"
```

A good commit message describes what you changed.

Examples:
- Added customer analysis
- Fixed revenue calculation
- Updated Power BI dashboard
- Cleaned sales dataset

### What is Branch?
A branch allows you to work on a separate version of a project without directly changing the main version.

```bash
git branch
git branch dashboard-update
git switch dashboard-update
```

To return to the main branch:

```bash
git switch main
```

### What is Push?
Push uploads your local commits to GitHub.

```bash
git push origin main
```

### What is Pull?
Pull downloads and integrates the latest changes from the remote repository.

```bash
git pull origin main
```

### Git Workflow

```bash
git init
git add .
git commit -m "Initial project commit"
git branch -M main
git remote add origin https://github.com/username/project-name.git
git push -u origin main
```

Remember:

- `git add` → Select changes.
- `git commit` → Save changes locally.
- `git push` → Upload commits to GitHub.
- `git pull` → Get remote changes.
- `git clone` → Copy an existing repository.

## 2. GitHub

GitHub is an online platform where you can store Git repositories, share projects, collaborate, and showcase your work.

For a Data Analyst, GitHub can contain:
- SQL projects
- Python projects
- Excel analysis
- Power BI dashboard documentation
- Data cleaning projects
- Exploratory Data Analysis (EDA)

Website: https://github.com/

## 3. README File

A README file explains your project to someone visiting your GitHub repository.

Create a file named `README.md`.

### Recommended README Structure

```markdown
# Sweet Shop Sales Analysis

## Project Overview
Analysis of sweet shop sales data to understand
revenue, profit, customer behavior and product performance.

## Objectives
- Analyze total revenue and profit.
- Identify top-selling products.
- Analyze monthly sales trends.
- Understand customer purchasing behavior.

## Tools Used
- Excel
- Power BI
- SQL

## Dataset
The project contains order and product information.

## Key Insights
- Identify the highest-revenue product.
- Identify the best-performing month.
- Compare product profitability.

## Dashboard
Add your dashboard screenshot here.

## Conclusion
Summarize the important findings and recommendations.
```

A good README should answer:
1. What is this project?
2. Why did you create it?
3. Which tools did you use?
4. What did you analyze?
5. What did you discover?
6. Where can someone see the results?

## 4. .gitignore

`.gitignore` tells Git which files and folders should not be tracked.

For example, you generally should not upload:
- Temporary files
- Python cache files
- Virtual environments
- Passwords and API keys
- Large unnecessary files

Example `.gitignore`:

```gitignore
# Python
__pycache__/
*.pyc
.venv/

# Temporary files
*.tmp
*.log

# Environment variables and secrets
.env

# Jupyter
.ipynb_checkpoints/
```

Important: `.gitignore` does not automatically remove files that Git is already tracking. Also, never upload passwords, API keys, or confidential business data.

## 5. Professional Project Structure

Keep your analytics projects organized.

Example:

```text
Sweet-Shop-Sales-Analysis/
│
├── Dataset/
│   ├── Orders.xlsx
│   └── Products.xlsx
│
├── Python/
│   └── sales_analysis.ipynb
│
├── SQL/
│   └── analysis_queries.sql
│
├── PowerBI/
│   └── SweetShopDashboard.pbix
│
├── Images/
│   └── dashboard.png
│
├── README.md
└── .gitignore
```

Benefits:
- Easy to understand.
- Easy to maintain.
- Looks professional.
- Makes collaboration easier.

## 6. Build Your GitHub Analytics Portfolio

Your GitHub profile should demonstrate your practical skills, not just contain random files.

### Recommended portfolio projects

**Project 1 — Excel Sales Analysis**
- Data cleaning
- Pivot Tables
- XLOOKUP
- KPI calculations
- Excel dashboard

**Project 2 — SQL Business Analysis**
- Joins
- GROUP BY
- Subqueries
- CTEs
- Window functions
- Business questions

**Project 3 — Python Exploratory Data Analysis**
- Pandas
- NumPy
- Missing-value handling
- Data visualization
- Business insights

**Project 4 — Power BI Sales Dashboard**
- Power Query
- Data modeling
- DAX
- Time intelligence
- Interactive dashboard

**Project 5 — API Data Analysis**
- API extraction
- JSON processing
- Python Requests
- Pandas
- Data analysis

For each project, upload the README, relevant source files, and dashboard screenshots. Only upload datasets that you are allowed to share.

## 7. LinkedIn Profile Optimization

LinkedIn is a professional networking platform where recruiters can discover your profile.

Website: https://www.linkedin.com/

### Important profile sections

**1. Profile Photo**
- Use a clear and professional photograph.
- Use a simple background.

**2. Headline**

Example:

Data Analyst | Excel | SQL | Python | Power BI | Data Visualization | Business Insights

**3. About Section**

Explain:
- Your educational background.
- Your analytics skills.
- Your practical projects.
- Your interest in solving business problems.

**4. Skills**

Add relevant skills:
- Microsoft Excel
- SQL
- Python
- Pandas
- NumPy
- Power BI
- Data Visualization
- Data Cleaning
- Data Analysis
- Dashboard Development

**5. Projects**

Add your best projects with:
- Project title
- Description
- Tools used
- GitHub repository link
- Dashboard or project link

## 8. Resume Preparation

Your resume should communicate your skills and achievements clearly.

### Recommended sections

1. Professional Summary
2. Technical Skills
3. Work Experience / Internship
4. Projects
5. Education
6. Certifications and Achievements

### Example professional summary

Data Analyst with practical experience in data cleaning, analysis, and dashboard development using Excel, SQL, Python, and Power BI. Skilled in transforming raw datasets into meaningful business insights through data visualization and reporting.

### How to write project descriptions

Avoid:
"Created a sales dashboard in Power BI."

Prefer:
"Developed an interactive Power BI sales dashboard using Power Query and DAX to analyze revenue, profit, product performance, and regional sales trends."

Use measurable results only when you have actually calculated and verified them.

## 9. Business Communication

A Data Analyst must communicate with both technical and non-technical people.

Important communication skills:
- Explain findings in simple language.
- Write professional emails.
- Ask clear questions.
- Present data confidently.
- Explain business problems and recommendations.
- Avoid unnecessary technical jargon.

### Example

Technical explanation:

"Revenue declined by 15% MoM due to a reduction in transaction volume."

Business explanation:

"Sales decreased by 15% compared with the previous month, mainly because fewer orders were placed. We should investigate customer demand and promotional performance."

## 10. Presenting Insights

A Data Analyst should not simply show charts. They should explain what the charts mean and what action the business should take.

Use this framework:

**1. Observation:** What happened?

**2. Insight:** Why is it important?

**3. Recommendation:** What should the business do?

### Example

Observation:
Product A generated the highest revenue.

Insight:
Customers are purchasing Product A more frequently than other products.

Recommendation:
Maintain sufficient stock of Product A and investigate whether similar products have growth potential.

### Five questions to answer in a business presentation

1. What happened?
2. When did it happen?
3. Where did it happen?
4. Why did it happen?
5. What should we do next?

---

# Practical Assignment — Day 39

## Task 1: Git Installation
- Install Git.
- Configure your username and email.
- Verify the installation.

```bash
git --version
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

## Task 2: Create Your First Repository
- Create a folder named `Data-Analytics-Portfolio`.
- Initialize Git.
- Create a README file.
- Add and commit your files.

```bash
git init
git add .
git commit -m "Initial portfolio setup"
```

## Task 3: Upload to GitHub
- Create a GitHub account if you don't already have one.
- Create a new repository.
- Connect your local folder to GitHub.
- Push your project.

## Task 4: Create a Professional README
Document one of your completed analytics projects.

Include:
- Project overview
- Objectives
- Tools
- Dataset
- Key insights
- Dashboard screenshot

## Task 5: Career Portfolio
- Review your LinkedIn headline.
- Update your About section.
- Add your analytics projects.
- Review your resume.
- Add your GitHub profile link.

## Task 6: Business Presentation
Choose your Sweet Shop Sales Analysis project.

Prepare a short presentation answering:
- What was the business problem?
- What data did you analyze?
- What were your top three findings?
- What actions do you recommend?

# Day 39 Completion Checklist

- [ ] Git installed and configured.
- [ ] Understand repository, clone, commit, branch, push and pull.
- [ ] Created a GitHub repository.
- [ ] Uploaded an analytics project.
- [ ] Created a README.md.
- [ ] Created a .gitignore.
- [ ] Organized project folders.
- [ ] Updated LinkedIn profile.
- [ ] Reviewed resume.
- [ ] Practiced presenting business insights.

# Interview Questions

1. What is Git?
2. What is the difference between Git and GitHub?
3. What is a repository?
4. What is the difference between clone and pull?
5. What is a commit?
6. What is a branch?
7. What is the difference between push and pull?
8. What is a README file?
9. Why do we use .gitignore?
10. How would you explain a Power BI dashboard to a business manager?

**Final Goal:** By the end of Day 39, you should have at least one well-documented analytics project on GitHub and a professional profile that helps recruiters understand your Data Analyst skills.
