-- Hospital Analytics Project
-- File: q03_aggregation.sql
-- Topic: Aggregations
-- Author: Ann B Mariyam

-------------------------------------------------------
-- Q12: Revenue per department
-- (Uses billing amount + joins patient->appointments->doctor->department)
-- If a patient visited multiple departments, billing may be counted multiple times.
-------------------------------------------------------
SELECT
  dep.department_name,
  SUM(b.amount) AS total_revenue
FROM billing b
JOIN appointments a  ON a.patient_id = b.patient_id
JOIN doctors d       ON d.doctor_id = a.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
GROUP BY dep.department_name
ORDER BY total_revenue DESC;

-------------------------------------------------------
-- Q13: Average treatment cost by disease/diagnosis
-- (Uses medical_records.diagnosis)
-------------------------------------------------------
SELECT
  m.diagnosis,
  ROUND(AVG(m.treatment_cost), 2) AS avg_treatment_cost
FROM medical_records m
GROUP BY m.diagnosis
ORDER BY avg_treatment_cost DESC;

-------------------------------------------------------
-- Q14: Patient volume per department (monthly)
-- (Count appointments per department per month)
-------------------------------------------------------
SELECT
  dep.department_name,
  DATE_FORMAT(a.appointment_date, '%Y-%m-01') AS month_start,
  COUNT(*) AS appointment_volume
FROM appointments a
JOIN doctors d       ON d.doctor_id = a.doctor_id
JOIN departments dep ON dep.department_id = d.department_id
GROUP BY dep.department_name, month_start
ORDER BY month_start DESC, appointment_volume DESC;

-------------------------------------------------------
-- Q15: Total revenue per payment method
-------------------------------------------------------
SELECT
  payment_method,
  SUM(amount) AS total_revenue
FROM billing
GROUP BY payment_method
ORDER BY total_revenue DESC;

-------------------------------------------------------
-- Q16: Number of cancellations per doctor
-------------------------------------------------------
SELECT
  d.doctor_id,
  d.doctor_name,
  COUNT(*) AS cancellations
FROM appointments a
JOIN doctors d ON d.doctor_id = a.doctor_id
WHERE a.status = 'Cancelled'
GROUP BY d.doctor_id, d.doctor_name
ORDER BY cancellations DESC;

