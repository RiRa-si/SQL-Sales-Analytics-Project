# SQL-Sales-Analytics-Project
A SQL-based Sales Analytics project covering 70 progressively challenging queries using joins, aggregations, subqueries, window functions, self joins, and customer analysis.
# SQL Sales Analytics Project

## 📌 Project Overview

This project is a comprehensive **SQL Sales Analytics and Customer Analysis project** designed to practice and demonstrate SQL skills using a relational sales database.

The project contains **70 SQL problems**, progressing from basic joins and aggregations to more advanced concepts such as subqueries, window functions, self joins, and customer sales analysis.

The database represents a simple business environment containing customers, orders, products, employees, departments, and order details.

---

## 🎯 Project Objectives

The main objectives of this project are to:

* Practice SQL from basic to advanced levels
* Analyze customer purchasing behavior
* Calculate sales and revenue metrics
* Analyze product and category performance
* Analyze employee sales performance
* Practice relational database joins
* Work with aggregation and grouping
* Solve real-world style SQL problems
* Build confidence with complex SQL queries

---

## 🗄️ Database Structure

The project uses multiple related tables.

### Main Tables

#### Customers

Stores customer information.

```text
customerid
customername
...
```

#### Orders

Stores information about customer orders.

```text
orderid
customerid
employeeid
...
```

#### OrderDetails

Stores individual products and quantities within each order.

```text
orderid
productid
quantity
...
```

#### Products

Stores product information.

```text
productid
productname
category
price
...
```

#### Employees

Stores employee information.

```text
employeeid
employeename
...
```

---

## 🔗 Table Relationships

```text
Customers
    │
    │ customerid
    ▼
 Orders
    │
    │ orderid
    ▼
OrderDetails
    │
    │ productid
    ▼
Products
```

Employees are connected to Orders through:

```text
Employees.employeeid
        │
        ▼
Orders.employeeid
```

---

## 🧠 SQL Concepts Covered

Throughout the 70 questions, the project covers:

### Basic SQL

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* Column aliases

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* Multiple-table joins
* Self joins

### Aggregation

* `SUM()`
* `AVG()`
* `COUNT()`
* `COUNT(DISTINCT)`
* `MAX()`
* `MIN()`

### Grouping

* `GROUP BY`
* `HAVING`

### Advanced SQL

* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `LAG()`
* `LEAD()`

### Data Analysis Techniques

* Customer spending analysis
* Product sales analysis
* Category sales analysis
* Employee performance analysis
* Customer order analysis
* Distinct category analysis
* Top-performing entities
* Customer sales reports

---

## 📊 Example Business Questions

Some of the questions answered in this project include:

* Which customer has spent the most money?
* Which product generated the highest total sales?
* Which category generated the highest sales?
* Which employee handled the highest total sales?
* Which customers purchased products from multiple categories?
* Which product was purchased by the largest number of different customers?
* Which customer purchased the greatest total quantity?
* Which customer placed the greatest number of orders?
* Which employees earn more than their managers?
* How many employees work under each manager?
* Which managers have the highest average subordinate salary?

---

## 🏆 Final Customer Sales Report

The final question combines several SQL concepts to create a complete customer sales report containing:

```text
CustomerName
OrderCount
TotalItems
TotalSpending
AverageOrderValue
```

The report also includes customers who have never placed an order by using `LEFT JOIN`.

Example calculation:

```text
TotalItems
= SUM(OrderDetails.Quantity)

TotalSpending
= SUM(OrderDetails.Quantity × Products.Price)

AverageOrderValue
= TotalSpending ÷ Number of Orders
```

---

## 🛠️ Tools Used

* **MySQL**
* **MySQL Workbench**
* SQL


## 📈 Learning Progression

The project was developed progressively:

```text
Basic Queries
      ↓
Joins
      ↓
GROUP BY & Aggregation
      ↓
HAVING
      ↓
Subqueries
      ↓
Window Functions
      ↓
Self Joins
      ↓
Advanced Sales Analysis
      ↓
Final Customer Sales Report
```

---

## 💡 Key Learning Outcomes

Through this project, I practiced how to:

* Combine data from multiple relational tables
* Choose the appropriate type of SQL join
* Aggregate data at different levels
* Filter grouped results using `HAVING`
* Find maximum and minimum values using aggregation
* Solve "top per group" problems using window functions
* Compare employees with their managers using self joins
* Count unique customers using `COUNT(DISTINCT)`
* Handle customers with no orders using `LEFT JOIN`
* Handle missing aggregate results using `COALESCE()`
* Build multi-step analytical SQL queries

---

## 🚀 Future Improvements

Possible future improvements include:

* Adding more realistic sales data
* Creating SQL views for frequently used reports
* Connecting the database to Power BI
* Creating interactive sales dashboards
* Adding more advanced CTE and window-function analysis
* Performing customer segmentation
* Analyzing monthly and yearly sales trends

---

## 👨‍💻 Author

**Ritesh Raj**

This project was created as part of my journey to improve my **SQL and Data Analytics skills**.

---

## ⭐ Conclusion

This project demonstrates my practical understanding of SQL and my ability to solve business-oriented data analysis problems using relational databases.

The questions progress from fundamental SQL concepts to complex analytical queries, providing hands-on practice with real-world style data analysis scenarios.
