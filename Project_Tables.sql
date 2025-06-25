create database project;
use project;

-- Project: Banking Management System

--  ● Problem Statement: 
-- "This project develop a database system for the banking sector to manage customer information, account details, transactions, and branch assignments. 
-- This system aims to ensure secure customer login, track account activities like deposits and withdrawals, and maintain transaction history. 
-- It will help improve operational efficiency, reduce manual errors, and provide accurate records for both customers and banking staff."

-- I. Database Design & Table Creation (DDL) 
-- 1. Create all necessary tables using appropriate data types and constraints. 
-- 2. Define primary and foreign keys to establish relationships. 
-- 3. Add constraints like NOT NULL, UNIQUE, DEFAULT, CHECK. 
-- 6. Insert at least 10-20 rows of sample data into each table. 
-- 9. Insert multiple rows using a single statement. 

CREATE TABLE Customers_Table (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(150),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT,
    DOB DATE
);

INSERT INTO Customers_Table (CustomerID, FullName, Email, Phone, Address, DOB) VALUES
(1, 'Aarav Mehta', 'aarav.mehta@example.com', '9876543210', '123 MG Road, Mumbai', '2001-03-22'),
(2, 'Sneha Reddy', 'sneha.reddy@example.com', '9988776655', '45 Jubilee Hills, Hyderabad', '2002-07-19'),
(3, 'Rohit Sharma', 'rohit.sharma@example.com', '9876123456', '78 Connaught Place, Delhi', '1989-10-05'),
(4, 'Priya Verma', 'priya.verma@example.com', '9090909090', '12 Lakeview St, Bangalore', '2000-01-30'),
(5, 'Karan Singh', 'karan.singh@example.com', '9845123456', '67 Sector 21, Chandigarh', '1990-06-18'),
(6, 'Divya Nair', 'divya.nair@example.com', '9898989898', '90 Panampilly Nagar, Kochi', '1996-09-09'),
(7, 'Aditya Das', 'aditya.das@example.com', '9776655443', '21 Bistupur, Jamshedpur', '2000-11-25'),
(8, 'Neha Kulkarni', 'neha.kulkarni@example.com', '9765432100', '32 Koregaon Park, Pune', '1997-08-15'),
(9, 'Vikram Jain', 'vikram.jain@example.com', '9654321098', '55 Hazratganj, Lucknow', '1988-04-10'),
(10, 'Meena Iyer', 'meena.iyer@example.com', '9543210987', '102 R.S. Puram, Coimbatore', '2003-12-01'),
(11, 'Rajeev Bansal', 'rajeev.bansal@example.com', '9123456780', '5 Aundh Road, Pune', '1987-05-14'),
(12, 'Aishwarya Rao', 'aishwarya.rao@example.com', '9812345678', '4 Indiranagar, Bangalore', '1993-07-23'),
(13, 'Sameer Khan', 'sameer.khan@example.com', '9991234567', '88 Malad East, Mumbai', '1986-02-17'),
(14, 'Tanvi Kapoor', 'tanvi.kapoor@example.com', '9834567890', '33 Civil Lines, Nagpur', '2002-10-03'),
(15, 'Ramesh Patel', 'ramesh.patel@example.com', '9823123456', '10 Ashram Road, Ahmedabad', '1985-03-11'),
(16, 'Shruti Agarwal', 'shruti.agarwal@example.com', '9911223344', '77 GT Road, Kanpur', '2004-01-26'),
(17, 'Harsha Shetty', 'harsha.shetty@example.com', '9933445566', '63 MG Road, Mangalore', '1990-09-14'),
(18, 'Nikhil Yadav', 'nikhil.yadav@example.com', '9877098765', '23 Station Road, Bhopal', '1994-06-21'),
(19, 'Pooja Bhatt', 'pooja.bhatt@example.com', '9765098743', '9 Gandhi Nagar, Jaipur', '2005-11-11'),
(20, 'Deepak Chawla', 'deepak.chawla@example.com', '9847098712', '6 Lalbagh, Indore', '1989-08-08');

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    AccountType VARCHAR(50) NOT NULL CHECK (AccountType IN ('Savings', 'Current')),
    Balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    CreatedOn DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers_Table(CustomerID)
);


INSERT INTO Accounts (AccountID, CustomerID, AccountNumber, AccountType, Balance, CreatedOn) VALUES
(101, 1, 'ACC100001', 'Savings', 25400.75, '2022-01-15'),
(102, 2, 'ACC100002', 'Current', 105000.00, '2021-06-30'),
(103, 3, 'ACC100003', 'Savings', 46000.50, '2020-12-05'),
(104, 4, 'ACC100004', 'Savings', 38000.00, '2023-03-20'),
(105, 5, 'ACC100005', 'Current', 500000.00, '2019-08-19'),
(106, 6, 'ACC100006', 'Savings', 72000.10, '2020-10-10'),
(107, 7, 'ACC100007', 'Current', 210000.00, '2022-11-22'),
(108, 8, 'ACC100008', 'Savings', 9500.00, '2023-01-01'),
(109, 9, 'ACC100009', 'Savings', 87000.00, '2021-07-14'),
(110, 10, 'ACC100010', 'Current', 112000.00, '2023-06-12'),
(111, 11, 'ACC100011', 'Savings', 33400.00, '2020-09-03'),
(112, 12, 'ACC100012', 'Current', 243500.00, '2022-12-30'),
(113, 13, 'ACC100013', 'Savings', 12800.00, '2019-03-01'),
(114, 14, 'ACC100014', 'Current', 152000.75, '2021-04-17'),
(115, 15, 'ACC100015', 'Savings', 99000.00, '2020-02-25'),
(116, 16, 'ACC100016', 'Savings', 18750.20, '2023-08-08'),
(117, 17, 'ACC100017', 'Current', 64000.00, '2022-05-15'),
(118, 18, 'ACC100018', 'Savings', 4800.50, '2021-10-10'),
(119, 19, 'ACC100019', 'Current', 305000.00, '2020-06-06'),
(120, 20, 'ACC100020', 'Savings', 12750.00, '2023-09-09');

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATETIME,
    Amount DECIMAL(12, 2),
    TransactionType VARCHAR(20) CHECK (TransactionType IN ('Credit', 'Debit')),
    Description TEXT,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType, Description) VALUES
(1001, 101, '2023-01-15 10:25:00', 5000.00, 'Credit', 'Salary Deposit'),
(1002, 102, '2023-01-18 14:40:00', 20000.00, 'Debit', 'Business Payment'),
(1003, 103, '2023-02-01 09:15:00', 1500.00, 'Debit', 'Electricity Bill'),
(1004, 104, '2023-02-10 17:20:00', 10000.00, 'Credit', 'Freelance Payment'),
(1005, 105, '2023-03-05 11:00:00', 25000.00, 'Debit', 'Car EMI'),
(1006, 106, '2023-03-12 15:45:00', 8000.00, 'Debit', 'Shopping'),
(1007, 107, '2023-04-03 08:55:00', 6000.00, 'Credit', 'Interest Credit'),
(1008, 108, '2023-04-08 13:30:00', 3000.00, 'Debit', 'Groceries'),
(1009, 109, '2023-05-02 10:10:00', 12000.00, 'Credit', 'Bonus'),
(1010, 110, '2023-05-06 09:45:00', 5000.00, 'Debit', 'Mobile Purchase'),
(1011, 111, '2023-05-14 16:20:00', 7000.00, 'Credit', 'Rent Received'),
(1012, 112, '2023-05-20 11:15:00', 1500.00, 'Debit', 'Utility Bill'),
(1013, 113, '2023-06-01 14:10:00', 2500.00, 'Credit', 'Gift Transfer'),
(1014, 114, '2023-06-05 17:00:00', 9000.00, 'Debit', 'Insurance Premium'),
(1015, 115, '2023-06-10 10:30:00', 3000.00, 'Credit', 'Cashback'),
(1016, 116, '2023-06-15 13:20:00', 3500.00, 'Debit', 'Dining Out'),
(1017, 117, '2023-07-01 09:00:00', 7000.00, 'Credit', 'Dividend Payout'),
(1018, 118, '2023-07-04 15:30:00', 4000.00, 'Debit', 'Medical Expense'),
(1019, 119, '2023-07-08 08:40:00', 20000.00, 'Debit', 'Home Renovation'),
(1020, 120, '2023-07-10 11:50:00', 11000.00, 'Credit', 'Loan Disbursement');

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Location VARCHAR(150),
    ManagerName VARCHAR(100)
);

INSERT INTO Branches (BranchID, BranchName, Location, ManagerName) VALUES
(1, 'Mumbai Central', 'Mumbai', 'Rajiv Sharma'),
(2, 'Hyderabad Jubilee', 'Hyderabad', 'Sneha Menon'),
(3, 'Delhi Connaught', 'Delhi', 'Amit Khanna'),
(4, 'Bangalore Lakeview', 'Bangalore', 'Divya Rao'),
(5, 'Chandigarh Sector 21', 'Chandigarh', 'Karan Bedi'),
(6, 'Kochi Panampilly', 'Kochi', 'Anjali Nair'),
(7, 'Jamshedpur Bistupur', 'Jamshedpur', 'Ravi Prasad'),
(8, 'Pune Koregaon', 'Pune', 'Meena Deshpande'),
(9, 'Lucknow Hazratganj', 'Lucknow', 'Alok Tiwari'),
(10, 'Coimbatore RS Puram', 'Coimbatore', 'Deepa Iyer'),
(11, 'Ahmedabad Ashram', 'Ahmedabad', 'Ramesh Patel'),
(12, 'Bangalore Indiranagar', 'Bangalore', 'Suhas Shetty'),
(13, 'Mumbai Malad', 'Mumbai', 'Farhan Khan'),
(14, 'Nagpur Civil Lines', 'Nagpur', 'Tanvi Singh'),
(15, 'Kanpur GT Road', 'Kanpur', 'Harshit Agarwal'),
(16, 'Mangalore MG Road', 'Mangalore', 'Shruthi Shetty'),
(17, 'Bhopal Station Road', 'Bhopal', 'Nikhil Yadav'),
(18, 'Jaipur Gandhi Nagar', 'Jaipur', 'Pooja Mehra'),
(19, 'Indore Lalbagh', 'Indore', 'Deepak Chawla'),
(20, 'Thane West', 'Thane', 'Vikas Joshi');


CREATE TABLE AccountBranch (
    AccountID INT,
    BranchID INT,
    AssignedDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

INSERT INTO AccountBranch (AccountID, BranchID, AssignedDate) VALUES
(101, 1, '2022-01-20'),(102, 2, '2021-07-01'),(103, 3, '2020-12-10'),(104, 4, '2023-03-25'),(105, 5, '2019-08-22'),
(106, 6, '2020-10-15'),(107, 7, '2022-11-25'),(108, 8, '2023-01-03'),(109, 9, '2021-07-18'),(110, 10, '2023-06-15'),
(111, 11, '2020-09-07'),(112, 12, '2023-01-05'),(113, 13, '2019-03-06'),(114, 14, '2021-04-20'),(115, 15, '2020-03-01'),
(116, 16, '2023-08-10'),(117, 17, '2022-05-18'),(118, 18, '2021-10-12'),(119, 19, '2020-06-10'),(120, 20, '2023-09-12');

CREATE TABLE LoginCredentials (
    LoginID INT PRIMARY KEY,
    CustomerID INT,
    Username VARCHAR(50) UNIQUE,
    PasswordHash VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers_Table (CustomerID)
);

INSERT INTO LoginCredentials (LoginID, CustomerID, Username, PasswordHash) VALUES
(1, 1, 'john.doe', 'John@1234'),(2, 2, 'jane.smith', 'Jane@5678'),(3, 3, 'ravi.kumar', 'Ravi#9012'),
(4, 4, 'anita.jose', 'Anita@3456'),(5, 5, 'suresh.nair', 'Suresh@7890'),(6, 6, 'mira.patel', 'Mira$2345'),
(7, 7, 'arjun.reddy', 'Arjun@6789'),(8, 8, 'lata.mishra', 'Lata@1234'),(9, 9, 'vijay.mehta', 'Vijay#5678'),
(10, 10, 'asha.raju', 'Asha@9012'),(11, 11, 'karan.singh', 'Karan@3456'),(12, 12, 'priya.bose', 'Priya$7890'),
(13, 13, 'neeraj.verma', 'Neeraj#2345'),(14, 14, 'pinky.das', 'Pinky@6789'),(15, 15, 'rahul.jain', 'Rahul@1234'),
(16, 16, 'swati.pillai', 'Swati#5678'),(17, 17, 'dev.sahu', 'Dev@9012'),(18, 18, 'shreya.ram', 'Shreya$2345'),
(19, 19, 'manoj.gupta', 'Manoj#6789'),(20, 20, 'meena.rao', 'Meena@1234');

show tables;
