create database sales_and_profit;
use sales_and_profit;

-- Q1: Total Sales and Profit
SELECT SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM retail;

-- Q2: Sales and Profit by Category
SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM retail
GROUP BY category;

-- Q3: Sales and Profit by Region
SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM retail
GROUP BY region;

-- Q4: Average Discount by Category
SELECT category, AVG(discount) AS avg_discount
FROM retail
GROUP BY category;

-- Q5: Identify Loss-Making Orders
SELECT *
FROM retail
WHERE profit < 0;

-- Q6: Top 5 Sales Orders
SELECT *
FROM retail
ORDER BY sales DESC
LIMIT 5;

-- Q7: Monthly Sales Trend
SELECT 
    year,
    month,
    SUM(sales) AS total_sales
FROM retail
GROUP BY year, month
ORDER BY year, month;

-- Q8: Profit by Discount Level
SELECT 
    CASE 
        WHEN discount <= 0.1 THEN 'low'
        WHEN discount <= 0.3 THEN 'medium'
        ELSE 'high'
    END AS discount_level,
    SUM(profit) AS total_profit
FROM retail
GROUP BY 
    CASE 
        WHEN discount <= 0.1 THEN 'low'
        WHEN discount <= 0.3 THEN 'medium'
        ELSE 'high'
    END
ORDER BY total_profit DESC;


-- Q9: Category contributing highest profit
SELECT 
    category, 
    SUM(profit) AS total_profit
FROM retail
GROUP BY category
ORDER BY total_profit DESC;


-- Q10: Region with highest losses
SELECT 
    region, 
    SUM(profit) AS total_profit
FROM retail
GROUP BY region
ORDER BY total_profit ASC;