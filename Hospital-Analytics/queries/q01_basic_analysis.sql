-- Hospital Analytics Project
-- File: q01_basic_analysis.sql
-- Topic: Basic KPIs & Descriptive Statistics
-- Author: Ann B Mariyam
-- Description: Basic overview queries for patients, doctors, departments, and appointments.

-------------------------------------------------------
-- Problem 1: Overall Entity Counts
-- Goal: Get total counts of patients, doctors, and departments.
-------------------------------------------------------

-- Total number of patients
SELECT COUNT(*) AS total_patients
FROM patients;

-- Total number of doctors
SELECT COUNT(*) AS total_doctors
FROM doctors;

-- Total number of departments
SELECT COUNT(*) AS total_departments
FROM departments;

-------------------------------------------------------
-- Problem 2: Most Common Diseases (Top 5)
-- Goal: Find the most frequent diagnoses among patients.
-------------------------------------------------------

SELECT disease,
       COUNT(*) AS patient_count
FROM patients
GROUP BY disease
ORDER BY patient_count DESC
LIMIT 5;

-- ORDER BY DESC shows the most common diseases first.

-------------------------------------------------------
-- Problem 3: Patient Age Summary
-- Goal: Get average, minimum, and maximum age of patients.
-------------------------------------------------------

SELECT AVG(age) AS avg_age,
       MIN(age) AS youngest_age,
       MAX(age) AS oldest_age
FROM patients;


SELECT gender,
       COUNT(*) AS patient_count,
       AVG(age) AS avg_age
FROM patients
GROUP BY gender;

-------------------------------------------------------
-- Problem 4: Appointment Volume by Status
-- Goal: See how many appointments were completed, cancelled, or no-show.
-------------------------------------------------------

SELECT status,
       COUNT(*) AS appointment_count
FROM appointments
GROUP BY status;

-------------------------------------------------------
-- Problem 5: Top 10 Cities by Patient Count
-- Goal: Find the cities with the highest number of patients.
-------------------------------------------------------

SELECT city,
       COUNT(*) AS patient_count
FROM patients
GROUP BY city
ORDER BY patient_count DESC
LIMIT 10;

-------------------------------------------------------
-- End of q01_basic_analysis.sql
-------------------------------------------------------

