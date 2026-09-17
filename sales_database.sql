CREATE DATABASE StorePractice;
USE StorePractice;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    EmployeeID INT
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    ManagerID INT,
    Salary DECIMAL(10,2)
);



INSERT INTO Customers VALUES
(1, 'Amit', 'Patna', 'India'),
(2, 'Priya', 'Delhi', 'India'),
(3, 'Rahul', 'Mumbai', 'India'),
(4, 'Sneha', 'Bangalore', 'India'),
(5, 'Rohan', 'Kolkata', 'India'),
(6, 'Anjali', 'Pune', 'India'),
(7, 'Vikas', 'Jaipur', 'India'),
(8, 'Neha', 'Chennai', 'India'),
(9, 'Karan', 'Hyderabad', 'India'),
(10, 'Pooja', 'Lucknow', 'India'),
(11, 'Arjun', 'Patna', 'India'),
(12, 'Meera', 'Delhi', 'India');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mouse', 'Electronics', 1000),
(103, 'Keyboard', 'Electronics', 2000),
(104, 'Monitor', 'Electronics', 15000),
(105, 'Headphones', 'Electronics', 3000),
(106, 'Chair', 'Furniture', 8000),
(107, 'Desk', 'Furniture', 12000),
(108, 'Notebook', 'Stationery', 100),
(109, 'Pen', 'Stationery', 50),
(110, 'Bag', 'Accessories', 1500),
(111, 'Webcam', 'Electronics', 4000),
(112, 'Tablet', 'Electronics', 25000);

INSERT INTO Employees VALUES
(201, 'Raj', 'Sales', NULL, 90000),
(202, 'Simran', 'Sales', 201, 60000),
(203, 'Vivek', 'Sales', 201, 55000),
(204, 'Nisha', 'Support', NULL, 85000),
(205, 'Ravi', 'Support', 204, 50000),
(206, 'Kavya', 'Support', 204, 48000),
(207, 'Manish', 'IT', NULL, 100000),
(208, 'Deepak', 'IT', 207, 70000),
(209, 'Isha', 'IT', 207, 65000),
(210, 'Sonal', 'HR', NULL, 80000);


INSERT INTO Orders VALUES
(301, 1, '2026-01-05', 202),
(302, 2, '2026-01-07', 203),
(303, 3, '2026-01-10', 202),
(304, 1, '2026-01-15', 203),
(305, 4, '2026-01-20', 202),
(306, 5, '2026-02-01', 205),
(307, 6, '2026-02-05', 206),
(308, 7, '2026-02-10', 205),
(309, 2, '2026-02-15', 202),
(310, 8, '2026-02-20', 206);

INSERT INTO OrderDetails VALUES
(401, 301, 101, 1),
(402, 301, 102, 2),
(403, 302, 103, 1),
(404, 302, 105, 2),
(405, 303, 104, 1),
(406, 303, 106, 1),
(407, 304, 107, 1),
(408, 304, 108, 5),
(409, 305, 109, 10),
(410, 305, 110, 2),
(411, 306, 101, 1),
(412, 306, 111, 2),
(413, 307, 112, 1),
(414, 307, 105, 1),
(415, 308, 106, 2),
(416, 308, 107, 1),
(417, 309, 101, 1),
(418, 309, 104, 2),
(419, 310, 110, 3),
(420, 310, 102, 2);