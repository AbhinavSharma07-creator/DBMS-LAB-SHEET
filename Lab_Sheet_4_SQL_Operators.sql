-- Lab Sheet 4: SQL Operators (MySQL)
USE CollegeDB;

-- 1. Addition
SELECT 10 + 5 AS Result;

-- 2. Subtraction
SELECT 10 - 5 AS Result;

-- 3. Multiplication
SELECT 10 * 5 AS Result;

-- 4. Division
SELECT 10 / 5 AS Result;

-- 5. Price multiplied by quantity
SELECT Product_Name, Price * Quantity AS Total_Amount FROM Product;

-- 6. AND
SELECT * FROM Student WHERE Age >= 18 AND City = 'Delhi';

-- 7. OR
SELECT * FROM Student WHERE City = 'Delhi' OR City = 'Meerut';

-- 8. NOT
SELECT * FROM Student WHERE NOT City = 'Delhi';

-- 9. Specific course AND city
SELECT * FROM Student WHERE Course = 'AIML' AND City = 'Meerut';

-- 10. Either of two departments
SELECT * FROM Employee WHERE Department = 'IT' OR Department = 'HR';

-- 11. Equal to
SELECT * FROM Student WHERE City = 'Delhi';

-- 12. Greater than
SELECT * FROM Employee WHERE Salary > 35000;

-- 13. Less than
SELECT * FROM Employee WHERE Salary < 40000;

-- 14. Greater than/equal and less than/equal
SELECT * FROM Employee WHERE Salary >= 30000 AND Salary <= 45000;

-- 15. Not equal
SELECT * FROM Student WHERE City <> 'Delhi';
-- Alternative: WHERE City != 'Delhi'

-- 16. BETWEEN
SELECT * FROM Employee WHERE Salary BETWEEN 30000 AND 45000;

-- 17. IN
SELECT * FROM Student WHERE City IN ('Delhi', 'Meerut');

-- 18. NOT IN
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Meerut');

-- 19. LIKE: names beginning with A
SELECT * FROM Student WHERE Name LIKE 'A%';

-- 20. IS NULL and IS NOT NULL
SELECT * FROM Student WHERE City IS NULL;
SELECT * FROM Student WHERE City IS NOT NULL;

-- 21. UNION
SELECT City AS Place FROM Student
UNION
SELECT Location AS Place FROM Department;

-- 22. UNION ALL
SELECT City AS Place FROM Student
UNION ALL
SELECT Location AS Place FROM Department;

-- 23. INTERSECT workaround for MySQL versions without INTERSECT
SELECT DISTINCT s.City
FROM Student s
INNER JOIN Department d ON s.City = d.Location;

-- 24. EXCEPT/MINUS workaround for MySQL
SELECT DISTINCT s.City
FROM Student s
LEFT JOIN Department d ON s.City = d.Location
WHERE d.Location IS NULL;

-- 25. Multiple operators together
SELECT Student_ID, Name, Course, City
FROM Student
WHERE Age >= 18
  AND Course IN ('AIML', 'CSE')
  AND City <> 'Roorkee'
  AND Student_ID > 0;
