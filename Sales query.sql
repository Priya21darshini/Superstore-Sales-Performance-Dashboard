CREATE DATABASE superstore;
USE superstore;

CREATE TABLE superstore_data (
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);

-- Question: What is the total sales, total profit, and total quantity sold?
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM superstore_data;

-- Question: Which product category generates the highest sales?
SELECT 
    category,
    SUM(sales) AS total_sales
FROM superstore_data
GROUP BY category
ORDER BY total_sales DESC;

-- Question: Which region generates the highest profit?
SELECT 
    region,
    SUM(profit) AS total_profit
FROM superstore_data
GROUP BY region
ORDER BY total_profit DESC;

--  Total business performance
SELECT SUM(sales), SUM(profit), SUM(quantity)
FROM superstore_data;

-- Question: Which customer segment generates the highest sales?
SELECT 
    segment,
    SUM(sales) AS total_sales
FROM superstore_data
GROUP BY segment
ORDER BY total_sales DESC;

-- Question: Which shipping mode is most frequently used?
SELECT 
    ship_mode,
    COUNT(*) AS total_orders
FROM superstore_data
GROUP BY ship_mode
ORDER BY total_orders DESC;

-- Question: Top cities by sales
SELECT 
    city,
    SUM(sales) AS total_sales
FROM superstore_data
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- Question: Which sub-categories are least profitable?
SELECT 
    sub_category,
    SUM(profit) AS total_profit
FROM superstore_data
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 10;

-- Question: Average profit at different discount levels
SELECT 
    discount,
    AVG(profit) AS avg_profit
FROM superstore_data
GROUP BY discount
ORDER BY discount;

-- Question: Top states by profit
SELECT 
    state,
    SUM(profit) AS total_profit
FROM superstore_data
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- Question: Which category sells the highest quantity?
SELECT 
    category,
    SUM(quantity) AS total_quantity
FROM superstore_data
GROUP BY category
ORDER BY total_quantity DESC;

-- Question: Which categories have the highest profit margin?
SELECT 
    category,
    SUM(profit) / SUM(sales) AS profit_margin
FROM superstore_data
GROUP BY category
ORDER BY profit_margin DESC;

-- Question: Profit per order by shipping mode
SELECT 
    ship_mode,
    SUM(profit) / COUNT(*) AS profit_per_order
FROM superstore_data
GROUP BY ship_mode
ORDER BY profit_per_order DESC;

-- Question: Profit by region and category
SELECT 
    region,
    category,
    SUM(profit) AS total_profit
FROM superstore_data
GROUP BY region, category
ORDER BY total_profit DESC;

-- Question: States with high sales but low profit
SELECT 
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_data
GROUP BY state
HAVING SUM(sales) > 50000
ORDER BY total_profit ASC;

-- Question: Average discount by sub-category
SELECT 
    sub_category,
    AVG(discount) AS avg_discount
FROM superstore_data
GROUP BY sub_category
ORDER BY avg_discount DESC;

-- Question: Profit per unit by city
SELECT 
    city,
    SUM(profit) / SUM(quantity) AS profit_per_unit
FROM superstore_data
GROUP BY city
ORDER BY profit_per_unit DESC
LIMIT 10;
