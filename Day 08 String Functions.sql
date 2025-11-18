-- Convert all patient names to uppercase.
SELECT UPPER(name) AS name_in_upper
FROM patients;

-- Find the length of each staff member's name.
SELECT staff_name, LENGTH(staff_name) AS Staff_Name_Lenth
FROM staff;

-- Concatenate staff_id and staff_name with a hyphen separator.
SELECT staff_id, staff_name,
CONCAT_WS('-', staff_id, staff_name) AS Concat_Str
FROM staff;

/*
Daily Challenge:
Create a patient summary that shows patient_id, full name in uppercase, service in lowercase,
age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length.
Only show patients whose name length is greater than 10 characters.
*/
SELECT 
patient_id, 
UPPER(name) AS patient_name,
LOWER(service) AS Service,
CASE
	WHEN age >= 65 THEN 'Senior'
    WHEN age < 65 AND age >= 18 THEN 'Adult'
    ELSE 'Minor'
END AS Age_Category,
LENGTH(name) AS Name_length
FROM patients
WHERE LENGTH(name) > 10;
