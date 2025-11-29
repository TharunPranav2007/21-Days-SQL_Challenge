-- 1. List all unique services in the patients table.
SELECT DISTINCT service FROM patients;

-- 2. Find all unique staff roles in the hospital.
SELECT DISTINCT role FROM staff;

-- 3. Get distinct months from the services_weekly table.
SELECT DISTINCT month FROM services_weekly;

-- Daily Challenge: Unique combinations of service and event type with counts.
SELECT service, event, COUNT(*) as count
FROM services_weekly
WHERE event IS NOT NULL AND event != 'none'
GROUP BY service, event
ORDER BY count DESC;