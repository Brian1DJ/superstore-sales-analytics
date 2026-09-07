-- PHASE 3 EXPLORATORY DATA ANALYSIS (KPI AND OTHER THINGS)


-- KEY PERFORMANCE INDICATORS
SELECT
	sum(sales) as total_sales,
    sum(profit) as total_profit,
    COUNT(DISTINCT order_id) as total_orders,
    COUNT(DISTINCT customer_id) as total_customers,
    AVG(sales) AS average_row_sales,
    SUM(profit)/sum(sales)*100 AS profit_margin
from superstore;

select 
	category,
    SUM(sales) as total_sales,
    SUM(profit) as total_profit,
    sum(profit)/SUM(sales)*100 as profit_margin
from superstore
GROUP BY category
order by total_sales desc;

SELECT
	sub_category,
	SUM(sales) as total_sales,
    SUM(profit) as total_profit,
	sum(profit)/SUM(sales)*100 as profit_margin
FROM superstore	
GROUP BY sub_category
order by total_profit desc; 
-- tables are high in sales but not profitable so highest sales =! highest profitability

SELECT
	region,
	SUM(sales) as total_sales,
    SUM(profit) as total_profit,
	sum(profit)/SUM(sales)*100 as profit_margin
FROM superstore	
GROUP BY region
order by total_sales desc;

SELECT
	segment,
	SUM(sales) as total_sales,
    SUM(profit) as total_profit,
	sum(profit)/SUM(sales)*100 as profit_margin
FROM superstore	
GROUP BY segment
order by total_sales desc;  


select
	DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS total_sales,
    sum(profit) as total_profit
FROM superstore
GROUP BY date_format(order_date, '%Y-%m')
ORDER BY month;

-- DISCOUNT VS PROFIT ANALYSIS
SELECT 
discount, 
	SUM(sales) as total_sales,
	SUM(profit) as total_profit,
	sum(profit)/SUM(sales)*100 as profit_margin
FROM superstore	
GROUP BY discount
order by discount;  
-- DISCOUNT CAUSE LOSSES (30% to 80% are losses)

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

SELECT
    region,
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(profit) / SUM(sales) * 100 AS profit_margin
FROM superstore
GROUP BY region, category
ORDER BY region, total_profit DESC;
-- central furniture is losing money and west office supplies is the strongest when it comes to profit and sales
