-- Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT 
	patient_id,
    name,
    satisfaction,
    CASE
		WHEN satisfaction > 90 THEN 'High'
        WHEN satisfaction > 75 THEN 'Mediun'
        ELSE 'low'
	END Satisfaction_Category
FROM patients;

-- Label staff roles as 'Medical' or 'Support' based on role type.
SELECT
	staff_id,
    staff_name,
    role,
    CASE role
		WHEN 'doctor' THEN 'Medical'
        WHEN 'nurse' THEN 'Support'
        ELSE 'Support'
	END Role_Type
FROM staff;

-- Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT 
	name,
    age,
    CASE 
		WHEN age > 65 THEN 'Senior'
        WHEN age > 40 THEN 'Middle Age'
        WHEN age > 18 THEN 'Young Adult'
        WHEN age >= 0 THEN 'Child'
        ELSE 'NA'
    END Age_Group
FROM patients;


/*
Create a service performance report showing service name, total patients admitted,
and a performance category based on the following:
'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. 
Order by average satisfaction descending.
*/
SELECT 
	service,
	SUM(patients_admitted) AS Total_Patients,
	ROUND(AVG(patient_satisfaction),2) AS Avg_Satisfaction,
	CASE
		WHEN AVG(patient_satisfaction) >= 85 THEN "Excellent"
        WHEN AVG(patient_satisfaction) >= 75 THEN "Good"
        WHEN AVG(patient_satisfaction) >= 65 THEN "Fair"
        ELSE "Needs Improvement"
	END Performance_Category
FROM services_weekly
GROUP BY service
ORDER BY Avg_Satisfaction DESC;
	

	