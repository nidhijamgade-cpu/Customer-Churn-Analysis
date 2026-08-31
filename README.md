Customer Churn Analysis — Python, SQL & Power BI

📌 Project Overview

This project analyzes customer churn in a telecommunications dataset of 7,043 customers to identify key factors associated with customer attrition and high-risk customer segments.

The analysis was performed using Python, SQL, and Power BI, combining exploratory data analysis, customer segmentation, SQL-based business analysis, and interactive dashboard development.

The objective was to understand why customers churn, which customer segments are most vulnerable, and where retention efforts could be prioritized.

---

🎯 Business Problem

Customer churn can significantly affect recurring revenue and customer lifetime value.

The key business questions addressed in this project were:

- What is the overall customer churn rate?
- Which contract types have the highest churn?
- How does customer tenure relate to churn?
- Which payment and internet-service segments have higher churn?
- What customer characteristics are associated with higher churn?
- Can customers be grouped into meaningful risk segments?
- Which customers could be prioritized for retention efforts?

---

🛠️ Tools & Technologies

- Python — Pandas, NumPy, Matplotlib
- SQL — MySQL
- Power BI — DAX, interactive dashboards, slicers
- Excel/CSV — Data handling and preparation
- Generative AI — Used as an analytical and debugging assistant during exploratory analysis and development

---

🔄 Analysis Workflow

Raw Telco Dataset
       ↓
Python Data Cleaning & EDA
       ↓
Feature Engineering
       ↓
Customer Risk Segmentation
       ↓
SQL Business Analysis
       ↓
Power BI Data Model & DAX Measures
       ↓
Interactive Churn Dashboard
       ↓
Retention Insights & Recommendations

---

📊 Dataset

The dataset contains 7,043 customer records and information covering:

- Customer demographics
- Tenure
- Contract type
- Payment method
- Internet service
- Online security and backup services
- Tech support
- Streaming services
- Monthly charges
- Total charges
- Churn status

The cleaned dataset used for analysis is included in this repository.

---

🐍 Python Analysis

Python was used for:

- Data inspection and validation
- Data type conversion
- Missing-value identification
- Duplicate checking
- Exploratory data analysis
- Churn-rate analysis
- Tenure and charge segmentation
- Risk-factor engineering
- Customer risk segmentation

Risk Segmentation

A risk-factor framework was developed using churn-associated customer characteristics.

Customers were grouped into:

- Low Risk
- Medium Risk
- High Risk

An additional RiskFactorCount measure was created to identify customers exhibiting multiple churn-associated characteristics.

---

🗄️ SQL Analysis

SQL was used to perform business-focused analysis including:

- Overall churn KPIs
- Churn by contract
- Churn by tenure group
- Churn by payment method
- Churn by internet service
- Contract and payment-method segmentation
- High-risk customer analysis
- At-risk customer analysis
- Financial comparison between churned and retained customers

SQL techniques used include:

- "select"
- "where"
- "group by"
- "order by"
- "case when"
- Aggregate functions
- "having"
- CTEs
- Window functions

The complete SQL analysis is available in:

"Churn Analysis.sql"

---

📈 Key Findings

Overall Churn

- Total customers: 7,043
- Churned customers: 1,869
- Retained customers: 5,174
- Overall churn rate: 26.54%

Contract Type

Contract| Churn Rate
Month-to-month| 42.71%
One year| 11.27%
Two year| 2.83%

Month-to-month customers showed substantially higher churn than customers on longer-term contracts.

Tenure

Tenure Group| Churn Rate
0–12 Months| 47.44%
13–24 Months| 28.71%
25–48 Months| 20.39%
49–72 Months| 9.51%

Customers in their first year showed the highest observed churn.

Payment Method

Payment Method| Churn Rate
Electronic check| 45.29%
Mailed check| 19.11%
Bank transfer| 16.71%
Credit card| 15.24%

Electronic-check customers showed the highest churn rate among the payment-method groups.

Internet Service

Internet Service| Churn Rate
Fiber optic| 41.89%
DSL| 18.96%
No internet service| 7.40%

Support & Security

Customers without support/security services showed higher observed churn:

- No Tech Support: 41.64%
- With Tech Support: 15.17%
- No Online Security: 41.77%
- With Online Security: 14.61%

---

🔴 Risk Analysis

The risk-factor analysis showed a strong relationship between the number of observed risk characteristics and historical churn.

Risk Factors| Churn Rate
0| 1.21%
1| 5.24%
2| 13.95%
3| 16.52%
4| 29.88%
5| 44.64%
6| 60.05%
7| 74.17%

Customers with 4 or more risk factors:

- At-risk customers: 3,093
- Churned customers: 1,505
- Historical churn rate: 48.66%

This compares with an overall churn rate of 26.54%.

Risk Segments

Risk Segment| Customers| Churn Rate
Low Risk| 3,060| 7.09%
Medium Risk| 1,827| 23.37%
High Risk| 2,156| 56.82%

---

📊 Power BI Dashboard

The Power BI report contains three interactive pages.

1. Executive Churn Overview

Provides a high-level view of:

- Total customers
- Churned and retained customers
- Overall churn rate
- Average charges
- Churn by contract
- Churn by tenure
- Churn by internet service
- Churn by risk segment

2. Churn Drivers

Explores churn across:

- Payment method
- Tech support
- Online security
- Monthly charge groups
- Partner status
- Dependents

3. At-Risk Customers

Provides an interactive retention-analysis view containing:

- High-risk customer count
- At-risk customer count
- At-risk churn rate
- Risk-factor distribution
- Churn rate by risk-factor count
- Customer-level at-risk table
- Risk, contract, internet-service, and payment-method slicers

---

💡 Retention Recommendations

Based on the observed patterns, businesses could consider:

1. Prioritizing early-tenure customers with proactive onboarding and engagement programs.
2. Monitoring month-to-month customers and encouraging suitable customers to consider longer-term plans.
3. Investigating electronic-check customers to understand payment-related friction or customer preferences.
4. Targeting customers without Tech Support or Online Security with education, bundled services, or retention offers.
5. Prioritizing customers with multiple risk factors for proactive retention campaigns.
6. Using the Power BI risk-segment view to help customer-success teams focus on high-risk retained customers before churn occurs.

«These recommendations are based on observed associations in the dataset and should be validated with additional business and customer-level analysis before implementation.»

---

📁 Repository Contents

customer-churn-analysis/
│
├── Customer-Churn-Eda.ipynb
├── Telco_Customer_Churn_Cleaned.csv
├── Churn Analysis.sql
├── Customer_Churn_Analysis.pbix
└── README.md

---

🎓 Skills Demonstrated

- Exploratory Data Analysis
- Data Cleaning
- Feature Engineering
- Customer Segmentation
- Risk Analysis
- SQL Business Analysis
- Conditional Aggregation
- CTEs
- Window Functions
- Power BI
- DAX Measures
- Data Visualization
- Dashboard Design
- Business Insight Generation
- Retention Analysis
- Generative AI-assisted analytical workflow

---

📌 Project Outcome

The project demonstrates an end-to-end analytics workflow, transforming raw customer data into actionable churn insights and an interactive Power BI retention dashboard.

The analysis identifies high-risk customer segments and provides a framework for prioritizing retention efforts based on multiple churn-associated characteristics.
