-- 1
SELECT DISTINCT s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restStaff z ON z.first_name = 'Zoe' AND z.surname = 'Ball'
WHERE s.headwaiter = z.headwaiter AND s.staff_no != z.staff_no;

-- 4
SELECT b.cust_name, b.bill_total, s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.table_no IN (
    SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no  
JOIN restRest_table rt ON rt.room_name = rm.room_name  
JOIN restBill b ON b.table_no = rt.table_no  
JOIN restStaff ws ON b.waiter_no = ws.staff_no  
AND rm.room_date = 160312
AND b.bill_date = 160312;


