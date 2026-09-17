-- level 1 : basic inner join 
-- display customer names and their order ids
select c.customername , o.orderid
from customers as c
join orders as o
on c.customerid = o.customerid;

-- 2:
select c.customername , o.orderdate
from customers as c
join orders as o
on c.customerid = o.customerid;

-- 3:
select c.customername , o.orderid , o.orderdate
from customers as c
join orders as o
on c.customerid = o.customerid;

-- 4
select productname , price
from products 
order by price desc;

select * from orderdetails;
select * from products;
select * from customers;

-- 5 : display order id , productname , quantity
select o.orderid , p.productname , o.quantity
from orderdetails as o
join products as p
on o.productid  = p.productid;

-- 6 : display customer name , product name and quantity
SELECT c.CustomerName, p.ProductName, od.Quantity
FROM Customers AS c
JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od
    ON o.OrderID = od.OrderID
JOIN Products AS p
    ON od.ProductID = p.ProductID;
    
-- 7: fund all customers who have placed an order
select * from orders;
select c.customername 
from customers as c
join orders as o
on o.customerid = c.customerid;

-- 8: find all products that have been ordered
select p.productname 
from products as p
join orderdetails as o
on o.productid = p.productid;


select * from employees;
-- 9: display employees and the orders handled by them.
select e.employeename , p.productname 
from employees as e
join orders as o
on o.employeeid = e.employeeid
join orderdetails as od
on od.orderid = o.orderid
join products as p
on p.productid = od.productid; 

-- 10: display customername , productname , quantity ,price
select c.customername , p.productname , od.quantity,p.price
from customers as c
join orders as o
on o.customerid = c.customerid
join orderdetails as od
on od.orderid = o.orderid
join products as p
on p.productid = od.productid;

-- level 2 - left join
-- Q11: Display all customers, including customers who haven't placed an order.

select c.customername 
from customers as c
left join orders as o
on c.customerid = o.customerid;

-- Q12: Find customers who have never placed an order.

select c.customername 
from customers as c
left join orders as o
on c.customerid = o.customerid
where o.customerid is null;

-- Q13: Display every product, including products that have never been ordered.
select p.productname 
from products as p
left join orderdetails as od
on p.productid = od.productid
left join orders as o
on od.orderid = o.orderid;

-- Q14: Find products that have never been ordered.
select p.productname 
from products as p
left join orderdetails as od
on p.productid = od.productid
left join orders as o
on od.orderid = o.orderid
where o.customerid is null;


-- Q15: display every employee, including employees who haven;t handled an order
select e.employeename 
from employees as e
left join orders as o
on e.employeeid = o.employeeid;

-- Q16: find employees who haven't handled any orders.
select e.employeename 
from employees as e
left join orders as o
on e.employeeid = o.employeeid
where o.employeeid is null;

-- Q17: Display every customer and their order count.
select c.customername , count(o.orderid) as order_count
from customers as c
left join orders as o
on c.customerid = o.customerid
group by c.customername;


-- Q18: Display every product and the total quantity sold.
select p.productname , coalesce(sum(od.quantity),0) as totalsold 
from products as p
left join orderdetails as od
on od.productid = p.productid 
group by p.productname ;

-- level 3: join + where 
-- Q21: Find customers who placed orders after:2026-02-01
select c.customername , o.orderdate
from customers as c
left join orders as o
on c.customerid = o.customerid 
where o.orderdate > "2026-02-01";

-- Q22: find products with a price greater than 10000 that have been ordered 
select p.productname , p.price
from products as p
join orderdetails as od
on p.productid = od.productid
where p.price > 10000;

-- Q23: Find customers from Delhi who have placed an order.
select distinct c.customername 
from customers as c
join orders as o
on o.customerid = c.customerid
where c.city = "Delhi";

-- Q24: Find orders handled by employees from the Sales department.

select * 
from employees as e
join orders as o
on o.employeeid = e.employeeid
where e.department = "sales";

-- Q25: Find products in the Electronics category that were ordered.

SELECT p.ProductName, p.Category
FROM Products AS p
JOIN OrderDetails AS od
    ON p.ProductID = od.ProductID
WHERE p.Category = 'Electronics';

-- Q30: find all orders containing products from the furniture category
select o.orderid , p.productname , p.category
from products as p
join orderdetails as od
on p.productid = od.productid
join orders as o
on od.orderid = o.orderid
where p.category   = "furniture";

-- Q29: find customers who ordered a laptop.
select c.customername , p.productname 
from customers as c
join orders as o 
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid
join products as p
on p.productid = od.productid
where p.productname = "laptop";

-- level 4 - join + group by 
-- Q31: Count the number of orders for each customer.Expected:CustomerName | OrderCount
select c.customername , count(o.orderid) as ordercount
from customers as c
join orders as o 
on c.customerid = o.customerid
group by c.customername ;

-- Q32: find the total quantity of products ordered by each customer
select c.customername , sum(od.quantity)
from customers as c
join orders as o 
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid
group by c.customername;

-- Q33: find the number of times each product was ordered.

select p.productname  , count(o.orderid) as ordercount
from products as p
join orderdetails as od
on p.productid = od.productid
join orders as o
on o.orderid = od.orderid
group by p.productname ;

-- Q34: find the total quantity sold for each product
select p.productname , sum(od.quantity) as totalcounts
from products as p
join orderdetails as od
on p.productid = od.productid 
join orders as o 
on o.orderid = od.orderid
group by p.productname ;

-- Q35: find the number of orders handled by each employee
select e.employeename , count(o.orderid ) as countoforders 
from employees as e
join orders as o 
on e.employeeid = o.employeeid 
group by e.employeename ;


-- Q36: find the total sales amount for each product.sales = price  * qantity
select p.productname  , sum(p.price * od.quantity ) as totalsale
from products as p
join orderdetails as od
on od.productid = p.productid
group by p.productname ;

-- Q37: find the total spending of each customer
select c.customername   , sum(p.price*od.quantity) as totalspending 
from customers as c
join orders as o
on o.customerid = c.customerid
join orderdetails as od
on o.orderid = od.orderid
join products as p
on p.productid = od.productid
group by c.customername ;

-- Q38: find the average product price in each category.
select p.category , avg(
p.price) as avproduct
from products as p
group by p.category;

-- Q39: find the highest-priced product ineach category.
SELECT p.Category,
       p.ProductName,
       p.Price
FROM Products AS p
JOIN (
    SELECT Category, MAX(Price) AS highest_price
    FROM Products
    GROUP BY Category
) AS x
ON p.Category = x.Category
AND p.Price = x.highest_price;

SELECT p.Category, p.ProductName, p.Price
FROM Products AS p
WHERE p.Price = (
    SELECT MAX(p2.Price)
    FROM Products AS p2
    WHERE p2.Category = p.Category
);

-- Q40: find the number of diffferent products orderred by each customer
select c.customername , count(distinct od.productid) as countoforder
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid
group by c.customername ;

-- level 5 - having
-- Q41: find customers who placed more than 1 order.
select c.customername , count(o.orderid) as countoforder
from customers as c
join orders as o
on o.customerid = c.customerid 
group by c.customername
having countoforder >1;

-- Q42: Find products whose total quantity sold is greater than 2.
select p.productname , sum(od.quantity) as totalquantity
from products as p
join orderdetails as od
on p.productid = od.productid
group by p.productname
having totalquantity > 2;

-- Q43: find employees who handled more than 1 order.
select e.employeename , count(o.orderid) as totalcount
from employees as e
join orders as o
on o.employeeid = e.employeeid
group by e.employeename 
having totalcount > 1;

-- Q44: find customers whose total spending is greater than 30000;
select c.customername , sum(p.price*od.quantity) as totalspending
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid
join products as p
on p.productid = od.productid
group by c.customername 
having totalspending > 30000;

-- Q45: Find categories whose average product price is greater than 5000.
select p.category , avg(p.price) as avgproduct
from products as p
group by p.category
having avgproduct > 5000;

-- Q46: Find customers who ordered more than 3 total items.
select c.customername , sum(od.quantity) as "totalitems"
from customers as c
join orders as o
on o.customerid = c.customerid
join orderdetails as od
on od.orderid = o.orderid
group by c.customername 
having totalitems > 3;

-- Q47: Find products whose total sales amount is greater than 10000.
select p.productname , sum( p.price*od.quantity) as totalsales
from products as p
join orderdetails as od
on od.productid = p.productid
group by p.productname 
having totalsales > 10000;

-- Q48: Find employees whose average handled-order customer spending is greater than 20000.
with namee as 
(select e.employeename ,o.orderid, sum(p.price* od.quantity) as avehan
from employees as e
join orders as o
on o.employeeid = e.employeeid
join orderdetails as od
on od.orderid = o.orderid
join products as p
on p.productid = od.productid
group by e.employeename , o.orderid
)
select employeename , avg(avehan) as avg_spending
from namee
group by employeename 
having avg_spending > 20000;


-- level 6-- multiple joins
-- Q49: display: customername , orderid , productname , quantity
select c.customername , o.orderid , p.productname , od.quantity
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid 
join products as p
on p.productid = od.productid;

-- Q50: Display:
-- CustomerName | ProductName | Quantity | Price | TotalPrice
select c.customername , p.productname , od.quantity, p.price, od.quantity*p.price as total_price
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid 
join products as p
on p.productid = od.productid;

-- Q51: find the total amount spent by every customer.

select c.customername ,  sum(od.quantity*p.price) as total_price
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid 
join products as p
on p.productid = od.productid
group by c.customername ;

-- Q52: find the most expensive product ordered by each customer

select customername , productname , price
from (
      select c.customername , p.productname , p.price,
      row_number() over(partition by c.customername order by p.price desc) as rn
      from customers as c
      join orders as o
         on c.customerid = o.customerid
	  join orderdetails as od
         on o.orderid = od.orderid
	  join products as p
         on p.productid = od.productid
	) as x
where rn = 1;

-- Q53: Find customers who have ordered products from more than one category.
select c.customername , count(distinct p.category) as total_count
from customers as c
join orders as o
on c.customerid = o.customerid
join orderdetails as od
on od.orderid = o.orderid 
join products as p
on p.productid = od.productid
group by c.customername 
having total_count > 1;

-- Q54:find the customer who has spent the most money
SELECT customername, total_price
FROM (
    SELECT 
        c.customername,
        SUM(od.quantity * p.price) AS total_price
    FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN orderdetails AS od
        ON od.orderid = o.orderid
    JOIN products AS p
        ON p.productid = od.productid
    GROUP BY c.customername
) AS x
ORDER BY total_price DESC
LIMIT 1;

-- Q55: find the product that generated the highest total sales
select productname , total_price
from (select
      p.productname , sum(od.quantity*p.price) as total_price
      FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN orderdetails AS od
        ON od.orderid = o.orderid
    JOIN products AS p
        ON p.productid = od.productid
	group by p.productname ) as x
order by total_price desc
limit 1;

-- Q56: find the category that generated the highest total sales
select category , total_sale
from ( 
      select p.category , sum(od.quantity*p.price) as total_sale
         FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN orderdetails AS od
        ON od.orderid = o.orderid
    JOIN products AS p
        ON p.productid = od.productid
	group by p.category) as x
order by total_sale desc
limit 1;

-- Q57: find the employee who handled orders worth the highest total amount
select employeename , highest_total
from (
     select e.employeename , sum(od.quantity*p.price) as highest_total
	FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN orderdetails AS od
        ON od.orderid = o.orderid
    JOIN products AS p
        ON p.productid = od.productid
	join employees as e
       on e.employeeid = o.employeeid
	group by e.employeename 
    ) as x
order by highest_total desc
limit 1;

-- Q58: display each employee and the total sales amount of the orders they handled
select employeename , highest_total
from (
     select e.employeename , sum(od.quantity*p.price) as highest_total
	FROM customers AS c
    JOIN orders AS o
        ON c.customerid = o.customerid
    JOIN orderdetails AS od
        ON od.orderid = o.orderid
    JOIN products AS p
        ON p.productid = od.productid
	join employees as e
       on e.employeeid = o.employeeid
	group by e.employeename 
    ) as x
order by highest_total 
;


-- level 7 -- self join 
-- Q59:
select e.employeename as employee , m.employeename as manager
from employees as e
join employees as m
on m.employeeid = e.managerid ;


-- Q60 
select e.employeename as employee , e.salary as employeesalary , m.employeename  as manager , m.salary as managersalary 
from employees as e
join employees  as m
on m.employeeid = e.managerid;


-- Q61: 
select e.employeename  as employee , e.salary as empsal , m.employeename  as manager , m.salary as mansal
from employees as e
join employees as m
on m.employeeid = e.managerid 
where e.salary > m.salary;

-- Q62: find emplyees who don't have a manager
select e.employeename as employee 
from employees as e
where e.managerid is null;

-- Q63: find managers who have at least one emplyee reporting to them 
select m.employeename as manager ,count( e.employeename ) as count_emp
from employees as e
join employees as m
on e.managerid = m.employeeid 
group by m.employeename 
having count_emp >=1;

-- Q64:
select m.employeename as manager ,count( e.employeename ) as count_emp
from employees as e
join employees as m
on e.managerid = m.employeeid 
group by m.employeename ;

-- Q65: 
select m.employeename as manager ,avg( e.salary ) as ave_sub_sal
from employees as e
join employees as m
on e.managerid = m.employeeid 
group by m.employeename
having ave_sub_sal > 50000;