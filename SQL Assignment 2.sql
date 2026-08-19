USE employee;

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

use employee;

INSERT INTO locations (location_name) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');

use employee;

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, salary, department_id, location_id ) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 60000, 3, 4),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 80000, 12, 1),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 45000, 10, 2),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 70000, 8, 3),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 55000, 11, 1),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 65000, 8, 2),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 90000, 2, 3),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 70000, 8, 4),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 55000,  11, 3),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 80000, 12, 4),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 60000, 2, 1),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 95000, 13, 2),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 75000, 10, 3),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst',60000, 10, 2),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 85000, 7, 1 ),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 100000, 4, 4),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist',  80000, 12, 2),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 75000 , 9, 3),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 55000, 4, 4),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 90000,  1, 1),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 85000, 7, 3),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 60000, 4, 4 ),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 70000, 2, 2),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 95000, 5, 1),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 100000, 3, 4),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 75000, 3, 2),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 60000, 6, 3),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 60000, 6, 1),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 80000, 12, 2),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 90000, 5, 1);

# Distint values

SELECT DISTINCT salary FROM Employees;

# ALIAS (AS):  

SELECT age AS Employee_Age, 
       salary AS Employee_Salary 
FROM employees;

#  WHERE CLAUSE & OPERATORS:  
SELECT * FROM Employees WHERE Salary >50000;
SELECT * FROM Employees WHERE hire_date < '2016-01-01';

#Find the employee whose designation is missing and fill it with "Data Scientist"

SET SQL_SAFE_UPDATES =0;

UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT * FROM Employees;

# Sorting and Grouping Data:  
# ORDER BY:  Find employees sorted by department ID in ascending order and salary in descending order. 

SELECT * FROM Employees ORDER BY Department_id ASC, Salary DESC;

#LIMIT: Display the first 5 employees hired in the year 2018. 

SELECT employee_name, hire_date FROM employees
WHERE YEAR(hire_date) = 2018
LIMIT 5;

#  AGGREGATE FUNCTIONS:  Calculate the sum of all salaries in the Finance department.  
#Find the minimum age among all employees.  

SELECT SUM(salary) FROM Employees 
WHERE designation = 'Financial Department';

SELECT * FROM employees;
SELECT MIN(Age) FROM Employees;

#GROUP BY:  List the maximum salary for each location.  
SELECT location_id, MAX(salary) AS Maximum_Salary
FROM employees
GROUP BY location_id;

SELECT designation, AVG(salary) AS Avg_Salary
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

# HAVING:  Find departments with less than 3 employees. Find locations with female employees whose average age is below 30.  

SELECT department_id, COUNT(*) AS Employee_Count
FROM employees
GROUP BY department_id
having COUNT(*) <3;

 # Find locations with female employees whose average age is below 30. 
 
SELECT location_id, AVG(age) AS Avg_Age
FROM employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;

# JOINS
 #INNER JOIN:  List employee names, their designations, and department names where 
#employees are assigned to a department.  

SELECT * FROM departments;

SELECT
    e.employee_name,
    e.designation,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;

# LEFT JOIN

SELECT d.department_name,
    COUNT(e.employee_id) AS total_employees FROM departments d
LEFT JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_id,
    d.department_name;
    
   # RIGHT JOIN:   Display all locations along with the names of employees assigned to each location. 
   #If no employees are assigned to a location, display NULL for employee name. 

SELECT l.location_name, e.employee_name
FROM employees e
RIGHT JOIN locations l
ON e.location_id = l.location_id;

# CROSS JOIN Show all possible combinations of departments and locations.

SELECT 
    d.department_name,
    l.location_name
FROM 
    departments d
CROSS JOIN 
    locations l;

# ● Show pairs of employees working in the same department, excluding self-pairs. 


SELECT 
    e1.employee_name AS employee_1,
    e2.employee_name AS employee_2,
    e1.department_id
FROM 
    employees e1
JOIN 
    employees e2
ON 
    e1.department_id = e2.department_id
    AND e1.employee_id < e2.employee_id;
    
    
    # Windows function # Write a window function query to rank employees by salary using rank().
SELECT employee_id,employee_name,salary,
RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

#Write a window function query to rank employees by salary within each department using DENSE_RANK() 

SELECT employee_id,employee_name,department_id, Salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY Salary DESC) 
AS department_rank
FROM employees;

#Write a window function query, Running total salary by department 

SELECT employee_id, employee_name,department_id,salary,
SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS running_total_salary
FROM employees;