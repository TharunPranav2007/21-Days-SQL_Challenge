-- 1. Show each patient with their service's average satisfaction as a column.
SELECT p1.patient_id, p1.name, p1.service, p1.satisfaction,
       (SELECT ROUND(AVG(satisfaction), 2) FROM patients p2 WHERE p2.service = p1.service) AS service_avg_sat
FROM patients p1 LIMIT 5;

-- 2. Create a derived table of service statistics and query from it.
SELECT * FROM (
    SELECT service, SUM(patients_admitted) AS total_admitted 
    FROM services_weekly GROUP BY service
) AS t1;

-- 3. Display staff with their service's total patient count.
SELECT s.staff_name, s.service,
       (SELECT COUNT(*) FROM patients p WHERE p.service = s.service) AS total_patients
FROM staff s LIMIT 5;

-- Daily Challenge: Performance Gap Report.
SELECT 
    t1.service, t1.total_admitted,
    (t1.total_admitted - (SELECT AVG(total) FROM (SELECT SUM(patients_admitted) as total FROM services_weekly GROUP BY service) as sub)) AS diff_from_avg,
    CASE 
        WHEN t1.total_admitted > (SELECT AVG(total) FROM (SELECT SUM(patients_admitted) as total FROM services_weekly GROUP BY service) as sub) THEN 'Above Average'
        ELSE 'Below Average'
    END AS rank_indicator
FROM (SELECT service, SUM(patients_admitted) AS total_admitted FROM services_weekly GROUP BY service) AS t1
ORDER BY t1.total_admitted DESC;