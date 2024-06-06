use customer_data;
select * from cust_details;
/*Create a view named ‘customer_san_jose’ which comprises of only those
customers who are from San Jose*/
CREATE VIEW customer_san_jose1 AS
SELECT *
FROM cust_details
WHERE city = 'SanJose';

 select * from customer_san_jose1; 
/*. Inside a transaction, update the first name of the customer to Francis
where the last name is Jordan(smith)*/
-- a. Rollback the transaction

BEGIN TRANSACTION;

UPDATE cust_details
SET first_name = 'Francis'
WHERE last_name = 'Smith';

ROLLBACK;
select * from cust_details;

-- b. Set the first name of customer to Alex, where the last name is Jordan
UPDATE cust_details
SET first_name = 'Alex'
WHERE last_name = 'Smith';
select * from cust_details;


/*Inside a TRY... CATCH block, divide 100 with 0, print the default error
message.*/
BEGIN TRY
    -- Attempt the division
    DECLARE @result FLOAT;
    SET @result = 100 / 0;
END TRY
BEGIN CATCH
    -- Catch and handle the exception
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;
select * from order_s;
/*Create a transaction to insert a new record to Orders table and and save it*/
CREATE SEQUENCE OrderSeq
    START WITH 1
    INCREMENT BY 1;
BEGIN TRANSACTION;

-- Attempt to insert a new record into the Orders table
INSERT INTO order_s (order_id, customer_id, order_date, amount)
VALUES (NEXT VALUE FOR OrderSeq, '123', GETDATE(), 100.00);

-- Check if the insert was successful
IF @@ERROR = 0
BEGIN
    -- Commit the transaction if successful
    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';
END
ELSE
BEGIN
    -- Rollback the transaction if an error occurred
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back due to an error.';
END
