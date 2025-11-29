-- 1. Calculate running total of patients admitted by week for each service.
SELECT service, week, patients_admitted,
       SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) as running_total
FROM services_weekly LIMIT 5;

-- 2. Find the moving average of patient satisfaction over 4-week periods.
SELECT service, week, patient_satisfaction,
       AVG(patient_satisfaction) OVER (PARTITION BY service ORDER BY week ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) as moving_avg_4wk
FROM services_weekly LIMIT 5;

-- 3. Show cumulative patient refusals by week across all services.
SELECT week, SUM(patients_refused) as weekly_refusals,
       SUM(SUM(patients_refused)) OVER (ORDER BY week) as cumulative_refusals
FROM services_weekly GROUP BY week LIMIT 5;

-- Daily Challenge: Trend Analysis (Running Total & 3-week Moving Avg) for weeks 10-20.
WITH CalculatedData AS (
    SELECT service, week, patients_admitted, patient_satisfaction,
           SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) as running_total_admitted,
           AVG(patient_satisfaction) OVER (PARTITION BY service ORDER BY week ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as moving_avg_sat_3wk,
           AVG(patients_admitted) OVER (PARTITION BY service) as service_avg
    FROM services_weekly
)
SELECT service, week, patients_admitted, running_total_admitted, moving_avg_sat_3wk, (patients_admitted - service_avg) as diff_from_avg
FROM CalculatedData
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;