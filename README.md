# AnalystLab_FinTrust_Digital_Bank_Project
​FinTrust Digital Bank data analytics: SQL database querying, data cleaning, revenue leakage analysis, and Power BI executive wireframe layout.

# FinTrust Financial Intelligence & Digital Banking Support Solution

## Project Overview
This repository contains the complete business intelligence, data understanding, KPI planning, and executive Power BI dashboard wireframe developed for FinTrust Digital Bank. 

The goal of this analytical project is to provide actionable insights into customer behavior, transaction channels, revenue leakage, and fraud/risk exposure to support strategic decision-making across executive, operational, and technical leadership teams.

---

## Key Project Deliverables
- Part A — Business Understanding: Key management business questions, strategic decisions supported, and stakeholder analysis.
- Part B — Data Understanding: Data schema analysis covering 1,500 customer records and 12,000 transaction records, missing value audits, datatype checks, and relational integrity mapping.
- Part C — Analytical Questions: Structured queries focused on revenue drivers, channel efficiency, payment failures, and geographical risk patterns.
- Part D — KPI Planning: Formal definitions, formulas, and business rationale for 8 core metrics (Gross Potential Revenue, Realized Revenue, Revenue Leakage, ARPU, ATV, Failure Rates, Risk Flag Rates, and Channel Revenue Share).
- Part E — Dashboard Wireframe: Executive dashboard layout built in Power BI Desktop featuring custom slicers, KPI scorecards, interactive trend visual, and channel/risk chart breakdown quadrants.
- Project Execution Roadmap: Implementation strategy, success criteria, project risks, and future backend integration dependencies.

---

## 🛠️ Data Analysis Process

The analysis followed a structured, end-to-end data analytics workflow designed to turn raw transactional data into actionable business intelligence:

### 1. Data Preparation & Quality Assessment (Excel)
* Initial Data Audit: Evaluated raw datasets in Microsoft Excel to audit total record counts, row/column dimensions, and overall structure.
* Data Cleaning & Validation: Identified missing values, duplicate entries, and inconsistent data formatting to establish baseline data integrity.

### 2. Data Modeling & SQL Querying
* Relational Structuring: Imported and structured datasets into MySQL Workbench for efficient analytical querying.
* Business Inquiry & SQL Analysis: Executed structured SQL queries using aggregate functions, GROUP BY, CTEs, and JOIN statements to answer operational business questions.
* Regional & Financial Profiling: Evaluated regional sales performance, transaction failure patterns, and cost distributions.

### 3. Exploratory Data Analysis & Feature Engineering (Python & DAX)
* Statistical Profiling & EDA: Conducted exploratory analysis using Python (pandas, numpy, matplotlib, seaborn) to uncover statistical patterns, distributions, and transactional anomalies.
* Custom DAX Measures: Developed dynamic Data Analysis Expressions (DAX) in Power BI to model financial metrics, including:
  * Month-over-Month (MoM) and Year-over-Year (YoY) Growth
  * Customer Retention & Churn Rates
  * Category Profitability & Margins

### 4. Dashboard Visualization & Storytelling
* Interactive Power BI Dashboard: Built an intuitive, multi-page visual report with interactive filters, category drill-downs, and KPI tracking.
* Executive Delivery: Translated complex analytical findings into concise, data-backed strategic recommendations.

---

## 💡 Business Insights & Strategic Recommendations

### 1. Revenue & Customer Segmentation
* Insight: Everyday retail users drive consistent daily transaction volume, while commercial/SME accounts and high-spending segments contribute a higher share of overall monetary value.
* Action: Enhance mobile convenience features for retail users while offering expanded limits and multi-user administrative features for commercial accounts.

### 2. Operational Efficiency & Transaction Failures
* Insight: Mobile transaction drops and pending states lead to friction and delayed or uncollected processing revenue.
* Action: Optimize payment retry logic, network routing, and third-party gateway integrations to minimize transaction drop-offs.

### 3. Security & Risk Management
* Insight: Fraud patterns show higher concentrations on specific mobile platforms and high-value transfers exceeding standard thresholds.
* Action: Implement dynamic, step-up authentication (biometrics/OTP triggers) for high-value transactions originating from elevated-risk device profiles.
