-- 1. Combine patient names and staff names into a single list.
SELECT name AS full_name FROM patients
UNION ALL
SELECT staff_name AS full_name FROM staff;

-- 2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT * FROM patients WHERE satisfaction > 90
UNION
SELECT * FROM patients WHERE satisfaction < 50;

-- 3. List all unique names from both patients and staff tables.
SELECT name AS full_name FROM patients
UNION
SELECT staff_name AS full_name FROM staff;

-- Daily Challenge: Comprehensive personnel list for Surgery and Emergency.
SELECT patient_id AS identifier, name AS full_name, 'Patient' AS type, service
FROM patients WHERE service IN ('surgery', 'emergency')
UNION ALL
SELECT staff_id AS identifier, staff_name AS full_name, 'Staff' AS type, service
FROM staff WHERE service IN ('surgery', 'emergency')
ORDER BY type, service, full_name;