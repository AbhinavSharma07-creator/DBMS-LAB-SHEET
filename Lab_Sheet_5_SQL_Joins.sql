-- Lab Sheet 5: SQL Joins (MySQL)
USE CollegeDB;

-- Join examples use Student.Dept_ID and Student.Course_ID, which are added below.
-- Add the columns if they do not already exist.
ALTER TABLE Student ADD COLUMN Dept_ID INT;
ALTER TABLE Student ADD COLUMN Course_ID INT;

-- Sample data mapping for join demonstrations
UPDATE Student SET Dept_ID = 1, Course_ID = 1 WHERE Student_ID IN (1, 3, 6, 7);
UPDATE Student SET Dept_ID = 2, Course_ID = 2 WHERE Student_ID IN (2, 4, 5, 8);

-- 1-2. INNER JOIN: students and department names
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 3. Employees with department names
SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
INNER JOIN Department d ON e.Department = d.Dept_Name;

-- 4. Students with course details
SELECT s.Name, c.Course_Name, c.Duration, c.Fees
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- 5. Students in a particular department
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'IT';

-- 6-7. LEFT JOIN: all students, even without a department
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 8-9. RIGHT JOIN: all departments, including those without students
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 10. Students without a department
SELECT s.Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments with no students
SELECT d.Dept_Name
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
WHERE s.Student_ID IS NULL;

-- 12. FULL OUTER JOIN workaround in MySQL
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 13-14. CROSS JOIN and number of combinations
SELECT s.Name, c.Course_Name
FROM Student s
CROSS JOIN Course c;

SELECT COUNT(*) AS Possible_Combinations
FROM Student s
CROSS JOIN Course c;

-- 15. NATURAL JOIN example (shared column name must exist)
-- This query assumes both tables have a column named Dept_ID.
SELECT * FROM Student NATURAL JOIN Department;

-- 16. Compare NATURAL JOIN and INNER JOIN
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 17-18. SELF JOIN: employee-manager relationships
-- Add manager ID if it does not exist.
ALTER TABLE Employee ADD COLUMN Manager_ID INT;
UPDATE Employee SET Manager_ID = 101 WHERE Emp_ID IN (102, 103);
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 101;

SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 19-20. Join Student, Department, and Course
SELECT s.Name AS Student_Name, c.Course_Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course c ON s.Course_ID = c.Course_ID;

-- 21. Employees whose salary is above department average
SELECT e.Emp_Name, e.Department, e.Salary
FROM Employee e
JOIN (
    SELECT Department, AVG(Salary) AS Avg_Salary
    FROM Employee
    GROUP BY Department
) a ON e.Department = a.Department
WHERE e.Salary > a.Avg_Salary;

-- 22. Department with maximum number of students
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
ORDER BY Student_Count DESC
LIMIT 1;

-- 23. Total students in each department
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- 24. Courses and number of enrolled students
SELECT c.Course_Name, COUNT(s.Student_ID) AS Enrolled_Students
FROM Course c
LEFT JOIN Student s ON s.Course_ID = c.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- 25. Combined student-department-course report
SELECT s.Student_ID, s.Name, d.Dept_Name, c.Course_Name,
       COUNT(s.Student_ID) OVER (PARTITION BY d.Dept_ID) AS Students_In_Department
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course c ON s.Course_ID = c.Course_ID
GROUP BY s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name, c.Course_Name;
