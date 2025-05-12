-- Clinic Booking Database
CREATE DATABASE clinicdb;

USE clinicdb;

-- A table for doctors
CREATE TABLE doctors (
doctorID INT AUTO_INCREMENT PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
Specialization VARCHAR(100) NOT NULL,
email VARCHAR(200) UNIQUE NOT NULL
);

-- A table for patients

CREATE TABLE patients (
patientID INT AUTO_INCREMENT PRIMARY KEY,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(50) NOT NULL,
birthDate DATE NOT NULL,
email VARCHAR (150) UNIQUE NOT NULL,
phoneNumber INT
);

-- patients appointment table
CREATE TABLE appointments (
patientID INT NOT NULL,
doctorID INT NOT NULL,
appointmentDate DATETIME NOT NULL,
notes TEXT,
FOREIGN KEY (patientID) REFERENCES patients (patientID),
FOREIGN KEY (doctorId) REFERENCES doctors (doctorID)
);

-- Patients treatment table
CREATE TABLE treatments (
treatmentID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
description TEXT);

-- many to many relationships between treatment and appointment

CREATE TABLE appointmentTreatment(
patientID INT,
treatmentID INT,
PRIMARY KEY (patientID, treatmentID),
FOREIGN KEY (patientID) REFERENCES patients(patientID),
FOREIGN KEY (treatmentID) REFERENCES treatments (treatmentID)
);

-- one-to-one relationship in the payment transactions table
CREATE TABLE payments (
paymentID INT AUTO_INCREMENT PRIMARY KEY,
patientID INT UNIQUE NOT NULL,
amountPaid DECIMAL(10,2) NOT NULL,
paymentMethod VARCHAR (50) NOT NULL,
FOREIGN KEY (patientID) REFERENCES patients(patientID)
);

-- A table for labs
CREATE TABLE labs (
labID INT AUTO_INCREMENT PRIMARY KEY,
labName VARCHAR (50) NOT NULL,
description TEXT,
cost DECIMAL(10,2) NOT NULL
);
-- patients appoint and labs-many-to-many relationships
CREATE TABLE labAppointment (
patientID INT,
labID INT,
labResults TEXT,
releaseDate DATE,
PRIMARY KEY (patientID, labID),
FOREIGN KEY (patientID) REFERENCES appointments(patientID),
FOREIGN KEY (labID) REFERENCES labs(labID)
);









