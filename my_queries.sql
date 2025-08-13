
 CREATE DATABASE my_db;

CREATE TABLE employee (
  employee_id INT PRIMARY KEY IDENTITY(1,1), 
  employee_name VARCHAR(100),
  salary DECIMAL(10, 2),
  hire_date DATE
);


CREATE TABLE account (
  account_id INT PRIMARY KEY IDENTITY(1,1), 
  OPEN_BRANCH_ID INT,
  account_status VARCHAR(20),
  PENDING_BALANCE DECIMAL(10, 2)
);


INSERT INTO employee (employee_name, salary, hire_date) VALUES
('John Smith', 45000.00, '2022-01-15'),
('Jane Doe', 52000.00, '2021-11-20'),
('Peter Jones', 40000.00, '2023-02-10'),
('Mary Williams', 42000.00, '2022-08-01'),
('David Brown', 43000.00, '2023-01-05'),
('Emily Davis', 60000.00, '2020-05-25'),
('Michael Miller', 75000.00, '2019-03-12'),
('Sarah Wilson', 42000.00, '2022-09-18');


INSERT INTO account (OPEN_BRANCH_ID, account_status, PENDING_BALANCE) VALUES
(101, 'active', 3800.00),
(101, 'active', 4100.00),
(102, 'active', 5000.00),
(102, 'active', 6000.00),
(103, 'active', 2500.00),
(103, 'inactive', 9000.00),
(103, 'active', 3000.00),
(104, 'active', 4250.00),
(105, 'active', 8000.00),
(105, 'active', 7500.00);
--A
SELECT DISTINCT salary
FROM employee
ORDER BY salary ASC
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;
--B
SELECT MIN(salary) AS second_lowest_salary
FROM employee
WHERE salary > (SELECT MIN(salary) FROM employee);
--C
SELECT
    OPEN_BRANCH_ID,
    AVG(PENDING_BALANCE) AS average_pending_balance
FROM account
WHERE account_status = 'active'
GROUP BY OPEN_BRANCH_ID
HAVING AVG(PENDING_BALANCE) < 4300;
--D
SELECT
    employee_id,
    employee_name,
    salary,
    hire_date
FROM employee
ORDER BY hire_date DESC
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;
--E
SELECT
    COUNT(DISTINCT OPEN_BRANCH_ID) AS total_number_of_branches
FROM account;
GO