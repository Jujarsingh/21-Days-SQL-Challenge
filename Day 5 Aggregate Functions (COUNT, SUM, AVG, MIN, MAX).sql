-- Count the total number of patients in the hospital.
SELECT COUNT(*) AS Total_Patients
FROM patients;

-- Calculate the average satisfaction score of all patients.
SELECT ROUND(AVG(satisfaction),2) AS Avg_Satisfaction_Score
FROM patients;

-- Find the minimum and maximum age of patients.
SELECT MAX(age) AS Oldest, MIN(age) AS Youngest
from patients;

/*
Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks.
Round the average satisfaction to 2 decimal places.
*/
SELECT SUM(patients_admitted) AS Total_Patients_Admitted,
SUM(patients_refused) AS Total_Patients_Refused,
ROUND(AVG(patient_satisfaction),2) AS Avg_Patient_Satisfaction
FROM services_weekly;



