/* =========================================================
File: 2_data_reference.sql
Database: full_lab_project
Description: Seed data for hospital wards and laboratory tests
Purpose: 
- Populates the ward directory for workload analysis
- Defines reference TAT (Turnaround Time) values for all tests
- Sets thresholds for delay detection
========================================================= */

use  full_lab_project;

/* =======================
Table: Wards
Description: List of hospital departments used for ward-level analysis
Assumptions:
- ward_id is AUTO_INCREMENT
======================= */

INSERT INTO wards (ward_name)
	VALUES
		('Emergency'),
		('ICU'),
		('Cardiology'),
		('Pediatrics'),
		('Gynecology'),
		('Obstetrics'),
		('Neonatology'),
		('Internal'),
		('Gastroenterology'),
		('General Surgery')

-- Verify wards insertion
select * from wards


/* =======================
Table: Tests
Description: Catalog of laboratory tests with performance benchmarks
Columns:
- TAT_med: Target median time (minutes)
- TAT_delay_threshold: Time after which an order is flagged as delayed
- typical_delay_reasons: Standard codes for process issues
======================= */

INSERT INTO tests
(test_name, category, TAT_med, TAT_delay_threshold, typical_delay_reasons)
VALUES
-- =========================
-- HEMATOLOGY
-- =========================
('Morfologia', 'Hematology', 25, 40, 'RER, REP, EQP'),

-- =========================
-- COAGULATION
-- =========================
('APTT', 'Coagulation', 40, 60, 'RER, REP, DIL, PRE' ),
('PT', 'Coagulation', 40, 60, 'RER, REP, DIL, PRE '),
('Fibrynogen', 'Coagulation', 40, 60, 'RER, REP, PRE'),
('D-dimery', 'Coagulation', 40, 60, 'RER, REP, DIL, PRE'),

-- =========================
-- BIOCHEMISTRY – ROUTINE
-- =========================
('Glukoza', 'Biochemistry', 25, 40, 'RER,REP'),
('Elektrolity', 'Biochemistry', 30, 45, 'RER,EQP'),
('Kreatynina', 'Biochemistry', 35, 50, 'REP,DIL'),
('Mocznik', 'Biochemistry', 35, 50, 'REP'),
('ALAT', 'Biochemistry', 40, 60, 'REP,EQP'),
('ASPAT', 'Biochemistry', 40, 60, 'REP,EQP'),
('Bilirubina całkowita', 'Biochemistry', 45, 65, 'REP'),
('Bilirubina bezpośrednia', 'Biochemistry', 45, 65, 'REP'),
('Równowaga kwasowo – zasadowa (gazometria) ', 'Biochemistry', 15, 30, 'RER'),


-- =========================
-- BIOCHEMISTRY – INFLAMMATION
-- =========================
('CRP', 'Biochemistry', 30, 45, 'REP,DIL'),
('PCT', 'Biochemistry', 50, 70, 'REP,DIL'),

-- =========================
-- BIOCHEMISTRY – CARDIAC
-- =========================
('hs Troponina T', 'Biochemistry', 45, 60, 'RER'),
('CK-MB', 'Biochemistry', 45, 60, 'RER'),
('proBNP', 'Biochemistry', 45, 60, 'RER,DIL'),
('CK', 'Biochemistry', 30, 60, 'RER,DIL'),

-- =========================
-- VIROLOGY
-- =========================
( 'HCV Ab', 'Virology', 60, 180, 'PRE, REP, EQP' ),
( 'HIV Ag/Ab', 'Virology', 60, 180, 'PRE, REP, EQP' ),

-- =========================
-- TOXICOLOGY
-- =========================
( 'Etanol', 'Toxicology', 30, 50, 'RER, EQP' ),
( 'Narkotyki w moczu (test jakościowy)', 'Toxicology', 20, 40, 'RER' ),

-- =========================
-- URINALYSIS
-- =========================
( 'Badanie ogólne moczu', 'Urinalysis', 30, 45, 'RER' );


-- Verify tests insertion
select * from tests
