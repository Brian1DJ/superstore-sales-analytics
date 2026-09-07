-- PHASE 2 CLEANING

DESCRIBE superstore;
select 
	order_date,
    str_to_date(order_date, '%m/%d/%Y') AS converted_order_date,
    ship_date,
    str_to_date(ship_date,'%m/%d/%Y') AS converted_ship_date
from superstore
LIMIT 10;


UPDATE superstore
SET	
	order_date = DATE_FORMAT(
		STR_TO_DATE(order_date,'%m/%d/%Y'), '%Y,%m,%d'),
		ship_date = DATE_FORMAT(
        STR_TO_DATE(ship_date, '%m/%d/%Y'),
        '%Y-%m-%d'
    );
ALTER TABLE superstore
modify order_date DATE,
modify ship_date DATE;

SELECT count(*) as invalid_dates
from superstore
where ship_date < order_date;

SELECT 
	min(discount) as min_discount,
    MAX(discount) as max_discount,
    count(*) as total_rows,
    SUM(CASE WHEN discount<0 or discount > 1 then 1 else 0 end) AS invalid_discounts 
    from superstore;

SELECT 
	min(sales) as min_sales,
    MAX(sales) as max_sales,
    count(*) as total_rows,
    SUM(CASE WHEN sales<=0 then 1 else 0 end) AS invalid_sales
    from superstore;
    
SELECT
    MIN(profit) AS min_profit,
    MAX(profit) AS max_profit,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS loss_making_rows
FROM superstore;

SELECT
    SUM(CASE WHEN category = '' OR category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN sub_category = '' OR sub_category IS NULL THEN 1 ELSE 0 END) AS missing_sub_category,
    SUM(CASE WHEN region = '' OR region IS NULL THEN 1 ELSE 0 END) AS missing_region,
    SUM(CASE WHEN segment = '' OR segment IS NULL THEN 1 ELSE 0 END) AS missing_segment,
    SUM(CASE WHEN customer_name = '' OR customer_name IS NULL THEN 1 ELSE 0 END) AS missing_customer_name
FROM superstore;
