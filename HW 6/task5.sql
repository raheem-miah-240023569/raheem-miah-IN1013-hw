-- 1
SELECT ws.first_name, ws.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
GROUP BY b.waiter_no, b.bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT rt.room_name, COUNT(*) AS num_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3
SELECT rt.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4
SELECT s.first_name, s.surname, SUM(b.bill_total) AS total_bill_amount
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
JOIN restBill b ON b.table_no IN (
    SELECT table_no FROM restRest_table WHERE room_name = rm.room_name
)
WHERE b.bill_date = rm.room_date
GROUP BY rm.headwaiter
ORDER BY total_bill_amount DESC;

-- 5
SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT ws.first_name, ws.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
GROUP BY b.waiter_no, b.bill_date
HAVING COUNT(*) >= 3;
