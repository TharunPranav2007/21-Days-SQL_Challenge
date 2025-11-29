-- 1. Retrieve all columns from the patients table.
SELECT * FROM patients;

-- 2. Select only patient_id, name, and age from patients.
SELECT patient_id, name, age FROM patients;

-- 3. Display the first 10 records from services_weekly.
SELECT * FROM services_weekly LIMIT 10;

-- Daily Challenge: List all unique hospital services available in the hospital.
SELECT DISTINCT service FROM services_weekly;
