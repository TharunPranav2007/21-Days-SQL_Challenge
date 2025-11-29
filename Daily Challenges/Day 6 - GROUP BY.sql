-- 1. Count the number of patients by each service.
SELECT service, COUNT(*) AS patient_count FROM patients GROUP BY service;

-- 2. Calculate the average age of patients grouped by service.
SELECT service, AVG(age) AS average_age FROM patients GROUP BY service;

-- 3. Find the total number of staff members per role.
SELECT role, COUNT(*) AS staff_count FROM staff GROUP BY role;

-- Daily Challenge: Calculate admission rate per service.
SELECT 
    service,
    SUM(patients_admitted) AS total_admitted,
    SUM(patients_refused) AS total_refused,
    ROUND((SUM(patients_admitted) / SUM(patients_request)) * 100, 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;