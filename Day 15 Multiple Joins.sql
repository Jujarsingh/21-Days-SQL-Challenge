-- Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service AS patient_service,

    s.staff_id,
    s.staff_name,
    s.role,
    s.service AS staff_service,

    ss.week AS available_week
FROM patients p
LEFT JOIN staff s
    ON p.service = s.service         
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id;
    
-- Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT
    sw.service,
    sw.week,
    sw.patients_admitted,
    sw.event,
    sw.patient_satisfaction,
	s.staff_id,
    s.staff_name,
    s.role,
	ss.week AS staff_available_week
FROM services_weekly sw
LEFT JOIN staff s
ON sw.service = s.service              
LEFT JOIN staff_schedule ss
ON s.staff_name= ss.staff_name            
AND sw.week = ss.week                  
ORDER BY
sw.service,
sw.week,
s.staff_name;

-- Create a multi-table report showing patient admissions with staff information.
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service AS patient_service,
    s.staff_id,
    s.staff_name,
    s.role,
    s.service AS staff_service,
    ss.week AS staff_available_week
FROM patients p
LEFT JOIN staff s
    ON p.service = s.service                       
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id                  
ORDER BY 
    p.name,
    s.staff_name;
    
-- Create a comprehensive service analysis report for week 20 showing: service name, 
-- total patients admitted that week, total patients refused, average patient satisfaction, 
-- count of staff assigned to service, and count of staff present that week.
-- Order by patients admitted descending.
SELECT
    sw.service,
    SUM(sw.patients_admitted) AS total_patients_admitted,
    SUM(sw.patients_refused) AS total_patients_refused,
    AVG(sw.patient_satisfaction) AS avg_satisfaction_score,
    COUNT(DISTINCT s.staff_id) AS staff_assigned,
    COUNT(DISTINCT ss.staff_id) AS staff_present_week_20
FROM services_weekly sw
LEFT JOIN staff s 
    ON sw.service = s.service
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id
    AND ss.week = 20 
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_patients_admitted DESC;
