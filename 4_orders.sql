/* =========================================================
File: 4_orders.sql
Project: Laboratory Workload and Efficiency SQL Analysis
Database: full_lab_project
Description: Transactional seed data for 200 laboratory test orders
Date Range: 2025-12-25 to 2025-12-28
Purpose:
- Provides the core dataset for workload and efficiency audits
- Enables Turnaround Time (TAT) analysis and delay detection
- Supports Pareto analysis to identify high-impact tests
- Allows ward-level comparisons of laboratory service efficiency

Assumptions & Logic:
- Inter-departmental Workflow: Pediatric specialists provide coverage for Neonatology,
  and Internists support Emergency diagnostics to reflect realistic hospital staffing patterns.
- Strategic Modeling: Intentional delays (tat_minutes > threshold) were 
  introduced in 60-80% of critical tests for bottleneck analysis 
========================================================= */

USE full_lab_project;

/* =======================

======================= */
INSERT INTO orders 
(patient_id, doctor_id, diagnostician_id, test_id, order_datetime, tat_minutes, abnormal, delay_reason)
VALUES

				-- Pacjent 1: Anna Kowalska (1985 - Dorosła, Internal)
		(1, 1, 1, 1, '2025-12-25 08:00:00', 25, 0, NULL), -- Morfologia
		(1, 1, 2, 6, '2025-12-25 08:01:00', 28, 0, NULL), -- Glukoza
		(1, 1, 3, 8, '2025-12-25 08:02:00', 35, 0, NULL), -- Kreatynina
		(1, 1, 4, 15, '2025-12-25 08:03:00', 32, 1, NULL), -- CRP
		
		-- Pacjent 2: Piotr Nowak (1978 - Dorosły, General Surgery)
		(2, 2, 1, 1, '2025-12-25 08:10:00', 30, 0, NULL), -- Morfologia
		(2, 2, 2, 2, '2025-12-25 08:11:00', 45, 0, NULL), -- APTT
		(2, 2, 3, 3, '2025-12-25 08:12:00', 44, 0, NULL), -- PT
		(2, 2, 4, 4, '2025-12-25 08:13:00', 50, 0, NULL), -- Fibrynogen
		
		-- Pacjent 3: Maria Wiśniewska (2015 - Dziecko, Emergency)
		(3, 10, 1, 1, '2025-12-25 08:20:00', 22, 0, NULL), -- Morfologia
		(3, 10, 2, 15, '2025-12-25 08:21:00', 30, 0, NULL), -- CRP
		(3, 10, 3, 14, '2025-12-25 08:22:00', 12, 0, NULL), -- Gazometria
		
		-- Pacjent 4: Jan Zieliński (1991 - Dorosły, Internal)
		(4, 5, 1, 1, '2025-12-25 08:30:00', 26, 0, NULL), -- Morfologia
		(4, 5, 2, 7, '2025-12-25 08:31:00', 35, 0, NULL), -- Elektrolity
		(4, 5, 3, 8, '2025-12-25 08:32:00', 40, 0, NULL), -- Kreatynina
		(4, 5, 4, 9, '2025-12-25 08:33:00', 38, 0, NULL), -- Mocznik
		
		-- Pacjent 5: Katarzyna Kaczmarek (1996 - Dorosła, Internal)
		(5, 11, 1, 1, '2025-12-25 08:40:00', 25, 0, NULL), -- Morfologia
		(5, 11, 2, 10, '2025-12-25 08:41:00', 42, 0, NULL), -- ALAT
		(5, 11, 3, 11, '2025-12-25 08:42:00', 45, 0, NULL), -- ASPAT
		(5, 11, 2, 7, '2025-12-25 08:41:00', 55, 0, 'EQP'), -- Elektrolity
		(5, 11, 3, 15, '2025-12-25 08:42:00', 60, 1, 'REP'), -- CRP
		(5, 11, 5, 6, '2025-12-25 08:44:00', 28, 0,  NULL), -- Glukoza
		
		-- Pacjent 6: Marta Nowak (1987 - Dorosła, Gynecology)
		(6, 4, 1, 1, '2025-12-25 09:00:00', 27, 0, NULL), -- Morfologia
		(6, 4, 2, 4, '2025-12-25 09:01:00', 48, 0, NULL), -- Fibrynogen
		(6, 4, 3, 5, '2025-12-25 09:02:00', 50, 0, NULL), -- D-dimery
		
		-- Pacjent 7: Piotr Wiśniewski (1975 - Dorosły, Emergency)
		(7, 25, 1, 1, '2025-12-25 09:15:00', 24, 0, NULL), -- Morfologia
		(7, 25, 2, 23, '2025-12-25 09:16:00', 48, 1, NULL), -- Etanol
		(7, 25, 3, 14, '2025-12-25 09:17:00', 15, 0, NULL), -- Gazometria
		
		-- Pacjent 8: Kinga Wójcik (1993 - Dorosła, Obstetrics)
		(8, 6, 1, 1, '2025-12-25 09:30:00', 25, 0, NULL), -- Morfologia
		(8, 6, 2, 2, '2025-12-25 09:31:00', 44, 0, NULL), -- APTT
		(8, 6, 3, 3, '2025-12-25 09:32:00', 42, 0, NULL), -- PT
		(8, 6, 4, 4, '2025-12-25 09:33:00', 75, 1, 'RER'), -- Fibrynogen
		
		-- Pacjent 9: Tomasz Kaczmarek (1982 - Dorosły, Internal)
		(9, 15, 1, 1, '2025-12-25 10:00:00', 26, 0, NULL), -- Morfologia
		(9, 15, 2, 8, '2025-12-25 10:01:00', 38, 0, NULL), -- Kreatynina
		(9, 15, 3, 9, '2025-12-25 10:02:00', 36, 0, NULL), -- Mocznik
		(9, 15, 4, 15, '2025-12-25 10:03:00', 33, 0,  NULL ), -- CRP
		(9, 15, 5, 7, '2025-12-25 10:04:00', 40, 0,  NULL ), -- Elektrolity
		(9, 15, 1, 6, '2025-12-25 10:05:00', 25, 0,  NULL ), -- Glukoza
		
		-- Pacjent 10: Magdalena Lewandowska (2005 - Dorosła, Internal)
		(10, 21, 1, 1, '2025-12-25 10:15:00', 24, 0, NULL), -- Morfologia
		(10, 21, 2, 15, '2025-12-25 10:16:00', 30, 0, NULL), -- CRP
		(10, 21, 3, 12, '2025-12-25 10:17:00', 48, 0,  NULL ), -- Bilirubina całkowita
		(10, 21, 4, 10, '2025-12-25 10:18:00', 42, 0,  NULL ), -- ALAT
		(10, 21, 5, 11, '2025-12-25 10:19:00', 44, 0,  NULL ), -- ASPAT
		(10, 21, 4, 25, '2025-12-25 10:18:00', 30, 0,  NULL), -- Mocz
		
		-- Pacjent 11: Łukasz Sikora (1999 - Dorosły, Cardiology)
		(11, 17, 1, 1, '2025-12-25 10:30:00', 25, 0, NULL), -- Morfologia
		(11, 17, 2, 17, '2025-12-25 10:31:00', 55, 1, 'DIL'), -- hs Troponina T
		(11, 17, 3, 19, '2025-12-25 10:32:00', 65, 1, 'RER'), -- proBNP
		
		-- Pacjent 12: Anna Jankowska (2018 - Dziecko, Pediatrics)
		(12, 3, 1, 1, '2025-12-25 11:00:00', 22, 0, NULL), -- Morfologia
		(12, 3, 2, 15, '2025-12-25 11:01:00', 30, 0, NULL), -- CRP
		(12, 3, 3, 25, '2025-12-25 11:02:00', 35, 0, NULL), -- Mocz
		
		-- Pacjent 13: Paweł Kozłowski (1960 - Dorosły, ICU)
		(13, 7, 1, 1, '2025-12-25 11:15:00', 26, 1, NULL), -- Morfologia
		(13, 7, 2, 14, '2025-12-25 11:16:00', 12, 0, NULL), -- Gazometria
		(13, 7, 3, 15, '2025-12-25 11:17:00', 65, 1, 'DIL'), -- CRP
		(13, 7, 4, 16, '2025-12-25 11:18:00', 90, 1, 'DIL'), -- PCT
		
		-- Pacjent 14: Natalia Zielińska (1990 - Dorosła, Gynecology)
		(14, 18, 1, 1, '2025-12-25 11:30:00', 25, 0, NULL), -- Morfologia
		(14, 18, 2, 2, '2025-12-25 11:31:00', 42, 0, NULL), -- APTT
		(14, 18, 3, 3, '2025-12-25 11:32:00', 45, 0, NULL), -- PT
		(14, 18, 4, 4, '2025-12-25 11:33:00', 75, 1, 'REP'), -- Fibrynogen 
		(14, 18, 5, 15, '2025-12-25 11:34:00', 55, 1, 'DIL'), -- CRP 
		(14, 18, 6, 25, '2025-12-25 11:35:00', 35, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 15: Jakub Grabowski (2010 - Dziecko, Pediatrics)
		(15, 14, 1, 1, '2025-12-25 11:45:00', 24, 0, NULL), -- Morfologia
		(15, 14, 2, 15, '2025-12-25 11:46:00', 32, 0, NULL), -- CRP
		(15, 14, 3, 25, '2025-12-25 11:47:00', 35, 0, NULL), -- Mocz
		
		-- Pacjent 16: Monika Wojciechowska (1985 - Dorosła, Obstetrics)
		(16, 16, 1, 1, '2025-12-25 12:00:00', 27, 0, NULL), -- Morfologia
		(16, 16, 2, 6, '2025-12-25 12:01:00', 25, 0, NULL), -- Glukoza
		(16, 16, 3, 2, '2025-12-25 12:02:00', 48, 0, NULL), -- APTT
		
		-- Pacjent 17: Dariusz Rutkowski (1978 - Dorosły, General Surgery)
		(17, 7, 1, 1, '2025-12-25 12:15:00', 30, 0, NULL), -- Morfologia
		(17, 7, 2, 2, '2025-12-25 12:16:00', 44, 0, NULL), -- APTT
		(17, 7, 3, 3, '2025-12-25 12:17:00', 42, 0, NULL), -- PT
		
		-- Pacjent 18: Ewelina Piotrowska (1992 - Dorosła, Internal)
		(18, 21, 1, 1, '2025-12-25 12:30:00', 25, 0, NULL), -- Morfologia
		(18, 21, 2, 7, '2025-12-25 12:31:00', 50, 0, 'RER'), -- Elektrolity
		(18, 21, 3, 15, '2025-12-25 12:32:00', 58, 1, 'DIL'), -- CRP
		(18, 21, 3, 6, '2025-12-25 12:32:00', 28, 0, NULL), -- Glukoza
		(18, 21, 5, 16, '2025-12-25 12:34:00', 55, 1,  NULL ), -- PCT
		
		-- Pacjent 19: Rafał Kowal (1980 - Dorosły, ICU)
		(19, 19, 1, 1, '2025-12-25 12:45:00', 28, 1, NULL), -- Morfologia
		(19, 19, 2, 14, '2025-12-25 12:46:00', 14, 0, NULL), -- Gazometria
		(19, 19, 2, 16, '2025-12-25 12:46:00', 85, 1, 'DIL'), -- PCT
		(19, 19, 3, 15, '2025-12-25 12:47:00', 55, 1, 'DIL'), -- CRP
		
		-- Pacjent 20: Karolina Nowicka (2000 - Dorosła, Emergency)
		(20, 25, 1, 1, '2025-12-25 13:00:00', 26, 0, NULL), -- Morfologia
		(20, 25, 2, 23, '2025-12-25 13:01:00', 45, 1, NULL), -- Etanol
		(20, 25, 3, 6, '2025-12-25 13:02:00', 24, 0, NULL), -- Glukoza
		(20, 25, 4, 7, '2025-12-25 13:03:00', 52, 0, 'REP'), -- Elektrolity 
		(20, 25, 5, 15, '2025-12-25 13:04:00', 60, 1, 'DIL'), -- CRP 
		(20, 25, 6, 24, '2025-12-25 13:05:00', 30, 0, NULL), -- Narkotyki w moczu (test jakościowy)
		
		-- Pacjent 21: Grzegorz Maj (1972 - Dorosły, Cardiology)
		(21, 23, 1, 1, '2025-12-25 13:15:00', 28, 0, NULL), -- Morfologia
		(21, 23, 2, 17, '2025-12-25 13:16:00', 50, 1, NULL), -- hs Troponina T
		(21, 23, 3, 18, '2025-12-25 13:17:00', 48, 1, NULL), -- CK-MB
		
		-- Pacjent 22: Paulina Ciesielska (1988 - Dorosła, Obstetrics)
		(22, 24, 1, 1, '2025-12-25 13:30:00', 25, 0, NULL), -- Morfologia
		(22, 24, 4, 2, '2025-12-25 13:33:00', 44, 0, NULL), -- APTT
		(22, 24, 5, 3, '2025-12-25 13:34:00', 42, 0, NULL), -- PT
		(22, 24, 6, 4, '2025-12-25 13:35:00', 75, 1, 'REP'), -- Fibrynogen 
		(22, 24, 7, 15, '2025-12-25 13:36:00', 60, 1, 'DIL'), -- CRP 
		(22, 24, 2, 21, '2025-12-25 13:31:00', 180, 0, NULL), -- HCV Ab
		(22, 24, 3, 22, '2025-12-25 13:32:00', 180, 0, NULL), -- HIV
		
		-- Pacjent 23: Damian Wróblewski (1995 - Dorosły, Internal)
		(23, 9, 1, 1, '2025-12-25 13:45:00', 27, 0, NULL), -- Morfologia
		(23, 9, 2, 6, '2025-12-25 13:46:00', 30, 0, NULL), -- Glukoza
		(23, 9, 3, 15, '2025-12-25 13:47:00', 35, 1, NULL), -- CRP
		(23, 9, 4, 10, '2025-12-25 13:48:00', 45, 0,  NULL ), -- ALAT
		(23, 9, 5, 11, '2025-12-25 13:49:00', 45, 0,  NULL) , -- ASPAT
		(23, 9, 1, 12, '2025-12-25 13:50:00', 50, 0,  NULL ), -- Bilirubina c
		
		-- Pacjent 24: Barbara Michalska (1979 - Dorosła, Internal)
		(24, 1, 1, 1, '2025-12-25 14:00:00', 26, 0, NULL), -- Morfologia
		(24, 1, 2, 14, '2025-12-25 14:01:00', 15, 0, NULL), -- Gazometria
		(24, 1, 3, 16, '2025-12-25 14:02:00', 50, 1, NULL), -- PCT
		
		-- Pacjent 25: Tomasz Sobczak (1983 - Dorosły, General Surgery)
		(25, 19, 1, 1, '2025-12-25 14:15:00', 31, 0, NULL), -- Morfologia
		(25, 19, 2, 2, '2025-12-25 14:16:00', 48, 0, NULL), -- APTT
		(25, 19, 3, 3, '2025-12-25 14:17:00', 46, 0, NULL), -- PT
		
		-- Pacjent 26: Kamil Kwiatkowski (Wiek 34, Internal)
		(26, 1, 1, 1,  '2025-12-26 08:00:00', 25, 0, NULL), -- Morfologia 
		(26, 1, 2, 6,  '2025-12-26 08:01:00', 30, 0, NULL), -- Glukoza 
		(26, 1, 2, 7, '2025-12-26 08:01:00', 55, 0, 'EQP'), -- Elektrolity
		(26, 1, 3, 15, '2025-12-26 08:02:00', 60, 1, 'REP'), -- CRP
		(26, 1, 5, 12, '2025-12-26 08:04:00', 45, 0,  NULL  ), -- Bilirubina całkowita
		(26, 1, 6, 8, '2025-12-26 08:05:00', 35, 0,  NULL  ), -- Kreatynina
		
		 
		-- Pacjent 27: Julia Sikorska (Wiek 41, Gynecology) 
		(27, 4, 1, 1,  '2025-12-26 08:15:00', 24, 0, NULL), -- Morfologia 
		(27, 4, 2, 4, '2025-12-26 08:16:00', 75, 1, 'REP'), -- Fibrynogen
		(27, 4, 3, 21, '2025-12-26 08:17:00', 250, 0, 'PRE'), -- HCV Ab
		(27, 4, 4, 22, '2025-12-26 08:18:00', 250, 0, 'PRE'), -- HIV Ag/Ab
		
		-- Pacjent 28: Michał Wojciechowski (Wiek 49, ICU) 
		(28, 7, 1, 1,  '2025-12-26 08:30:00', 25, 1, NULL), -- Morfologia 
		(28, 7, 2, 14, '2025-12-26 08:31:00', 15, 0, NULL), -- Gazometria 
		(28, 7, 3, 16, '2025-12-26 08:32:00', 95, 1, 'DIL'), -- PCT
		(28, 7, 4, 15, '2025-12-26 08:33:00', 55, 1, 'REP'), -- CRP
		(28, 7, 4, 8,  '2025-12-26 08:33:00', 40, 0, NULL), -- Kreatynina
		
		-- Pacjent 29: Agnieszka Zielińska (Wiek 35, Obstetrics) 
		(29, 6, 1, 1,  '2025-12-26 08:45:00', 26, 0, NULL), -- Morfologia 
		(29, 6, 2, 2,  '2025-12-26 08:46:00', 45, 0, NULL), -- APTT 
		(29, 6, 3, 3,  '2025-12-26 08:47:00', 44, 0, NULL), -- PT
		(29, 6, 2, 4, '2025-12-26 08:46:00', 70, 0, 'RER'), -- Fibrynogen
		(29, 6, 3, 21, '2025-12-26 08:47:00', 245, 0, 'EQP'), -- HCV Ab
		(29, 6, 4, 22, '2025-12-26 08:48:00', 245, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 30: Łukasz Nowak (Wiek 22, Internal) 
		(30, 5, 1, 1,  '2025-12-26 09:00:00', 25, 0, NULL), -- Morfologia 
		(30, 5, 2, 23, '2025-12-26 09:01:00', 48, 1, NULL), -- Etanol 
		(30, 5, 3, 24, '2025-12-26 09:02:00', 30, 0, NULL), -- Narkotyki
		
		-- Pacjent 31: Anna Kowalczyk (Wiek 8, Pediatrics) 
		(31, 3, 1, 1,  '2025-12-26 09:15:00', 22, 0, NULL), -- Morfologia 
		(31, 3, 2, 15, '2025-12-26 09:16:00', 30, 0, NULL), -- CRP 
		(31, 3, 3, 25, '2025-12-26 09:17:00', 30, 0, NULL), -- Mocz
		
		-- Pacjent 32: Paweł Wiśniewski (Wiek 36, Cardiology) 
		(32, 13, 1, 1,  '2025-12-26 09:30:00', 25, 0, NULL), -- Morfologia 
		(32, 13, 2, 17, '2025-12-26 09:31:00', 55, 1, NULL), -- hs Troponina T 
		(32, 13, 3, 19, '2025-12-26 09:32:00', 60, 1, NULL), -- proBNP
		
		-- Pacjent 33: Karolina Jankowska (Wiek 40, Obstetrics) 
		(33, 16, 1, 1,  '2025-12-26 09:45:00', 26, 0, NULL), -- Morfologia 
		(33, 16, 2, 5,  '2025-12-26 09:46:00', 42, 0, NULL), -- D-dimery 
		(33, 16, 3, 6,  '2025-12-26 09:47:00', 28, 0, NULL), -- Glukoza
		
		-- Pacjent 34: Mateusz Lewandowski (Wiek 47, Emergency) 
		(34, 25, 1, 1,  '2025-12-26 10:00:00', 24, 0, NULL), -- Morfologia 
		(34, 25, 2, 14, '2025-12-26 10:01:00', 12, 0, NULL), -- Gazometria 
		(34, 25, 3, 23, '2025-12-26 10:02:00', 190, 1, 'EQP'), -- Etanol
		
		-- Pacjent 35: Barbara Wróblewska (Wiek 60, Gynecology) 
		(35, 12, 1, 1,  '2025-12-26 10:15:00', 28, 0, NULL), -- Morfologia
		(35, 12, 2, 15, '2025-12-26 10:16:00', 35, 0, NULL), -- CRP 
		(35, 12, 3, 8,  '2025-12-26 10:17:00', 40, 0, NULL), -- Kreatynina
		
		-- Pacjent 36: Dawid Grabowski (Wiek 33, Internal) 
		(36, 9, 1, 1,  '2025-12-26 10:30:00', 25, 0, NULL), -- Morfologia
		(36, 15, 2, 7, '2025-12-26 10:31:00', 50, 0, 'RER'), -- Elektrolity
		(36, 15, 3, 15, '2025-12-26 10:32:00', 58, 1, 'DIL'), -- CRP 
		(36, 9, 2, 10, '2025-12-26 10:31:00', 42, 0, NULL), -- ALAT 
		(36, 9, 3, 11, '2025-12-26 10:32:00', 45, 0, NULL), -- ASPAT
		
		-- Pacjent 37: Magdalena Rutkowska (Wiek 24, Internal) 
		(37, 11, 1, 1,  '2025-12-26 10:45:00', 26, 0, NULL), -- Morfologia 
		(37, 11, 2, 6,  '2025-12-26 10:46:00', 25, 0, NULL), -- Glukoza 
		(37, 11, 3, 15, '2025-12-26 10:47:00', 32, 0, NULL), -- CRP
		
		-- Pacjent 38: Tomasz Piotrowski (Wiek 43, Cardiology) 
		(38, 17, 1, 1,  '2025-12-26 11:00:00', 25, 0, NULL), -- Morfologia 
		(38, 17, 2, 17, '2025-12-26 11:01:00', 50, 1, NULL), -- hs Troponina T 
		(38, 17, 3, 18, '2025-12-26 11:02:00', 50, 1, NULL), -- CK-MB
		
		-- Pacjent 39: Ewa Kaczmarek (Wiek 27, Gynecology) 
		(39, 18, 1, 1,  '2025-12-26 11:15:00', 27, 0, NULL), -- Morfologia 
		(39, 18, 2, 21, '2025-12-26 11:16:00', 180, 0, NULL), -- HCV Ab 
		(39, 18, 3, 22, '2025-12-26 11:17:00', 180, 0, NULL), -- HIV Ag/Ab
		
		-- Pacjent 40: Rafał Nowicki (Wiek 55, General Surgery) 
		(40, 19, 1, 1,  '2025-12-26 11:30:00', 28, 0, NULL), -- Morfologia 
		(40, 19, 2, 2,  '2025-12-26 11:31:00', 45, 0, NULL), -- APTT 
		(40, 19, 3, 3,  '2025-12-26 11:32:00', 44, 0, NULL), -- PT
		
		-- Pacjent 41: Monika Michalska (Wiek 38, Obstetrics) 
		(41, 24, 1, 1,  '2025-12-26 11:45:00', 26, 0, NULL), -- Morfologia 
		(41, 24, 2, 6,  '2025-12-26 11:46:00', 30, 0, NULL), -- Glukoza 
		(41, 24, 3, 15, '2025-12-26 11:47:00', 35, 1, NULL), -- CRP
		
		-- Pacjent 42: Jakub Wojcik (Wiek 20, Internal) 
		(42, 15, 1, 1,  '2025-12-26 12:00:00', 25, 0, NULL), -- Morfologia 
		(42, 25, 2, 12, '2025-12-25 12:01:00', 45, 0,  NULL ), -- Bilirubina całkowita
		(42, 25, 3, 10, '2025-12-25 12:02:00', 42, 0,  NULL ), -- ALAT
		(42, 25, 4, 7, '2025-12-25 12:03:00', 52, 0, 'EQP'), -- Elektrolity
		(42, 25, 5, 15, '2025-12-25 12:04:00', 58, 1, 'REP'), -- CRP
		
		-- Pacjent 43: Natalia Lewandowska (Wiek 30, Internal) 
		(43, 20, 1, 1,  '2025-12-26 12:15:00', 27, 0, NULL), -- Morfologia 
		(43, 20, 2, 10, '2025-12-26 12:16:00', 45, 0, NULL), -- ALAT 
		(43, 20, 3, 11, '2025-12-26 12:17:00', 48, 0, NULL), -- ASPAT
		
		-- Pacjent 44: Krzysztof Kowal (Wiek 44, ICU) 
		(44, 2, 1, 1,  '2025-12-26 12:30:00', 25, 1, NULL), -- Morfologia 
		(44, 2, 2, 14, '2025-12-26 12:31:00', 14, 0, NULL), -- Gazometria 
		(44, 2, 3, 15, '2025-12-26 12:32:00', 60, 1, 'DIL'), -- CRP
		(44, 2, 3, 16, '2025-12-26 12:32:00', 65, 1, 'REP'), -- PCT
		
		-- Pacjent 45: Paulina Grabowska (Wiek 25, Gynecology) 
		(45, 12, 1, 1,  '2025-12-26 12:45:00', 26, 0, NULL), -- Morfologia 
		(45, 12, 2, 4,  '2025-12-26 12:46:00', 48, 0, NULL), -- Fibrynogen 
		(45, 12, 3, 5,  '2025-12-26 12:47:00', 50, 0, NULL), -- D-dimery
		
		-- Pacjent 46: Mateusz Sobczak (Wiek 32, Cardiology) 
		(46, 23, 1, 1,  '2025-12-26 13:00:00', 25, 0, NULL), -- Morfologia 
		(46, 23, 2, 17, '2025-12-26 13:01:00', 55, 1, NULL), -- hs Troponina T 
		(46, 23, 3, 19, '2025-12-26 13:02:00', 60, 1, NULL), -- proBNP
		
		-- Pacjent 47: Anna Rutkowska (Wiek 39, Obstetrics) 
		(47, 8, 1, 1,  '2025-12-26 13:15:00', 27, 0, NULL), -- Morfologia 
		(47, 8, 2, 2,  '2025-12-26 13:16:00', 45, 0, NULL), -- APTT 
		(47, 8, 3, 3,  '2025-12-26 13:17:00', 42, 0, NULL), -- PT
		
		-- Pacjent 48: Michał Wróblewski (Wiek 50, Internal) 
		(48, 21, 1, 1,  '2025-12-26 13:30:00', 25, 0, NULL), -- Morfologia 
		(48, 21, 2, 7, '2025-12-26 13:31:00', 55, 0, 'EQP'), -- Elektrolity
		(48, 21, 3, 15, '2025-12-26 13:32:00', 62, 0, 'DIL'), -- CRP
		(48, 21, 4, 6, '2025-12-26 13:33:00', 25, 0,  NULL), -- Glukoza
		(48, 21, 5, 12, '2025-12-26 13:34:00', 50, 0,  NULL), -- Bilirubina całkowita
		(48, 21, 2, 8,  '2025-12-26 13:31:00', 38, 0, NULL), -- Kreatynina 
		(48, 21, 3, 9,  '2025-12-26 13:32:00', 40, 0, NULL), -- Mocznik
		
		-- Pacjent 49: Katarzyna Piotrowska (Wiek 33, Gynecology) 
		(49, 18, 1, 1,  '2025-12-26 13:45:00', 26, 0, NULL), -- Morfologia 
		(49, 18, 2, 15, '2025-12-26 13:46:00', 35, 1, NULL), -- CRP 
		(49, 18, 3, 6,  '2025-12-26 13:47:00', 28, 0, NULL), -- Glukoza
		
		-- Pacjent 50: Łukasz Nowakowski (Wiek 23, Internal) 
		(50, 1, 1, 1,  '2025-12-26 14:00:00', 25, 0, NULL), -- Morfologia 
		(50, 1, 2, 6, '2025-12-25 14:01:00', 25, 0,  NULL), -- Glukoza
		(50, 1, 3, 11, '2025-12-25 14:02:00', 40, 0,  NULL), -- ASPAT
		(50, 1, 4, 15, '2025-12-25 14:03:00', 60, 1, 'DIL'), -- CRP
		(50, 1, 5, 16, '2025-12-25 14:04:00', 85, 1, 'REP'), -- PCT
		
		-- Pacjent 51: Barbara Zielińska (1969 - Dorosła, Gynecology)
		(51, 4, 1, 1, '2025-12-26 08:00:00', 25, 0,  NULL), -- Morfologia
		(51, 4, 2, 4, '2025-12-26 08:01:00', 70, 0, 'PRE'), -- Fibrynogen
		(51, 4, 3, 21, '2025-12-26 08:02:00', 210, 0, 'EQP'), -- HCV Ab
		(51, 4, 4, 22, '2025-12-26 08:03:00', 205, 0, 'PRE'), -- HIV Ag/Ab
		(51, 4, 5, 15, '2025-12-26 08:04:00', 30, 0,  NULL), -- CRP
		
		-- Pacjent 52: Tomasz Kowalczyk (1988 - Dorosły, Internal)
		(52, 25, 1, 1, '2025-12-26 08:15:00', 24, 0,  NULL), -- Morfologia
		(52, 25, 2, 7, '2025-12-26 08:16:00', 55, 0, 'EQP'), -- Elektrolity
		(52, 25, 3, 15, '2025-12-26 08:17:00', 50, 1, 'REP'), -- CRP
		(52, 25, 4, 10, '2025-12-26 08:18:00', 42, 0,  NULL), -- ALAT
		(52, 25, 5, 6, '2025-12-26 08:19:00', 25, 0,  NULL), -- Glukoza
		
		-- Pacjent 53: Ewa Wiśniewska (1999 - Dorosła, Obstetrics)
		(53, 6, 1, 1, '2025-12-26 08:30:00', 26, 0,  NULL), -- Morfologia
		(53, 6, 5, 2, '2025-12-26 08:34:00', 40, 0,  NULL), -- APTT
		(53, 6, 2, 4, '2025-12-26 08:31:00', 75, 1, 'RER'), -- Fibrynogen
		(53, 6, 3, 21, '2025-12-26 08:32:00', 250, 0, 'PRE'), -- HCV Ab
		(53, 6, 4, 22, '2025-12-26 08:33:00', 260, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 54: Dawid Lewandowski (1984 - Dorosły, Cardiology)
		(54, 13, 1, 1, '2025-12-26 08:45:00', 25, 0,  NULL), -- Morfologia
		(54, 13, 5, 15, '2025-12-26 08:49:00', 52, 0, 'REP'), -- CRP
		(54, 13, 2, 17, '2025-12-26 08:46:00', 55, 1,  NULL), -- hs Troponina T
		(54, 13, 4, 18, '2025-12-26 08:48:00', 68, 1, 'RER'), -- CK-MB
		(54, 13, 3, 19, '2025-12-26 08:47:00', 60, 1,  NULL), -- proBNP
		
		-- Pacjent 55: Magdalena Wojciechowska (2004 - Dorosła, Internal)
		(55, 1, 1, 1, '2025-12-26 09:00:00', 25, 0,  NULL), -- Morfologia
		(55, 1, 2, 7, '2025-12-26 09:01:00', 52, 0, 'RER'), -- Elektrolity
		(55, 1, 3, 15, '2025-12-26 09:02:00', 60, 1, 'DIL'), -- CRP
		(55, 1, 4, 16, '2025-12-26 09:03:00', 55, 0,  NULL), -- PCT
		(55, 1, 5, 6, '2025-12-26 09:04:00', 25, 0,  NULL), -- Glukoza
		
		-- Pacjent 56: Rafał Grabowski (1977 - Dorosły, General Surgery)
		(56, 7, 1, 1, '2025-12-26 09:15:00', 30, 0,  NULL), -- Morfologia
		(56, 7, 2, 2, '2025-12-26 09:16:00', 45, 0,  NULL), -- APTT
		(56, 7, 3, 3, '2025-12-26 09:17:00', 44, 0,  NULL), -- PT
		(56, 7, 4, 4, '2025-12-26 09:18:00', 48, 0,  NULL), -- Fibrynogen
		
		-- Pacjent 57: Paulina Kowal (1991 - Dorosła, Gynecology)
		(57, 12, 1, 1, '2025-12-26 09:30:00', 25, 0,  NULL), -- Morfologia
		(57, 12, 2, 15, '2025-12-26 09:31:00', 30, 0,  NULL), -- CRP
		(57, 12, 3, 25, '2025-12-26 09:32:00', 35, 0,  NULL), -- Mocz
		
		-- Pacjent 58: Jakub Rutkowski (2000 - Dorosły, Internal)
		(58, 15, 1, 1, '2025-12-26 10:00:00', 25, 0,  NULL), -- Morfologia
		(58, 15, 2, 7, '2025-12-26 10:01:00', 58, 0, 'RER'), -- Elektrolity
		(58, 15, 3, 15, '2025-12-26 10:02:00', 60, 1, 'DIL'), -- CRP
		(58, 15, 4, 10, '2025-12-26 10:03:00', 42, 0,  NULL), -- ALAT
		(58, 15, 5, 11, '2025-12-26 10:04:00', 40, 0,  NULL), -- ASPAT
		(58, 15, 6, 12, '2025-12-26 10:05:00', 50, 0,  NULL), -- Bilirubina całkowita
		
		-- Pacjent 59: Natalia Michalska (1994 - Dorosła, Obstetrics)
		(59, 16, 1, 1, '2025-12-26 10:15:00', 26, 0,  NULL), -- Morfologia
		(59, 16, 2, 4, '2025-12-26 10:16:00', 72, 0, 'REP'), -- Fibrynogen
		(59, 16, 3, 22, '2025-12-26 10:17:00', 255, 0, 'PRE'), -- HIV Ag/Ab
		(59, 16, 4, 6, '2025-12-26 10:18:00', 25, 0,  NULL), -- Glukoza
		
		-- Pacjent 60: Mateusz Piotrowski (1985 - Dorosły, Internal)
		(60, 11, 1, 1, '2025-12-26 10:30:00', 25, 0,  NULL), -- Morfologia
		(60, 11, 2, 7, '2025-12-26 10:31:00', 50, 0, 'EQP'), -- Elektrolity
		(60, 11, 3, 15, '2025-12-26 10:32:00', 55, 0, 'REP'), -- CRP
		(60, 11, 4, 8, '2025-12-26 10:33:00', 35, 0,  NULL), -- Kreatynina
		(60, 11, 5, 9, '2025-12-26 10:34:00', 35, 0,  NULL), -- Mocznik
		
		-- Pacjent 61: Monika Wróblewska (1987 - Dorosła, Obstetrics)
		(61, 8, 1, 1, '2025-12-26 11:00:00', 25, 0,  NULL ), -- Morfologia
		(61, 8, 2, 4, '2025-12-26 11:01:00', 78, 1, 'RER'), -- Fibrynogen
		(61, 8, 3, 15, '2025-12-26 11:02:00', 30, 0,  NULL), -- CRP
		
		-- Pacjent 62: Krzysztof Lewandowski (1979 - Dorosły, ICU)
		(62, 2, 1, 1, '2025-12-26 11:15:00', 26, 0,  NULL), -- Morfologia
		(62, 2, 2, 14, '2025-12-26 11:16:00', 15, 0,  NULL), -- Gazometria
		(62, 2, 3, 16, '2025-12-26 11:17:00', 95, 1, 'REP'), -- PCT
		(62, 2, 4, 15, '2025-12-26 11:18:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 63: Karolina Nowak (2003 - Dorosła, Gynecology)
		(63, 18, 1, 1, '2025-12-26 11:30:00', 25, 0,  NULL), -- Morfologia
		(63, 18, 2, 21, '2025-12-26 11:31:00', 60, 0,  NULL), -- HCV Ab
		(63, 18, 3, 22, '2025-12-26 11:32:00', 60, 0,  NULL), -- HIV Ag/Ab
		
		-- Pacjent 64: Tomasz Kwiatkowski (1990 - Dorosły, Cardiology)
		(64, 23, 1, 1, '2025-12-26 11:45:00', 25, 0,  NULL), -- Morfologia
		(64, 23, 2, 17, '2025-12-26 11:46:00', 45, 1,  NULL), -- hs Troponina T
		(64, 23, 3, 18, '2025-12-26 11:47:00', 45, 0,  NULL), -- CK-MB
		
		-- Pacjent 65: Anna Grabowska (1996 - Dorosła, Internal)
		(65, 1, 1, 1, '2025-12-26 12:00:00', 25, 0,  NULL), -- Morfologia
		(65, 1, 2, 7, '2025-12-26 12:01:00', 50, 0, 'EQP'), -- Elektrolity
		(65, 1, 3, 15, '2025-12-26 12:02:00', 58, 0, 'DIL'), -- CRP
		(65, 1, 4, 6, '2025-12-26 12:03:00', 25, 0,  NULL), -- Glukoza
		(65, 1, 5, 10, '2025-12-26 12:04:00', 42, 0,  NULL), -- ALAT
		
		-- Pacjent 66: Michał Sikora (1983 - Dorosły, Cardiology)
		(66, 17, 1, 1, '2025-12-26 12:15:00', 25, 0,  NULL), -- Morfologia
		(66, 17, 2, 17, '2025-12-26 12:16:00', 50, 1,  null), -- hs Troponina T
		(66, 17, 3, 19, '2025-12-26 12:17:00', 55, 1,  NULL), -- proBNP
		
		-- Pacjent 67: Agnieszka Wojciechowska (1991 - Dorosła, Obstetrics)
		(67, 6, 1, 1, '2025-12-26 12:30:00', 25, 0,  NULL), -- Morfologia
		(67, 6, 4, 3, '2025-12-26 12:33:00', 40, 0,  NULL ), -- PT
		(67, 6, 2, 4, '2025-12-26 12:31:00', 70, 0, 'PRE'), -- Fibrynogen
		(67, 6, 3, 21, '2025-12-26 12:32:00', 260, 0, 'EQP'), -- HCV Ab
		
		-- Pacjent 68: Łukasz Kaczmarek (2004 - Dorosły, Internal)
		(68, 9, 1, 1, '2025-12-26 12:45:00', 25, 0,  NULL), -- Morfologia
		(68, 9, 2, 7, '2025-12-26 12:46:00', 30, 0,  NULL), -- Elektrolity
		(68, 9, 3, 15, '2025-12-26 12:47:00', 60, 1, 'DIL'), -- CRP
		(68, 9, 4, 16, '2025-12-26 12:48:00', 55, 0,  NULL), -- PCT
		(68, 9, 5, 6, '2025-12-26 12:49:00', 25, 0,  NULL), -- Glukoza
		
		-- Pacjent 69: Karolina Lewandowska (1998 - Dorosła, Gynecology)
		(69, 4, 1, 1, '2025-12-26 13:00:00', 25, 0,  NULL), -- Morfologia
		(69, 4, 2, 15, '2025-12-26 13:01:00', 30, 0,  NULL), -- CRP
		(69, 4, 3, 25, '2025-12-26 13:02:00', 30, 0,  NULL), -- Mocz
		
		-- Pacjent 70: Mateusz Rutkowski (1975 - Dorosły, Internal)
		(70, 5, 1, 1, '2025-12-26 13:15:00', 25, 0,  NULL), -- Morfologia
		(70, 5, 2, 7, '2025-12-26 13:16:00', 52, 0, 'RER'), -- Elektrolity
		(70, 5, 3, 15, '2025-12-26 13:17:00', 58, 0, 'REP'), -- CRP
		(70, 5, 4, 10, '2025-12-26 13:18:00', 40, 0,  NULL), -- ALAT
		(70, 5, 5, 11, '2025-12-26 13:19:00', 40, 0,  NULL), -- ASPAT
		
		-- Pacjent 71: Paulina Wiśniewska (2002 - Dorosła, Obstetrics)
		(71, 24, 1, 1, '2025-12-26 13:30:00', 25, 0,  NULL), -- Morfologia
		(71, 24, 2, 4, '2025-12-26 13:31:00', 75, 1, 'RER'), -- Fibrynogen
		(71, 24, 3, 2, '2025-12-26 13:32:00', 40, 0,  NULL), -- APTT
		(71, 24, 4, 6, '2025-12-26 13:33:00', 25, 0,  NULL), -- Glukoza
		
		-- Pacjent 72: Jakub Grabowski (1995 - Dorosły, Cardiology)
		(72, 13, 1, 1, '2025-12-26 13:45:00', 25, 0,  NULL), -- Morfologia
		(72, 13, 2, 17, '2025-12-26 13:46:00', 50, 1,  NULL), -- hs Troponina T
		(72, 13, 3, 19, '2025-12-26 13:47:00', 55, 1,  NULL), -- proBNP
		
		-- Pacjent 73: Natalia Nowak (2018 - Dziecko, Pediatrics)
		(73, 3, 1, 1, '2025-12-26 14:00:00', 22, 0,  NULL), -- Morfologia
		(73, 3, 2, 15, '2025-12-26 14:01:00', 30, 0,  NULL), -- CRP
		(73, 3, 3, 25, '2025-12-26 14:02:00', 30, 0,  NULL), -- Mocz
		
		-- Pacjent 74: Rafał Kowalczyk (1981 - Dorosły, General Surgery)
		(74, 19, 1, 1, '2025-12-26 14:15:00', 30, 0,  NULL), -- Morfologia
		(74, 19, 2, 2, '2025-12-26 14:16:00', 45, 0,  NULL), -- APTT
		(74, 19, 3, 3, '2025-12-26 14:17:00', 44, 0,  NULL), -- PT
		
		-- Pacjent 75: Monika Wróblewska (1993 - Dorosła, Gynecology)
		(75, 12, 1, 1, '2025-12-26 14:30:00', 25, 0, NULL), -- Morfologia
		(75, 12, 2, 15, '2025-12-26 14:31:00', 30, 0, NULL), -- CRP
		(75, 12, 3, 6, '2025-12-26 14:32:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 76: Krzysztof Lewandowski (1986 - Dorosły, ICU)
		(76, 2, 4, 1, '2025-12-26 15:00:00', 25, 0, NULL), -- Morfologia
		(76, 2, 5, 16, '2025-12-26 15:01:00', 95, 1, 'REP'), -- PCT
		(76, 2, 6, 15, '2025-12-26 15:02:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 77: Ewa Kowal (2001 - Dorosła, Obstetrics)
		(77, 6, 7, 1, '2025-12-26 15:15:00', 25, 0, NULL), -- Morfologia
		(77, 6, 8, 4, '2025-12-26 15:16:00', 75, 1, 'PRE'), -- Fibrynogen
		(77, 6, 9, 21, '2025-12-26 15:17:00', 250, 0, 'EQP'), -- HCV Ab
		
		-- Pacjent 78: Dawid Rutkowski (2005 - Dorosły, przeniesiony z Pediatrics do Internal)
		(78, 1, 10, 1, '2025-12-26 15:30:00', 28, 0, NULL), -- Morfologia
		(78, 1, 1, 7, '2025-12-26 15:31:00', 55, 0, 'EQP'), -- Elektrolity
		(78, 1, 2, 15, '2025-12-26 15:32:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 79: Magdalena Piotrowska (1990 - Dorosła, przeniesiona z Neonatology do Internal)
		(79, 5, 3, 1, '2025-12-26 15:45:00', 25, 0, NULL), -- Morfologia
		(79, 5, 4, 15, '2025-12-26 15:46:00', 58, 1, 'DIL'), -- CRP
		(79, 5, 5, 7, '2025-12-26 15:47:00', 52, 0, 'RER'), -- Elektrolity
		
		-- Pacjent 80: Tomasz Wojciechowski (1988 - Dorosły, Internal)
		(80, 11, 6, 1, '2025-12-26 16:00:00', 25, 0, NULL), -- Morfologia
		(80, 11, 7, 10, '2025-12-26 16:01:00', 42, 0, NULL), -- ALAT
		(80, 11, 8, 6, '2025-12-26 16:02:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 81: Anna Lewandowska (1997 - Dorosła, Gynecology)
		(81, 18, 9, 1, '2025-12-26 16:15:00', 25, 0, NULL), -- Morfologia
		(81, 18, 10, 21, '2025-12-26 16:16:00', 240, 0, 'PRE'), -- HCV Ab
		(81, 18, 1, 15, '2025-12-26 16:17:00', 30, 0, NULL), -- CRP
		
		-- Pacjent 82: Łukasz Grabowski (2003 - Dorosły, przeniesiony z Pediatrics do Internal)
		(82, 15, 2, 1, '2025-12-26 16:30:00', 25, 0, NULL), -- Morfologia
		(82, 15, 3, 7, '2025-12-26 16:31:00', 50, 0, 'EQP'), -- Elektrolity
		(82, 15, 4, 15, '2025-12-26 16:32:00', 60, 1, 'REP'), -- CRP
		
		-- Pacjent 83: Barbara Nowakowska (1965 - Dorosła, Gynecology)
		(83, 4, 5, 1, '2025-12-26 16:45:00', 28, 0, NULL), -- Morfologia
		(83, 4, 6, 4, '2025-12-26 16:46:00', 48, 0, NULL), -- Fibrynogen
		(83, 4, 7, 15, '2025-12-26 16:47:00', 32, 0, NULL), -- CRP
		
		-- Pacjent 84: Jakub Kaczmarek (2000 - Dorosły, Cardiology)
		(84, 13, 8, 1, '2025-12-26 17:00:00', 25, 0, NULL), -- Morfologia
		(84, 13, 9, 17, '2025-12-26 17:01:00', 55, 1, NULL), -- hs Troponina T
		(84, 13, 10, 19, '2025-12-26 17:02:00', 70, 1, 'DIL'), -- proBNP
		
		-- Pacjent 85: Natalia Sikorska (1994 - Dorosła, Obstetrics)
		(85, 24, 1, 1, '2025-12-26 17:15:00', 26, 0, NULL), -- Morfologia
		(85, 24, 3, 2, '2025-12-26 17:17:00', 40, 0, NULL), -- APTT
		(85, 24, 4, 3, '2025-12-26 17:18:00', 40, 0, NULL), -- PT
		(85, 24, 2, 4, '2025-12-26 17:16:00', 75, 1, 'REP'), -- Fibrynogen
		(85, 24, 5, 15, '2025-12-26 17:19:00', 30, 0, NULL), -- CRP
		(85, 24, 3, 21, '2025-12-26 17:17:00', 245, 0, 'EQP'), -- HCV Ab
		
		-- Pacjent 86: Michał Wojciechowski (1978 - Dorosły, Internal)
		(86, 21, 4, 1, '2025-12-26 17:30:00', 25, 0, NULL), -- Morfologia
		(86, 21, 5, 7, '2025-12-26 17:31:00', 58, 0, 'RER'), -- Elektrolity
		(86, 21, 6, 15, '2025-12-26 17:32:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 87: Agnieszka Rutkowska (1992 - Dorosła, Gynecology)
		(87, 12, 7, 1, '2025-12-27 08:00:00', 25, 0, NULL), -- Morfologia
		(87, 12, 8, 21, '2025-12-27 08:01:00', 230, 0, 'PRE'), -- HCV Ab
		(87, 12, 9, 15, '2025-12-27 08:02:00', 30, 0, NULL), -- CRP
		
		-- Pacjent 88: Łukasz Piotrowski (2002 – Dorosły, Internal)
		(88, 5, 10, 1, '2025-12-27 08:15:00', 25, 0, NULL), -- Morfologia
		(88, 5, 1, 7, '2025-12-27 08:16:00', 55, 0, 'EQP'), -- Elektrolity
		(88, 5, 2, 16, '2025-12-27 08:17:00', 85, 1, 'REP'), -- PCT
		
		-- Pacjent 89: Karolina Kowalczyk (1996 - Dorosła, Obstetrics)
		(89, 8, 3, 1, '2025-12-27 08:30:00', 25, 0, NULL), -- Morfologia
		(89, 8, 4, 4, '2025-12-27 08:31:00', 70, 0, 'PRE'), -- Fibrynogen
		(89, 8, 5, 22, '2025-12-27 08:32:00', 240, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 90: Mateusz Grabowski (1980 - Dorosły, Cardiology)
		(90, 23, 6, 1, '2025-12-27 08:45:00', 28, 0, NULL), -- Morfologia
		(90, 23, 7, 17, '2025-12-27 08:46:00', 50, 1, NULL), -- hs Troponina T
		(90, 23, 8, 19, '2025-12-27 08:47:00', 55, 1, NULL), -- proBNP
		
		-- Pacjent 91: Paulina Lewandowska (2001 - Dorosła, Gynecology)
		(91, 18, 9, 1, '2025-12-27 09:00:00', 25, 0, NULL), -- Morfologia
		(91, 18, 10, 21, '2025-12-27 09:01:00', 260, 0, 'EQP'), -- HCV Ab
		(91, 18, 1, 22, '2025-12-27 09:02:00', 245, 0, 'PRE'), -- HIV Ag/Ab
		
		-- Pacjent 92: Jakub Nowak (1997 - Dorosły, Cardiology)
		(92, 17, 2, 1, '2025-12-27 09:15:00', 25, 0, NULL), -- Morfologia
		(92, 17, 3, 17, '2025-12-27 09:16:00', 50, 1, NULL), -- hs Troponina T
		(92, 17, 4, 18, '2025-12-27 09:17:00', 45, 0, NULL), -- CK-MB
		
		-- Pacjent 93: Natalia Wojciechowska (2017 - Dziecko, Pediatrics)
		(93, 10, 5, 1, '2025-12-27 09:30:00', 22, 0, NULL), -- Morfologia
		(93, 10, 6, 15, '2025-12-27 09:31:00', 30, 0, NULL), -- CRP
		(93, 10, 7, 25, '2025-12-27 09:32:00', 35, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 94: Rafał Sikorski (1984 - Dorosły, General Surgery)
		(94, 19, 8, 1, '2025-12-27 09:45:00', 30, 0, NULL), -- Morfologia
		(94, 19, 9, 2, '2025-12-27 09:46:00', 45, 0, NULL), -- APTT
		(94, 19, 10, 3, '2025-12-27 09:47:00', 44, 0, NULL), -- PT
		(94, 19, 1, 5, '2025-12-27 09:48:00', 40, 0, NULL), -- D-dimery
		(94, 19, 2, 15, '2025-12-27 09:49:00', 30, 0, NULL), -- CRP
		(94, 19, 3, 20, '2025-12-27 09:50:00', 35, 0, NULL), -- CK
		
		-- Pacjent 95: Monika Kowal (1995 - Dorosła, Gynecology)
		(95, 12, 1, 1, '2025-12-27 10:00:00', 25, 0, NULL), -- Morfologia
		(95, 12, 2, 15, '2025-12-27 10:01:00', 30, 0, NULL), -- CRP
		(95, 12, 3, 22, '2025-12-27 10:02:00', 60, 0, NULL), -- HIV Ag/Ab
		
		-- Pacjent 96: Krzysztof Piotrowski (1986 - Dorosły, ICU)
		(96, 2, 4, 1, '2025-12-27 10:15:00', 26, 1, NULL), -- Morfologia
		(96, 2, 5, 16, '2025-12-27 10:16:00', 92, 1, 'REP'), -- PCT
		(96, 2, 6, 15, '2025-12-27 10:17:00', 58, 1, 'REP'), -- CRP
		
		-- Pacjent 97: Ewa Grabowska (2000 - Dorosła, Obstetrics)
		(97, 24, 7, 1, '2025-12-27 10:30:00', 25, 0, NULL), -- Morfologia
		(97, 24, 8, 4, '2025-12-27 10:31:00', 80, 0, 'RER'), -- Fibrynogen
		(97, 24, 9, 21, '2025-12-27 10:32:00', 255, 0, 'PRE'), -- HCV Ab
		
		-- Pacjent 98: Dawid Nowicki (2004 – Dorosły, Internal)
		(98, 20, 10, 1, '2025-12-27 10:45:00', 25, 0, NULL), -- Morfologia
		(98, 20, 1, 7, '2025-12-27 10:46:00', 55, 0, 'EQP'), -- Elektrolity
		(98, 20, 2, 15, '2025-12-27 10:47:00', 62, 1, 'REP'), -- CRP
		
		-- Pacjent 99: Magdalena Lewandowska (1991 - Dorosła, Internal)
		(99, 15, 3, 1, '2025-12-27 11:00:00', 25, 0, NULL), -- Morfologia
		(99, 15, 4, 6, '2025-12-27 11:01:00', 25, 0, NULL), -- Glukoza
		(99, 15, 5, 10, '2025-12-27 11:02:00', 42, 0, NULL), -- ALAT
		(99, 15, 6, 11, '2025-12-27 11:03:00', 40, 0, NULL), -- ASPAT
		(99, 15, 7, 12, '2025-12-27 11:04:00', 48, 0, NULL), -- Bilirubina całkowita
		(99, 15, 8, 8, '2025-12-27 11:05:00', 55, 1, 'REP'), -- Kreatynina 
		(99, 15, 9, 9, '2025-12-27 11:06:00', 35, 0, NULL), -- Mocznik
		
		
		-- Pacjent 100: Tomasz Kowalczyk (1989 - Dorosły, Interna)
		(100, 1, 6, 1, '2025-12-27 11:15:00', 25, 0, NULL), -- Morfologia
		(100, 1, 7, 7, '2025-12-27 11:16:00', 58, 0, 'EQP'), -- Elektrolity
		(100, 1, 8, 15, '2025-12-27 11:17:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 101: Anna Wróblewska (K, 1998 - Gynecology)
		(101, 4, 1, 1, '2025-12-27 08:00:00', 25, 0, NULL), -- Morfologia
		(101, 4, 5, 4, '2025-12-27 08:04:00', 75, 0, 'RER'), -- Fibrynogen
		(101, 4, 6, 6, '2025-12-27 08:05:00', 25, 0, NULL), -- Glukoza
		(101, 4, 2, 15, '2025-12-27 08:01:00', 55, 1, 'DIL'), -- CRP
		(101, 4, 3, 21, '2025-12-27 08:02:00', 210, 0, 'EQP'), -- HCV Ab
		(101, 4, 4, 22, '2025-12-27 08:03:00', 240, 0, 'PRE'), -- HIV Ag/Ab
		
		-- Pacjent 102: Łukasz Piotrowski (M, 2003, dorosły, Internal )
		(102, 1, 7, 1, '2025-12-27 08:15:00', 28, 0, NULL), -- Morfologia
		(102, 1, 8, 7, '2025-12-27 08:16:00', 55, 0, 'EQP'), -- Elektrolity
		(102, 1, 9, 15, '2025-12-27 08:17:00', 60, 1, 'DIL'), -- CRP
		(102, 1, 10, 8, '2025-12-27 08:18:00', 35, 0, NULL), -- Kreatynina
		(102, 1, 1, 9, '2025-12-27 08:19:00', 35, 0, NULL), -- Mocznik
		(102, 1, 2, 6, '2025-12-27 08:20:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 103: Barbara Nowak (K, 1968 - Gynecology)
		(103, 12, 3, 1, '2025-12-27 08:30:00', 25, 0, NULL), -- Morfologia
		(103, 12, 4, 15, '2025-12-27 08:31:00', 30, 0, NULL), -- CRP
		(103, 12, 5, 21, '2025-12-27 08:32:00', 250, 0, 'PRE'), -- HCV Ab
		(103, 12, 6, 10, '2025-12-27 08:33:00', 42, 0, NULL), -- ALAT
		(103, 12, 7, 11, '2025-12-27 08:34:00', 40, 0, NULL), -- ASPAT
		(103, 12, 8, 7, '2025-12-27 08:35:00', 52, 0, 'RER'), -- Elektrolity
		
		-- Pacjent 104: Jakub Kowal (M, 2000 - Cardiology)
		(104, 13, 9, 1, '2025-12-27 08:45:00', 25, 0, NULL), -- Morfologia
		(104, 13, 10, 17, '2025-12-27 08:46:00', 65, 1, 'RER'), -- hs Troponina T
		(104, 13, 1, 19, '2025-12-27 08:47:00', 70, 1, 'DIL'), -- proBNP
		(104, 13, 2, 18, '2025-12-27 08:48:00', 50, 0, NULL), -- CK-MB
		(104, 13, 3, 7, '2025-12-27 08:49:00', 55, 0, 'EQP'), -- Elektrolity
		(104, 13, 4, 14, '2025-12-27 08:50:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		
		-- Pacjent 105: Natalia Kaczmarek (K, 1993 - Obstetrics)
		(105, 16, 5, 1, '2025-12-27 09:00:00', 25, 0, NULL), -- Morfologia
		(105, 16, 6, 4, '2025-12-27 09:01:00', 75, 1, 'PRE'), -- Fibrynogen
		(105, 16, 7, 2, '2025-12-27 09:02:00', 44, 0, NULL), -- APTT
		(105, 16, 8, 3, '2025-12-27 09:03:00', 42, 0, NULL), -- PT
		(105, 16, 9, 21, '2025-12-27 09:04:00', 260, 0, 'EQP'), -- HCV Ab
		(105, 16, 10, 15, '2025-12-27 09:05:00', 30, 0, NULL), -- CRP
		
		-- Pacjent 106: Patryk Nowicki (M, 1980 - Internal)
		(106, 5, 1, 1, '2025-12-27 09:15:00', 26, 0, NULL), -- Morfologia
		(106, 5, 2, 7, '2025-12-27 09:16:00', 50, 0, 'EQP'), -- Elektrolity
		(106, 5, 3, 15, '2025-12-27 09:17:00', 60, 1, 'REP'), -- CRP
		(106, 5, 4, 16, '2025-12-27 09:18:00', 88, 1, 'DIL'), -- PCT
		(106, 5, 5, 8, '2025-12-27 09:19:00', 35, 0, NULL), -- Kreatynina
		(106, 5, 6, 6, '2025-12-27 09:20:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 107: Katarzyna Wójcik (K, 1992 - Gynecology)
		(107, 12, 7, 1, '2025-12-27 09:30:00', 25, 0, NULL), -- Morfologia
		(107, 12, 8, 21, '2025-12-27 09:31:00', 220, 0, 'PRE'), -- HCV Ab
		(107, 12, 9, 22, '2025-12-27 09:32:00', 210, 0, 'EQP'), -- HIV Ag/Ab
		(107, 12, 10, 15, '2025-12-27 09:33:00', 32, 0, NULL), -- CRP
		(107, 12, 1, 10, '2025-12-27 09:34:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 108: Michał Kamiński (M, 1975 - Emergency)
		(108, 25, 2, 1, '2025-12-27 09:45:00', 24, 0, NULL), -- Morfologia
		(108, 25, 3, 14, '2025-12-27 09:46:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(108, 25, 4, 15, '2025-12-27 09:47:00', 52, 1, 'REP'), -- CRP
		(108, 25, 5, 23, '2025-12-27 09:48:00', 30, 0, NULL), -- Etanol
		(108, 25, 6, 7, '2025-12-27 09:49:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 109: Anna Zielińska (K, 1988 - Obstetrics)
		(109, 8, 7, 1, '2025-12-27 10:00:00', 25, 0, NULL), -- Morfologia
		(109, 8, 8, 4, '2025-12-27 10:01:00', 78, 1, 'REP'), -- Fibrynogen
		(109, 8, 9, 21, '2025-12-27 10:02:00', 245, 0, 'PRE'), -- HCV Ab
		(109, 8, 10, 15, '2025-12-27 10:03:00', 30, 0, NULL), -- CRP
		(109, 8, 1, 6, '2025-12-27 10:04:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 110: Łukasz Sikora (M, 2005 - Pediatrics -> Dr Internist Ward 8)
		(110, 21, 2, 1, '2025-12-27 10:15:00', 25, 0, NULL), -- Morfologia
		(110, 21, 3, 15, '2025-12-27 10:16:00', 60, 1, 'DIL'), -- CRP
		(110, 21, 4, 7, '2025-12-27 10:17:00', 55, 0, 'EQP'), -- Elektrolity
		(110, 21, 5, 8, '2025-12-27 10:18:00', 35, 0, NULL), -- Kreatynina
		(110, 21, 6, 16, '2025-12-27 10:19:00', 85, 1, 'REP'), -- PCT
		
		-- Pacjent 111: Magdalena Kowalczyk (K, 1990 - Gynecology)
		(111, 18, 7, 1, '2025-12-27 10:30:00', 25, 0, NULL), -- Morfologia
		(111, 18, 8, 21, '2025-12-27 10:31:00', 260, 0, 'PRE'), -- HCV Ab
		(111, 18, 9, 22, '2025-12-27 10:32:00', 250, 0, 'EQP'), -- HIV Ag/Ab
		(111, 18, 10, 15, '2025-12-27 10:33:00', 30, 0, NULL), -- CRP
		(111, 18, 1, 10, '2025-12-27 10:34:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 112: Tomasz Lewandowski (M, 1978 - Cardiology)
		(112, 17, 2, 1, '2025-12-27 10:45:00', 25, 0, NULL), -- Morfologia
		(112, 17, 3, 17, '2025-12-27 10:46:00', 55, 1, NULL), -- hs Troponina T
		(112, 17, 4, 19, '2025-12-27 10:47:00', 68, 1, 'RER'), -- proBNP
		(112, 17, 5, 18, '2025-12-27 10:48:00', 45, 0, NULL), -- CK-MB
		(112, 17, 6, 7, '2025-12-27 10:49:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 113: Barbara Grabowska (K, 2016 - Neonatology -> Dr Pediatrist Ward 4)
		(113, 3, 7, 1, '2025-12-27 11:00:00', 22, 0, NULL), -- Morfologia
		(113, 3, 8, 15, '2025-12-27 11:01:00', 30, 0, NULL), -- CRP
		(113, 3, 9, 12, '2025-12-27 11:02:00', 45, 0, NULL), -- Bilirubina całkowita
		(113, 3, 10, 25, '2025-12-27 11:03:00', 30, 0, NULL), -- Badanie ogólne moczu
		(113, 3, 1, 7, '2025-12-27 11:04:00', 35, 0, NULL), -- Elektrolity
		
		-- Pacjent 114: Krzysztof Jankowski (M, 1985 - Internal)
		(114, 1, 2, 1, '2025-12-27 11:15:00', 25, 0, NULL), -- Morfologia
		(114, 1, 3, 15, '2025-12-27 11:16:00', 60, 1, 'DIL'), -- CRP
		(114, 1, 4, 16, '2025-12-27 11:17:00', 95, 1, 'REP'), -- PCT
		(114, 1, 5, 7, '2025-12-27 11:18:00', 52, 0, 'RER'), -- Elektrolity
		(114, 1, 6, 14, '2025-12-27 11:19:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		
		-- Pacjent 115: Monika Rutkowska (K, 1995 - Obstetrics)
		(115, 24, 7, 1, '2025-12-27 11:30:00', 26, 0, NULL), -- Morfologia
		(115, 24, 8, 4, '2025-12-27 11:31:00', 72, 1, 'PRE'), -- Fibrynogen
		(115, 24, 9, 21, '2025-12-27 11:32:00', 255, 0, 'EQP'), -- HCV Ab
		(115, 24, 10, 15, '2025-12-27 11:33:00', 30, 0, NULL), -- CRP
		(115, 24, 1, 6, '2025-12-27 11:34:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 116: Jakub Piotrowski (M, 2008 - Pediatrics)
		(116, 10, 2, 1, '2025-12-27 11:45:00', 22, 0, NULL), -- Morfologia
		(116, 10, 3, 15, '2025-12-27 11:46:00', 30, 0, NULL), -- CRP
		(116, 10, 4, 25, '2025-12-27 11:47:00', 35, 0, NULL), -- Badanie ogólne moczu
		(116, 10, 5, 7, '2025-12-27 11:48:00', 30, 0, NULL), -- Elektrolity
		(116, 10, 6, 12, '2025-12-27 11:49:00', 45, 0, NULL), -- Bilirubina całkowita
		
		-- Pacjent 117: Ewelina Sobczak (K, 1982 - Gynecology)
		(117, 4, 7, 1, '2025-12-27 12:00:00', 24, 0, NULL), -- Morfologia
		(117, 4, 8, 21, '2025-12-27 12:01:00', 230, 0, 'REP'), -- HCV Ab
		(117, 4, 9, 22, '2025-12-27 12:02:00', 245, 0, 'PRE'), -- HIV Ag/Ab
		(117, 4, 10, 15, '2025-12-27 12:03:00', 30, 0, NULL), -- CRP
		(117, 4, 1, 10, '2025-12-27 12:04:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 118: Rafał Wroblewski (M, 1991 - Cardiology)
		(118, 23, 2, 1, '2025-12-27 12:15:00', 25, 0, NULL), -- Morfologia
		(118, 23, 3, 17, '2025-12-27 12:16:00', 50, 1, NULL), -- hs Troponina T
		(118, 23, 4, 19, '2025-12-27 12:17:00', 60, 1, NULL), -- proBNP
		(118, 23, 5, 7, '2025-12-27 12:18:00', 52, 0, 'EQP'), -- Elektrolity
		(118, 23, 6, 14, '2025-12-27 12:19:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		
		-- Pacjent 119: Paulina Kozlowska (K, 1999 - Obstetrics)
		(119, 6, 7, 1, '2025-12-27 12:30:00', 25, 0, NULL), -- Morfologia
		(119, 6, 8, 4, '2025-12-27 12:31:00', 80, 1, 'RER'), -- Fibrynogen
		(119, 6, 9, 21, '2025-12-27 12:32:00', 255, 0, 'PRE'), -- HCV Ab
		(119, 6, 10, 15, '2025-12-27 12:33:00', 30, 0, NULL), -- CRP
		(119, 6, 1, 3, '2025-12-27 12:34:00', 42, 0, NULL), -- PT
		
		-- Pacjent 120: Grzegorz Nowak (M, 1972 - Emergency -> Dr Internista Ward 8)
		(120, 15, 2, 1, '2025-12-27 12:45:00', 25, 0, NULL), -- Morfologia
		(120, 15, 3, 23, '2025-12-27 12:46:00', 35, 1, NULL), -- Etanol
		(120, 15, 4, 14, '2025-12-27 12:47:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(120, 15, 5, 15, '2025-12-27 12:48:00', 60, 1, 'DIL'), -- CRP
		(120, 15, 6, 7, '2025-12-27 12:49:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 121: Janusz Nowakowski (M, 1970 - Emergency -> Dr Internist Ward 8)
		(121, 9, 7, 1, '2025-12-27 13:00:00', 25, 0, NULL), -- Morfologia
		(121, 9, 8, 15, '2025-12-27 13:01:00', 58, 1, 'REP'), -- CRP
		(121, 9, 9, 7, '2025-12-27 13:02:00', 52, 0, 'RER'), -- Elektrolity
		(121, 9, 10, 14, '2025-12-27 13:03:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(121, 9, 1, 8, '2025-12-27 13:04:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 122: Beata Pawlak (K, 1988 - ICU -> Dr Internist Ward 8)
		(122, 11, 2, 1, '2025-12-27 13:15:00', 28, 1, NULL), -- Morfologia
		(122, 11, 3, 16, '2025-12-27 13:16:00', 92, 1, 'DIL'), -- PCT
		(122, 11, 4, 15, '2025-12-27 13:17:00', 65, 1, 'REP'), -- CRP
		(122, 11, 5, 14, '2025-12-27 13:18:00', 18, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(122, 11, 6, 7, '2025-12-27 13:19:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 123: Andrzej Szymański (M, 1965 - Cardiology)
		(123, 17, 7, 1, '2025-12-27 13:30:00', 25, 0, NULL), -- Morfologia
		(123, 17, 8, 17, '2025-12-27 13:31:00', 50, 1, NULL), -- hs Troponina T
		(123, 17, 9, 19, '2025-12-27 13:32:00', 60, 1, NULL), -- proBNP
		(123, 17, 10, 18, '2025-12-27 13:33:00', 45, 0, NULL), -- CK-MB
		(123, 17, 1, 7, '2025-12-27 13:34:00', 52, 0, 'RER'), -- Elektrolity
		
		-- Pacjent 124: Małgorzata Woźniak (K, 1992  Emergency)
		(124, 20, 2, 1, '2025-12-27 13:45:00', 25, 0, NULL), -- Morfologia
		(124, 20, 3, 15, '2025-12-27 13:46:00', 60, 1, 'DIL'), -- CRP
		(124, 20, 4, 7, '2025-12-27 13:47:00', 55, 0, 'EQP'), -- Elektrolity
		(124, 20, 5, 6, '2025-12-27 13:48:00', 25, 0, NULL), -- Glukoza
		(124, 20, 6, 8, '2025-12-27 13:49:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 125: Stanisław Kozłowski (M, 1958 Internist)
		(125, 25, 7, 1, '2025-12-27 14:00:00', 25, 0, NULL), -- Morfologia
		(125, 25, 8, 10, '2025-12-27 14:01:00', 42, 0, NULL), -- ALAT
		(125, 25, 9, 11, '2025-12-27 14:02:00', 40, 0, NULL), -- ASPAT
		(125, 25, 10, 15, '2025-12-27 14:03:00', 55, 1, 'DIL'), -- CRP
		(125, 25, 1, 7, '2025-12-27 14:04:00', 52, 0, 'REP'), -- Elektrolity
		
		-- Pacjent 126: Elżbieta Jankowska (K, 1976, Położnictwo) 
		(126, 6, 1, 1, '2025-12-27 13:00:00', 25, 0, NULL), -- Morfologia
		(126, 6, 3, 2, '2025-12-27 13:02:00', 44, 0, NULL), -- APTT
		(126, 6, 4, 3, '2025-12-27 13:03:00', 42, 0, NULL), -- PT
		(126, 6, 2, 4, '2025-12-27 13:01:00', 75, 1, 'REP'), -- Fibrynogen
		(126, 6, 6, 15, '2025-12-27 13:05:00', 30, 0, NULL), -- CRP
		(126, 6, 5, 21, '2025-12-27 13:04:00', 210, 0, 'EQP'), -- HCV Ab
		
		-- Pacjent 127: Wojciech Mazur (M, 2024, Neonatologia) 
		(127, 3, 7, 1, '2025-12-27 13:10:00', 22, 0, NULL), -- Morfologia
		(127, 3, 8, 12, '2025-12-27 13:11:00', 45, 1, NULL), -- Bilirubina całkowita
		(127, 3, 9, 13, '2025-12-27 13:12:00', 48, 1, NULL), -- Bilirubina bezpośrednia
		(127, 3, 10, 15, '2025-12-27 13:13:00', 50, 0, 'REP'), -- CRP
		(127, 3, 1, 7, '2025-12-27 13:14:00', 35, 0, NULL), -- Elektrolity
		
		-- Pacjent 128: Alicja Kwiatkowska (K, 1990, Interna) 
		(128, 1, 2, 1, '2025-12-27 13:20:00', 25, 0, NULL), -- Morfologia
		(128, 1, 3, 7, '2025-12-27 13:21:00', 55, 0, 'EQP'), -- Elektrolity
		(128, 1, 4, 15, '2025-12-27 13:22:00', 60, 1, 'DIL'), -- CRP
		(128, 1, 5, 8, '2025-12-27 13:23:00', 35, 0, NULL), -- Kreatynina
		(128, 1, 6, 6, '2025-12-27 13:24:00', 25, 0, NULL), -- Glukoza
		(128, 1, 7, 10, '2025-12-27 13:25:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 129: Piotr Krawczyk (M, 1982, Gastroenterology)
		(129, 9, 8, 1, '2025-12-27 13:30:00', 25, 0, NULL), -- Morfologia
		(129, 9, 9, 10, '2025-12-27 13:31:00', 42, 0, NULL), -- ALAT
		(129, 9, 10, 11, '2025-12-27 13:32:00', 40, 0, NULL), -- ASPAT
		(129, 9, 1, 7, '2025-12-27 13:33:00', 52, 0, 'RER'), -- Elektrolity
		(129, 9, 2, 15, '2025-12-27 13:34:00', 55, 1, 'REP'), -- CRP
		(129, 9, 3, 12, '2025-12-27 13:35:00', 48, 0, NULL), -- Bilirubina całkowita
		
		-- Pacjent 130: Krystyna Kaczmarek (K, 1955, General Surgery) 
		(130, 2, 4, 1, '2025-12-27 13:40:00', 30, 0, NULL), -- Morfologia
		(130, 2, 5, 2, '2025-12-27 13:41:00', 45, 0, NULL), -- APTT
		(130, 2, 6, 3, '2025-12-27 13:42:00', 42, 0, NULL), -- PT
		(130, 2, 7, 4, '2025-12-27 13:43:00', 70, 0, 'PRE'), -- Fibrynogen
		(130, 2, 8, 15, '2025-12-27 13:44:00', 52, 1, 'DIL'), -- CRP
		
		-- Pacjent 131: Jerzy Piotrowski (M, 1963, Emergency) 
		(131, 25, 9, 1, '2025-12-27 13:50:00', 24, 0, NULL), -- Morfologia
		(131, 25, 10, 14, '2025-12-27 13:51:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(131, 25, 1, 15, '2025-12-27 13:52:00', 55, 1, 'REP'), -- CRP
		(131, 25, 2, 23, '2025-12-27 13:53:00', 35, 1, NULL), -- Etanol
		(131, 25, 3, 7, '2025-12-27 13:54:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 132: Danuta Grabowska (K, 1984, ICU) 
		(132, 1, 4, 1, '2025-12-27 14:00:00', 26, 1, NULL), -- Morfologia
		(132, 1, 5, 16, '2025-12-27 14:01:00', 95, 1, 'DIL'), -- PCT
		(132, 1, 6, 15, '2025-12-27 14:02:00', 60, 1, 'DIL'), -- CRP
		(132, 1, 7, 14, '2025-12-27 14:03:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(132, 1, 8, 8, '2025-12-27 14:04:00', 40, 0, NULL), -- Kreatynina
		
		-- Pacjent 133: Henryk Nowak (M, 1971, Cardiology) 
		(133, 13, 9, 1, '2025-12-27 14:10:00', 25, 0, NULL), -- Morfologia
		(133, 13, 10, 17, '2025-12-27 14:11:00', 55, 1, NULL), -- hs Troponina T
		(133, 13, 1, 19, '2025-12-27 14:12:00', 65, 1, 'DIL'), -- proBNP
		(133, 13, 2, 18, '2025-12-27 14:13:00', 50, 0, NULL), -- CK-MB
		(133, 13, 3, 7, '2025-12-27 14:14:00', 52, 0, 'RER'), -- Elektrolity
		
		-- Pacjent 134: Zofia Pawłowska (K, 2010, Pediatrics) 
		(134, 10, 4, 1, '2025-12-27 14:20:00', 22, 0, NULL), -- Morfologia
		(134, 10, 5, 15, '2025-12-27 14:21:00', 30, 0, NULL), -- CRP
		(134, 10, 6, 25, '2025-12-27 14:22:00', 35, 0, NULL), -- Badanie ogólne moczu
		(134, 10, 7, 6, '2025-12-27 14:23:00', 25, 0, NULL), -- Glukoza
		(134, 10, 8, 7, '2025-12-27 14:24:00', 30, 0, NULL), -- Elektrolity
		
		-- Pacjent 135: Stefan Michalski (M, 1979, Emergency) 
		(135, 11, 9, 1, '2025-12-27 14:30:00', 25, 0, NULL), -- Morfologia
		(135, 11, 10, 7, '2025-12-27 14:31:00', 52, 0, 'EQP'), -- Elektrolity
		(135, 11, 1, 15, '2025-12-27 14:32:00', 58, 1, 'DIL'), -- CRP
		(135, 11, 2, 6, '2025-12-27 14:33:00', 25, 0, NULL), -- Glukoza
		(135, 11, 3, 10, '2025-12-27 14:34:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 136: Halina Nowicka (K, 1986, Obstetrics) 
		(136, 16, 4, 1, '2025-12-27 14:40:00', 26, 0, NULL), -- Morfologia
		(136, 16, 5, 4, '2025-12-27 14:41:00', 70, 0, 'REP'), -- Fibrynogen
		(136, 16, 6, 21, '2025-12-27 14:42:00', 260, 0, 'PRE'), -- HCV Ab
		(136, 16, 7, 22, '2025-12-27 14:43:00', 240, 0, 'EQP'), -- HIV Ag/Ab
		(136, 16, 8, 15, '2025-12-27 14:44:00', 30, 0, NULL), -- CRP
		
		-- Pacjent 137: Antoni Adamczyk (M, 2025, Neonatology) 
		(137, 3, 9, 1, '2025-12-27 14:50:00', 22, 0, NULL), -- Morfologia
		(137, 3, 10, 12, '2025-12-27 14:51:00', 45, 0, NULL), -- Bilirubina całkowita
		(137, 3, 1, 15, '2025-12-27 14:52:00', 55, 0, 'REP'), -- CRP
		(137, 3, 2, 7, '2025-12-27 14:53:00', 32, 0, NULL), -- Elektrolity
		(137, 3, 3, 6, '2025-12-27 14:54:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 138: Jadwiga Dudek (K, 1994, Internal) 
		(138, 20, 4, 1, '2025-12-27 15:00:00', 25, 0, NULL), -- Morfologia
		(138, 20, 5, 7, '2025-12-27 15:01:00', 50, 0, 'RER'), -- Elektrolity
		(138, 20, 6, 15, '2025-12-27 15:02:00', 60, 1, 'DIL'), -- CRP
		(138, 20, 7, 10, '2025-12-27 15:03:00', 42, 0, NULL), -- ALAT
		(138, 20, 8, 6, '2025-12-27 15:04:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 139: Marek Zając (M, 1980, Gastroenterology)
		(139, 1, 9, 1, '2025-12-27 15:10:00', 25, 0, NULL), -- Morfologia
		(139, 1, 10, 10, '2025-12-27 15:11:00', 40, 0, NULL), -- ALAT
		(139, 1, 1, 11, '2025-12-27 15:12:00', 40, 0, NULL), -- ASPAT
		(139, 1, 2, 7, '2025-12-27 15:13:00', 50, 0, 'EQP'), -- Elektrolity
		(139, 1, 3, 15, '2025-12-27 15:14:00', 55, 1, 'REP'), -- CRP
		
		-- Pacjent 140: Teresa Wieczorek (K, 1968, General Surgery) 
		(140, 19, 4, 1, '2025-12-27 15:20:00', 30, 0, NULL), -- Morfologia
		(140, 19, 5, 2, '2025-12-27 15:21:00', 44, 0, NULL), -- APTT
		(140, 19, 6, 3, '2025-12-27 15:22:00', 42, 0, NULL), -- PT
		(140, 19, 7, 4, '2025-12-27 15:23:00', 65, 0, 'RER'), -- Fibrynogen
		(140, 19, 8, 15, '2025-12-27 15:24:00', 52, 1, 'DIL'), -- CRP
		
		-- Pacjent 141: Edward Król (M, 1975, Emergency) 
		(141, 25, 9, 1, '2025-12-27 15:30:00', 25, 0, NULL), -- Morfologia
		(141, 25, 10, 14, '2025-12-27 15:31:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(141, 25, 1, 15, '2025-12-27 15:32:00', 60, 1, 'DIL'), -- CRP
		(141, 25, 2, 23, '2025-12-27 15:33:00', 30, 0, NULL), -- Etanol
		(141, 25, 3, 7, '2025-12-27 15:34:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 142: Irena Jabłońska (K, 1991, ICU)
		(142, 1, 4, 1, '2025-12-27 15:40:00', 28, 1, NULL), -- Morfologia
		(142, 1, 5, 16, '2025-12-27 15:41:00', 92, 1, 'DIL'), -- PCT
		(142, 1, 6, 15, '2025-12-27 15:42:00', 58, 1, 'DIL'), -- CRP
		(142, 1, 7, 14, '2025-12-27 15:43:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(142, 1, 8, 7, '2025-12-27 15:44:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 143: Tadeusz Majewski (M, 1962, Cardiology)
		(143, 17, 9, 1, '2025-12-27 15:50:00', 25, 0, NULL), -- Morfologia
		(143, 17, 10, 17, '2025-12-27 15:51:00', 50, 1, NULL), -- hs Troponina T
		(143, 17, 1, 19, '2025-12-27 15:52:00', 60, 1, NULL), -- proBNP
		(143, 17, 2, 18, '2025-12-27 15:53:00', 45, 0, NULL), -- CK-MB
		(143, 17, 3, 7, '2025-12-27 15:54:00', 52, 0, 'RER'), -- Elektrolity
		
		-- Pacjent 144: Barbara Olszewska (K, 2008, Pediatrist) 
		(144, 22, 4, 1, '2025-12-27 16:00:00', 24, 0, NULL), -- Morfologia
		(144, 22, 5, 15, '2025-12-27 16:01:00', 30, 0, NULL), -- CRP
		(144, 22, 6, 25, '2025-12-27 16:02:00', 30, 0, NULL), -- Badanie ogólne moczu
		(144, 22, 7, 6, '2025-12-27 16:03:00', 25, 0, NULL), -- Glukoza
		(144, 22, 8, 7, '2025-12-27 16:04:00', 30, 0, NULL), -- Elektrolity
		
		-- Pacjent 145: Roman Stępień (M, 1983, Internal)
		(145, 21, 9, 1, '2025-12-27 16:10:00', 25, 0, NULL), -- Morfologia
		(145, 21, 10, 7, '2025-12-27 16:11:00', 55, 0, 'EQP'), -- Elektrolity
		(145, 21, 1, 15, '2025-12-27 16:12:00', 62, 1, 'REP'), -- CRP
		(145, 21, 2, 6, '2025-12-27 16:13:00', 25, 0, NULL), -- Glukoza
		(145, 21, 3, 8, '2025-12-27 16:14:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 146: Janina Jaworska (K, 1987, Obstetrics) 
		(146, 24, 4, 1, '2025-12-27 16:20:00', 26, 0, NULL), -- Morfologia
		(146, 24, 5, 4, '2025-12-27 16:21:00', 75, 1, 'RER'), -- Fibrynogen
		(146, 24, 6, 21, '2025-12-27 16:22:00', 260, 0, 'PRE'), -- HCV Ab
		(146, 24, 7, 22, '2025-12-27 16:23:00', 245, 0, 'EQP'), -- HIV Ag/Ab
		(146, 24, 8, 15, '2025-12-27 16:24:00', 30, 0, NULL), -- CRP
		
		-- Pacjent 147: Kacper Malinowski (M, 2023, Neonatology)
		(147, 3, 9, 1, '2025-12-27 16:30:00', 22, 0, NULL), -- Morfologia
		(147, 3, 10, 12, '2025-12-27 16:31:00', 45, 0, NULL), -- Bilirubina całkowita
		(147, 3, 1, 15, '2025-12-27 16:32:00', 52, 0, 'DIL'), -- CRP
		(147, 3, 2, 7, '2025-12-27 16:33:00', 30, 0, NULL), -- Elektrolity
		(147, 3, 3, 6, '2025-12-27 16:34:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 148: Maria Pawlak (K, 1995, Internal) 
		(148, 11, 4, 1, '2025-12-27 16:40:00', 25, 0, NULL), -- Morfologia
		(148, 11, 5, 6, '2025-12-27 16:41:00', 25, 0, NULL), -- Glukoza
		(148, 11, 6, 7, '2025-12-27 16:42:00', 50, 0, 'EQP'), -- Elektrolity
		(148, 11, 7, 15, '2025-12-27 16:43:00', 55, 1, 'REP'), -- CRP
		(148, 11, 8, 8, '2025-12-27 16:44:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 149: Krzysztof Witkowski (M, 1973, Gastroenterology) 
		(149, 15, 9, 1, '2025-12-27 16:50:00', 25, 0, NULL), -- Morfologia
		(149, 15, 10, 10, '2025-12-27 16:51:00', 40, 0, NULL), -- ALAT
		(149, 15, 1, 11, '2025-12-27 16:52:00', 40, 0, NULL), -- ASPAT
		(149, 15, 2, 7, '2025-12-27 16:53:00', 50, 0, 'EQP'), -- Elektrolity
		(149, 15, 3, 15, '2025-12-27 16:54:00', 55, 1, 'DIL'), -- CRP
		
		-- Pacjent 150: Lucyna Walczak (K, 1960, General Surgery) 
		(150, 19, 4, 1, '2025-12-27 17:00:00', 30, 0, NULL), -- Morfologia
		(150, 19, 5, 2, '2025-12-27 17:01:00', 44, 0, NULL), -- APTT
		(150, 19, 6, 3, '2025-12-27 17:02:00', 42, 0, NULL), -- PT
		(150, 19, 7, 4, '2025-12-27 17:03:00', 65, 1, 'REP'), -- Fibrynogen
		(150, 19, 8, 15, '2025-12-27 17:04:00', 55, 0, 'DIL'), -- CRP
		
		-- Pacjent 151: Marian Rutkowski (M, 1969, Emergency )
		(151, 25, 1, 1, '2025-12-27 13:00:00', 25, 0, NULL), -- Morfologia
		(151, 25, 2, 14, '2025-12-27 13:01:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(151, 25, 3, 15, '2025-12-27 13:02:00', 55, 1, 'DIL'), -- CRP
		(151, 25, 4, 7, '2025-12-27 13:03:00', 52, 0, 'EQP'), -- Elektrolity
		(151, 25, 5, 23, '2025-12-27 13:04:00', 35, 1, NULL), -- Etanol
		(151, 25, 6, 8, '2025-12-27 13:05:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 152: Bożena Michalak (K, 1982, ICU)
		(152, 1, 7, 1, '2025-12-27 13:15:00', 28, 0, NULL), -- Morfologia
		(152, 1, 8, 16, '2025-12-27 13:16:00', 92, 1, 'DIL'), -- PCT
		(152, 1, 9, 15, '2025-12-27 13:17:00', 60, 1, 'DIL'), -- CRP
		(152, 1, 10, 14, '2025-12-27 13:18:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(152, 1, 1, 7, '2025-12-27 13:19:00', 50, 0, 'RER'), -- Elektrolity
		(152, 1, 2, 6, '2025-12-27 13:20:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 153: Józef Sikora (M, 1954, Cardiology)
		(153, 13, 3, 1, '2025-12-27 13:30:00', 25, 0, NULL), -- Morfologia
		(153, 13, 7, 7, '2025-12-27 13:34:00', 52, 0, 'EQP'), -- Elektrolity
		(153, 13, 8, 8, '2025-12-27 13:35:00', 35, 0, NULL), -- Kreatynina
		(153, 13, 4, 17, '2025-12-27 13:31:00', 55, 1, NULL), -- hs Troponina T
		(153, 13, 6, 18, '2025-12-27 13:33:00', 45, 0, NULL), -- CK-MB
		(153, 13, 5, 19, '2025-12-27 13:32:00', 70, 1, 'DIL'), -- proBNP
		
		-- Pacjent 154: Urszula Baran (K, 2012, Pediatrics)
		(154, 10, 9, 1, '2025-12-27 13:45:00', 22, 0, NULL), -- Morfologia
		(154, 10, 2, 6, '2025-12-27 13:48:00', 25, 0, NULL), -- Glukoza
		(154, 10, 3, 12, '2025-12-27 13:49:00', 45, 0, NULL), -- Bilirubina całkowita
		(154, 10, 10, 15, '2025-12-27 13:46:00', 30, 0, NULL), -- CRP
		(154, 10, 1, 25, '2025-12-27 13:47:00', 35, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 155: Zbigniew Szewczyk (M, 1977, Internal)
		(155, 5, 4, 1, '2025-12-27 14:00:00', 25, 0, NULL), -- Morfologia
		(155, 5, 5, 15, '2025-12-27 14:01:00', 60, 1, 'DIL'), -- CRP
		(155, 5, 6, 7, '2025-12-27 14:02:00', 55, 0, 'EQP'), -- Elektrolity
		(155, 5, 7, 10, '2025-12-27 14:03:00', 42, 0, NULL), -- ALAT
		(155, 5, 8, 11, '2025-12-27 14:04:00', 40, 0, NULL), -- ASPAT
		(155, 5, 9, 8, '2025-12-27 14:05:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 156: Wanda Ostrowska (K, 1989, Obstetrics)
		(156, 16, 10, 1, '2025-12-27 14:15:00', 26, 0, NULL), -- Morfologia
		(156, 16, 4, 2, '2025-12-27 14:19:00', 44, 0, NULL), -- APTT
		(156, 16, 1, 4, '2025-12-27 14:16:00', 75, 1, 'PRE'), -- Fibrynogen
		(156, 16, 5, 15, '2025-12-27 14:20:00', 30, 0, NULL), -- CRP
		(156, 16, 2, 21, '2025-12-27 14:17:00', 260, 0, 'EQP'), -- HCV Ab
		(156, 16, 3, 22, '2025-12-27 14:18:00', 240, 0, 'PRE'), -- HIV Ag/Ab
		
		-- Pacjent 157: Leon Tomaszewski (M, 2024, Neonatology)
		(157, 3, 6, 1, '2025-12-27 14:30:00', 22, 0, NULL), -- Morfologia
		(157, 3, 9, 15, '2025-12-27 14:33:00', 52, 0, 'REP'), -- CRP
		(157, 3, 10, 7, '2025-12-27 14:34:00', 32, 0, NULL), -- Elektrolity
		(157, 3, 7, 12, '2025-12-27 14:31:00', 45, 1, NULL), -- Bilirubina całkowita
		(157, 3, 8, 13, '2025-12-27 14:32:00', 48, 1, NULL), -- Bilirubina bezpośrednia
		
		-- Pacjent 158: Helena Pietrzak (K, 1998, Internal)
		(158, 9, 1, 1, '2025-12-27 14:45:00', 25, 0, NULL), -- Morfologia
		(158, 9, 2, 7, '2025-12-27 14:46:00', 50, 0, 'EQP'), -- Elektrolity
		(158, 9, 6, 6, '2025-12-27 14:50:00', 25, 0, NULL), -- Glukoza
		(158, 9, 3, 15, '2025-12-27 14:47:00', 60, 1, 'DIL'), -- CRP
		(158, 9, 5, 10, '2025-12-27 14:49:00', 42, 0, NULL), -- ALAT
		(158, 9, 4, 16, '2025-12-27 14:48:00', 85, 0, 'DIL'), -- PCT
		
		-- Pacjent 159: Kazimierz Duda (M, 1966, Gastroenterology)
		(159, 11, 7, 1, '2025-12-27 15:00:00', 25, 0, NULL), -- Morfologia
		(159, 11, 1, 7, '2025-12-27 15:04:00', 52, 0, 'RER'), -- Elektrolity
		(159, 11, 2, 15, '2025-12-27 15:05:00', 55, 1, 'DIL'), -- CRP
		(159, 11, 8, 10, '2025-12-27 15:01:00', 40, 0, NULL), -- ALAT
		(159, 11, 9, 11, '2025-12-27 15:02:00', 40, 0, NULL), -- ASPAT
		(159, 11, 10, 12, '2025-12-27 15:03:00', 50, 0, NULL), -- Bilirubina całkowita
		
		-- Pacjent 160: Grażyna Wróbel (K, 1972, General Surgery)
		(160, 19, 3, 1, '2025-12-27 15:15:00', 30, 0, NULL), -- Morfologia
		(160, 19, 4, 2, '2025-12-27 15:16:00', 45, 0, NULL), -- APTT
		(160, 19, 5, 3, '2025-12-27 15:17:00', 42, 0, NULL), -- PT
		(160, 19, 6, 4, '2025-12-27 15:18:00', 70, 0, 'PRE'), -- Fibrynogen
		(160, 19, 7, 15, '2025-12-27 15:19:00', 52, 1, 'REP'), -- CRP
		
		-- Pacjent 161: Ryszard Jasiński (M, 1981, Emergency)
		(161, 25, 8, 1, '2025-12-27 15:30:00', 25, 0, NULL), -- Morfologia
		(161, 25, 10, 15, '2025-12-27 15:32:00', 55, 1, 'DIL'), -- CRP
		(161, 25, 2, 7, '2025-12-27 15:34:00', 52, 0, 'EQP'), -- Elektrolity
		(161, 25, 1, 23, '2025-12-27 15:33:00', 45, 1, NULL), -- Etanol
		
		-- Pacjent 162: Ewa Marciniak (K, 1993, ICU)
		(162, 1, 3, 1, '2025-12-27 15:45:00', 26, 1, NULL), -- Morfologia
		(162, 1, 4, 16, '2025-12-27 15:46:00', 95, 1, 'REP'), -- PCT
		(162, 1, 5, 15, '2025-12-27 15:47:00', 58, 1, 'DIL'), -- CRP
		(162, 1, 7, 8, '2025-12-27 15:49:00', 38, 0, NULL), -- Kreatynina
		(162, 1, 6, 14, '2025-12-27 15:48:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		
		-- Pacjent 163: Władysław Bąk (M, 1959, Cardiology)
		(163, 17, 8, 1, '2025-12-27 16:00:00', 25, 0, NULL), -- Morfologia
		(163, 17, 2, 7, '2025-12-27 16:04:00', 52, 0, 'EQP'), -- Elektrolity
		(163, 17, 9, 17, '2025-12-27 16:01:00', 50, 1, NULL), -- hs Troponina T
		(163, 17, 10, 19, '2025-12-27 16:02:00', 65, 1, 'RER'), -- proBNP
		(163, 17, 1, 18, '2025-12-27 16:03:00', 45, 0, NULL), -- CK-MB
		
		-- Pacjent 164: Zuzanna Sadowska (K, 2005, Emergency)
		(164, 15, 3, 1, '2025-12-27 16:15:00', 24, 0, NULL), -- Morfologia
		(164, 15, 4, 7, '2025-12-27 16:16:00', 50, 0, 'EQP'), -- Elektrolity
		(164, 15, 6, 6, '2025-12-27 16:18:00', 25, 0, NULL), -- Glukoza
		(164, 15, 5, 15, '2025-12-27 16:17:00', 60, 0, 'DIL'), -- CRP
		
		-- Pacjent 165: Zygmunt Dąbrowski (M, 1964,Internal)
		(165, 21, 8, 1, '2025-12-27 16:30:00', 25, 0, NULL), -- Morfologia
		(165, 21, 9, 7, '2025-12-27 16:31:00', 55, 0, 'RER'), -- Elektrolity
		(165, 21, 2, 8, '2025-12-27 16:34:00', 35, 0, NULL), -- Kreatynina
		(165, 21, 10, 15, '2025-12-27 16:32:00', 60, 1, 'DIL'), -- CRP
		(165, 21, 1, 16, '2025-12-27 16:33:00', 85, 1, 'REP'), -- PCT
		
		-- Pacjent 166: Dorota Sawicka (K, 1985, Obstetrics)
		(166, 24, 3, 1, '2025-12-27 16:45:00', 26, 0, NULL), -- Morfologia
		(166, 24, 4, 4, '2025-12-27 16:46:00', 75, 1, 'REP'), -- Fibrynogen
		(166, 24, 7, 15, '2025-12-27 16:49:00', 30, 0, NULL), -- CRP
		(166, 24, 5, 21, '2025-12-27 16:47:00', 250, 0, 'PRE'), -- HCV Ab
		(166, 24, 6, 22, '2025-12-27 16:48:00', 230, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 167: Natan Włodarczyk (M, 2025, Neonatology )
		(167, 14, 8, 1, '2025-12-27 17:00:00', 22, 0, NULL), -- Morfologia
		(167, 14, 1, 15, '2025-12-27 17:03:00', 52, 0, 'REP'), -- CRP
		(167, 14, 2, 7, '2025-12-27 17:04:00', 30, 0, NULL), -- Elektrolity
		(167, 14, 9, 12, '2025-12-27 17:01:00', 45, 0, NULL), -- Bilirubina całkowita
		(167, 14, 10, 13, '2025-12-27 17:02:00', 48, 1, NULL), -- Bilirubina bezpośrednia
		
		-- Pacjent 168: Katarzyna Lis (K, 1997, Internal)
		(168, 11, 3, 1, '2025-12-27 17:15:00', 25, 0, NULL), -- Morfologia
		(168, 11, 4, 7, '2025-12-27 17:16:00', 50, 0, 'EQP'), -- Elektrolity
		(168, 11, 5, 15, '2025-12-27 17:17:00', 55, 1, 'REP'), -- CRP
		(168, 11, 6, 16, '2025-12-27 17:18:00', 85, 1, 'DIL'), -- PCT
		(168, 11, 7, 6, '2025-12-27 17:19:00', 25, 0, NULL), -- Glukoza
		
		-- Pacjent 169: Franciszek Kubiak (M, 1974, Gastroenterology)
		(169, 1, 8, 1, '2025-12-27 17:30:00', 25, 0, NULL), -- Morfologia
		(169, 1, 9, 10, '2025-12-27 17:31:00', 42, 0, NULL), -- ALAT
		(169, 1, 10, 11, '2025-12-27 17:32:00', 40, 0, NULL), -- ASPAT
		(169, 1, 1, 7, '2025-12-27 17:33:00', 50, 0, 'RER'), -- Elektrolity
		(169, 1, 2, 15, '2025-12-27 17:34:00', 55, 1, 'DIL'), -- CRP
		
		-- Pacjent 170: Jolanta Kalina (K, 1967, General Surgery)
		(170, 19, 3, 1, '2025-12-27 17:45:00', 30, 0, NULL), -- Morfologia
		(170, 19, 4, 2, '2025-12-27 17:46:00', 44, 0, NULL), -- APTT
		(170, 19, 5, 3, '2025-12-27 17:47:00', 42, 0, NULL), -- PT
		(170, 19, 6, 4, '2025-12-27 17:48:00', 65, 1, 'REP'), -- Fibrynogen
		(170, 19, 7, 15, '2025-12-27 17:49:00', 52, 0, 'DIL'), -- CRP
		
		-- Pacjent 171: Bogdan Wysocki (M, 1978, Emergency)
		(171, 25, 8, 1, '2025-12-27 18:00:00', 25, 0, NULL), -- Morfologia
		(171, 25, 2, 7, '2025-12-27 18:04:00', 35, 0, NULL), -- Elektrolity
		(171, 25, 10, 15, '2025-12-27 18:02:00', 30, 0, NULL), -- CRP
		(171, 25, 6, 16, '2025-12-27 18:08:00', 55, 0, NULL), -- PCT
		(171, 25, 3, 17, '2025-12-27 18:05:00', 45, 0, NULL), -- hs Troponina T
		(171, 25, 4, 18, '2025-12-27 18:06:00', 45, 0, NULL), -- CK-MB
		(171, 25, 5, 19, '2025-12-27 18:07:00', 45, 0, NULL), -- proBNP
		
		-- Pacjent 172: Renata Kozak (K, 1983, ICU)
		(172, 1, 3, 1, '2025-12-27 18:15:00', 28, 1, NULL), -- Morfologia
		(172, 1, 4, 16, '2025-12-27 18:16:00', 92, 1, 'DIL'), -- PCT
		(172, 1, 5, 15, '2025-12-27 18:17:00', 58, 1, 'DIL'), -- CRP
		(172, 1, 6, 14, '2025-12-27 18:18:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(172, 1, 7, 8, '2025-12-27 18:19:00', 38, 0, NULL), -- Kreatynina
		
		-- Pacjent 173: Czesław Mucha (M, 1961, Cardiology)
		(173, 23, 8, 1, '2025-12-27 18:30:00', 25, 0, NULL), -- Morfologia
		(173, 23, 2, 7, '2025-12-27 18:34:00', 52, 0, 'RER'), -- Elektrolity
		(173, 23, 9, 17, '2025-12-27 18:31:00', 50, 1, NULL), -- hs Troponina T
		(173, 23, 10, 19, '2025-12-27 18:32:00', 60, 1, NULL), -- proBNP
		(173, 23, 1, 18, '2025-12-27 18:33:00', 45, 0, NULL), -- CK-MB
		
		-- Pacjent 174: Hanna Urbańska (K, 2015, Pediatrics)
		(174, 22, 3, 1, '2025-12-27 18:45:00', 24, 0, NULL), -- Morfologia
		(174, 22, 6, 6, '2025-12-27 18:48:00', 25, 0, NULL), -- Glukoza
		(174, 22, 7, 7, '2025-12-27 18:49:00', 30, 0, NULL), -- Elektrolity
		(174, 22, 4, 15, '2025-12-27 18:46:00', 30, 0, NULL), -- CRP
		(174, 22, 5, 25, '2025-12-27 18:47:00', 30, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 175: Mieczysław Sobczyk (M, 1957, Internal)
		(175, 21, 8, 1, '2025-12-27 19:00:00', 25, 0, NULL), -- Morfologia
		(175, 21, 10, 7, '2025-12-27 19:02:00', 55, 0, 'EQP'), -- Elektrolity
		(175, 21, 2, 6, '2025-12-27 19:04:00', 25, 0, NULL), -- Glukoza
		(175, 21, 9, 15, '2025-12-27 19:01:00', 62, 1, 'DIL'), -- CRP
		(175, 21, 1, 16, '2025-12-27 19:03:00', 85, 1, 'DIL'), -- PCT
		(175, 21, 3, 8, '2025-12-27 19:05:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 176: Klara Hermans (K, 1999, Obstetrics)
		(176, 6, 1, 1, '2025-12-28 08:00:00', 25, 0, NULL), -- Morfologia
		(176, 6, 2, 4, '2025-12-28 08:01:00', 75, 1, 'REP'), -- Fibrynogen
		(176, 6, 5, 2, '2025-12-28 08:04:00', 44, 0, NULL), -- APTT
		(176, 6, 6, 15, '2025-12-28 08:05:00', 32, 0, NULL), -- CRP
		(176, 6, 3, 21, '2025-12-28 08:02:00', 210, 0, 'PRE'), -- HCV Ab
		(176, 6, 4, 22, '2025-12-28 08:03:00', 240, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 177: Oskar Wilk (M, 2024, Neonatology)
		(177, 3, 7, 1, '2025-12-28 08:15:00', 22, 0, NULL), -- Morfologia
		(177, 3, 1, 7, '2025-12-28 08:19:00', 32, 0, NULL), -- Elektrolity
		(177, 3, 10, 15, '2025-12-28 08:18:00', 55, 0, 'REP'), -- CRP
		(177, 3, 8, 12, '2025-12-28 08:16:00', 45, 1, NULL), -- Bilirubina całkowita
		(177, 3, 9, 13, '2025-12-28 08:17:00', 48, 1, NULL), -- Bilirubina bezpośrednia
		
		-- Pacjent 178: Izabela Kania (K, 1992, Internal)
		(178, 1, 2, 1, '2025-12-28 08:30:00', 25, 0, NULL), -- Morfologia
		(178, 1, 3, 7, '2025-12-28 08:31:00', 52, 0, 'EQP'), -- Elektrolity
		(178, 1, 7, 6, '2025-12-28 08:35:00', 25, 0, NULL), -- Glukoza
		(178, 1, 4, 15, '2025-12-28 08:32:00', 60, 1, 'REP'), -- CRP
		(178, 1, 5, 16, '2025-12-28 08:33:00', 85, 1, 'DIL'), -- PCT
		(178, 1, 6, 8, '2025-12-28 08:34:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 179: Artur Lisowski (M, 1980, Gastroenterology)
		(179, 5, 8, 1, '2025-12-28 08:45:00', 25, 0, NULL), -- Morfologia
		(179, 5, 2, 7, '2025-12-28 08:49:00', 50, 0, 'RER'), -- Elektrolity
		(179, 5, 9, 10, '2025-12-28 08:46:00', 42, 0, NULL), -- ALAT
		(179, 5, 10, 11, '2025-12-28 08:47:00', 45, 0, NULL), -- ASPAT
		(179, 5, 1, 12, '2025-12-28 08:48:00', 48, 0, NULL), -- Bilirubina całkowita
		
		
		-- Pacjent 180: Marta Czajka (K, 1974, General Surgery)
		(180, 2, 3, 1, '2025-12-28 09:00:00', 30, 0, NULL), -- Morfologia
		(180, 2, 4, 2, '2025-12-28 09:01:00', 45, 0, NULL), -- APTT
		(180, 2, 5, 3, '2025-12-28 09:02:00', 44, 0, NULL), -- PT
		(180, 2, 6, 4, '2025-12-28 09:03:00', 65, 0, 'PRE'), -- Fibrynogen
		(180, 2, 7, 15, '2025-12-28 09:04:00', 55, 1, 'REP'), -- CRP
		
		-- Pacjent 181: Sławomir Gajewski (M, 1982, Emergency)
		(181, 25, 8, 1, '2025-12-28 09:15:00', 25, 0, NULL), -- Morfologia
		(181, 25, 9, 14, '2025-12-28 09:16:00', 12, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(181, 25, 10, 15, '2025-12-28 09:17:00', 58, 1, 'DIL'), -- CRP
		(181, 25, 2, 7, '2025-12-28 09:19:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 182: Monika Sokołowska (K, 1996, ICU)
		(182, 1, 3, 1, '2025-12-28 09:30:00', 28, 1, NULL), -- Morfologia
		(182, 1, 4, 16, '2025-12-28 09:31:00', 92, 1, 'REP'), -- PCT
		(182, 1, 5, 15, '2025-12-28 09:32:00', 60, 1, 'DIL'), -- CRP
		(182, 1, 6, 14, '2025-12-28 09:33:00', 15, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(182, 1, 7, 8, '2025-12-28 09:34:00', 38, 0, NULL), -- Kreatynina
		
		-- Pacjent 183: Benedykt Przybylski (M, 1960, Cardiology)
		(183, 13, 8, 1, '2025-12-28 09:45:00', 25, 0, NULL), -- Morfologia
		(183, 13, 2, 7, '2025-12-28 09:49:00', 50, 0, 'EQP'), -- Elektrolity
		(183, 13, 9, 17, '2025-12-28 09:46:00', 55, 1, NULL), -- hs Troponina T
		(183, 13, 10, 19, '2025-12-28 09:47:00', 65, 1, 'RER'), -- proBNP
		(183, 13, 1, 18, '2025-12-28 09:48:00', 45, 0, NULL), -- CK-MB
		
		-- Pacjent 184: Nina Węgrzyn (K, 2011, Pediatrics)
		(184, 10, 3, 1, '2025-12-28 10:00:00', 22, 0, NULL), -- Morfologia
		(184, 10, 6, 6, '2025-12-28 10:03:00', 25, 0, NULL), -- Glukoza
		(184, 10, 4, 15, '2025-12-28 10:01:00', 32, 0, NULL), -- CRP
		(184, 10, 5, 25, '2025-12-28 10:02:00', 30, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 185: Robert Szczepański (M, 1985, Gynecology)
		(185, 15, 7, 1, '2025-12-28 10:15:00', 25, 0, NULL), -- Morfologia
		(185, 15, 9, 7, '2025-12-28 10:17:00', 55, 0, 'EQP'), -- Elektrolity
		(185, 15, 8, 15, '2025-12-28 10:16:00', 58, 1, 'DIL'), -- CRP
		(185, 15, 10, 16, '2025-12-28 10:18:00', 85, 0, 'DIL'), -- PCT
		(185, 15, 1, 8, '2025-12-28 10:19:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 186: Aurelia Burek (K, 1990, Obstetrics)
		(186, 16, 2, 1, '2025-12-28 10:30:00', 25, 0, NULL), -- Morfologia
		(186, 16, 3, 4, '2025-12-28 10:31:00', 70, 0, 'REP'), -- Fibrynogen
		(186, 16, 6, 15, '2025-12-28 10:34:00', 30, 0, NULL), -- CRP
		(186, 16, 4, 21, '2025-12-28 10:32:00', 255, 0, 'PRE'), -- HCV Ab
		(186, 16, 5, 22, '2025-12-28 10:33:00', 260, 0, 'EQP'), -- HIV Ag/Ab
		
		-- Pacjent 187: Tymon Górecki (M, 2025, Neonatology)
		(187, 22, 7, 1, '2025-12-28 10:45:00', 22, 0, NULL), -- Morfologia
		(187, 22, 1, 7, '2025-12-28 10:49:00', 32, 0, NULL), -- Elektrolity
		(187, 22, 10, 15, '2025-12-28 10:48:00', 55, 0, 'REP'), -- CRP
		(187, 22, 8, 12, '2025-12-28 10:46:00', 45, 0, NULL), -- Bilirubina całkowita
		(187, 22, 9, 13, '2025-12-28 10:47:00', 48, 1, NULL), -- Bilirubina bezpośrednia
		
		
		-- Pacjent 188: Kamila Zaremba (K, 1993, Internal)
		(188, 11, 2, 1, '2025-12-28 11:00:00', 25, 0, NULL), -- Morfologia
		(188, 11, 3, 7, '2025-12-28 11:01:00', 50, 0, 'RER'), -- Elektrolity
		(188, 11, 6, 6, '2025-12-28 11:04:00', 25, 0, NULL), -- Glukoza
		(188, 11, 4, 15, '2025-12-28 11:02:00', 62, 1, 'DIL'), -- CRP
		(188, 11, 5, 10, '2025-12-28 11:03:00', 42, 0, NULL), -- ALAT
		
		-- Pacjent 189: Filip Chmielewski (M, 1989, Gastroenterology)
		(189, 21, 7, 1, '2025-12-28 11:15:00', 25, 0, NULL), -- Morfologia
		(189, 21, 1, 7, '2025-12-28 11:19:00', 52, 0, 'EQP'), -- Elektrolity
		(189, 21, 8, 10, '2025-12-28 11:16:00', 40, 0, NULL), -- ALAT
		(189, 21, 9, 11, '2025-12-28 11:17:00', 40, 0, NULL), -- ASPAT
		(189, 21, 10, 15, '2025-12-28 11:18:00', 55, 1, 'REP'), -- CRP
		
		-- Pacjent 190: Sonia Bielecka (K, 1971, General Surgery)
		(190, 7, 2, 1, '2025-12-28 11:30:00', 30, 0, NULL), -- Morfologia
		(190, 7, 3, 2, '2025-12-28 11:31:00', 44, 0, NULL), -- APTT
		(190, 7, 4, 4, '2025-12-28 11:32:00', 48, 0, NULL), -- Fibrynogen
		(190, 7, 5, 3, '2025-12-28 11:33:00', 42, 0, NULL), -- PT
		(190, 7, 6, 15, '2025-12-28 11:34:00', 35, 1, NULL), -- CRP
		
		-- Pacjent 191: Grzegorz Ratajczak (M, 1984, Emergency)
		(191, 25, 7, 1, '2025-12-28 11:45:00', 25, 0, NULL), -- Morfologia
		(191, 25, 10, 7, '2025-12-28 11:48:00', 50, 0, 'EQP'), -- Elektrolity 
		(191, 25, 9, 15, '2025-12-28 11:47:00', 55, 1, 'REP'), -- CRP 
		(191, 25, 1, 17, '2025-12-28 11:49:00', 50, 0, NULL), -- hs Troponina T
		(191, 25, 2, 20, '2025-12-28 11:50:00', 40, 0, NULL), -- CK
		(191, 25, 3, 18, '2025-12-28 11:51:00', 50, 0, NULL), -- CK-MB
		
		-- Pacjent 192: Mirosława Mroz (K, 1966, ICU)
		(192, 19, 2, 1, '2025-12-28 12:00:00', 26, 1, NULL), -- Morfologia
		(192, 19, 3, 16, '2025-12-28 12:01:00', 88, 1, 'DIL'), -- PCT
		(192, 19, 4, 15, '2025-12-28 12:02:00', 58, 1, 'DIL'), -- CRP
		(192, 19, 5, 14, '2025-12-28 12:03:00', 18, 0, NULL), -- Równowaga kwasowo – zasadowa (gazometria)
		(192, 19, 6, 8, '2025-12-28 12:04:00', 35, 0, NULL), -- Kreatynina
		
		-- Pacjent 193: Zdzisław Kaczmarczyk (M, 1952, Cardiology)
		(193, 23, 7, 1, '2025-12-28 12:15:00', 25, 0, NULL), -- Morfologia
		(193, 23, 1, 7, '2025-12-28 12:19:00', 52, 0, 'RER'), -- Elektrolity
		(193, 23, 8, 17, '2025-12-28 12:16:00', 50, 1, NULL), -- hs Troponina T
		(193, 23, 9, 19, '2025-12-28 12:17:00', 60, 1, NULL), -- proBNP
		(193, 23, 10, 18, '2025-12-28 12:18:00', 45, 0, NULL), -- CK-MB
		
		-- Pacjent 194: Blanka Świątek (K, 2018, Pediatrics)
		(194, 22, 2, 1, '2025-12-28 12:30:00', 24, 0, NULL), -- Morfologia
		(194, 22, 5, 6, '2025-12-28 12:33:00', 25, 0, NULL), -- Glukoza
		(194, 22, 3, 15, '2025-12-28 12:31:00', 30, 0, NULL), -- CRP
		(194, 22, 4, 25, '2025-12-28 12:32:00', 30, 0, NULL), -- Badanie ogólne moczu
		
		-- Pacjent 195: Feliks Wolski (M, 1970, Internal)
		(195, 21, 6, 1, '2025-12-28 12:45:00', 25, 0, NULL), -- Morfologia
		(195, 21, 8, 7, '2025-12-28 12:47:00', 55, 0, 'EQP'), -- Elektrolity
		(195, 21, 10, 6, '2025-12-28 12:49:00', 25, 0, NULL), -- Glukoza
		(195, 21, 7, 15, '2025-12-28 12:46:00', 65, 1, 'DIL'), -- CRP
		(195, 21, 9, 16, '2025-12-28 12:48:00', 85, 1, 'DIL'), -- PCT
		
		-- Pacjent 196: Liliana Kołodziej (K, 2002, Obstetrics)
		(196, 6, 1, 1, '2025-12-28 13:00:00', 25, 0, NULL), -- Morfologia
		(196, 6, 2, 4, '2025-12-28 13:01:00', 75, 1, 'REP'), -- Fibrynogen
		(196, 6, 5, 15, '2025-12-28 13:04:00', 30, 0, NULL), -- CRP
		(196, 6, 3, 21, '2025-12-28 13:02:00', 260, 0, 'EQP'), -- HCV Ab
		(196, 6, 4, 22, '2025-12-28 13:03:00', 245, 0, 'PRE'), -- HIV Ag/Ab
		
		-- Pacjent 197: Bruno Sowa (M, 2024, Neonatology)
		(197, 3, 6, 1, '2025-12-28 13:15:00', 22, 0, NULL), -- Morfologia
		(197, 3, 9, 7, '2025-12-28 13:18:00', 30, 0, NULL), -- Elektrolity
		(197, 3, 8, 15, '2025-12-28 13:17:00', 52, 0, 'REP'), -- CRP
		(197, 3, 7, 12, '2025-12-28 13:16:00', 45, 1, NULL), -- Bilirubina całkowita
		
		-- Pacjent 198: Marzena Marek (K, 1978, Internal)
		(198, 1, 10, 1, '2025-12-28 13:30:00', 25, 0, NULL), -- Morfologia
		(198, 1, 2, 7, '2025-12-28 13:32:00', 58, 0, 'EQP'), -- Elektrolity
		(198, 1, 3, 6, '2025-12-28 13:33:00', 25, 0, NULL), -- Glukoza
		(198, 1, 1, 15, '2025-12-28 13:31:00', 60, 1, 'DIL'), -- CRP
		
		-- Pacjent 199: Julian Zięba (M, 1983, Gastroenterology -> Dr Internist Ward 8)
		(199, 15, 4, 1, '2025-12-28 13:45:00', 25, 0, NULL), -- Morfologia
		(199, 15, 5, 10, '2025-12-28 13:46:00', 42, 0, NULL), -- ALAT
		(199, 15, 6, 11, '2025-12-28 13:47:00', 40, 0, NULL), -- ASPAT
		(199, 15, 7, 7, '2025-12-28 13:48:00', 50, 0, 'EQP'), -- Elektrolity
		
		-- Pacjent 200: Bogumiła Góra (K, 1965, General Surgery)
		(200, 19, 8, 1, '2025-12-28 14:00:00', 30, 0, NULL), -- Morfologia
		(200, 19, 9, 2, '2025-12-28 14:01:00', 44, 0, NULL), -- APTT
		(200, 19, 10, 3, '2025-12-28 14:02:00', 42, 0, NULL), -- PT
		(200, 19, 1, 4, '2025-12-28 14:03:00', 70, 0, 'PRE'), -- Fibrynogen
		(200, 19, 2, 15, '2025-12-28 14:04:00', 55, 1, 'REP'); -- CRP
		
		
		
		select * from orders
