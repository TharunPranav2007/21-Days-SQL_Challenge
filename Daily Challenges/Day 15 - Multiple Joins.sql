-- 1. Join patients, staff, and staff_schedule.
SELECT p.patient_id, p.name, s.staff_name, ss.week, ss.present
FROM patients p
INNER JOIN staff s ON p.service = s.service
INNER JOIN staff_schedule ss ON s.staff_id = ss.staff_id
LIMIT 5;

-- 2. Combine services_weekly with staff and staff_schedule.
SELECT sw.week, sw.service, sw.patients_admitted, s.staff_name, ss.present
FROM services_weekly sw
INNER JOIN staff s ON sw.service = s.service
INNER JOIN staff_schedule ss ON s.staff_id = ss.staff_id AND sw.week = ss.week
LIMIT 5;

-- 3. Create a multi-table report showing patient admissions with staff information.
SELECT p.patient_id, p.name, p.arrival_date, p.service, s.staff_name, s.role
FROM patients p
INNER JOIN staff s ON p.service = s.service
LIMIT 5;

-- Daily Challenge: Service analysis for week 20 (Assigned vs Present Staff).
SELECT 
    sw.service, sw.patients_admitted, sw.patients_refused, sw.patient_satisfaction,
    COUNT(DISTINCT s.staff_id) AS staff_assigned_count,
    COUNT(DISTINCT CASE WHEN ss.present = 1 THEN ss.staff_id END) AS staff_present_count
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON sw.service = ss.service AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY sw.service, sw.patients_admitted, sw.patients_refused, sw.patient_satisfaction
ORDER BY sw.patients_admitted DESC;