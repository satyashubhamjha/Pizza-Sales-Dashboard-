create database projects
use projects
select * from pizza_sales
--total revenue
select sum(total_price) as total_revenue from pizza_sales
--average order values(how muxh many spent by each individuals)
select (sum(total_price)/count(distinct order_id)) as average_order_value from pizza_sales
--total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales
--total order
select count(distinct order_id) as total_order from pizza_sales
--average pizza order
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as average_pizza_order from pizza_sales
--daily trends for total orders
select datename(dw,order_date) as order_day,count(distinct order_id) as total_orders
from pizza_sales
group by datename(dw,order_date)
--weekly tends for orders
SELECT 
    DATEPART(week, order_date) AS order_week,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(week, order_date)
ORDER BY order_week;
--montlhy trends for order
select 
    datename(month,order_date) as order_month,
    count(distinct order_id) as total_orders
from pizza_sales
group by datename(month,order_date)
order by total_orders
--yearly trends for order
select 
    datename(year,order_date) as order_year,
    count(distinct order_id) as total_order
from pizza_sales
group by  datename(year,order_date)
order by  total_order
--hourly trends for order
SELECT 
    DATEPART(hour, order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(hour, order_time)
ORDER BY order_hour
--quartly trends for order
SELECT 
    DATEPART(QUARTER, order_date) AS order_quarter,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(QUARTER, order_date)
ORDER BY order_quarter
--minutes trends for orders
SELECT 
    DATEPART(minute, order_time) AS order_minutes,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(minute, order_time)
ORDER BY order_minutes
--total pizza sold  by pizza category
select 
    pizza_category,sum(quantity) as total_pizza,
    cast(sum(quantity) as decimal(10,5))*100/(select sum(quantity) from pizza_sales) 
     as percentage_of_pizza_category
from pizza_sales
group by pizza_category
--here we observe that classiscal is bougth maximum then others
--% of sales of cost by pizza catteogry
select
    pizza_category,sum(total_price) as total_price,
    cast(cast(sum(total_price) as decimal(10,2))*100/ (select sum(total_price) from pizza_sales) as decimal(10,2)) as percent_cateogry
from pizza_sales
group by pizza_category
--% of sales of cost by pizza size
select
    pizza_size,sum(total_price) as total_prices,
    cast(cast(sum(total_price) as decimal(10,2))*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as percent_total
from pizza_sales
group by pizza_size
--top 5 best sellers by total pizza sold
select top(5)
    pizza_name, sum(total_price) as total_prices,sum(quantity) as total_no_of_pizza_sold
from pizza_sales
group by pizza_name
order by total_no_of_pizza_sold desc
--bottom 5 best sellers bt total pizza sold
select top(5)
    pizza_name, sum(total_price) as total_prices,sum(quantity) as total_no_of_pizza_sold
from pizza_sales
group by pizza_name
order by total_no_of_pizza_sold asc









