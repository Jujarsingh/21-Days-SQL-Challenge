-- Find all weeks in services_weekly where no special event occurred.
SELECT
	week,
    service
FROM services_weekly
WHERE
	event IS NULL
    OR
    event = 'none';
    
-- Count how many records have null or empty event values.
SELECT 
	COUNT(*) AS Null_Event_Count
FROM services_weekly
WHERE
	event IS NULL
    OR
    event = 'none';

-- List all services that had at least one week with a special event.
SELECT 
	DISTINCT service, event
FROM services_weekly
WHERE 
	event IS NOT NULL
	AND event <> 'none';
    
/*
Daily Challenge: Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
and average staff morale. Order by average patient satisfaction descending.
*/
SELECT
    CASE 
        WHEN event IS NOT NULL AND event <> 'none' 
            THEN 'With Event'
        ELSE 'No Event'
    END AS Event_Status,
    COUNT(*) AS Week_Count,
    AVG(patient_satisfaction) AS Avg_Patient_Satisfaction,
    AVG(staff_morale) AS Avg_Staff_Morale
FROM services_weekly
GROUP BY Event_Status
ORDER BY Avg_Patient_Satisfaction DESC;
