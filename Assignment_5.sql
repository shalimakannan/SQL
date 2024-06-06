use customer_data;
/*1. Arrange the ‘Orders’ dataset in decreasing order of amount*/

select * from order_s;
SELECT *
FROM order_s
ORDER BY amount desc;


/*2. Create a table with the name ‘Employee_details1’ consisting of these
columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
the name ‘Employee_details2’ consisting of the same columns as the first
table.*/


-- Create Employee_details1
CREATE TABLE Employee_details1 (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Emp_salary DECIMAL(10, 2)
);

-- Create Employee_details2 with the same structure as Employee_details1
CREATE TABLE Employee_details2 (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Emp_salary DECIMAL(10, 2)
);
-- Insert 5 records into Employee_details1
INSERT INTO Employee_details1 (Emp_id, Emp_name, Emp_salary)
VALUES 
    (1, 'John Doe', 50000.00),
    (2, 'Jane Smith', 60000.00),
    (3, 'Bob Johnson', 45000.00),
    (4, 'Mary Davis', 70000.00),
    (5, 'David Brown', 55000.00);

	-- Insert 5 records into Employee_details2
INSERT INTO Employee_details2 (Emp_id, Emp_name, Emp_salary)
VALUES 
    (6, 'Michael Johnson', 80000.00),
	 	 (7, 'Jennifer Lee', 55000.00),
    (8, 'Kevin Miller', 60000.00),
    (9, 'Laura Davis', 70000.00),
    (10, 'Mark Wilson', 48000.00);


/*3. Apply the UNION operator on these two tables*/

select Emp_id,Emp_name,Emp_salary from Employee_details1
UNION
select Emp_id,Emp_name,Emp_salary from Employee_details2; 


/*4. Apply the INTERSECT operator on these two tables*/
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
INTERSECT
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;

/*5.Apply the EXCEPT operator on these two tables*/
-- return all distinct rows from the left table that are not found in the right table's result set
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details1
EXCEPT
SELECT Emp_id, Emp_name, Emp_salary FROM Employee_details2;

