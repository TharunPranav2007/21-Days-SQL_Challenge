-- 1. Extract the year from all patient arrival dates.
SELECT YEAR(arrival_date) AS arrival_year FROM patients;

-- 2. Calculate the length of stay for each patient.
SELECT patient_id, DATEDIFF(departure_date, arrival_date) AS length_of_stay FROM patients;

-- 3. Find all patients who arrived in a specific month (e.g., December).
SELECT * FROM patients WHERE MONTH(arrival_date) = 12;

-- Daily Challenge: Services with average length of stay > 7 days.
SELECT 
    service,
    AVG(DATEDIFF(departure_date, arrival_date)) AS avg_length_of_stay,
    COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING avg_length_of_stay > 7
ORDER BY avg_length_of_stay DESC;