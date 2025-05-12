# Clinic Database ERD
 Entity-Relationship Diagram (ERD) for the `clinic.sql` database:

- **Doctors** (`doctorID` is the primary key)
  - `doctorID` → Primary Key
  - `firstName`
  - `lastName`
  - `Specialization`
  - `email` → Unique

- **Patients** (`patientID` is the primary key)
  - `patientID` → Primary Key
  - `firstName`
  - `lastName`
  - `birthDate`
  - `email` → Unique
  - `phoneNumber`

- **Appointments** (links `Patients` and `Doctors`)
  - `patientID` → Foreign Key referencing `Patients(patientID)`
  - `doctorID` → Foreign Key referencing `Doctors(doctorID)`
  - `appointmentDate`
  - `notes`

- **Treatments**
  - `treatmentID` → Primary Key
  - `name`
  - `description`

- **AppointmentTreatment** (many-to-many relationship between `Appointments` and `Treatments`)
  - `patientID` → Foreign Key referencing `patients(appointmentID)`
  - `treatmentID` → Foreign Key referencing `Treatments(treatmentID)`
  - Composite Primary Key: (`appointmentID`, `treatmentID`)

- **Payments** (one-to-one relationship with `Appointments`)
  - `paymentID` → Primary Key
  - `patientID` → Unique Foreign Key referencing `patientss(appointmentID)`
  - `amountPaid`
  - `paymentMethod`

- **Labs**
  - `labID` → Primary Key
  - `labName`
  - `description`
  - `cost`

- **LabAppointment** (many-to-many relationship between `Appointments` and `Labs`)
  - `patientID` → Foreign Key referencing `Appointments(appointmentID)`
  - `labID` → Foreign Key referencing `Labs(labID)`
  - `labResults`
  - `releaseDate`
  - Composite Primary Key: (`appointmentID`, `labID`)

### Relationships
1. **Doctors ↔ Appointments**: One-to-Many (a doctor can have multiple appointments).
2. **Patients ↔ Appointments**: One-to-Many (a patient can have multiple appointments).
3. **Appointments ↔ Treatments**: Many-to-Many (an appointment can have multiple treatments, and a treatment can belong to multiple appointments).
4. **Appointments ↔ Payments**: One-to-One (an appointment has one payment).
5. **Appointments ↔ Labs**: Many-to-Many (an appointment can involve multiple labs, and a lab can be associated with multiple appointments).

This structure ensures data integrity and supports the clinic's operations efficiently.