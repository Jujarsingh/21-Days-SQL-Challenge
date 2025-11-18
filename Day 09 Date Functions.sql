-- Extract the year from all patient arrival dates.
SELECT 
name AS Patient_Name,
YEAR(arrival_date) AS Arrvial_Year
FROM patients;

-- Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT
name AS Patient,
DATEDIFF(departure_date, arrival_date) AS Length_of_Stay
from patients;


-- Find all patients who arrived in a specific month.
SELECT 
name AS Patinet,
arrival_date
FROM patients
WHERE month(arrival_date) = 6;

/*
Daily Challenge: Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending.
*/
SELECT 
service,
Round(AVG(DATEDIFF(departure_date, arrival_date)),2) AS Average_stay,
COUNT(*) AS Patients_Count
FROM patients
GROUP BY service
HAVING Average_stay > 7
ORDER BY Average_stay DESC;
