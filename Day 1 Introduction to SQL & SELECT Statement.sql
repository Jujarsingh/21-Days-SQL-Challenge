/* 
Kicking off my 21-day SQL journey!
Day 1 Challenge: List all the unique hospital services
available in the database.
*/

-- Retrieve all columns from the patients table.

SELECT * FROM patients;

-- Select only the patient_id, name, and age columns from the patients table.

SELECT patient_id, name, age
FROM patients;

-- Display the first 10 records from the services_weekly table.

SELECT *
FROM services_weekly
LIMIT 10;

-- List all unique hospital services available in the hospital.

SELECT DISTINCT service
FROM services_weekly;