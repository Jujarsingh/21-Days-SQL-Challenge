-- Find services that have admitted more than 500 patients in total.
SELECT service, 
SUM(patients_admitted) AS patients_count
FROM services_weekly
GROUP BY service
HAVING patients_count > 500
ORDER BY patients_count DESC;

-- 2.Show services where average patient satisfaction is below 75.
SELECT service,
AVG(patient_satisfaction) AS Avg_Satisfaction
FROM services_weekly
GROUP BY service
HAVING Avg_Satisfaction < 75
ORDER BY Avg_Satisfaction ASC;

-- 3.List weeks where total staff presence across all services was less than 50.
SELECT 
week, COUNT(*) AS Staff_Presence_count
FROM staff_schedule
WHERE present = 1
GROUP BY week
HAVING  Staff_Presence_count < 50
ORDER BY Staff_Presence_count;

/*
Daily Challenge:
Identify services that refused more than 100 patients in total and
had an average patient satisfaction below 80.
Show service name, total refused, and average satisfaction.
*/
SELECT service,
SUM(patients_refused) AS total_patients_refused,
AVG(patient_satisfaction) as avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING total_patients_refused > 100 AND avg_patient_satisfaction < 80;
