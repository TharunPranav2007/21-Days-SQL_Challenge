-- 1. Find patients who are in services with above-average staff count.
SELECT * FROM patients
WHERE service IN (
    SELECT service FROM staff 
    GROUP BY service 
    HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) as cnt FROM staff GROUP BY service) as t)
);

-- 2. List staff who work in services that had any week with patient satisfaction below 70.
SELECT * FROM staff
WHERE service IN (SELECT DISTINCT service FROM services_weekly WHERE patient_satisfaction < 70);

-- 3. Show patients from services where total admitted patients exceed 1000.
SELECT * FROM patients
WHERE service IN (SELECT service FROM services_weekly GROUP BY service HAVING SUM(patients_admitted) > 1000);

-- Daily Challenge: Patients admitted to services with refusals AND below-average satisfaction.
SELECT patient_id, name, service, satisfaction
FROM patients
WHERE service IN (
    SELECT service FROM services_weekly
    GROUP BY service
    HAVING MAX(patients_refused) > 0
       AND AVG(patient_satisfaction) < (SELECT AVG(patient_satisfaction) FROM services_weekly)
);