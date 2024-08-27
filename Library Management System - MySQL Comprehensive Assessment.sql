/* Topic : Library Management System
You are going to build a project based on Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books 
available in the library.
Create a database named library and following TABLES in the database: 
1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus6. ReturnStatus */

CREATE DATABASE library;
USE library;

/* Attributes for the tables: 
1. Branch - • Branch_no , Set as PRIMARY KEY  • Manager_Id  • Branch_address  • Contact_no */

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

/*2. Employee  - • Emp_Id , Set as PRIMARY KEY  • Emp_name  • Position  • Salary • Branch_no     Set as FOREIGN KEY and it refer Branch_no in Branch table  */

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

/*3. Books  - • ISBN , Set as PRIMARY KEY  • Book_title  • Category  • Rental_Price  • Status [Give yes if book available and no if book not available]  • Author  • Publisher*/

CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

/* 4. Customer  - • Customer_Id, Set as PRIMARY KEY  • Customer_name  • Customer_address  • Reg_date */

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

/* 5. IssueStatus  - • Issue_Id , Set as PRIMARY KEY  • Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table  Issued_book_name • Issue_date 
• Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table */

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

/* 6. ReturnStatus  - • Return_Id, Set as PRIMARY KEY  • Return_cust  • Return_book_name  • Return_date  • Isbn_book2 Set as FOREIGN KEY and it should refer isbn in BOOKS table */

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

# Insert data into Branch 

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES (1, 101, '123 Main St', '1234567890'),
       (2, 102, '456 Oak St', '2345678901'),
       (3, 103, '789 Pine St', '3456789012');
       
# Insert Data into Employee 

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES (101, 'Alice', 'Manager', 60000, 1),
       (201, 'Bob', 'Assistant', 40000, 1),
       (301, 'George', 'Clerk', 32000, 1),
	   (211, 'Helen', 'Assistant', 45000, 1),
	   (311, 'Irene', 'Clerk', 30000, 1),
	   (321, 'Jack', 'Clerk', 31000, 1),
	   (221, 'Karen', 'Assistant', 47000, 1),
       (102, 'Charlie', 'Manager', 65000, 2),
       (302, 'David', 'Clerk', 30000, 2),      
	   (202, 'Leo', 'Assistant', 72000, 2),
	   (312, 'Megan', 'Clerk', 28000, 2),
       (103, 'Eve', 'Manager', 70000, 3),
       (203, 'Frank', 'Assistant', 45000, 3),
	   (213, 'Nina', 'Assistant', 46000, 3),
	   (303, 'Oscar', 'Clerk', 35000, 3),
	   (313, 'Pamela', 'Clerk', 43000, 3);

# Insert Data into Books

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
('978-3-16-148411-7', 'Book E', 'Fiction', 22.00, 'yes', 'Author E', 'Publisher E'),
('978-1-23-456780-3', 'Book F', 'Science', 28.00, 'no', 'Author F', 'Publisher F'),
('978-0-12-345679-6', 'Book G', 'History', 35.00, 'yes', 'Author G', 'Publisher G'),
('978-9-87-654322-3', 'Book H', 'Math', 18.00, 'no', 'Author H', 'Publisher H'),
('978-3-16-148412-4', 'Book I', 'Fiction', 25.00, 'yes', 'Author I', 'Publisher I'),
('978-1-23-456781-0', 'Book J', 'Science', 26.00, 'yes', 'Author J', 'Publisher J'),
('978-0-12-345680-2', 'Book K', 'History', 33.00, 'no', 'Author K', 'Publisher K'),
('978-9-87-654323-0', 'Book L', 'Math', 20.00, 'yes', 'Author L', 'Publisher L'),
('978-3-16-148413-1', 'Book M', 'Fiction', 27.00, 'no', 'Author M', 'Publisher M'),
('978-1-23-456782-7', 'Book N', 'Science', 29.00, 'yes', 'Author N', 'Publisher N');

       
# Insert Data into Customer

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(304, 'Michael Scott', '1725 Slough Ave', '2021-11-30'),
(305, 'Jim Halpert', '9843 Scranton Rd', '2022-01-05'),
(306, 'Pam Beesly', '8472 Meadow Ln', '2023-02-14'),
(307, 'Dwight Schrute', '1745 Beet Farm Ln', '2021-09-21'),
(308, 'Stanley Hudson', '9642 East Dr', '2021-10-10'),
(309, 'Ryan Howard', '1852 New York Ave', '2023-03-25'),
(310, 'Kelly Kapoor', '2563 Cedar St', '2022-06-12'),
(311, 'Toby Flenderson', '5784 Maple Ave', '2022-04-17'),
(312, 'Angela Martin', '1574 Elm St', '2022-08-03'),
(313, 'Kevin Malone', '7893 Birch Blvd', '2021-07-29');


# Insert Data into IssueStatus

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(403, 305, 'Book E', '2023-07-10', '978-3-16-148411-7'),
(404, 306, 'Book F', '2023-07-12', '978-1-23-456780-3'),
(405, 307, 'Book G', '2023-07-14', '978-0-12-345679-6'),
(406, 309, 'Book H', '2023-07-16', '978-9-87-654322-3'),
(407, 309, 'Book I', '2023-07-18', '978-3-16-148412-4'),
(408, 310, 'Book J', '2023-06-20', '978-1-23-456781-0'),
(409, 311, 'Book K', '2023-07-22', '978-0-12-345680-2'),
(410, 312, 'Book L', '2023-07-24', '978-9-87-654323-0'),
(411, 313, 'Book M', '2023-07-26', '978-3-16-148413-1'),
(412, 306, 'Book N', '2023-07-28', '978-1-23-456782-7');


# Insert Data into ReturnStatus

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(503, 305, 'Book E', '2023-08-01', '978-3-16-148411-7'),
(504, 306, 'Book F', '2023-08-03', '978-1-23-456780-3'),
(505, 307, 'Book G', '2023-08-05', '978-0-12-345679-6'),
(506, 309, 'Book H', '2023-08-07', '978-9-87-654322-3'),
(507, 309, 'Book I', '2023-08-09', '978-3-16-148412-4'),
(508, 310, 'Book J', '2023-08-11', '978-1-23-456781-0'),
(509, 311, 'Book K', '2023-08-13', '978-0-12-345680-2'),
(510, 312, 'Book L', '2023-08-15', '978-9-87-654323-0'),
(511, 313, 'Book M', '2023-08-17', '978-3-16-148413-1'),
(512, 306, 'Book N', '2023-08-19', '978-1-23-456782-7');


# Displaying all tables in Library database

SHOW TABLES;

-- Display data from Branch table
SELECT * FROM Branch;

-- Display data from Employee table
SELECT * FROM Employee;

-- Display data from Books table
SELECT * FROM Books;

-- Display data from Customer table
SELECT * FROM Customer;

-- Display data from IssueStatus table
SELECT * FROM IssueStatus;

-- Display data from ReturnStatus table
SELECT * FROM ReturnStatus;

/* Write the queries for the following :
1. Retrieve the book title, category, and rental price of all available books. */

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary. 

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 

SELECT Books.Book_title, Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- 4. Display the total count of books in each category. 

SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch. 

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT Customer.Customer_name FROM IssueStatus JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book_title from book table containing history. 

SELECT Book_title FROM Books WHERE Category = 'History';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT Employee.Emp_name, Branch.Branch_address FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

-- 12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id WHERE Books.Rental_Price > 25.00;

