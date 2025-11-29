-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction.
SELECT patient_id, satisfaction,
    CASE 
        WHEN satisfaction >= 80 THEN 'High'
        WHEN satisfaction >= 60 THEN 'Medium'
        ELSE 'Low'
    END AS satisfaction_category
FROM patients;

-- 2. Label staff roles as 'Medical' or 'Support'.
SELECT staff_name, role,
    CASE 
        WHEN role IN ('doctor', 'nurse') THEN 'Medical'
        ELSE 'Support'
    END AS role_category
FROM staff;

-- 3. Create age groups for patients.
SELECT patient_id, age,
    CASE 
        WHEN age <= 18 THEN '0-18'
        WHEN age <= 40 THEN '19-40'
        WHEN age <= 65 THEN '41-65'
        ELSE '65+'
    END AS age_group
FROM patients;

-- Daily Challenge: Service Performance Report.
SELECT 
    service,
    SUM(patients_admitted) AS total_admitted,
    CASE 
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY AVG(patient_satisfaction) DESC;