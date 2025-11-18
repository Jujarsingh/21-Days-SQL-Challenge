-- Join patients and staff based on their common service field 
-- (show patient and staff who work in same service).
SELECT 
	p.name AS Patient_Name,
	s.staff_name AS Staff_Name,
    p.service AS servcie
FROM patients p
JOIN staff s
ON p.service = s.service;

-- Join services_weekly with staff to show weekly service data with staff information.
SELECT 
	sw.week,
    s.staff_id,
    s.staff_name,
    sw.service,
    s.role
FROM services_weekly sw
INNER JOIN staff s
ON sw.service = s.service;  

-- Create a report showing patient information along with staff assigned to their service.
SELECT 
	p.patient_id,
    p.name AS Patient_name,
    p.age,
    p.arrival_date,
    p.departure_date,
    p.service,
    ss.staff_id,
    ss.staff_name,
    ss.role
FROM patients p 
INNER JOIN staff_schedule ss
ON p.service = ss.service;
    
-- Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members available in their service. 
-- Only include patients from services that have more than 5 staff members. Order by number of staff descending, then by patient name.
SELECT
    p.patient_id,
    p.name AS Patient_Name,
    p.age,
    p.service,
    sc.staff_count
FROM patients  p
JOIN (
    SELECT 
        service,
        COUNT(*) AS staff_count
    FROM staff
    GROUP BY service
    HAVING COUNT(*) > 5
) sc
    ON p.service = sc.service
ORDER BY 
    sc.staff_count DESC,
    p.name ASC;
    
