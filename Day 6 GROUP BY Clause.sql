-- Count the number of patients by each service.
SELECT service, COUNT(*) as patients_count
FROM patients
GROUP BY service;


-- Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age),2) AS avg_age
FROM patients
GROUP BY service;

-- Find the total number of staff members per role.
SELECT role, count(*) AS staff_members_count
FROM staff
GROUP BY role;

/*
Daily Challenge:For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted).
Order by admission rate descending.
*/
SELECT service,
SUM(patients_admitted) AS patients_admitted_count,
SUM(patients_refused) AS patients_refused_count,
ROUND((SUM(patients_admitted)*100)/SUM(patients_request),2) AS admision_percentage
FROM services_weekly
GROUP BY service
ORDER BY admision_percentage DESC;