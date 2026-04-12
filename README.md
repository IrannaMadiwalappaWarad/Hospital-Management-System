# **🏥 Hospital OS\_ v1.0 (Massive Neon Edition)**

**Hospital OS\_ v1.0** is a high-performance, web-based management system designed to administer patient records, doctor assignments, and analytical reports. Developed with a **Cyberpunk/Neon aesthetic**, it replaces traditional, dull administrative interfaces with a modern, reactive "Command Center" experience.

## ---

**⚡ Key Modules & Functionality**

* **⚡ CORE\_RECORDS (CRUD):** Complete lifecycle management of patient data including Registration (Add), Directory (View), Data Override (Update), and Secure Wipe (Delete).  
* **📊 ANALYTICS\_GEN:** Dynamic reporting engine filtering data by:  
  * Admission Date Ranges.  
  * Specific Doctor Assignments.  
  * Ailment/Diagnosis Categories.  
* **🛡️ SECURITY\_LAYER:** \* Server-side input validation to prevent negative numerical data.  
  * Client-side confirmation hooks using SweetAlert2 for data safety.  
* **🖥️ UI/UX DESIGN:** Glassmorphism panels, Neon Green accents (\#9BE931), and responsive Flexbox layouts.

## ---

**🛠️ Technical Architecture**

| Layer | Technology |
| :---- | :---- |
| **Frontend** | JSP, Bootstrap 5, SweetAlert2, FontAwesome 6 |
| **Backend** | Java Servlets (Jakarta EE 10), POJO Architecture |
| **Database** | MySQL 8.0+ |
| **Server** | Apache Tomcat 10.1 |
| **Project Design** | MVC (Model-View-Controller) |

## ---

**🚀 Installation & Setup**

### **1\. Database Configuration**

Execute the following SQL script in your MySQL terminal to initialize the environment:

SQL

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

### **2\. Environment Setup**

1. Ensure **Java JDK 17+** and **Apache Tomcat 10+** are installed.  
2. Clone the repository and import the project into **Eclipse IDE** (Enterprise Edition).  
3. Add mysql-connector-j.jar to the WEB-INF/lib folder.  
4. Update the database credentials in com.dao.HospitalDAO.java.

### **3\. Deployment**

1. Right-click on the project in Eclipse.  
2. Select **Run As \> Run on Server**.  
3. Access the system at: http://localhost:8080/HospitalMS/index.jsp

## ---

**📁 Project Structure**

Plaintext

HospitalMS/  
├── src/main/java/  
│   ├── com.dao/        \# HospitalDAO.java (JDBC Logic)  
│   ├── com.model/      \# Patient.java (Data Model)  
│   └── com.servlet/    \# All Logic Controllers (Add, Update, Delete, etc.)  
├── src/main/webapp/  
│   ├── index.jsp       \# Neon Command Center  
│   ├── patientadd.jsp  \# Registration UI  
│   ├── patientdisplay.jsp \# Core Database View  
│   ├── reports.jsp     \# Analytics Dashboard  
│   └── WEB-INF/        \# Configuration files  
└── README.md

## ---

**🧠 Core Engineering Principles**

* **Jakarta EE Migration:** Transitioned from javax to jakarta namespace to support the latest Tomcat 10 specifications.  
* **DRY (Don't Repeat Yourself):** Utilized a unified DAO method managePatient() to handle multiple SQL operations via command parameters.  
* **Responsive Integrity:** Implemented CSS clamp() and table-responsive wrappers to maintain UI alignment across all screen resolutions.

## ---

**👤 Author**

**Iranna M** *4th Semester Computer Science & Engineering* *Alva's Institute of Engineering and Technology*

---

*SYSTEM\_STATUS: STABLE // ENCRYPTION: ACTIVE // BUILD: SUCCESS*