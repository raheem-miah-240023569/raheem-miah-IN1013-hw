-- 1
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- 2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '%Smith'
ORDER BY cust_name DESC;

-- 3
SELECT DISTINCT cust_name
FROM restBill
WHERE SUBSTRING(cust_name, POSITION(' ' IN cust_name) + 1) LIKE 'C%';

-- 4
SELECT DISTINCT s.first_name || ' ' || s.surname AS headwaiter_name
FROM restStaff s
WHERE s.headwaiter IS NOT NULL;

-- 5
SELECT *
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- 6
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 150101 AND 151231
ORDER BY bill_date;
