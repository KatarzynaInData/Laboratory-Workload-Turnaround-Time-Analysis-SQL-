create database full_lab_project;
use  full_lab_project;

/* =======================
   Table: Wards
   Description: Hospital wards/departments
   Columns:
   - ward_id   : Primary key, AUTO_INCREMENT
   - ward_name : Name of the ward
   ======================= */
CREATE TABLE wards (
    ward_id INT PRIMARY KEY AUTO_INCREMENT,
    ward_name VARCHAR(50) NOT NULL );


/* =======================
   Table: Patients
   Description: Patient personal and admission data
   Columns:
   - patient_id : Primary key, AUTO_INCREMENT
   - first_name : Patient first name
   - last_name  : Patient last name
   - gender     : Patient gender (M/F)
   - birth_date : Date of birth
   - ward_id    : Reference to wards(ward_id)
   Assumptions:
   - Each patient may be assigned to one ward
   ======================= */
CREATE TABLE patients 
(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    birth_date DATE NOT NULL,
    ward_id INT,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id)
);


/* =======================
   Table: Doctors
   Description: Doctors working in hospital wards
   Columns:
   - doctor_id     : Primary key, AUTO_INCREMENT
   - first_name    : Doctor first name
   - last_name     : Doctor last name
   - specialization: Medical specialization
   - ward_id       : Reference to wards(ward_id)
   ======================= */
CREATE TABLE doctors 
(
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR (50) NOT NULL,
    ward_id INT,
    FOREIGN KEY (ward_id) REFERENCES wards(ward_id)
);


/* =======================
   Table: Diagnosticians
   Description: Laboratory diagnosticians performing tests
   Columns:
   - diagnostician_id : Primary key, AUTO_INCREMENT
   - first_name       : Diagnostician first name
   - last_name        : Diagnostician last name
   ======================= */
CREATE TABLE diagnosticians 
(
    diagnostician_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


/* =======================
   Table: Tests
   Description: Laboratory tests catalog
   Columns:
   - test_id              : Primary key, AUTO_INCREMENT
   - test_name            : Name of the laboratory test
   - category             : Test category 
   - TAT_med              : Median turnaround time (minutes)
   - TAT_delay_threshold  : Delay threshold (minutes)
   - typical_delay_reasons: Common causes of delay
   ======================= */
CREATE TABLE tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    test_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    tat_med SMALLINT NOT NULL,
    tat_delay_threshold SMALLINT NOT NULL,
    typical_delay_reasons VARCHAR(100)
);

/* =======================
   Table: Orders
   Description: Laboratory test orders
   Columns:
   - order_id          : Primary key, AUTO_INCREMENT
   - patient_id        : Reference to patients(patient_id)
   - doctor_id         : Ordering doctor
   - diagnostician_id  : Performing diagnostician
   - test_id           : Ordered test
   - order_datetime    : Date and time of order
   - tat_minutes       : Actual turnaround time
   - abnormal          : Abnormal result flag
   - delay_reason      : Reason for delay (if any)
   Assumptions:
   - Each order refers to exactly one patient, doctor,
     diagnostician and test
   ======================= */
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnostician_id INT NOT NULL,
    test_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    tat_minutes SMALLINT NOT NULL,
    abnormal BOOLEAN NOT NULL,
    delay_reason VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (diagnostician_id) REFERENCES diagnosticians(diagnostician_id),
    FOREIGN KEY (test_id) REFERENCES tests(test_id)
);

