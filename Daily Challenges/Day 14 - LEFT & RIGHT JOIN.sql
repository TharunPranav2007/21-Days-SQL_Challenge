-- 1. Show all staff members and their schedule information (including empty schedules).
SELECT s.staff_id, s.staff_name, ss.week, ss.present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
LIMIT 5;

-- 2. List all services from services_weekly and their corresponding staff.
SELECT sw.week, sw.service, s.staff_name, s.role
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LIMIT 5;

-- 3. Display all patients and their service's weekly statistics.
SELECT p.patient_id, p.name, p.service, sw.week, sw.available_beds
FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service
LIMIT 5;

-- Daily Challenge: Staff utilisation report (count weeks present).
SELECT 
    s.staff_id, s.staff_name, s.role, s.service,
    COALESCE(SUM(ss.present), 0) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY weeks_present DESC;