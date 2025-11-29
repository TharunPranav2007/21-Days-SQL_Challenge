-- 1. Find services that have admitted more than 500 patients in total.
SELECT service, SUM(patients_admitted) AS total_admitted
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500;

-- 2. Show services where average patient satisfaction is below 75.
SELECT service, AVG(patient_satisfaction) AS avg_satisfaction
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) < 75;

-- 3. List weeks where total staff presence across all services was less than 50.
SELECT week, SUM(present) AS total_present
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;

-- Daily Challenge: Identify services with > 100 refusals AND avg satisfaction < 80.
SELECT 
    service, 
    SUM(patients_refused) AS total_refused, 
    AVG(patient_satisfaction) AS avg_satisfaction
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused) > 100 AND AVG(patient_satisfaction) < 80;