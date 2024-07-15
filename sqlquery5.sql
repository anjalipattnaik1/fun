
--question 01
CREATE TABLE Orders(
order_id int IDENTITY(1,1) PRIMARY KEY,
customer_id int, 
order_date date, 
total_amount numeric(20)
 
);
 
insert into Orders(customer_id, order_date, total_amount) values(100, '2024-08-17', 5752.65), (101, '2024-08-18', 55500.72), (103, '2024-08-15', 5700.05), (104, '2024-08-17', 5752.65);
select * from Orders;
 
CREATE TABLE OrderItems(
order_id int,
FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
product_id int, 
quantity int,
price numeric(20)
 
);
 
 
insert into OrderItems values(1, 1001, 567, 8965.75), (2, 1056, 277, 5200.00), (3, 1043, 700, 10000.35), (4, 1078, 120, 3365.72);
 
select * from OrderItems;
 
SELECT top 3 customer_id, SUM(total_amount) AS total_spent 
FROM Orders 
WHERE order_date >= DATEADD(month, -1, GETDATE()) 
GROUP BY customer_id 
ORDER BY total_spent DESC ;



--question 2
  create table Employees(
  employee_id int,
  name varchar(20),
  department varchar(100)
  );
  insert into Employees (employee_id,name,department) values (001, 'kukura', 'IT'), (002, 'mankada', 'HR'), (003, 'bilei' , 'BM');
  select* from Employees;

  create table Attendance(
  employee_id int,
  joining_date DATE, 
  status varchar(100)
  );
  insert into Attendance (employee_id,joining_date,status) values (001, '2023-10-01', 'present'), (002, '2023-11-01', 'absent'), (003, '2023-11-01' , 'present');
  select * from Attendance;
 SELECT e.name, COUNT(a.status) AS present_days  
 FROM Employees e    
 JOIN Attendance a ON e.employee_id = a.employee_id    
 WHERE a.status = 'Present' AND a.joining_date >= DATEADD(month, -3, GETDATE())  
 GROUP BY e.name; 


--question 3
 CREATE TABLE Customers (
customer_id INT,
name VARCHAR(50),
region VARCHAR(50)
);
INSERT INTO Customers (customer_id, name, region) VALUES  (1, 'Sunil', 'America'), (2, 'Susil', 'Austrelia'), (3, 'Titi', 'India'), (4, 'Google', 'Europe');
select * from Customers;

 CREATE TABLE Purchases (
purchase_id INT,
customer_id INT, 
purchase_date DATE,
amount DECIMAL(10,2)
);

 
INSERT INTO Purchases (purchase_id, customer_id, purchase_date, amount) VALUES (1, 1, '2023-01-10', 100.00), (2, 2, '2023-02-15', 75.20), (3, 3, '2023-03-20', 200.00), (4, 4, '2023-04-25', 150.75); 
select * from Purchases;
 
SELECT region, AVG(total_amount) AS avg_purchase FROM (SELECT c.region, p.customer_id, SUM(p.amount) AS total_amount FROM Customers c JOIN Purchases p ON c.customer_id = p.customer_id GROUP BY c.region, p.customer_id) AS regional_purchases GROUP BY region ORDER BY avg_purchase DESC; 


--question 4
CREATE TABLE Sales(
sale_id INT,
product_id INT,
sale_date DATE,
amount DECIMAL(10,2)
); 
INSERT INTO Sales (sale_id, product_id, sale_date, amount) VALUES (1, 1, '2024-01-10', 200.00), (2, 2, '2024-02-15', 250.00), (3, 3, '2024-03-20', 150.00), (4, 4, '2024-04-25', 300.00);
SELECT * FROM Sales;

 
 
CREATE TABLE Products(
product_id INT,
category VARCHAR(50)
); 
INSERT INTO Products (product_id, category) VALUES (1, 'Books'), (2, 'Clothing'), (3, 'Home'), (4, 'Toys');
select * from Products;

 
SELECT p.category, MONTH(s.sale_date) AS sale_month, SUM(s.amount) AS total_sales 
FROM Sales s         
JOIN Products p ON s.product_id = p.product_id        
WHERE YEAR(s.sale_date) = YEAR(GETDATE())        
GROUP BY p.category, MONTH(s.sale_date)        
ORDER BY p.category, sale_month; 



--question 05
create table Patients(
patient_id int PRIMARY KEY,
name varchar(20),
age int
);

insert into Patients (patient_id,name,age) values (001, 'Anjali', 24), (002, 'Rojaline', 23), (003, 'Anshuman' , 45);
select * from Patients;

create table Visits(
visit_id int PRIMARY KEY,
patient_id int, 
visit_date DATE, 
diagnosis VARCHAR(20)
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

insert into Visits (visit_id,patient_id,visit_date,diagnosis) values (1, 001, '2025-01-10' , 'covid'), (2, 002, '2025-01-11' , 'dengue'), (3, 003, '2025-01-12', 'flu');
select* from Visits;


  SELECT p.name, COUNT(v.visit_id) AS visit_count  
  FROM Patients p 
  JOIN Visits v ON p.patient_id = v.patient_id   
  WHERE v.visit_date >= DATEADD(year, -1, GETDATE())    
  GROUP BY p.name
  HAVING COUNT(v.visit_id) > 3; 

 
 --question 6
CREATE TABLE Accounts (
account_id INT,
customer_id INT, 
balance Decimal(10,2)
);
INSERT INTO Accounts (account_id, customer_id, balance) VALUES (1, 101, 1200.00), (2,102, 1000.00), (3, 103, 200.00);
SELECT * FROM Accounts;

 
CREATE TABLE Transactions (
transaction_id INT,
account_id INT,
transaction_date DATE,
amount DECIMAL(10,2),
type VARCHAR(50) 
);

INSERT INTO Transactions (transaction_id, account_id, transaction_date, amount, type) VALUES (1, 1, '2024-07-15', 200.00, 'Deposit'), (2, 2, '2024-07-12', 100.00, 'Withdrawal'), (3, 3, '2024-07-10', 300.00, 'Deposit');
SELECT * FROM Transactions;

SELECT account_id,  
SUM(CASE WHEN type = 'Deposit' THEN amount ELSE 0 END) AS total_deposits,     
SUM(CASE WHEN type = 'Withdrawal' THEN amount ELSE 0 END) AS total_withdrawals   
FROM Transactions  
WHERE transaction_date >= DATEADD(month, -6, GETDATE())    
GROUP BY account_id;


--question 07

create table Students(
student_id int,
name varchar(20),
major varchar(20)
);
insert into Students(student_id,name,major) values (01, 'abc', 'physics'), (02, 'def', 'math'), (03, 'ghi', 'biology');
select * from Students;

create table Courses(
course_id int,
course_name varchar(20)
); 
insert into Courses(course_id,course_name) values (001, 'mca'), (002, 'mba'), (003, 'bba');
select * from Courses;

create table Enrollments(
enrollment_id int,
student_id int, 
course_id int,
enrollment_date DATE
); 
 insert into Enrollments(enrollment_id,student_id,course_id,enrollment_date) values (1001, 01, 001, '2024-10-10'), (1002, 02, 002, '2024-10-08'), (1003, 003, 10, '2024-10-07');
 select * from Enrollments;
  SELECT c.course_name, COUNT(e.student_id) AS student_count     
  FROM Courses c    
  JOIN Enrollments e ON c.course_id = e.course_id       
  GROUP BY c.course_name    
  ORDER BY student_count DESC; 


--question 8
create table Inventory(
item_id int primary key,
product_name varchar(20),
stock_level int
); 
insert into Inventory(item_id,product_name,stock_level) values (01, 'laptop', 10), (02, 'tv', 15),(03, 'mobile', 15);
select * from Inventory;

create table Sales(
sale_id int primary key,
item_id int,
sale_date date,
quantity_sold int
foreign key (item_id) REFERENCES Inventory(item_id)
);

insert into Sales(sale_id,item_id,sale_date,quantity_sold) values (1, 01, '2023-10-11', 9), (2, 02, '2023-10-10', 1), (3, 03, '2023-10-12', 5);
select * from Sales;

 SELECT i.product_name, i.stock_level - COALESCE(SUM(s.quantity_sold), 0) AS remaining_stock   
 FROM Inventory i     
 LEFT JOIN Sales s ON i.item_id = s.item_id       
 GROUP BY i.product_name, i.stock_level       
 HAVING remaining_stock < 10; 
