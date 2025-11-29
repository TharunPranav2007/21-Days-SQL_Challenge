-- 1. Convert all patient names to uppercase.
SELECT UPPER(name) AS upper_name FROM patients;

-- 2. Find the length of each staff member's name.
SELECT staff_name, LENGTH(staff_name) AS name_length FROM staff;

-- 3. Concatenate staff_id and staff_name with a hyphen separator.
SELECT CONCAT(staff_id, '-', staff_name) AS staff_identifier FROM staff;

-- Daily Challenge: Create a patient summary report with name length > 10.
SELECT
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service_lower,
    CASE
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
FROM patients
WHERE LENGTH(name) > 10;