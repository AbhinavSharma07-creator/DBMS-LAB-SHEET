-- Lab Sheet 2: DML Commands – INSERT, UPDATE and DELETE
USE CollegeDB;

-- 1. Insert one student
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (1, 'Aman', 19, 'AIML', 'Meerut');

-- 2. Insert five records using separate statements
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (2, 'Riya', 20, 'CSE', 'Delhi');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (3, 'Rahul', 19, 'AIML', 'Meerut');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (4, 'Neha', 21, 'DS', 'Noida');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (5, 'Karan', 20, 'CSE', 'Delhi');
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES (6, 'Priya', 19, 'AIML', 'Roorkee');

-- 3. Insert multiple records in one statement
INSERT INTO Student (Student_ID, Name, Age, Course, City) VALUES
(7, 'Arjun', 20, 'CSE', 'Meerut'),
(8, 'Simran', 19, 'DS', 'Delhi');

-- 4. Insert employee records
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary) VALUES
(101, 'Vikas', 'IT', 35000),
(102, 'Pooja', 'HR', 32000),
(103, 'Amit', 'IT', 42000);

-- 5. Insert department records
INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES
(1, 'IT', 'Block A'),
(2, 'HR', 'Block B'),
(3, 'Sales', 'Block C');

-- 6. Insert product records
INSERT INTO Product (Product_ID, Product_Name, Price, Quantity) VALUES
(1, 'Keyboard', 700, 10),
(2, 'Mouse', 400, 0),
(3, 'Monitor', 8000, 5);

-- 7. Insert customer records
INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone) VALUES
(1, 'Aarav', 'aarav@example.com', '9876500001'),
(2, 'Meera', 'meera@example.com', '9876500002');

-- 8. Insert course records
INSERT INTO Course (Course_ID, Course_Name, Duration, Fees) VALUES
(1, 'BTech AIML', '4 years', 90000),
(2, 'BTech CSE', '4 years', 85000);

-- 9. Insert all columns explicitly
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (9, 'Ishita', 20, 'AIML', 'Haridwar');

-- 10. Insert selected columns only
INSERT INTO Student (Student_ID, Name)
VALUES (10, 'Dev');

-- 11. Update city for a particular student
UPDATE Student SET City = 'Noida' WHERE Student_ID = 1;

-- 12. Update salary of a particular employee
UPDATE Employee SET Salary = 38000 WHERE Emp_ID = 101;

-- 13. Increase all employee salaries by 10%
UPDATE Employee SET Salary = Salary * 1.10;

-- 14. Increase all product prices by 5%
UPDATE Product SET Price = Price * 1.05;

-- 15. Change a student's course
UPDATE Student SET Course = 'CSE' WHERE Student_ID = 1;

-- 16. Update employee department
UPDATE Employee SET Department = 'Finance' WHERE Emp_ID = 102;

-- 17. Change Meerut students to Delhi
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update course fees
UPDATE Course SET Fees = 95000 WHERE Course_ID = 1;

-- 19. Update multiple student columns
UPDATE Student SET Age = 21, City = 'Roorkee' WHERE Student_ID = 2;

-- 20. Delete a particular student
DELETE FROM Student WHERE Student_ID = 10;

-- 21. Delete students from a particular city
DELETE FROM Student WHERE City = 'Noida';

-- 22. Delete employees below a specified salary
DELETE FROM Employee WHERE Salary < 30000;

-- 23. Delete products with zero quantity
DELETE FROM Product WHERE Quantity = 0;

-- 24. Delete using multiple conditions
DELETE FROM Student WHERE (City = 'Delhi' AND Course = 'DS') OR Age < 18;

-- 25. Display the table after operations
SELECT * FROM Student;
