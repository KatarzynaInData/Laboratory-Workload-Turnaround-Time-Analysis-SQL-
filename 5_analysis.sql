/* =========================================================
File: 5_analysis.sql
Database: full_lab_project
Author: [Katarzyna_In_Data]

=========================================================================================
Project: LABORATORY WORKLOAD & TURNAROUND TIME (TAT) ANALYSIS

Description: 
Process-oriented efficiency audit focused on laboratory workflow. The analysis identifies 
high-impact tests (Pareto), monitors turnaround time (TAT) deviations, and compares 
ward performance. Focus is on operational efficiency, not clinical judgment.

=========================================================================================
*/

USE full_lab_project;

-- =======================================================================================
-- MODULE 1: WORKLOAD CONCENTRATION (PARETO ANALYSIS)
-- 
-- GOAL: Identify the "high-impact" tests responsible for the majority of lab workload.
-- 
-- TECHNIQUES: Common Table Expressions (WITH), Window Functions (SUM() OVER).
-- =======================================================================================

WITH test_volume AS (
    SELECT 
        t.test_id,
        t.test_name,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    JOIN tests t ON o.test_id = t.test_id
    GROUP BY t.test_id, t.test_name
),
cumulative_orders AS (
    SELECT 
        test_id, 
        test_name, 
        total_orders,
   	    SUM(total_orders) OVER (ORDER BY total_orders DESC) AS cumulative_orders,
        SUM(total_orders) OVER () AS total_lab_orders
    FROM test_volume
)
SELECT 
    test_name,
    total_orders,
    cumulative_orders,
    ROUND(cumulative_orders * 100.0 / total_lab_orders, 2) AS cumulative_percentage 
FROM  cumulative_orders
ORDER BY  total_orders DESC;

-- =======================================================================================
-- MODULE 2: TURNAROUND TIME (TAT) AND DELAYS
-- 
-- GOAL: Analyze deviations from median targets and identify delay rates per test.
-- 
-- INSIGHT: Positive difference means slower than target; negative means faster.
-- =======================================================================================
-- 2.1. Average TAT vs. Reference Median / Średni TAT vs. Mediana referencyjna

SELECT 
    t.test_name,
    t.category,
    AVG(o.tat_minutes) AS avg_tat_minutes,
    t.TAT_med,
    ROUND(AVG(o.tat_minutes) - t.TAT_med, 1) AS tat_difference 
FROM orders o
JOIN tests t ON o.test_id = t.test_id
GROUP BY t.test_id, t.test_name, t.category, t.TAT_med
ORDER BY avg_tat_minutes DESC;

-- 2.2. Delay Rate Analysis / Analiza wskaźnika opóźnień
-- Using CASE WHEN to flag orders exceeding the delay threshold.

SELECT 
    t.test_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.tat_minutes > t.TAT_delay_threshold THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(SUM(CASE WHEN o.tat_minutes > t.TAT_delay_threshold THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id), 2) AS delayed_percentage 
FROM orders o
JOIN tests t ON o.test_id = t.test_id
GROUP BY t.test_id, t.test_name
ORDER BY delayed_percentage DESC;

-- =======================================================================================
-- MODULE 3: WARD-LEVEL PERFORMANCE COMPARISON
-- 
-- GOAL: Evaluate how different hospital units impact lab workload and delay statistics.
-- =======================================================================================
SELECT 
    w.ward_name,
    COUNT(o.order_id) AS ward_order_volume,
    AVG(o.tat_minutes) AS ward_avg_tat,
    ROUND(SUM(CASE WHEN o.tat_minutes > t.TAT_delay_threshold THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id), 2) AS ward_delay_rate
FROM orders o
JOIN patients p ON  o.patient_id = p.patient_id
JOIN wards w ON  p.ward_id = w.ward_id
JOIN tests t ON  o.test_id = t.test_id
GROUP BY  w.ward_id, w.ward_name
ORDER BY  ward_order_volume DESC;

-- =======================================================================================
-- MODULE 4: DELAY REASON DIAGNOSTICS
-- 
-- GOAL: Identify the technical or procedural root causes of delays (e.g., repetition, equipment).
--
-- Glossary of codes:
-- EQP: Equipment issues | REP: Technical repetitions | RER: Reruns
-- DIL: Dilutions | PRE: Pre-analytical issues
-- =======================================================================================
SELECT 
   	delay_reason,
    COUNT(order_id) AS occurrence_count,
	ROUND(COUNT(order_id) * 100.0 / SUM(COUNT(order_id)) OVER (), 2) AS share_percentage
FROM orders
WHERE delay_reason IS NOT NULL
GROUP BY delay_reason
ORDER BY occurrence_count DESC;

/* =======================================================================================
   KEY ANALYTICAL INSIGHTS (FINAL SUMMARY)
   =======================================================================================
   1. PARETO CONCENTRATION (44/80): 11 out of 25 tests (44%) generate nearly 80% of volume.
      The "Big Three" (Morphology, CRP, Electrolytes) account for 48.22% of the workload.
   
   2. ROUTINE STABILITY: High-volume routine tests (Morphology, Glucose) show excellent 
      stability, with deviations from the median as low as +0.4 to +0.6 minutes.
   
   3. PROCESS BOTTLENECKS: CRP is a primary bottleneck, consistently exceeding the target 
      median by 18 minutes, primarily due to technical repetitions (REP).
   
   4. STAT EFFICIENCY: Life-saving tests (Gazometria) consistently achieve times 
      BELOW the target median (-1.1 min), confirming effective prioritization for Emergency/ICU.
======================================================================================= */



