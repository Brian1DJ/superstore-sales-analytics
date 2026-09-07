-- PHASE 1 
SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM superstore;

SELECT
	COUNT(distinct order_id) AS Total_orders,
    COUNT(DISTINCT customer_id) AS Total_customers,
    SUM(sales) as total_sakes,
    SUM(profit) as total_profit
    from superstore;


SELECT DISTINCT category
FROM superstore;
select distinct sub_category from superstore;
select distinct region from superstore;
select distinct segment from superstore;

SELECT 
	count(*) AS total_rows,
    count(order_id) as order_ids,
    count(customer_id) as customer_ids,
    count(order_date) as order_dates,
    count(sales) as sales,
    count(profit) as profits
from superstore;

SELECT
	count(*) as total_rows,
    count(distinct order_id) as unique_orders
FROM superstore;

SELECT
	count(*) as total_rows,
    COUNT(DISTINCT CONCAT_WS ('|', row_id, order_id, order_date, ship_date, customer_id, product_id, sales,quantity
    ,discount, profit)) AS unique_records
from superstore;

SELECT
    MIN(sales) AS min_sales,
    MAX(sales) AS max_sales,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    MIN(discount) AS min_discount,
    MAX(discount) AS max_discount,
    MIN(profit) AS min_profit,
    MAX(profit) AS max_profit
FROM superstore;

SELECT distinct ship_mode
from superstore;
