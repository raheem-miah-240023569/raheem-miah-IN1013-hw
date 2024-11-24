-- 1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no  -- Get the waiter who served the customer
JOIN restRoom_management rm ON rm.headwaiter = s.staff_no  -- Get the headwaiter for the room
WHERE b.bill_total > 450.00
AND s.first_name = 'Charles';  -- Only consider 'Charles' as the headwaiter

-- 2
SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
JOIN restBill b ON b.table_no IN (
    SELECT table_no FROM restRest_table WHERE room_name = 'Green'
)
WHERE b.cust_name = 'Nerida Smith'
AND b.bill_date = 160111
AND rm.room_date = 160111;

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total) FROM restBill
);

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.waiter_no IS NULL;

-- 5
SELECT b.cust_name, s.first_name AS headwaiter_first, s.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
