# Library-Management-System---MySQL-Comprehensive-Assessment

## Overview

This project involves the creation of a SQL database named `library` with several tables designed to manage and track various aspects of a library system. The database includes tables for branches, employees, books, customers, issue status, and return status.

## Database Structure

### Tables

1. **Branch**
   - `Branch_no` (PRIMARY KEY)
   - `Manager_Id`
   - `Branch_address`
   - `Contact_no`

2. **Employee**
   - `Emp_Id` (PRIMARY KEY)
   - `Emp_name`
   - `Position`
   - `Salary`
   - `Branch_no` (FOREIGN KEY references `Branch_no` in `Branch` table)

3. **Books**
   - `ISBN` (PRIMARY KEY)
   - `Book_title`
   - `Category`
   - `Rental_Price`
   - `Status` (e.g., 'yes' for available, 'no' for not available)
   - `Author`
   - `Publisher`

4. **Customer**
   - `Customer_Id` (PRIMARY KEY)
   - `Customer_name`
   - `Customer_address`
   - `Reg_date`

5. **IssueStatus**
   - `Issue_Id` (PRIMARY KEY)
   - `Issued_cust` (FOREIGN KEY references `Customer_Id` in `Customer` table)
   - `Issued_book_name`
   - `Issue_date`
   - `Isbn_book` (FOREIGN KEY references `ISBN` in `Books` table)

6. **ReturnStatus**
   - `Return_Id` (PRIMARY KEY)
   - `Return_cust` (FOREIGN KEY references `Customer_Id` in `Customer` table)
   - `Return_book_name`
   - `Return_date`
   - `Isbn_book2` (FOREIGN KEY references `ISBN` in `Books` table)

## Sample Queries

1. **Retrieve the book title, category, and rental price of all available books:**

    ```sql
    SELECT Book_title, Category, Rental_Price
    FROM Books
    WHERE Status = 'yes';
    ```

2. **List the employee names and their respective salaries in descending order of salary:**

    ```sql
    SELECT Emp_name, Salary
    FROM Employee
    ORDER BY Salary DESC;
    ```

3. **Retrieve the book titles and the corresponding customers who have issued those books:**

    ```sql
    SELECT B.Book_title, C.Customer_name
    FROM Books B
    JOIN IssueStatus I ON B.ISBN = I.Isbn_book
    JOIN Customer C ON I.Issued_cust = C.Customer_Id;
    ```

4. **Display the total count of books in each category:**

    ```sql
    SELECT Category, COUNT(*) AS Total_Books
    FROM Books
    GROUP BY Category;
    ```

5. **Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000:**

    ```sql
    SELECT Emp_name, Position
    FROM Employee
    WHERE Salary > 50000;
    ```

6. **List the customer names who registered before 2022-01-01 and have not issued any books yet:**

    ```sql
    SELECT Customer_name
    FROM Customer
    WHERE Reg_date < '2022-01-01'
    AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
    ```

7. **Display the branch numbers and the total count of employees in each branch:**

    ```sql
    SELECT Branch_no, COUNT(*) AS Total_Employees
    FROM Employee
    GROUP BY Branch_no;
    ```

8. **Display the names of customers who have issued books in the month of June 2023:**

    ```sql
    SELECT DISTINCT C.Customer_name
    FROM Customer C
    JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
    WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;
    ```

9. **Retrieve book titles from the Books table containing history:**

    ```sql
    SELECT Book_title
    FROM Books
    WHERE Category = 'History';
    ```

10. **Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:**

    ```sql
    SELECT Branch_no, COUNT(*) AS Total_Employees
    FROM Employee
    GROUP BY Branch_no
    HAVING COUNT(*) > 5;
    ```

11. **Retrieve the names of employees who manage branches and their respective branch addresses:**

    ```sql
    SELECT E.Emp_name, B.Branch_address
    FROM Employee E
    JOIN Branch B ON E.Branch_no = B.Branch_no
    WHERE E.Position = 'Manager';
    ```

12. **Display the names of customers who have issued books with a rental price higher than Rs. 25:**

    ```sql
    SELECT DISTINCT C.Customer_name
    FROM Customer C
    JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
    JOIN Books B ON I.Isbn_book = B.ISBN
    WHERE B.Rental_Price > 25;
    ```

## How to Use

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/D-K02/Library-Management-System---MySQL-Comprehensive-Assessment.git
    ```

2. Load the SQL scripts into your database management system (DBMS) to create and populate the tables.

3. Execute the provided queries to retrieve and manipulate the data.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by various library management systems and SQL best practices.
- Thanks to contributors and mentors who provided valuable feedback.

Feel free to contribute to this project by opening issues or submitting pull requests.


