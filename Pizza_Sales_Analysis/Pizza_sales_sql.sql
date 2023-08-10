SELECT SUM(total_price) AS Total_revenue from pizza_sales;
select * from pizza_sales 
select sum(total_price)/ count(distinct order_id) as Avg_order_val from pizza_sales
select sum(quantity) as Total_pizza_sold from pizza_sales
select count(distinct order_id) as Total_orders from pizza_sales
select cast(sum(quantity) as decimal(10,2)) / 
CAST(count(distinct order_id) AS decimal(10,2)) as average_pizza_per_order from pizza_sales

--Trend as per weekday of pizza orders
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as total_orders_per_day
from pizza_sales
GROUP BY DATENAME(DW, order_date)

--Total orders per month
select datename(Month, order_date) as Month_name , COUNT(DISTINCT order_id) AS Total_orders_per_month from pizza_sales
group by DATENAME(Month, order_date)
ORDER BY Total_orders_per_month DESC

--Percentage of sales by pizza category
select pizza_category, sum(total_price)*100 / (select sum(total_price) from pizza_sales WHERE MONTH(order_date)=1) as Pct_Total_sales_per_pizza from pizza_sales 
WHERE MONTH(order_date)=1 --month of january
group by pizza_category

--percentage of sales as per pizza size
select pizza_size, sum(total_price)*100 / (select sum(total_price) from pizza_sales where DATEPART(quarter, order_date)=1) as Pct_Total_sales_per_pizza_size from pizza_sales 
where DATEPART(quarter, order_date)=1
group by pizza_size
order by Pct_Total_sales_per_pizza_size desc

--The top performing pizzas
select TOP 5 pizza_name, sum(total_price) as Revenue_per_pizza from pizza_sales
group by pizza_name 
order by Revenue_per_pizza desc 

--Bottom performing pizzas
select TOP 5 pizza_name, sum(total_price) as Revenue_per_pizza from pizza_sales
group by pizza_name 
order by Revenue_per_pizza  

--Top performing pizzas by quantity
select TOP 5 pizza_name, sum(quantity) as Revenue_per_pizza_qt from pizza_sales
group by pizza_name 
order by Revenue_per_pizza_qt DESC

--Bottom performing pizzas by quantity
select TOP 5 pizza_name, sum(quantity) as Revenue_per_pizza_qt from pizza_sales
group by pizza_name 
order by Revenue_per_pizza_qt ASC

--Bottom performing pizzas by order
select TOP 5 pizza_name, COUNT(Distinct order_id) as Revenue_per_pizza_qt from pizza_sales
group by pizza_name 
order by Revenue_per_pizza_qt DESC



















