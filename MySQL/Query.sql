use supplychain;
-- Business Questions
-- 1	What are the total revenue, total orders, and total units sold?
select sum(Revenue) as Total_Revenue, count(Order_ID) as Total_Orders, sum(Quantity) as Total_Units_Sold from orders; 
-- 2	Which are the Top 10 products by revenue?
select ord.Product_ID, prod.Product_Name, sum(ord.Revenue) as Revenue from Orders ord left join Products prod
on ord.Product_ID = prod.Product_ID group by Product_ID order by revenue desc limit 10;
-- 3	Which categories generate the highest revenue and profit?
select prod.Category, sum(ord.Revenue) as Revenue, sum(prod.Profit) as Profit from Orders ord left join Products prod
on ord.Product_ID = prod.Product_ID group by prod.Category order by Profit desc;
-- 4	What is the monthly revenue and sales trend?
select Month, monthname(Order_Date) as Month_Name, sum(Revenue) as Total_Revenue, count(Order_ID) as Total_Orders, 
sum(Quantity) as Total_Units_Sold from orders where Month is not null group by Month, Month_Name order by month; 
-- 5	Which products have low inventory or stockout conditions?	Inventory, Product
select inv.Inventory_ID as Inventory_ID, inv.Product_ID as Product_ID, prod.Product_Name as Product_Name, inv.Stock_Status as Stock_Status
from Inventory inv left join Products prod on inv.Product_ID = prod.Product_ID where Stock_Status like "Stockout_";
-- 6	Which products have high demand but low inventory?
select prod.Product_ID as Product_ID, prod.Product_Name as Product_Name, count(ord.Order_ID) as Orders, inv.Closing_Stock
from Products prod left join orders ord on prod.Product_ID = ord.Product_ID  left join 
(select Product_ID, sum(Closing_Stock) as Closing_Stock from inventory group by Product_ID) inv on 
prod.Product_ID = inv.Product_ID group by prod.Product_ID, prod.Product_Name, inv.Closing_Stock order by Orders desc, Closing_Stock asc limit 10;
-- 7	Which suppliers have the longest lead time and lowest reliability?	Suppliers
select Supplier_ID, Lead_Time_Days, Reliability_Score from suppliers order by Lead_Time_Days desc, Reliability_Score asc limit 10;
-- 8	Which suppliers have the lowest on-time delivery percentage?	Purchases, Suppliers
select sup.Supplier_ID as Supplier_ID, sup.Supplier_Name as Supplier_Name, 
sum(case when pur.delivery_Status = "On Time" or pur.delivery_Status = "Early Delivery" then 1 else 0 end) as On_Time_Delivery,
round(sum(case when pur.delivery_Status = "On Time" or pur.delivery_Status = "Early Delivery" then 1 else 0 end) * 100.0 / count(pur.Purchase_ID), 2) as On_Time_Delivery_Percentage
from suppliers sup left join purchases pur on sup.Supplier_ID = pur.Supplier_ID
group by Supplier_ID order by On_Time_Delivery_Percentage desc;
-- 9	Which suppliers have the highest delivery delays?	Purchases, Suppliers
select sup.Supplier_Id, sup.Supplier_Name, round(avg(pur.delivery_days), 2) as avg_delivery_days from suppliers sup 
left join purchases pur on sup.Supplier_ID = pur.Supplier_ID group by sup.Supplier_ID order by avg_delivery_days desc limit 10;
-- 10	Which products have high sales but low profit margins?	Orders, Products
select prod.Product_ID, prod.Product_Name, prod.Margin_Pct as Margin_Pct, count(ord.Order_ID) as Total_Orders
from products prod left join orders ord on prod.Product_ID = ord.Product_ID group by Product_ID order by Total_Orders desc, Margin_Pct asc;
-- 11	Which customer segments generate the highest revenue?
select cust.Customer_Segment, sum(ord.Revenue) as Revenue, avg(ord.Revenue) as Avg_Revenue from customers cust left join orders ord 
on cust.Customer_ID = ord.Customer_ID group by Customer_Segment order by Revenue desc;
-- 12	Which products have the highest overall supply-chain risk based on demand, inventory, and supplier lead time?	Orders, Inventory, Products, Suppliers
select prod.Product_ID, prod.Product_Name, sup.Supplier_Name, 
ord.Total_Demand, inv.Total_Inventory, sup.Lead_Time_Days,
round((ord.Total_Demand * sup.Lead_Time_Days) / nullif(inv.Total_Inventory, 0), 2) as Supply_Chain_Risk_Score from products prod
join (select Product_ID, sum(Quantity) as Total_Demand from orders group by Product_ID) ord on prod.Product_ID = ord.Product_ID
join(select Product_ID, sum(Closing_Stock) as Total_Inventory
from inventory group by Product_ID) inv on prod.Product_ID = inv.Product_ID
join suppliers sup on prod.Supplier_ID = sup.Supplier_ID
order by Supply_Chain_Risk_Score desc;