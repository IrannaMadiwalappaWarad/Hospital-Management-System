# 🏥 Hospital OS_ v1.0

**Hospital OS_ v1.0** is a modern, web-based hospital management system designed to manage patient records, doctor assignments, and analytical reports through a clean futuristic interface.

Built with a **Minimal Cyber UI aesthetic**, the system transforms traditional hospital administration into a streamlined digital command center experience.

---

# ⚡ Key Modules & Functionality

## ⚡ PATIENT_ADD
Register and initialize new patient records into the system core.

### Features
- Add patient details securely
- Store admission information
- Assign doctors dynamically
- Validate form inputs before submission

---

## 🗂️ CORE_RECORDS (CRUD)
Complete lifecycle management of hospital records.

### Operations
- Add patient data
- View complete patient directory
- Update patient information
- Delete outdated records safely

---

## 📊 REPORT_GEN
Analytical reporting engine for hospital data processing.

### Filters Available
- Admission date ranges
- Assigned doctor
- Ailment categories
- Patient-specific searches

---

## 🛡️ SECURITY_LAYER
System protection and validation mechanisms.

### Security Features
- Server-side validation
- Prevention of invalid numerical data
- Confirmation dialogs using SweetAlert2
- Controlled CRUD operations

---

## 🖥️ UI / UX DESIGN
Modern responsive interface inspired by futuristic operating systems.

### Design Elements
- Glassmorphism cards
- Soft purple neon theme
- Responsive Flexbox layouts
- Minimal command-center dashboard
- FontAwesome 6 icons

---

# 🛠️ Technical Architecture

| Layer | Technology |
| :--- | :--- |
| **Frontend** | JSP, Bootstrap 5, SweetAlert2, FontAwesome 6 |
| **Backend** | Java Servlets (Jakarta EE 10), POJO Architecture |
| **Database** | MySQL 8.0+ |
| **Server** | Apache Tomcat 10.1 |
| **Project Design** | MVC (Model-View-Controller) |

---

# 🚀 Installation & Setup

## 1. Database Configuration

Execute the following SQL script in MySQL:

```sql
CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    AdmissionDate DATE NOT NULL,
    Ailment VARCHAR(255),
    AssignedDoctor VARCHAR(100)
);
```

---

## 2. Environment Setup

1. Install **Java JDK 17+**
2. Install **Apache Tomcat 10+**
3. Import the project into **Eclipse IDE Enterprise Edition**
4. Add `mysql-connector-j.jar` into `WEB-INF/lib`
5. Update database credentials inside:

```plaintext
com.dao.HospitalDAO.java
```

---

## 3. Deployment

1. Right-click the project in Eclipse
2. Select:

```plaintext
Run As → Run on Server
```

3. Open in browser:

```plaintext
http://localhost:8080/HospitalMS/index.jsp
```

---

# 📁 Project Structure

```plaintext
HospitalMS/
├── src/main/java/
│   ├── com.dao/
│   │   └── HospitalDAO.java
│   ├── com.model/
│   │   └── Patient.java
│   └── com.servlet/
│       ├── AddPatientServlet.java
│       ├── UpdatePatientServlet.java
│       ├── DeletePatientServlet.java
│       └── ReportServlet.java
│
├── src/main/webapp/
│   ├── index.jsp
│   ├── patientadd.jsp
│   ├── patientdisplay.jsp
│   ├── reports.jsp
│   └── WEB-INF/
│
└── README.md
```

---

# 🧠 Core Engineering Principles

## Jakarta EE Migration
Migrated from `javax` to `jakarta` namespace for compatibility with Tomcat 10.

## DRY Principle
Implemented reusable DAO methods to reduce repetitive SQL logic.

## Responsive Integrity
Used responsive wrappers and modern CSS alignment techniques for cross-device support.

## MVC Architecture
Separated presentation, business logic, and data access for maintainability.

---

# 👤 Author

**Iranna M**  
*4th Semester Computer Science & Engineering*  
*Alva's Institute of Engineering and Technology*

---

```plaintext
SYSTEM_STATUS: ONLINE
ENCRYPTION: ACTIVE
BUILD_VERSION: Hospital OS_ v1.0
```

