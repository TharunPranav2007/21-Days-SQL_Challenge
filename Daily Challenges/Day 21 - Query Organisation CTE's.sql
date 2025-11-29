-- 1. Create a CTE to calculate service statistics, then query from it.
WITH ServiceStats AS (
    SELECT service, SUM(patients_admitted) as total_admitted FROM services_weekly GROUP BY service
)
SELECT * FROM ServiceStats WHERE total_admitted > 1000;

-- 2. Use multiple CTEs to break down a complex query.
WITH HighVol AS (SELECT service FROM services_weekly GROUP BY service HAVING SUM(patients_admitted) > 1000),
     StaffCount AS (SELECT service, COUNT(*) as cnt FROM staff GROUP BY service)
SELECT h.service, s.cnt FROM HighVol h JOIN StaffCount s ON h.service = s.service;

-- 3. Build a CTE for staff utilization and join it with patient data.
WITH StaffUtil AS (SELECT service, AVG(present) as avg_pres FROM staff_schedule GROUP BY service)
SELECT p.name, p.service, su.avg_pres FROM patients p JOIN StaffUtil su ON p.service = su.service LIMIT 5;

-- Daily Challenge: Comprehensive Hospital Performance Dashboard.
WITH ServiceMetrics AS (
    SELECT service, SUM(patients_admitted) AS total_admissions, SUM(patients_refused) AS total_refusals, AVG(patient_satisfaction) AS avg_satisfaction
    FROM services_weekly GROUP BY service
),
StaffPresence AS (
    SELECT staff_id, SUM(present) AS weeks_present FROM staff_schedule GROUP BY staff_id
),
StaffMetrics AS (
    SELECT s.service, COUNT(DISTINCT s.staff_id) AS total_staff, AVG(COALESCE(sp.weeks_present, 0)) AS avg_weeks_present
    FROM staff s LEFT JOIN StaffPresence sp ON s.staff_id = sp.staff_id GROUP BY s.service
),
PatientMetrics AS (
    SELECT service, AVG(age) AS avg_patient_age, COUNT(patient_id) AS total_patient_count
    FROM patients GROUP BY service
)
SELECT 
    sm.service, sm.total_admissions, sm.total_refusals, ROUND(sm.avg_satisfaction, 2) AS avg_satisfaction,
    stm.total_staff, ROUND(stm.avg_weeks_present, 2) AS avg_weeks_present,
    ROUND(pm.avg_patient_age, 2) AS avg_patient_age, pm.total_patient_count,
    ROUND(((sm.total_admissions * 100.0 / NULLIF(sm.total_admissions + sm.total_refusals, 0)) * 0.5) + (sm.avg_satisfaction * 0.5), 2) AS performance_score
FROM ServiceMetrics sm
LEFT JOIN StaffMetrics stm ON sm.service = stm.service
LEFT JOIN PatientMetrics pm ON sm.service = pm.service
ORDER BY performance_score DESC;