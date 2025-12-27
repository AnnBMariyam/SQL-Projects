-- Hospital Analytics Project
-- File: q04_window_functions.sql
-- Topic: Window Functions
-- Author: Ann B Mariyam

-------------------------------------------------------
-- Q17: Rank doctors by revenue generated
-- (Revenue proxy = SUM(treatment_cost) from medical_records)
-------------------------------------------------------
WITH doctor_rev AS (
  SELECT
    d.doctor_id,
    d.doctor_name,
    SUM(m.treatment_cost) AS revenue
  FROM medical_records m
  JOIN doctors d ON d.doctor_id = m.doctor_id
  GROUP BY d.doctor_id, d.doctor_name
)
SELECT
  doctor_id,
  doctor_name,
  revenue,
  DENSE_RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM doctor_rev
ORDER BY revenue DESC;

-------------------------------------------------------
-- Q18: Running total of daily appointments
-------------------------------------------------------
WITH daily AS (
  SELECT
    appointment_date,
    COUNT(*) AS daily_appointments
  FROM appointments
  GROUP BY appointment_date
)
SELECT
  appointment_date,
  daily_appointments,
  SUM(daily_appointments) OVER (ORDER BY appointment_date) AS running_total_appointments
FROM daily
ORDER BY appointment_date;

-------------------------------------------------------
-- Q19: Top 3 diseases by patient count (using patients.disease)
-------------------------------------------------------
WITH disease_counts AS (
  SELECT disease, COUNT(*) AS patient_count
  FROM patients
  GROUP BY disease
)
SELECT disease, patient_count
FROM (
  SELECT
    disease,
    patient_count,
    DENSE_RANK() OVER (ORDER BY patient_count DESC) AS dr
  FROM disease_counts
) t
WHERE dr <= 3
ORDER BY patient_count DESC;

-------------------------------------------------------
-- Q20: Weekly moving average of appointments (7-day moving avg)
-------------------------------------------------------
WITH daily AS (
  SELECT
    appointment_date,
    COUNT(*) AS daily_appointments
  FROM appointments
  GROUP BY appointment_date
)
SELECT
  appointment_date,
  daily_appointments,
  ROUND(
    AVG(daily_appointments) OVER (
      ORDER BY appointment_date
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ),
    2
  ) AS moving_avg_7_days
FROM daily
ORDER BY appointment_date;

-------------------------------------------------------
-- Q21: Dense rank patients based on total bill amount
-------------------------------------------------------
WITH patient_bills AS (
  SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    SUM(b.amount) AS total_billed
  FROM patients p
  JOIN billing b ON b.patient_id = p.patient_id
  GROUP BY p.patient_id, patient_name
)
SELECT
  patient_id,
  patient_name,
  total_billed,
  DENSE_RANK() OVER (ORDER BY total_billed DESC) AS billing_rank
FROM patient_bills
ORDER BY total_billed DESC;

