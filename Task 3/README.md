
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
