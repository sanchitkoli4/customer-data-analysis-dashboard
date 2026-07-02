SHOW DATABASES;
select * from customer;
select * from customer 
where category = null ;
SELECT *
FROM customer
LIMIT 20;

select * from customer
order by price desc
limit 10;

select sum(price * quantity) as revenue
from customer;


SELECT gender,
COUNT(*) AS total_transactions
FROM customer
GROUP BY gender;

SELECT DISTINCT gender FROM customer;
SELECT COUNT(*) AS total_records
FROM customer;

select * from customer 
where gender is null;

SELECT DISTINCT category FROM customer;

SELECT DISTINCT payment_method FROM customer;

# ----------PROJECT QUESTIONS------------ 

# 1.How is the shopping distribution according to gender?  --Pie Chart--
select gender ,
count(*) as transactions
from customer
group by gender;

# 2.Which gender did we sell more products to? --Bar Chart--
select gender ,
sum(quantity) as total_products
from customer
group by gender;

#3. Which Gender Generated More Revenue? --Column Chart--
select gender ,
sum(price * quantity) as revenue
from customer
group by gender
order by revenue;

# 4.Distribution of purchase categories relative to other columns?
SELECT
gender,
category,
SUM(quantity) AS products_sold
FROM customer
GROUP BY gender, category;

# 5.How is the shopping distribution according to age? --Column Chart--
select
case 
when age between 18 and 25 then "18 -25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "55+"
end as age_group ,
count(*) as transactions
from customer
group by age_group;

# 6.Which age cat did we sell more products to?
select 
case 
when age between 18 and 25 then "18-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "55+"
end as age_group ,
sum(quantity) as products
from customer 
group by age_group;


# 7.Which age cat generated more revenue?
select 
case 
when age between 18 and 25 then "18-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "55+"
end as age_group ,
sum(quantity*price) as revenue
from customer 
group by age_group;


# 8.Distribution of purchase categories relative to other columns?
SELECT
category,
CASE
WHEN age BETWEEN 18 AND 25 THEN '18-25'
WHEN age BETWEEN 26 AND 35 THEN '26-35'
WHEN age BETWEEN 36 AND 45 THEN '36-45'
WHEN age BETWEEN 46 AND 55 THEN '46-55'
ELSE '55+'
END AS age_group,
SUM(quantity) AS qty
FROM customer
GROUP BY category, age_group;

# 9.Does the payment method have a relation with other columns?
SELECT
payment_method,
gender,
COUNT(*) AS transactions
FROM customer
GROUP BY payment_method, gender;

# 10.How is the distribution of the payment method? --Donut Chart--
select payment_method,
count(*) as transactions 
from customer
group by payment_method;

############################################################################################################
#Count customers by gender
select gender ,
count(*) as total_customers
from customer
group by gender;

# Average age of customers
select avg(age) as avg_age
from customer;

# Youngest and oldest customer
select min(age) as youngest ,
max(age) as oldest 
from customer;

# Revenue by category
select category , 
sum(price * quantity) as revenue
from customer
group by category
order by revenue desc;

# Revenue by shopping mall
select shopping_mall,
sum(price * quantity) as revenue
from customer
group by shopping_mall
order by revenue desc;

# Transactions by payment method
select payment_method,
count(*) as transactions
from customer
group by payment_method;

# Average purchase value by category
select category ,
avg(price * quantity) as Avg_purchase
from customer
group by category;

# Top 5 highest transactions
select * from customer
order by price * quantity desc
limit 5 ;

# Total quantity sold by category
select category,
sum(quantity) as Total_qty
from customer
group by category
order by Total_qty desc;

# Revenue by gender
select gender,
sum(price * quantity) as revenue
from customer
group by gender;

# Average age by category purchased
select category,
avg(age) as avg_age
from customer
group by category;

# Which shopping mall generated the highest revenue?
select shopping_mall,
sum(price * quantity) as revenue
from customer
group by shopping_mall 
order by revenue desc
limit 1;

# Which category generated the most revenue?
select category,
sum(price * quantity) as revenue
from customer
group by category
order by revenue desc
limit 1;

# Which payment method is most preferred?
select payment_method,
count(*) as transactions
from customer
group by payment_method
order by transactions desc;

# Which age group spends the most?
SELECT
CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+'
END AS age_group,
SUM(price * quantity) AS revenue
FROM customer
GROUP BY age_group
ORDER BY revenue DESC;

# Male vs Female purchasing behavior
SELECT gender,
       category,
       COUNT(*) AS purchases
FROM customer
GROUP BY gender, category
ORDER BY gender, purchases DESC;

SELECT
    COUNT(*) AS total_rows,
    COUNT(invoice_no) AS total_invoice_count,
    COUNT(DISTINCT invoice_no) AS unique_invoice_count
FROM customer;


SELECT
    MAX(CASE WHEN gender='Female' THEN total_products END) -
    MAX(CASE WHEN gender='Male' THEN total_products END) AS difference
FROM
(
    SELECT gender,
           SUM(quantity) AS total_products
    FROM customer
    GROUP BY gender
) t;