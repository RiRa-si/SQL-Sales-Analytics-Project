-- advanced join question 
-- Q66: find customers who have ordered every type of product category available in their orders.
select c.customername ,c.customerid
from customers as c
join orders as o
on o.customerid = c.customerid 
join orderdetails as od
on od.orderid  = o.orderid 
join products as p
on p.productid = od.productid
group BY c.customerid, c.customername
HAVING COUNT(DISTINCT p.category) = (SELECT COUNT(DISTINCT category) FROM products);

-- Q67: find the customer who has purchased the greatest total quantity of products.
select c.customername ,c.customerid , sum(od.quantity) as total
from customers as c
join orders as o
on o.customerid = c.customerid 
join orderdetails as od
on od.orderid  = o.orderid 
group by c.customername , c.customerid
order by total desc
limit 1;

-- Q68: find the customer who has placed the greated number of orders
select c.customername ,c.customerid , count(o.orderid) as ordercount
from customers as c
join orders as o
on o.customerid = c.customerid 
group by c.customername , c.customerid
order by ordercount desc
limit 1;

-- Q69: find the product that has been purchased by the largest number of different customers
select p.productname , count(distinct c.customerid) as customer_count
from customers as c
join orders as o
on o.customerid = c.customerid 
join orderdetails as od
on od.orderid  = o.orderid 
join products as p
on p.productid = od.productid
group by p.productname , p.productid
order by customer_count desc
limit 1;

-- Q70: final customer sales report
select c.customername , count(o.orderid) as ordercount , sum(od.quantity) as totalitems ,
sum(od.quantity * p.price) as totalspending , SUM(od.quantity * p.price) / COUNT(DISTINCT o.orderid) as averageordervalue
from customers as c
left join  orders as o
on o.customerid = c.customerid 
left join  orderdetails as od
on od.orderid  = o.orderid 
left join  products as p
on p.productid = od.productid
group by c.customername , c.customerid 
order by totalspending desc
;


-- better code 
SELECT 
    c.customername,
    COUNT(DISTINCT o.orderid) AS ordercount,
    COALESCE(SUM(od.quantity), 0) AS totalitems,
    COALESCE(SUM(od.quantity * p.price), 0) AS totalspending,
    COALESCE(
        SUM(od.quantity * p.price) / NULLIF(COUNT(DISTINCT o.orderid), 0),
        0
    ) AS averageordervalue
FROM customers AS c
LEFT JOIN orders AS o
    ON o.customerid = c.customerid
LEFT JOIN orderdetails AS od
    ON od.orderid = o.orderid
LEFT JOIN products AS p
    ON p.productid = od.productid
GROUP BY c.customerid, c.customername
ORDER BY totalspending DESC;