-- 1. Join patients and staff based on their common service field.
SELECT p.patient_id, p.name, s.staff_name, p.service 
FROM patients p 
INNER JOIN staff s ON p.service = s.service
LIMIT 5;

-- 2. Join services_weekly with staff to show weekly data with staff info.
SELECT sw.week, sw.service, sw.patients_admitted, s.staff_name, s.role
FROM services_weekly sw
INNER JOIN staff s ON sw.service = s.service
LIMIT 5;

-- 3. Create a report showing patient information along with staff assigned to their service.
SELECT p.patient_id, p.name, p.service, s.staff_name, s.role
FROM patients p
INNER JOIN staff s ON p.service = s.service
LIMIT 5;

-- Daily Challenge: Report for patients in services with > 5 staff members.
SELECT 
    p.patient_id, p.name, p.age, p.service, sc.staff_count
FROM patients p
INNER JOIN (
    SELECT service, COUNT(staff_id) as staff_count 
    FROM staff 
    GROUP BY service 
    HAVING COUNT(staff_id) > 5
) sc ON p.service = sc.service
ORDER BY sc.staff_count DESC, p.name ASC;