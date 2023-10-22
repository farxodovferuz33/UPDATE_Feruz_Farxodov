
-- Task 1 : Alter the rental duration and rental rates of the film you inserted before to three weeks and 9.99, respectively.
-- My inserted data was with 1002 id thats why checked with 1002
update film set rental_duration = 3, rental_rate = 9.99 where film_id = 1002




-- Task 2 : Alter any existing customer in the database with at least 10 rental and 10 payment records. Change their personal data to yours
--  (first name, last name, address, etc.). You can use any existing address from the "address" table. Please do not perform any updates on the
--   "address" table, as this can impact multiple records with the same address.

-- Firstly found target customer_id with limit 1, because I needed to update only one, so then after knowing the ID, I updated customer with target customer_id
-- 1 step: knowing target customer_id
SELECT
    c.customer_id
FROM
    customer c
    INNER JOIN rental r ON c.customer_id = r.customer_id
    INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id
HAVING
    COUNT(DISTINCT r.rental_id) >= 10
    AND COUNT(DISTINCT p.payment_id) >= 10
LIMIT 1;
-- 2 step: Updating target customer
UPDATE
    customer
SET
    first_name = 'Feruz',
    last_name = 'Farxodov',
    email = 'feruz@email.com',
    address_id = (SELECT address_id FROM address LIMIT 1)
WHERE
    customer_id = 1;



-- Task 3 : Change the customer's create_date value to current_date. 
-- in this question didnt give any specific customer that which one should I update so I chose previos customer which I updated
UPDATE customer
SET create_date = CURRENT_DATE
WHERE customer_id = 1;

