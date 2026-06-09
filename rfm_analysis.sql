CREATE DATABASE customer_segmentation;
USE customer_segmentation;
CREATE TABLE rfm_final (
CustomerID FLOAT,
Recency INT,
Frequency INT,
Monetary FLOAT,
R_Score INT,
F_Score INT,
M_Score INT,
RFM_Score VARCHAR(10),
Segment VARCHAR(50),
RFM_Score_Num INT,
Value_Group VARCHAR(50)
);

SELECT * FROM customer_segmentation.rfm_final LIMIT 10;

SELECT COUNT(*) FROM rfm_final;

SELECT Value_Group,
	SUM(Monetary) AS Total_Revenue
FROM rfm_final
GROUP BY Value_Group;

SELECT Segment,
	COUNT(*) AS Customers
FROM rfm_final
GROUP BY Segment
ORDER BY Customers DESC;

SELECT Value_Group,
	Count(*) AS Customers,
    SUM(Monetary) AS Revenue,
    AVG(Monetary) AS Avg_Spend
FROM rfm_final
GROUP BY Value_Group

##Top 10 highest value customers
SELECT CustomerID,Monetary
FROM rfm_final
ORDER BY Monetary DESC
LIMIT 10;

##Revenue Contribution percentage By Segment
SELECT Segment,
	SUM(Monetary) AS Revenue,
    ROUND(SUM(Monetary) * 100 / (SELECT SUM(Monetary) FROM rfm_final), 2) AS Revenue_Percentage
FROM rfm_final
GROUP BY Segment;

##High value vs low value customer ratio
SELECT Value_Group,
	COUNT(*) AS Customers,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM rfm_final), 2) AS Customer_Percentage
FROM rfm_final
GROUP BY Value_Group;

## Average frequency by segment (behavior strength)
SELECT Segment,
       AVG(Frequency) AS Avg_Frequency
FROM rfm_final
GROUP BY Segment
ORDER BY Avg_Frequency DESC;

