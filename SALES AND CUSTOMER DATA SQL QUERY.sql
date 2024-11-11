create database lita_project_DB
select*from[dbo].[SALES DATA LITA PROJECT]

-------retrieve total sales from each category-------------
SELECT PRODUCT,SUM(revenue) as 'Total sales'
FROM[dbo].[SALES DATA LITA PROJECT]
group by Product


---------Number of Sales Transaction per Region----------
select region, count(*)as 'transaction sales'
from[dbo].[SALES DATA LITA PROJECT]
group by region

                                      
--------Highest Selling Product by Total Sales Value------------
select top 1 product,sum(Quantity*unitprice)
from[dbo].[SALES DATA LITA PROJECT] 
group by Product

alter table [dbo].[SALES DATA LITA PROJECT]
alter column unitprice tinyint;


-------------Total Revenue by Product------------------
select product,sum(revenue) as 'Total Revenue'
from[dbo].[SALES DATA LITA PROJECT]
group by PRODUCT


---------CALCULATE MONTHLY SALES TOTAL FOR THE CURRENT YEAR-------
SELECT DATENAME(MONTH,ORDERDATE) AS 'SALESMONTH',
SUM(Revenue) AS 'TOTAL SALES'
FROM[dbo].[SALES DATA LITA PROJECT]
WHERE YEAR(ORDERDATE)=YEAR(GETDATE())
GROUP BY DATENAME(MONTH,OrderDate)
ORDER BY [Total Sales] desc;


-------------Top 5 Customers by Total Purchase Amount------------
select top 5 customer_id, sum(Revenue) as 'total purchase amount'
from[dbo].[SALES DATA LITA PROJECT]
group by [Customer_ID]


-----------Calculate the Percentage of Total Sales Contibuted by Each Region---------
select region,
cast((SUM(Revenue)*100/(select sum(Revenue) from [dbo].[SALES DATA LITA PROJECT])) as VARCHAR(10))+'%' 
as 'Sales Percentage'
from[dbo].[SALES DATA LITA PROJECT]
group by Region 
order by [Sales Percentage] desc;


------------Identify Products with no Sales in the last Quarter--------------
select distinct product 
from[dbo].[SALES DATA LITA PROJECT]
where product not in(
select product
from[dbo].[SALES DATA LITA PROJECT]
where OrderDate>=dateadd(quarter, -1,getdate())
);