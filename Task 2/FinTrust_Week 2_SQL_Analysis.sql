-- =============================================
-- PART B: SQL BUSINESS ANALYSIS
-- =============================================

SELECT *
FROM fintrust_data.fintrust_customer_data
;

SELECT COUNT(*) AS Total_rows
FROM  fintrust_data.fintrust_customer_data
 ;
 
 SELECT COUNT(*) AS Total_columns
 FROM information_schema.columns
 WHERE table_schema = 'fintrust_data'
 AND table_name = 'fintrust_customer_data'
 ;


-- Q1: What is the transaction count and average amount by age group and customer_segment?
 
 SELECT 
    CASE 
        WHEN fintrust_customer_data.age < 25 THEN 'Under 25'
        WHEN fintrust_customer_data.age BETWEEN 25 AND 35 THEN '25-35'
        WHEN fintrust_customer_data.age BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Over 50'
    END AS age_range,
    fintrust_customer_data.customer_segment,
    COUNT(fintrust_transaction_data.transaction_id) AS total_transaction_count,
    ROUND(AVG(fintrust_transaction_data.AMOUNT_NGN),2) AS average_transaction_amount,
    ROUND(SUM(fintrust_transaction_data.AMOUNT_NGN),2) AS total_transaction_amount
FROM fintrust_data.fintrust_customer_data
JOIN fintrust_data.fintrust_transaction_data
    ON fintrust_customer_data.customer_id = fintrust_transaction_data.customer_id
GROUP BY age_range,fintrust_customer_data.customer_segment
ORDER BY total_transaction_count DESC;

/* 
BUSINESS INTERPRETATION:
Transaction volume is heavily driven by Everyday customers, led by the Over 50 group (1,918 transactions, ₦93.17M total). Everyday accounts represent the highest total spend across all age tiers. 

However, average transaction values peak in the Student and SME segments—specifically among Over 50 Students (₦50,982.64 avg) and Under 25 Students (₦50,783.03 avg). While Everyday accounts deliver frequency, Student and SME accounts yield higher monetary value per transaction.
*/


-- Q2:  What are the average transactions per customer by account type and tenure?

WITH Customer_Transaction_Counts AS (
    SELECT 
        c.Customer_ID,
        c.Account_Type,
        CASE 
            WHEN c.Tenure_Months < 12 THEN '< 1 Year'
            WHEN c.Tenure_Months BETWEEN 12 AND 36 THEN '1-3 Years'
            ELSE '> 3 Years'
        END AS Tenure_Group,
        COUNT(t.Transaction_ID) AS Transaction_Count
    FROM FinTrust_Customer_Data c
	LEFT JOIN FinTrust_transaction_Data t 
        ON c.Customer_ID = t.Customer_ID
    GROUP BY c.Customer_ID, c.Account_Type, Tenure_Group
)
SELECT 
    Account_Type,
    Tenure_Group,
    COUNT(Customer_ID) AS Total_Customers,
    ROUND(AVG(Transaction_Count), 2) AS Avg_Transactions_Per_Customer
FROM Customer_Transaction_Counts
GROUP BY Account_Type, Tenure_Group
ORDER BY Account_Type, Avg_Transactions_Per_Customer DESC;

/* 
BUSINESS INTERPRETATION:
Transaction frequency remains steady across all account types and tenure bands, ranging tightly between 7.64 and 8.77 transactions per customer[span_0](start_span)[span_0](end_span). Engagement is highest among newer accounts, led by Current (< 1 Year) at 8.77 transactions, Savings (< 1 Year) at 8.36, and Premium (1-3 Years) at 8.35[span_1](start_span)[span_1](end_span). 

Retention is strongest in Savings and Current accounts, with long-term holders (> 3 Years) forming the largest customer groups (564 and 262 customers) while maintaining steady activity at ~8.0 transactions per user[span_2](start_span)[span_2](end_span).
*/


-- Q3: What is the Total and average value by transaction type?
SELECT 
    Transaction_Type,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(Amount_NGN), 2) AS Total_Value_NGN,
    ROUND(AVG(Amount_NGN), 2) AS Avg_Value_Per_Transaction
FROM FinTrust_Transaction_Data
GROUP BY Transaction_Type
ORDER BY Total_Value_NGN DESC;

/* 
BUSINESS INTERPRETATION:
Transfers dominate platform value, generating ₦237.92M across 3,549 transactions at an average of ₦67,037.67 per transfer[span_0](start_span)[span_0](end_span). Deposits yield the highest average transaction value at ₦98,633.33 (₦130.99M total across 1,328 transactions), showing strong funding inflows[span_1](start_span)[span_1](end_span). 

Everyday operational activities like Card Purchases (3,033 txns, ₦85.86M total) drive high frequency, while routine utility payments like Bill Payments (₦19,094 avg) and Airtime/Data (1,185 txns, ₦8,249.93 avg) deliver steady engagement at lower monetary thresholds[span_2](start_span)[span_2](end_span).
*/


-- Q4: What is the transaction volume and revenue distribution across delivery channels?
SELECT 
    Channel,
    COUNT(Transaction_ID) AS Transaction_Volume,
    ROUND(SUM(Amount_NGN), 2) AS Total_Revenue_NGN,
    ROUND(100.0 * COUNT(Transaction_ID) / (SELECT COUNT(*) FROM FinTrust_Transaction_Data), 2) AS Volume_Share_Pct,
    ROUND(100.0 * SUM(Amount_NGN) / (SELECT SUM(Amount_NGN) FROM FinTrust_Transaction_Data), 2) AS Revenue_Share_Pct
FROM FinTrust_Transaction_Data
GROUP BY Channel
ORDER BY Transaction_Volume DESC;

/* 
BUSINESS INTERPRETATION:
Mobile App dominates platform usage, handling 42.52% of transaction volume (5,102 txns) and 42.84% of total revenue (₦240.10M)[span_0](start_span)[span_0](end_span). POS ranks second in volume at 19.94% (2,393 txns; ₦104.35M), while Web accounts for 15.58% of volume and 15.94% of revenue (₦89.32M)[span_1](start_span)[span_1](end_span). 

Self-service channels like ATM (1,747 txns, ₦83.94M) and USSD (889 txns, ₦42.76M) collectively capture ~22% of total throughput, confirming that digital channels drive over 58% of all financial transactions[span_2](start_span)[span_2](end_span).
*/

-- Q5: Percentage rate and financial impact of transaction statuses
SELECT 
    Transaction_Status,
    COUNT(Transaction_ID) AS Transaction_Count,
    ROUND(100.0 * COUNT(Transaction_ID) / (SELECT COUNT(*) FROM FinTrust_Transaction_Data), 2) AS Status_Percentage_Rate,
    ROUND(SUM(Amount_NGN), 2) AS Total_Amount_Impacted
FROM FinTrust_Transaction_Data
GROUP BY Transaction_Status
ORDER BY Transaction_Count DESC;

/* 
BUSINESS INTERPRETATION:
System processing reliability is high, with 90.47% of transactions successfully completed (10,856 txns) totaling ₦510.81M[span_0](start_span)[span_0](end_span). 

However, system friction accounts for 9.53% of overall traffic, driven by Failed transactions at 5.25% (630 txns, ₦24.83M impacted), Reversed transactions at 2.72% (326 txns, ₦15.63M), and Pending transactions at 1.57% (188 txns, ₦9.22M)[span_1](start_span)[span_1](end_span). Addressing the 5.25% failure rate represents an immediate opportunity to recover ~₦24.8M in trapped customer volume[span_2](start_span)[span_2](end_span).
*/


-- Q6:What is the monthly trend of transaction volume and total amount?

SELECT DATE_FORMAT(STR_TO_DATE(Transaction_DateTime, '%c/%e/%Y %H:%i'), '%Y-%m') AS Month_of_the_Year
FROM fintrust_data.fintrust_transaction_data;
SELECT 
    DATE_FORMAT(STR_TO_DATE(Transaction_DateTime, '%c/%e/%Y  %H:%i'), '%Y-%m') AS Month_of_the_Year,
    COUNT(Transaction_ID) AS Total_Transactions,
    ROUND(SUM(Amount_NGN), 2) AS Total_Volume_Amount,
    ROUND(AVG(Amount_NGN), 2) AS Avg_Transaction_Amount
    FROM fintrust_transaction_data
GROUP BY Month_of_the_Year 
ORDER BY Month_of_the_Year ASC
;

/* 
BUSINESS INTERPRETATION:
Transaction performance shows steady momentum across Q1 2026, peaking in March at ₦196.20M across 4,133 transactions (avg ₦47,471.82 per transaction). 

Activity experienced a brief dip in February (3,734 txns, ₦175.79M total), but overall average transaction value grew consistently each month—rising from ₦45,605.96 in January to ₦47,471.82 in March. This highlights steady platform adoption and increasing capital throughput per customer interaction over time.
*/





-- Q7: What is the distribution of account status and average tenure_months across differeent customer_segments?
SELECT 
    Customer_Segment,
    Account_Status,
    COUNT(Customer_ID) AS Customer_Count,
    ROUND(AVG(Tenure_Months), 1) AS Avg_Tenure_Months,
    ROUND(AVG(Digital_Engagement_Score), 2) AS Avg_Engagement_Score
FROM FinTrust_Customer_Data
GROUP BY Customer_Segment, Account_Status
ORDER BY Customer_Count DESC;

/* BUSINESS INTERPRETATION: Pinpoints dormant account concentration across income levels to guide targeted re-engagement strategies.  

Active accounts dominate the customer base across all segments, led by the Everyday segment (652 active customers, avg tenure 49.0 months, engagement score 68.40)[span_0](start_span)[span_0](end_span). 

Dormancy affects 107 customers overall, concentrated mostly in Everyday (47) and Student (22) groups despite higher average tenures (~54–56 months), signaling churn risk among mature accounts[span_1](start_span)[span_1](end_span). SME accounts exhibit the lowest dormant tenure (34.4 months) and lower engagement (56.26), indicating early-lifecycle drop-off that requires targeted re-engagement strategies[span_2](start_span)[span_2](end_span).
*/

-- Q8: What is the distribution of risk-flagged transactions across channels,device_type and location?

SELECT 
    t.Location,
    t.Channel,
    t.Device_Type,
    t.Risk_Review_Flag,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ROUND(SUM(t.Amount_NGN), 2) AS Total_Volume_NGN,
    ROUND(AVG(t.Amount_NGN), 2) AS Avg_Transaction_Value,
    ROUND(100.0 * COUNT(t.Transaction_ID) / SUM(COUNT(t.Transaction_ID)) OVER (PARTITION BY t.Location, t.Channel, t.Device_Type), 2) AS Flag_Share_Pct
FROM fintrust_data.fintrust_transaction_data t
GROUP BY t.Location, t.Channel, t.Device_Type, t.Risk_Review_Flag
ORDER BY Total_Volume_NGN DESC
LIMIT 15;

/* BUSINESS INTERPRETATION: Flags geographic hubs and device platforms exhibiting elevated failure rates or unusual international traffic for fraud review.

Standard, unflagged Mobile App transactions on Android lead overall volume across major regional hubs, top-ranked by Ibadan (₦9.98M across 211 txns) and Kano (₦9.50M across 205 txns)[span_0](start_span)[span_0](end_span). 

However, high-value risk exposure is heavily concentrated in Port Harcourt on Mobile App (Android), where flagged transactions (Risk_Review_Flag = Yes) account for 62 transactions totaling ₦6.05M[span_1](start_span)[span_1](end_span). These flagged transactions average ₦97,612.48—more than double the average size of unflagged Android transactions in the same city (₦38,842.44)—highlighting a critical vector for targeted fraud monitoring and security reviews[span_2](start_span)[span_2](end_span).
*/
