-- 1. Count the total number of patients in the hospital.
SELECT COUNT(*) FROM patients;

-- 2. Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) FROM patients;

-- 3. Find the minimum and maximum age of patients.
SELECT MIN(age), MAX(age) FROM patients;

-- Daily Challenge: Calculate total admissions, total refusals, and average satisfaction across all weeks.
SELECT 
    SUM(patients_admitted) AS total_admitted,
    SUM(patients_refused) AS total_refused,
    ROUND(AVG(patient_satisfaction), 2) AS avg_weekly_satisfaction
FROM services_weekly;