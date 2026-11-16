# Day 37 — API Data Extraction Using Python & Pandas

## 1. What is an API?

API stands for **Application Programming Interface**.

An API allows two software applications to communicate and exchange information.

### Simple example

Imagine you use a weather application.

You open the application and search for Indore.

The application needs weather information from a weather service.

The process:

1. You search for Indore.
2. The application sends a request to a weather API.
3. The API retrieves the required information.
4. The API sends a response.
5. The application displays the weather.

### Real-world API examples

- Weather APIs → Weather information.
- Google Maps APIs → Location and geographical information.
- Payment APIs → Payment transactions.
- Banking APIs → Financial information.
- E-commerce APIs → Orders and product information.
- Social media APIs → Posts and engagement information.

### Why do Data Analysts use APIs?

Data Analysts use APIs to:
- Collect real-time or regularly updated data.
- Extract data from external platforms.
- Automate data collection.
- Retrieve business information.
- Build analytical datasets.

**Remember:** An API is a communication interface that allows applications to exchange data.

---

## 2. What is HTTP?

HTTP stands for **Hypertext Transfer Protocol**.

It is a communication protocol used to transfer information between a client and a server.

### How HTTP works

Suppose Python requests sales information from a server.

```text
PYTHON CLIENT
     |
     | HTTP REQUEST
     |
     v
API SERVER
     |
     | HTTP RESPONSE
     |
     v
PYTHON CLIENT
```

### Important HTTP methods

HTTP methods describe what action a client wants to perform.

Common methods:

- GET → Retrieve information.
- POST → Submit information.
- PUT → Replace an existing resource.
- PATCH → Partially update a resource.
- DELETE → Delete a resource.

For Data Analysts, GET is commonly used when extracting information from APIs.

---

## 3. GET Method

### What is GET?

GET is an HTTP method used to retrieve information from a server.

It does not normally create or modify data on the server.

### Example

Suppose you want to retrieve customer information.

API endpoint:

```text
https://api.example.com/customers
```

A GET request asks the server to return customer information.

### Python example

```python
import requests

url = "https://api.example.com/customers"

response = requests.get(url)

print(response.status_code)
print(response.text)
```

This is a conceptual example. The endpoint is illustrative and is not a real working API.

### Real GET API example

We will use JSONPlaceholder, a public testing API.

```python
import requests

url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url)

print(response.status_code)
```

Expected status code:

```text
200
```

This indicates that the request succeeded.

---

## 4. POST Method

### What is POST?

POST is an HTTP method used to submit information to a server, commonly to create a new resource.

### Example

Suppose an application wants to submit customer information.

```python
import requests

url = "https://api.example.com/customers"

data = {
    "name": "Rahul",
    "city": "Indore"
}

response = requests.post(url, json=data)

print(response.status_code)
print(response.json())
```

### Difference between GET and POST

GET:
- Retrieves data.
- Commonly used for data extraction.
- Sends parameters through the URL or request configuration.

POST:
- Submits data.
- Commonly used to create resources or perform operations.
- Often sends information in the request body.

**Data Analyst tip:** You will frequently use GET when collecting external datasets for analysis. POST is useful when an API requires a request body to submit search criteria or other information.

---

## 5. What is JSON?

JSON stands for **JavaScript Object Notation**.

It is a lightweight format used to store and exchange structured data.

APIs commonly return information in JSON format.

### Example JSON

```json
{
    "id": 1,
    "name": "Rahul",
    "city": "Indore",
    "age": 25,
    "salary": 35000
}
```

This JSON object contains:
- id
- name
- city
- age
- salary

### JSON with multiple records

```json
[
    {
        "id": 1,
        "name": "Rahul",
        "city": "Indore"
    },
    {
        "id": 2,
        "name": "Amit",
        "city": "Bhopal"
    },
    {
        "id": 3,
        "name": "Priya",
        "city": "Khandwa"
    }
]
```

This is a JSON array containing three customer records.

### Important JSON data types

- String → "Rahul"
- Number → 25
- Boolean → true or false
- Null → null
- Array → [1, 2, 3]
- Object → {"name": "Rahul"}

### JSON vs Python dictionary

JSON:

```json
{
    "name": "Rahul",
    "age": 25
}
```

Python dictionary:

```python
data = {
    "name": "Rahul",
    "age": 25
}
```

They look similar, but JSON is a data-interchange format while a Python dictionary is a Python data structure.

---

## 6. Request and Response

### What is a Request?

A request is a message sent by a client to an API server.

It can contain:
- URL
- HTTP method
- Headers
- Query parameters
- Request body

### What is a Response?

A response is the information returned by the server.

It commonly contains:
- Status code
- Response headers
- Response body

### Example

```python
import requests

url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url)

print(response.status_code)
print(response.headers)
print(response.text)
```

### Important HTTP status codes

| Status Code | Meaning |
|---|---|
| 200 | OK |
| 201 | Created |
| 204 | No Content |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 429 | Too Many Requests |
| 500 | Internal Server Error |

**Remember:** A 200 status code generally means a successful request. A 404 means the requested resource was not found.

---

## 7. Python Requests Library

### What is Requests?

Requests is a Python library used to send HTTP requests and communicate with APIs.

### Installation

Open your terminal:

```bash
pip install requests
```

### Import the library

```python
import requests
```

### Important Requests functions

GET request:

```python
requests.get(url)
```

POST request:

```python
requests.post(url, json=data)
```

PUT request:

```python
requests.put(url, json=data)
```

DELETE request:

```python
requests.delete(url)
```

### Important response attributes and methods

```python
response.status_code
```

Returns the HTTP status code.

```python
response.text
```

Returns the response body as text.

```python
response.json()
```

Converts a JSON response into Python objects.

```python
response.headers
```

Returns response headers.

```python
response.url
```

Returns the final response URL.

### Complete example

```python
import requests

url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url, timeout=15)

if response.status_code == 200:
    data = response.json()
    print(data)
else:
    print("Request failed:", response.status_code)
```

---

## 8. API Authentication Concept

### What is API Authentication?

API authentication is the process of verifying whether a user or application is authorized to access an API.

Many APIs require authentication before providing information.

### Common authentication methods

**1. API Key**

A unique key used to identify and authorize an application.

Example:

```python
headers = {
    "x-api-key": "YOUR_API_KEY"
}
```

**2. Bearer Token**

A token sent in the Authorization header.

Example:

```python
headers = {
    "Authorization": "Bearer YOUR_ACCESS_TOKEN"
}
```

**3. Basic Authentication**

Uses a username and password.

Example:

```python
from requests.auth import HTTPBasicAuth

response = requests.get(
    url,
    auth=HTTPBasicAuth("username", "password")
)
```

**4. OAuth 2.0**

An authorization framework that allows applications to obtain access tokens to access protected resources.

### Important security rules

- Never publish your API keys on GitHub.
- Do not hardcode real passwords in scripts.
- Use environment variables to store credentials.
- Follow the API provider's authentication instructions.
- Never share access tokens publicly.

---

## 9. Extracting API Data

Now let's perform practical API data extraction.

We will use JSONPlaceholder.

API endpoint:

https://jsonplaceholder.typicode.com/users

### Step 1: Import Requests

```python
import requests
```

### Step 2: Define API URL

```python
url = "https://jsonplaceholder.typicode.com/users"
```

### Step 3: Send GET Request

```python
response = requests.get(url, timeout=15)
```

### Step 4: Check Response

```python
print(response.status_code)
```

Expected output:

```text
200
```

### Step 5: Extract JSON Data

```python
data = response.json()

print(data)
```

### Step 6: Check Number of Records

```python
print(len(data))
```

Expected output:

```text
10
```

The testing API returns 10 sample user records.

---

## 10. JSON to DataFrame

### What is a DataFrame?

A DataFrame is a two-dimensional data structure provided by Pandas.

It stores information in rows and columns.

We can convert API JSON data into a DataFrame for analysis.

### Step 1: Import Libraries

```python
import requests
import pandas as pd
```

### Step 2: Extract API Data

```python
url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url, timeout=15)

data = response.json()
```

### Step 3: Convert JSON into DataFrame

```python
df = pd.DataFrame(data)
```

### Step 4: Display Data

```python
print(df.head())
```

### Step 5: Check Data Information

```python
print(df.info())
```

### Step 6: Check Columns

```python
print(df.columns)
```

### Problem: Nested JSON

Sometimes JSON contains information inside other objects.

Example:

```json
{
    "id": 1,
    "name": "Rahul",
    "address": {
        "city": "Indore",
        "zipcode": "452001"
    }
}
```

A normal DataFrame may keep address as a nested dictionary.

Use `json_normalize()` to flatten nested JSON.

```python
from pandas import json_normalize

df = json_normalize(data)

print(df.head())
```

For nested address fields, columns may look like:

- address.city
- address.zipcode

**Remember:** Use `pd.DataFrame()` for simple records and `pd.json_normalize()` for nested JSON structures.

---

## 11. Loading API Data into Pandas

Loading API data into Pandas means extracting information from an API and converting it into a DataFrame so that you can analyze it.

### Complete practical code

```python
import requests
import pandas as pd

url = "https://jsonplaceholder.typicode.com/users"

response = requests.get(url, timeout=15)

if response.status_code == 200:

    data = response.json()

    df = pd.json_normalize(data)

    print(df.head())

    print(df.shape)

    print(df.info())

else:

    print("API Error:", response.status_code)
```

### Useful Pandas operations

View first five records:

```python
df.head()
```

View last five records:

```python
df.tail()
```

Check dataset dimensions:

```python
df.shape
```

Check missing values:

```python
df.isnull().sum()
```

Check duplicate records:

```python
df.duplicated().sum()
```

Select columns:

```python
df[["name", "email", "address.city"]]
```

Filter records:

```python
df[df["address.city"] == "McKenziehaven"]
```

Calculate number of records:

```python
len(df)
```

---

## 12. Saving Extracted Data

After extracting API data, you may want to save it for future analysis.

Pandas supports several formats.

### Save as CSV

```python
df.to_csv("api_data.csv", index=False)
```

### Save as Excel

```python
df.to_excel("api_data.xlsx", index=False)
```

This requires the openpyxl package:

```bash
pip install openpyxl
```

### Save as JSON

```python
df.to_json("api_data.json", orient="records", indent=4)
```

### Read saved CSV

```python
df = pd.read_csv("api_data.csv")
```

### Read saved Excel

```python
df = pd.read_excel("api_data.xlsx")
```

### Why save extracted data?

- Future analysis.
- Historical records.
- Reporting.
- Data backup.
- Dashboard development.
- Reusing data without repeatedly calling an API.

---

# 13. Complete API to Pandas Project

Now combine everything into one practical Python script.

### Project: Extract Customer Data from an API

```python
import requests
import pandas as pd

# Step 1: API URL
url = "https://jsonplaceholder.typicode.com/users"

# Step 2: Send GET request
response = requests.get(url, timeout=15)

# Step 3: Check response
if response.status_code == 200:

    # Step 4: Extract JSON
    data = response.json()

    # Step 5: Convert JSON to DataFrame
    df = pd.json_normalize(data)

    # Step 6: Select required columns
    df = df[
        [
            "id",
            "name",
            "username",
            "email",
            "address.city",
            "company.name"
        ]
    ]

    # Step 7: Rename columns
    df = df.rename(columns={
        "id": "Customer_ID",
        "name": "Customer_Name",
        "username": "Username",
        "email": "Email",
        "address.city": "City",
        "company.name": "Company"
    })

    # Step 8: Check missing values
    print(df.isnull().sum())

    # Step 9: Remove duplicates
    df = df.drop_duplicates()

    # Step 10: Display dataset
    print(df.head())

    # Step 11: Save CSV
    df.to_csv("customer_api_data.csv", index=False)

    # Step 12: Save Excel
    df.to_excel("customer_api_data.xlsx", index=False)

    print("API extraction completed successfully!")

else:
    print("Request failed:", response.status_code)
```

**Expected output:**

- 10 sample customer records.
- Cleaned DataFrame.
- Selected and renamed columns.
- CSV file.
- Excel file.

---

# 14. Complete Data Extraction Workflow

Understand this workflow because it represents a practical Data Analyst task.

```text
REST API
   |
   v
JSON RESPONSE
   |
   v
PYTHON REQUESTS
   |
   v
PANDAS DATAFRAME
   |
   v
DATA CLEANING
   |
   v
DATA ANALYSIS
   |
   v
CSV / EXCEL / DASHBOARD
```

### What happens at each stage?

**REST API:** Provides access to external information.

**JSON Response:** Returns structured data.

**Python Requests:** Sends API requests and retrieves responses.

**Pandas:** Converts JSON into a DataFrame.

**Cleaning:** Removes duplicates, handles missing values, and fixes data types.

**Analysis:** Performs filtering, aggregation, grouping, and visualization.

**Output:** Saves the data or sends it to a dashboard.

---

# Practical Assignment — Day 37

## Task 1: API Connection

- [ ] Install Requests.
- [ ] Import Requests.
- [ ] Connect to JSONPlaceholder.
- [ ] Send a GET request.
- [ ] Print the status code.
- [ ] Extract JSON data.

## Task 2: Pandas Conversion

- [ ] Import Pandas.
- [ ] Convert JSON into a DataFrame.
- [ ] Display the first five records.
- [ ] Check rows and columns.
- [ ] Check data types.
- [ ] Inspect missing values.

## Task 3: Data Cleaning

- [ ] Select required columns.
- [ ] Rename columns.
- [ ] Check duplicates.
- [ ] Remove duplicates where appropriate.
- [ ] Check missing values.
- [ ] Clean column names.

## Task 4: Data Analysis

- [ ] Count total users.
- [ ] Count unique cities.
- [ ] Find users by city.
- [ ] Group users by city.
- [ ] Count users per city.
- [ ] Identify companies represented in the data.

## Task 5: Save Data

- [ ] Export DataFrame to CSV.
- [ ] Export DataFrame to Excel.
- [ ] Export DataFrame to JSON.
- [ ] Read the CSV file again using Pandas.

---

# Quick Revision

- API → Allows applications to communicate.
- HTTP → Protocol for client-server communication.
- GET → Retrieves data.
- POST → Submits data.
- JSON → Data exchange format.
- Request → Message sent to the server.
- Response → Message returned by the server.
- Requests → Python library for HTTP communication.
- Authentication → Verifies access permission.
- DataFrame → Two-dimensional Pandas data structure.
- JSON Normalize → Converts nested JSON into tabular form.
- to_csv() → Saves DataFrame as CSV.
- to_excel() → Saves DataFrame as Excel.
- to_json() → Saves DataFrame as JSON.

## Important Interview Questions

1. What is an API?
2. What is a REST API?
3. What is HTTP?
4. What is the difference between GET and POST?
5. What is JSON?
6. What is the difference between JSON and a Python dictionary?
7. What is the Requests library?
8. What is an HTTP status code?
9. What is API authentication?
10. How do you convert JSON into a Pandas DataFrame?
11. What is json_normalize()?
12. How do you save API data to CSV and Excel?
13. What happens when an API returns a 404 or 500 error?
14. What is the difference between response.text and response.json()?

## Final Concept

**API + Python Requests + JSON + Pandas = Automated Data Extraction**

A Data Analyst should be able to collect data from external sources, convert it into structured datasets, clean it, and prepare it for business analysis.
