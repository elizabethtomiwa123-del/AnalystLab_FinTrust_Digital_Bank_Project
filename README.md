# AnalystLab_FinTrust_Digital_Bank_Project
​FinTrust Digital Bank data analytics: SQL database querying, data cleaning, revenue leakage analysis, and Power BI executive wireframe layout.

# FinTrust Financial Intelligence & Digital Banking Support Solution

## Project Overview
This repository contains the complete business intelligence, data understanding, KPI planning, and executive Power BI dashboard wireframe developed for FinTrust Digital Bank. 

The goal of this analytical project is to provide actionable insights into customer behavior, transaction channels, revenue leakage, and fraud/risk exposure to support strategic decision-making across executive, operational, and technical leadership teams.

---
# 🏦 FinTrust Digital Bank Project — Analyst Lab Internship

---

## 📌 Week 1

### 🛠️ Data Analysis Process
* Problem Framing & Scope Definition: Analyzed FinTrust's core operational objectives, focusing on key performance metrics across digital banking channels.
* KPI Planning: Mapped out strategic indicators including transaction success rates, customer activity profiles, and revenue distribution channels.
* Data Inspection: Conducted preliminary evaluation of raw transactional records to identify data structures and field definitions.
* Requirements Mapping: Established technical specifications for downstream data cleaning, relational schema design, and analytical workflows.

### 📁 Week 1 Deliverables & Files
* 📄 Week 1 Project Report: [/Task 1/Tomiwa_Elizabeth_AnalystLab_Week 1 _Project.docx](./Task%201/Tomiwa_Elizabeth_AnalystLab_Week%201%20_Project.docx)

---

## 📌 Week 2

### 🛠️ Data Analysis Process
1. Data Preparation & Quality Assessment (Excel):
   * Initial Data Audit: Evaluated raw datasets in Microsoft Excel to audit total record counts, row/column dimensions, and overall structure.
   * Data Cleaning & Validation: Identified missing values, duplicate entries, and inconsistent data formatting to establish baseline data integrity.

2. Data Modeling & SQL Querying:
   * Relational Structuring: Imported and structured datasets into MySQL Workbench for efficient analytical querying.
   * Business Inquiry & SQL Analysis: Executed structured SQL queries using aggregate functions, GROUP BY, CTEs, and JOIN statements to answer operational business questions.
   * Regional & Financial Profiling: Evaluated regional sales performance, transaction failure patterns, and cost distributions.

3. Exploratory Data Analysis & Feature Engineering (Python & DAX):
   * Statistical Profiling & EDA: Conducted exploratory analysis using Python (pandas, numpy, matplotlib, seaborn) to uncover statistical patterns, distributions, and transactional anomalies.
   * Custom DAX Measures: Developed dynamic Data Analysis Expressions (DAX) in Power BI to model financial metrics (MoM/YoY growth, retention, churn, category profitability).

4. Dashboard Visualization & Storytelling:
   * Interactive Power BI Dashboard: Built an intuitive, multi-page visual report with interactive filters, category drill-downs, and KPI tracking.
   * Executive Delivery: Translated complex analytical findings into concise, data-backed strategic recommendations.

### 💡 Business Insights & Strategic Recommendations
* Revenue & Customer Segmentation: Everyday retail users drive consistent daily transaction volume, while commercial/SME accounts contribute a higher share of overall monetary value. Enhance mobile convenience for retail users while offering expanded limits for commercial accounts.
* Operational Efficiency & Transaction Failures: Mobile transaction drops and pending states lead to friction and delayed revenue. Optimize payment retry logic, network routing, and third-party gateway integrations.
* Security & Risk Management: Fraud patterns show higher concentrations on specific mobile platforms and high-value transfers. Implement dynamic step-up authentication (biometrics/OTP) for high-value transactions from elevated-risk device profiles.

### 📁 Week 2 Deliverables & Files
* 📊 Excel Cleaning: [/Task 2/Data Quality & Cleaning.xlsx](./Task%202/Data%20Quality%20%26%20Cleaning.xlsx)
* 📜 SQL Analysis: [/Task 2/FinTrust_Week 2_SQL_Analysis.sql](./Task%202/FinTrust_Week%202_SQL_Analysis.sql)
* 📓 Python Notebook: [/Task 2/FinTrust_Week 2_Data_Analysis.ipynb](./Task%202/FinTrust_Week%202_Data_Analysis.ipynb)
* 📈 Power BI Dashboard: [/Task 2/FinTrust_Week 2_Analytics_Dashboard.pbix](./Task%202/FinTrust_Week%202_Analytics_Dashboard.pbix)

# FinTrust Digital Bank Project - Week 3 Analytics & Customer Health

Welcome to the repository for my Week 3 analytics project with AnalystLab! This project focuses on analyzing customer health, transaction behaviors, lifecycle metrics, and revenue leakage for **FinTrust Digital Bank** using Python, MySQL, and Power BI.

---

## 📁 Repository Structure & Explanations

### 1. `README.md` (Project Documentation)
* **What it is:** The central overview of the project.
* **What it explains:** Outlines the business context, technical objectives, methodology, tools used, and key insights uncovered during the analysis.

### 2. `SQL/` (Advanced SQL Queries & Data Processing)
* **What it contains:** MySQL scripts, window functions, and data transformation scripts.
* **What it explains:** Houses all core extraction logic, data hygiene updates, and advanced analytical queries. This includes:
  * **Customer Engagement & Tier Segmentation:** Categorizing users into engagement levels based on activity scores and volume.
  * **MAU & Revenue Tracking:** Calculating Monthly Active Users, Total Realized Revenue, and Average Revenue Per User (ARPU).
  * **Revenue Leakage Analysis:** Pinpointing failed/reversed transactions across channels, devices, and customer tenure bands.
  * **Cohort Retention Tracking:** Monitoring user retention indices month-over-month.
  * **Window Functions & Risk Auditing:** Using `LAG()` for MoM growth and `DENSE_RANK()` for identifying high-value flagged accounts.

### 3. `Python/` (Data Quality Audits, Cleaning & Visualization Scripts)
* **What it contains:** Jupyter Notebooks (`.ipynb`) and Python scripts (`.py`).
* **What it explains:** Documents exploratory data analysis (EDA) and data workflows using **Pandas**, **NumPy**, and **Seaborn**:
  * **Missingness & Quality Audits:** Automated missing value counts and percentage checks for critical fields like `Device_Type` and `Location`.
  * **Engagement & Leakage Segmentation:** Generates Seaborn boxplots illustrating transaction amount distributions across digital engagement tiers segmented by transaction status (`output_3_engagement_segmentation.png`).

### 4. `Dashboard/` (Power BI Dashboard)
* **What it contains:** The Power BI project file (`.pbix`).
* **What it explains:** An interactive executive dashboard featuring:
  * **Top Banner KPIs:** Monthly Active Users (MAU), ARPU, Gross Potential Revenue, Realized Revenue, Failure Rate %, and Average Transactions per User (8.00).
  * **Customer Health and Churn Dynamics (Page 2):** Visualizes engagement tiers, active user growth trends, channel performance breakdowns, and customer health detail audit tables using custom DAX measures and interactive charts.

### 5. `Documentation/` (Strategic & Technical Documentation)
* **What it contains:** Written analytical reports and documentation files.
* **What it explains:** Breaks down strategic business recommendations, metric definitions, and data governance protocols.

---

## 🛠️ Tools & Technologies Used
* **SQL (MySQL Workbench):** Advanced querying, window functions (`LAG`, `DENSE_RANK`), CTEs, and metric calculations.
* **Python (Pandas, NumPy, Seaborn, Matplotlib):** Data cleaning, quality checks, EDA, and statistical data visualization.
* **Power BI & DAX:** Advanced measure creation, data modeling, and executive dashboard design.

---

## 🚀 How to Explore This Project
1. **Review the Code:** Check the `SQL/` and `Python/` folders to examine the data cleaning, window functions, and visualization scripts.
2. **Inspect the Dashboard:** Download the `.pbix` file from the `Dashboard/` folder to interact with the visualizations and check the DAX measure implementations.
3. **Read the Documentation:** Open the `Documentation/` folder for a deep dive into the business findings and strategic recommendations.


