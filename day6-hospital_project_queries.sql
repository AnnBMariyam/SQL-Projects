-- Day 6 SQL Practice
-- Topic: Hospital Analytics Project
-- Author: Ann B Mariyam
-- Date: 5 December 2025
-- Description: Real-world SQL queries analyzing hospital datasets.
-------------------------------------------------------
-- Problem 1: Patient Count by Disease
-- Goal: Find how many patients have each disease (top 10).
-------------------------------------------------------

SELECT 
    disease,
    COUNT(*) AS patient_count
FROM patients
GROUP BY disease
ORDER BY patient_count DESC
LIMIT 10;

-- Explanation:
-- Groups patients by disease and counts them.
-- Shows the most common conditions treated by the hospital.

-------------------------------------------------------
-- Problem 2: Appointments per Department
-- Goal: Count total appointments for each department.
-------------------------------------------------------

SELECT 
    d.department_name,
    COUNT(*) AS total_appointments
FROM appointments a
JOIN doctors doc
    ON a.doctor_id = doc.doctor_id
JOIN departments d
    ON doc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_appointments DESC;

-- Explanation:
-- Joins appointments → doctors → departments.
-- Shows which departments handle the most appointments.

-------------------------------------------------------
-- Problem 3: Average Treatment Cost by Diagnosis
-- Goal: Find average treatment cost per diagnosis.
-------------------------------------------------------

SELECT 
    diagnosis,
    AVG(treatment_cost) AS avg_treatment_cost
FROM medical_records
GROUP BY diagnosis
ORDER BY avg_treatment_cost DESC;

-- Explanation:
-- Helps identify which diagnoses are most expensive on average.

-------------------------------------------------------
-- Problem 4: Revenue by Payment Method
-- Goal: See how patients pay: cash, credit, insurance, etc.
-------------------------------------------------------

SELECT 
    payment_method,
    SUM(amount) AS total_revenue
FROM billing
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Explanation:
-- Aggregates billing amount by payment method.
-- Useful for financial planning and insurance analysis.

-------------------------------------------------------
-- Problem 5: Top 5 Cities by Patient Count (with Avg Age)
-- Goal: Find which cities send the most patients.
-------------------------------------------------------

SELECT 
    city,
    COUNT(*) AS patient_count,
    AVG(age) AS avg_age
FROM patients
GROUP BY city
ORDER BY patient_count DESC
LIMIT 5;

-- Explanation:
-- Shows main catchment areas of the hospital
-- and gives an idea of the average age in each city.

-------------------------------------------------------
-- Problem 6: Doctor Workload (Top 10 by Appointment Count)
-- Goal: Find which doctors have the most appointments.
-------------------------------------------------------

SELECT 
    doc.doctor_name,
    doc.specialization,
    COUNT(*) AS appointment_count
FROM appointments a
JOIN doctors doc
    ON a.doctor_id = doc.doctor_id
GROUP BY doc.doctor_id, doc.doctor_name, doc.specialization
ORDER BY appointment_count DESC
LIMIT 10;

-- Explanation:
-- Highlights doctors with the highest patient load.

-------------------------------------------------------
-- Problem 7: Frequent Visitors (Patients with > 3 Appointments)
-- Goal: Identify patients who visit frequently.
-------------------------------------------------------

SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    COUNT(*) AS total_appointments
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(*) > 3
ORDER BY total_appointments DESC;

-- Explanation:
-- Uses HAVING with COUNT() to filter only frequent visitors.

-------------------------------------------------------
-- Problem 8: Appointment Status per Department
-- Goal: Show appointment outcome breakdown by department.
-------------------------------------------------------

SELECT 
    d.department_name,
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count,
    SUM(CASE WHEN a.status = 'No-show' THEN 1 ELSE 0 END) AS no_show_count
FROM appointments a
JOIN doctors doc
    ON a.doctor_id = doc.doctor_id
JOIN departments d
    ON doc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY completed_count DESC;

-- Explanation:
-- Conditional aggregation to count each status separately.
-- Helps monitor reliability of appointments per department.

-------------------------------------------------------
-- Problem 9: Average Treatment Cost per Department
-- Goal: Find average treatment_cost by department.
-------------------------------------------------------

SELECT 
    d.department_name,
    AVG(m.treatment_cost) AS avg_treatment_cost
FROM medical_records m
JOIN doctors doc
    ON m.doctor_id = doc.doctor_id
JOIN departments d
    ON doc.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_treatment_cost DESC;

-- Explanation:
-- Connects medical records → doctors → departments.
-- Helps identify which departments are costliest per treatment.

-------------------------------------------------------
-- Problem 10: High-Value Patients (Total Billing > 5000)
-- Goal: Find patients who generated more than 5000 in bills.
-------------------------------------------------------

SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    SUM(b.amount) AS total_billed
FROM billing b
JOIN patients p
    ON b.patient_id = p.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING SUM(b.amount) > 5000
ORDER BY total_billed DESC;

-- Explanation:
-- Identifies high-revenue patients.
-- Could be used for VIP care programs or deeper analysis.

-------------------------------------------------------
-- End of Day 6 Queries
-------------------------------------------------------
