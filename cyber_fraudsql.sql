create database cyber_fraud_db;
use cyber_fraud_db;
CREATE TABLE cyber_fraud (
    Complaint_ID VARCHAR(20) PRIMARY KEY,
    Complaint_Date DATE,
    State VARCHAR(100),
    City VARCHAR(100),
    Crime_Type VARCHAR(100),
    Platform VARCHAR(100),
    Victim_Age INT,
    Gender VARCHAR(50),
    Financial_Loss DECIMAL(15,2),
    Complaint_Status VARCHAR(50),
    Investigation_Status VARCHAR(50)
);
select count(*) as total_records from cyber_fraud;

#STEP 1:Verify Unique Complaints 
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT Complaint_ID) AS unique_complaints
FROM cyber_fraud;


#STEP 2:Find Total Financial Loss
SELECT
    ROUND(SUM(Financial_Loss), 2) AS total_financial_loss
FROM cyber_fraud;

#STEP 3:Find the Most Common CyberCrime Types
SELECT
    Crime_Type,
    COUNT(*) AS total_complaints
FROM cyber_fraud
GROUP BY Crime_Type
ORDER BY total_complaints DESC; 

select version();

#STEP 4:Find the State with highest Financial Loss 
SELECT
    State,
    ROUND(SUM(Financial_Loss), 2) AS total_loss
FROM cyber_fraud
GROUP BY State
ORDER BY total_loss DESC;

#STEP 5:Find the Most Common Fraud Platforms 
SELECT
    Platform,
    COUNT(*) AS total_complaints
FROM cyber_fraud
GROUP BY Platform
ORDER BY total_complaints DESC;

#STEP 6:Analyze Complaint Status 
SELECT
    Complaint_Status,
    COUNT(*) AS total_complaints
FROM cyber_fraud
GROUP BY Complaint_Status
ORDER BY total_complaints DESC; 

#STEP 7:Analyze Investigation Status 
SELECT
    Investigation_Status,
    COUNT(*) AS total_cases
FROM cyber_fraud
GROUP BY Investigation_Status
ORDER BY total_cases DESC;

#STEP 8:Calculate Monthly Financial Loss 
SELECT
    DATE_FORMAT(Complaint_Date, '%Y-%m') AS complaint_month,
    ROUND(SUM(Financial_Loss), 2) AS total_loss
FROM cyber_fraud
GROUP BY DATE_FORMAT(Complaint_Date, '%Y-%m')
ORDER BY complaint_month;

#STEP 9:Find the top 10 highest-loss-Complaints 
SELECT
    Complaint_ID,
    State,
    City,
    Crime_Type,
    Financial_Loss
FROM cyber_fraud
ORDER BY Financial_Loss DESC
LIMIT 10;

