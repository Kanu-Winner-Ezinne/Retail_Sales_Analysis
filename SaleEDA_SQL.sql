SELECT * FROM retail_analysis.sales_dataset;


CREATE TABLE sales_clean (
    transaction_id INT,
    order_date DATE,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

DESCRIBE sales_clean;
ALTER TABLE sales_clean
MODIFY customer_id VARCHAR(20);

INSERT INTO sales_clean
SELECT
    CAST(transaction_id AS UNSIGNED),
    STR_TO_DATE(Date, '%m/%d/%Y'),
    customer_id,          -- ← remove CAST
    gender,
    CAST(age AS UNSIGNED),
    product_category,
    CAST(quantity AS UNSIGNED),
    CAST(price_per_unit AS DECIMAL(10,2)),
    CAST(total_amount AS DECIMAL(10,2))
FROM sales_dataset 
WHERE STR_TO_DATE(Date, '%m/%d/%Y') IS NOT NULL;


# Confirm Date Conversion 
select date , Order_date from sales_dataset
join sales_clean limit 10;   


# who are our most valuable customers

select * from sales_clean;


# who are our most valuable customers

select customer_id, count(distinct transaction_id) as total_transaction,
sum(total_amount) as total_spent,
sum(quantity) as Total_Units
from sales_clean
group by customer_id
order by total_spent Desc limit 10;



# How Does customer age and gender influence purchasing behavior
# Spendings by age group an gender

SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25–34 '
        WHEN age BETWEEN 35 AND 44 THEN '35–44 '
        WHEN age BETWEEN 45 AND 54 THEN '45–54 '
        ELSE '55+'
    END AS age_group,
    gender,
    COUNT(DISTINCT transaction_id) AS transactions,
    SUM(total_amount) AS total_spent,
    AVG(total_amount) AS avg_spent
FROM sales_clean
GROUP BY age_group, gender
ORDER BY total_spent DESC;

# insight customer age 25-34 shows the highest spending with noticeable differences between genders


# which Product categories drive the most revenue

select * from sales_clean;

select product_category,sum(total_amount) as total_revenue,
sum(quantity) as total_units
from sales_clean
group by product_category
order by total_revenue;
#Insight 
# Electronics are driving sales with the total revenue of 470715.00

# Monthly Trends in Sales & Transaction

select 
date_format(order_date, '%m') as month,
count(distinct transaction_id) as total_transaction,
sum(total_amount) as total_revenue
from sales_clean
group by month
order by month;
# or
SELECT
    MONTH(order_date) AS month,
    COUNT(DISTINCT transaction_id) AS total_transaction,
    SUM(total_amount) AS total_revenue
FROM sales_clean
GROUP BY MONTH(order_date)
ORDER BY total_revenue desc;
# the hight revenue drives from the month of May then October and December
 
# Quantity Per Transaction
# step1 Total items per transaction
#step2 Average items per transaction

-- Total quantity per transaction
SELECT
    transaction_id,
    SUM(quantity) AS total_items
FROM sales_clean
GROUP BY transaction_id;

-- Average quantity per transaction
SELECT
    ROUND(AVG(total_items),2) AS avg_items_per_transaction
FROM (
    SELECT
        transaction_id,
        SUM(quantity) AS total_items
    FROM sales_clean
    GROUP BY transaction_id
)t;



# Pricing effect on the purchasing Behavior
 SELECT
    product_category,
    ROUND(AVG(price_per_unit),2) AS avg_price,
    SUM(quantity) AS total_units_sold,
    SUM(total_amount) AS total_revenue
FROM sales_clean
GROUP BY product_category
ORDER BY avg_price;

SELECT
    CASE
        WHEN price_per_unit < 10 THEN 'Low Price'
        WHEN price_per_unit BETWEEN 10 AND 30 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_band,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    SUM(total_amount) AS total_revenue
FROM sales_clean
GROUP BY price_band
ORDER BY total_revenue DESC;


