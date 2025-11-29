-- 1. Rank patients by satisfaction score within each service.
SELECT patient_id, service, satisfaction,
       RANK() OVER (PARTITION BY service ORDER BY satisfaction DESC) as sat_rank
FROM patients LIMIT 5;

-- 2. Assign row numbers to staff ordered by their name.
SELECT staff_id, staff_name,
       ROW_NUMBER() OVER (ORDER BY staff_name) as row_num
FROM staff LIMIT 5;

-- 3. Rank services by total patients admitted.
SELECT service, SUM(patients_admitted) as total_admitted,
       RANK() OVER (ORDER BY SUM(patients_admitted) DESC) as service_rank
FROM services_weekly GROUP BY service;

-- Daily Challenge: Top 3 weeks per service based on patient satisfaction.
WITH RankedWeeks AS (
    SELECT service, week, patient_satisfaction, patients_admitted,
           RANK() OVER (PARTITION BY service ORDER BY patient_satisfaction DESC) as week_rank
    FROM services_weekly
)
SELECT * FROM RankedWeeks WHERE week_rank <= 3;