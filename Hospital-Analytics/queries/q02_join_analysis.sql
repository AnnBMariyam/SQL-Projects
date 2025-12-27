-- Hospital Analytics Project
-- File: q02_join_analysis.sql
-- Topic: JOIN Analysis
-- Author: Ann B Mariyam

-------------------------------------------------------
-- Q6: List all appointments with doctor + department info
-------------------------------------------------------
SELECT
  a.appointment_id,
  a.appointment_date,
  a.status,
  p.patient_id,
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
  d.doctor_id,
  d.doctor_name,
  dep.department_name
FROM appointments a
JOIN patients p      ON p.patient_id = a.patient_id
JOIN doctors d       ON d.doctor_id = a.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
ORDER BY a.appointment_date DESC;

-------------------------------------------------------
-- Q7: Patients who visited more than 3 times in a year
-- (using appointments table as “visits”)
-------------------------------------------------------
SELECT
  a.patient_id,
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
  YEAR(a.appointment_date) AS visit_year,
  COUNT(*) AS visit_count
FROM appointments a
JOIN patients p ON p.patient_id = a.patient_id
GROUP BY a.patient_id, patient_name, visit_year
HAVING COUNT(*) > 3
ORDER BY visit_count DESC, visit_year DESC;

-------------------------------------------------------
-- Q8: Doctors with the highest number of appointments (Top 10)
-------------------------------------------------------
SELECT
  d.doctor_id,
  d.doctor_name,
  dep.department_name,
  COUNT(*) AS appointment_count
FROM appointments a
JOIN doctors d       ON d.doctor_id = a.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
GROUP BY d.doctor_id, d.doctor_name, dep.department_name
ORDER BY appointment_count DESC
LIMIT 10;

-------------------------------------------------------
-- Q9: Most visited department
-------------------------------------------------------
SELECT
  dep.department_name,
  COUNT(*) AS total_appointments
FROM appointments a
JOIN doctors d       ON d.doctor_id = a.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
GROUP BY dep.department_name
ORDER BY total_appointments DESC
LIMIT 1;

-------------------------------------------------------
-- Q10: Patients who had appointments but no billing record
-------------------------------------------------------
SELECT DISTINCT
  p.patient_id,
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM appointments a
JOIN patients p ON p.patient_id = a.patient_id
LEFT JOIN billing b ON b.patient_id = p.patient_id
WHERE b.patient_id IS NULL
ORDER BY p.patient_id;

-------------------------------------------------------
-- Q11: Doctor revenue generated from medical_records table
-- (Revenue proxy = SUM(treatment_cost))
-------------------------------------------------------
SELECT
  d.doctor_id,
  d.doctor_name,
  dep.department_name,
  SUM(m.treatment_cost) AS doctor_revenue
FROM medical_records m
JOIN doctors d       ON d.doctor_id = m.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
GROUP BY d.doctor_id, d.doctor_name, dep.department_name
ORDER BY doctor_revenue DESC;

