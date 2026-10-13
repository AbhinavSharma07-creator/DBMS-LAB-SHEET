-- Lab Sheet 3: SQL Functions (MySQL)
USE CollegeDB;

-- 1. ABS()
SELECT ABS(-15) AS Result;

-- 2. ROUND()
SELECT ROUND(12.567, 2) AS Result;

-- 3. CEIL() and FLOOR()
SELECT CEIL(12.3) AS Ceiling_Value, FLOOR(12.8) AS Floor_Value;

-- 4. MOD()
SELECT MOD(17, 5) AS Remainder;

-- 5. Rounded employee salaries
SELECT Emp_Name, ROUND(Salary) AS Rounded_Salary FROM Employee;

-- 6. COUNT students
SELECT COUNT(*) AS Total_Students FROM Student;

-- 7. SUM salaries
SELECT SUM(Salary) AS Total_Salary FROM Employee;

-- 8. AVG salary
SELECT AVG(Salary) AS Average_Salary FROM Employee;

-- 9. MAX salary
SELECT MAX(Salary) AS Highest_Salary FROM Employee;

-- 10. MIN salary
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;

-- 11. UPPER()
SELECT Name, UPPER(Name) AS Upper_Name FROM Student;

-- 12. LOWER()
SELECT Name, LOWER(Name) AS Lower_Name FROM Student;

-- 13. LENGTH()
SELECT Name, LENGTH(Name) AS Name_Length FROM Student;

-- 14. CONCAT()
SELECT CONCAT('Aman', ' ', 'Tyagi') AS Full_Name;

-- 15. SUBSTRING()
SELECT SUBSTRING('DATABASE', 1, 4) AS Part_Text;

-- 16. Number to string
SELECT CAST(123 AS CHAR) AS String_Value;

-- 17. String to number
SELECT CAST('456' AS UNSIGNED) AS Number_Value;

-- 18. Format a date
SELECT DATE_FORMAT('2026-10-13', '%d-%m-%Y') AS Formatted_Date;

-- 19. CAST()
SELECT CAST('2026-10-13' AS DATE) AS Date_Value;

-- 20. CONVERT()
SELECT CONVERT('123', UNSIGNED) AS Converted_Number;

-- 21. Current date
SELECT CURDATE() AS Current_Date;

-- 22. Extract year, month and day
SELECT YEAR('2026-10-13') AS Year_Value,
       MONTH('2026-10-13') AS Month_Value,
       DAY('2026-10-13') AS Day_Value;

-- 23. Difference between two dates
SELECT DATEDIFF('2026-10-13', '2026-10-01') AS Days_Difference;

-- 24. Add days to a date
SELECT DATE_ADD('2026-10-13', INTERVAL 7 DAY) AS New_Date;

-- 25. Display employee joining dates (example column)
-- If Employee has a Joining_Date column, use:
-- SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%d-%m-%Y') AS Joining_Date
-- FROM Employee;
