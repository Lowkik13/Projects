use project;

-- Project: Banking Management System

--  ● Problem Statement: 
-- "This project develops a database system for the banking sector to manage customer information, account details, transactions, and branch assignments. 
-- This system aims to ensure secure customer login, track account activities like deposits and withdrawals, and maintain transaction history. 
-- It will help improve operational efficiency, reduce manual errors, and provide accurate records for both customers and banking staff."

show tables;

-- I. Database Design & Table Creation (DDL) 
-- 4. Modify a column (e.g., change type). 
ALTER TABLE customers_table
modify phone VARCHAR(20);

-- 5. rename a table.
ALTER TABLE CUSTOMERS_TABLE
RENAME  to Customers;

-- II. Data Insertion & Manipulation (DML) 
-- 7. Update specific rows based on conditions. 
update customers
SET Phone = '9876543210'
WHERE CustomerID = 1;

-- 8. Delete one or more records using conditions. 
DELETE FROM AccountBranch
WHERE YEAR(AssignedDate) = 2022;

select count(*) from AccountBranch;

-- 10. Use LOCK to control concurrent updates (optional for advanced users).
LOCK TABLES Accounts WRITE;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 101;

UNLOCK TABLES;


-- III. SELECT Queries & Filtering 
-- 11. Retrieve all data from a table. 
SELECT * FROM Customers;
select * from accounts;

-- 12. Select specific columns with WHERE conditions. 
select AccountID, Balance from accounts where Balance > 100000;

-- 13. Use BETWEEN, IN, IS NULL, LIKE for filtering. 
-- BETWEEN
SELECT * FROM Customers
WHERE Customerid BETWEEN 1 AND 5;

-- IN
SELECT * FROM Accounts
WHERE ACCOUNTID IN (103, 106);

-- IS NULL
SELECT * FROM Customers
WHERE Phone IS NULL;

-- Like
SELECT * FROM Customers
WHERE FullName LIKE 'S%';

-- 14. Show top 5 records using LIMIT or sorted by a column. 
SELECT * FROM Customers
ORDER BY DOB DESC
LIMIT 5;

-- 15. Combine filters using AND, OR, and NOT.
-- AND
SELECT * FROM Accounts
WHERE Balance > 10000 AND AccountType = 'Savings';

-- OR
SELECT * FROM Branches
WHERE Location = 'Hyderabad' OR Location = 'Mumbai';

-- NOT
SELECT * FROM Accounts
WHERE NOT AccountType = 'Current';


-- IV. Sorting, Distinct, and Pagination 
-- 16. Display unique values from a column using DISTINCT. 
select distinct(AccountType) as uniq_AccountsType from Accounts;

-- 17. Sort records in ascending/descending order using ORDER BY. 
SELECT * FROM Accounts
ORDER BY Balance DESC;

-- 18. Implement pagination using LIMIT and OFFSET. 
SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 5 OFFSET 10;

-- V. Aggregate Functions & Grouping
-- 19. Use COUNT, SUM, AVG, MIN, MAX on relevant numeric columns. 
-- COUNT
select count(*) from accounts where accounttype = 'Savings';

-- SUM 
select sum(Amount) as tot_amount from transactions;

-- AVG
select avg(Amount) as avg_amount from transactions;

-- MIN
select min(Amount) as min_amount from transactions;

-- MAX
select max(Amount) as max_amount from transactions;

-- 20. Group records by a specific column and apply aggregation. 
select TransactionType, sum(amount) as total_amount from transactions group by TransactionType;

-- 21. Filter groups using HAVING (e.g., show groups with more than 3 items).
select TransactionType, count(TransactionType) as count_transactions from transactions group by TransactionType having count_transactions > 3;

-- VI. Joins 
-- 22. Use INNER JOIN to combine data from at least two related tables. 
SELECT c.FullName, a.AccountNumber
FROM Customers c
INNER JOIN Accounts a ON c.CustomerID = a.CustomerID;

SELECT a.accountid, a.accountnumber, t.transactionid, t.transactiontype, t.description
FROM accounts a
INNER JOIN transactions t ON a.accountid = t.accountid;

-- 23. Use LEFT JOIN or RIGHT JOIN to display unmatched data as well. 
-- LEFT JOIN
SELECT b.branchid, b.location, ab.assigneddate
FROM branches b
RIGHT JOIN accountbranch ab ON b.branchid = ab.branchid;

-- RIGHT JOIN
SELECT b.branchid, b.location, ab.assigneddate
FROM branches b
RIGHT JOIN accountbranch ab ON b.branchid = ab.branchid;

-- 24. Join three or more tables to produce a meaningful report. 
SELECT c.FullName, a.AccountNumber, b.Location
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN AccountBranch ab ON a.AccountID = ab.AccountID
JOIN Branches b ON ab.BranchID = b.BranchID;

-- VII. Subqueries 
-- 25. Write a subquery in WHERE to compare against aggregated data. 
SELECT AccountID, AccountNumber, Balance
FROM Accounts
WHERE Balance > (
    SELECT AVG(Balance)
    FROM Accounts
);

-- 26. Use a subquery in FROM as a derived table. 
SELECT c.FullName, t.TotalBalance
FROM Customers c
JOIN (
    SELECT CustomerID, SUM(Balance) AS TotalBalance
    FROM Accounts
    GROUP BY CustomerID
) t ON c.CustomerID = t.CustomerID;


-- 27. Implement a correlated subquery for row-wise comparison. 
SELECT a.AccountID, a.AccountNumber, a.Balance, a.AccountType
FROM Accounts a
WHERE a.Balance > (
    SELECT avg(Balance)
    FROM Accounts
    WHERE AccountType = a.AccountType
);

-- VIII. String Functions 
-- 28. Concatenate two or more columns into one. 
SELECT CONCAT(FullName, ' - ', Phone) AS ContactInfo FROM Customers;

-- 29. Change the case of text using UPPER or LOWER. 
-- UPPER
select upper(fullname) from customers;

-- LOWER
select lower(location) from branches;

-- 30. Use SUBSTRING, REPLACE, or REVERSE on text fields. 
-- SUBSTRING
SELECT SUBSTRING(FullName, 1, 5) AS ShortName
FROM Customers;

-- REPLACE
SELECT REPLACE(Email, '@example.com', '@gmail.com') AS UpdatedEmail FROM Customers;

-- REVERSE
select reverse(location) from branches;

-- 31. Extract left/right parts of a string, Use Other Strings
SELECT 
  Phone,
  LEFT(Phone, 3) AS FirstDigits, 
  RIGHT(Phone, 4) AS LastDigits
FROM Customers;

-- IX. Date & Time Functions 
-- 32. Extract parts of a date (year, month, day) using YEAR(), MONTH(), etc. 
select year(DOB) as year, month(DOB) as month, day(DOB) as day from customers;
 
-- 33. Get current date/time using NOW(), CURDATE(), CURTIME(). 
select now();
select curdate();
select curtime();

-- 34. Find the difference between two dates using DATEDIFF() or TIMESTAMPDIFF(). 
-- DATEDIFF()
select fullname, DOB, datediff(curdate(), DOB) as Days_Survived from customers;
SELECT transactionid, transactiondate, DATEDIFF(CURDATE(), transactiondate) AS days_since_transaction FROM Transactions;
-- TIMESTAMPDIFF()
SELECT DOB, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS days_difference FROM CUSTOMERS;

-- 35. Add or subtract time from a date using DATE_ADD() or DATE_SUB(). 
Select transactionid, transactiondate, date_add(transactiondate, INTERVAL 10 day) as extended_Date from transactions;
Select transactionid, transactiondate, date_sub(transactiondate, INTERVAL 10 day) as before_Date from transactions;

-- X. Conditional Logic & CASE 
-- 36. Use CASE to assign labels (e.g., rating, status, grade) based on column values. 
SELECT 
    customerid,
    accountid,
    balance,
    CASE
        WHEN balance < 50000 THEN 'Low'
        WHEN balance BETWEEN 50000 AND 100000 THEN 'Medium'
        WHEN balance > 100000 THEN 'High'
        ELSE 'Unknown'
    END AS Balance_Status
FROM
    accounts; 

-- 37. Use CASE in ORDER BY or UPDATE to apply dynamic logic.
-- CASE, ORDER BY 
SELECT 
    accountid, 
    balance,
    CASE 
        WHEN balance > 100000 THEN 1
        WHEN balance BETWEEN 50000 AND 100000 THEN 2
        ELSE 3
    END AS balance_category
FROM Accounts
ORDER BY balance_category;

-- CASE, UPDATE()
UPDATE Accounts
SET balance = balance + 
    CASE
        WHEN balance < 50000 THEN 100
        WHEN balance BETWEEN 50000 AND 100000 THEN 50
        ELSE 0
    END;

-- XI. Views 
-- 38. Create a view that summarizes key data (e.g., top customers, popular products). 
create view customer_summary as 
select c.customerid, a.accountid, a.accounttype, a.balance from customers c join accounts a on c.customerid = a.customerid;

select * from customer_summary order by balance desc;

-- 39. Create a view for public reporting (e.g., showing only non-sensitive data). 
CREATE VIEW public_customer_report AS
SELECT c.customerid, c.fullname, a.accountid, a.accounttype 
FROM customers c
JOIN accounts a ON c.customerid = a.customerid;

select * from public_customer_report;

-- 40. Query the view using filters and joins. 
-- filter 
SELECT * FROM public_customer_report WHERE accounttype = 'Savings';

-- join
SELECT p.customerid, p.fullname, p.accountid, p.accounttype, t.transactionid, t.transactiondate, t.amount
FROM public_customer_report p JOIN transactions t ON p.accountid = t.accountid
WHERE t.transactiondate > '2023-05-01' 
ORDER BY t.transactiondate DESC;
