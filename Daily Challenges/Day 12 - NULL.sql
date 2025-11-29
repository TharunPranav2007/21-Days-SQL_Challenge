-- 1. Find all weeks where no special event occurred.
SELECT * FROM services_weekly WHERE event IS NULL OR event = 'none';

-- 2. Count how many records have null or empty event values.
SELECT COUNT(*) FROM services_weekly WHERE event IS NULL OR event = '' OR event = 'none';

-- 3. List all services that had at least one week with a special event.
SELECT DISTINCT service FROM services_weekly WHERE event IS NOT NULL AND event != 'none';

-- Daily Challenge: Analyze event impact (With Event vs No Event).
SELECT 
    CASE 
        WHEN event IS NOT NULL AND event != 'none' THEN 'With Event'
        ELSE 'No Event'
    END AS event_status,
    COUNT(*) AS weeks_count,
    ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction,
    ROUND(AVG(staff_morale), 2) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;