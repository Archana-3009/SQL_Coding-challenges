CREATE DATABASE elearning_platform;


USE elearning_platform;

# Create table

CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

USE elearning_Platform;
INSERT INTO learners ( learner_id,full_name,Country)
values (1, 'Archana Sundaram', 'Coimbatore'),
	   (2, 'Radha krishnan', 'Madurai'),
       (3, 'Tamil Selvi', 'Theni'),
       (4, 'Dilip', 'Dindigul'),
       (5, 'Arul' , 'Chennai'),
       (6, 'Mullai', 'Tiruvannamalai'),
       (7, 'Saranya', 'Tiruppur');
       
INSERT INTO Courses ( Course_id, Course_name, Category,unit_price)
VALUES (33010, 'Data Analyst', 'Basic', 40000),
       (33011, 'Software Tessting' , 'Intermediate', 100000),
       (33012, 'Advanced Excel', 'Advanced', 25000),
       (33013, 'Power BI' , 'Advanced', 35000);

INSERT INTO purchases (Purchase_id, learner_id, Course_id,Quantity, Purchase_date)
VALUES (1,1,33010,2,'2025-01-07'),
	   (2,2,33010,1, '2025-01-15'),
       (3,3,33013,1, '2025-02-10'),
       (4,4,33012,1, '2025-02-10'),
       (5,5,33013,1, '2025-03-10'),
       (6,6,33012,1, '2025-04-10'),
       (7,7,33010,1, '2025-05-10'),
       (8, Null,33010,1, null),
       (9, Null,33012,1, null),
       (10,2,33012,1, '2025-02-10');
       
       # Data Exploration using Joins
USE Elearning_platform;

      SELECT 
    l.full_name AS Learner,
    c.course_name AS Course,
    c.category AS Category,
    p.quantity AS Quantity,
    ROUND(p.quantity * c.unit_price, 2) AS Total_Amount,
    p.purchase_date AS Purchase_Date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY Total_Amount DESC;


SELECT l.full_name, l.country, SUM(p.quantity * c.unit_price) AS Total_Spending
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name, l.country;

# Top 3 most purchased courses
SELECT c.course_name, SUM(p.quantity) AS Total_Quantity
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_name
ORDER BY Total_Quantity DESC
LIMIT 3;

# Show each category’s: 
#Total revenue 
#Number of unique learners
SELECT c.category,
       SUM(p.quantity * c.unit_price) AS Total_Revenue,
       COUNT(DISTINCT p.learner_id) AS Unique_Learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;

#List learners who purchased from more than one category. 
SELECT l.full_name FROM Purchases p
JOIN courses c ON p.course_id = c.course_id
JOIN learners l ON p.learner_id = l.learner_id
GROUP BY l.full_name
HAVING cOUNT(distinct c.category) > 1;

# Identify courses never purchased. 

SELECT course_name
FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM purchases);

#Subqueries & Correlated Subqueries 
# Q6. Find learners whose total spending is above the average learner spending. 

SELECT l.full_name
FROM learners l
JOIN purchases p ON l.learner_id = p.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
HAVING SUM(p.quantity * c.unit_price) > (SELECT AVG(total_spending)
    FROM (
        SELECT SUM(p.quantity * c.unit_price) AS total_spending
        FROM purchases p
        JOIN courses c ON p.course_id = c.course_id
        GROUP BY p.learner_id
    ) AS avg_spending
);


WITH learner_spending AS (
    SELECT l.learner_id, l.full_name, SUM(p.quantity * c.unit_price) AS total_spending
    FROM purchases p
    JOIN learners l ON p.learner_id = l.learner_id
    JOIN courses c ON p.course_id = c.course_id
    GROUP BY l.learner_id, l.full_name
)
SELECT * FROM learner_spending WHERE total_spending > 10000;

#Classify learners based on spending:

SELECT l.full_name,
       SUM(p.quantity * c.unit_price) AS total_spending,
       CASE
           WHEN SUM(p.quantity * c.unit_price) > 15000 THEN 'High Value'
           WHEN SUM(p.quantity * c.unit_price) BETWEEN 8000 AND 15000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS Learner_Type
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name;

# NULL Handling  Display all courses and replace NULL purchase counts with 0 using: IFNULL() or COALESCE() 

SELECT c.course_name, IFNULL(SUM(p.quantity), 0) AS Purchase_Count
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_name;

 # create View 

CREATE VIEW category_performance_view AS SELECT c.category,
       SUM(p.quantity * c.unit_price) AS Total_Revenue,
       COUNT(p.purchase_id) AS Number_of_Purchases,
       AVG(p.quantity * c.unit_price) AS Avg_Revenue_Per_Purchase
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;













      
       
       