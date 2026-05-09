<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dao.HospitalDAO" %>

<!DOCTYPE html>
<html>
<head>
    <title>HMS | INPUT_MOD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <style>
    :root { 
        --glass-bg: rgba(255, 255, 255, 0.75);
        --main-indigo: #4f46e5;
        --soft-bg: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%);
    }
    
    body { 
        background: var(--soft-bg);
        color: #1e293b; 
        font-family: 'Inter', system-ui, sans-serif;
        min-height: 100vh;
    }

    .neon-text { 
        color: var(--main-indigo);
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .neon-border { 
        background: var(--glass-bg);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.5);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        border-radius: 16px;
    }

    /* Fixed visibility for labels */
    .text-light, label { color: #334155 !important; font-weight: 600; }

    input, select { 
        background: #ffffff !important; 
        border: 1px solid #cbd5e1 !important; 
        color: #0f172a !important;
        border-radius: 8px !important;
    }

    /* Primary Action Button */
    .btn-neon { 
        background: var(--main-indigo); 
        color: white; 
        border: none;
        font-weight: 700;
        transition: 0.3s;
    }
    .btn-neon:hover { background: #3730a3; color: white; transform: translateY(-2px); }

    /* Fix for "Main Menu" or "Exit" buttons that were hidden */
    .btn-outline-light {
        border-color: #64748b;
        color: #475569;
    }
    .btn-outline-light:hover { background: #64748b; color: white; }
</style>
</head>

<%
    // Logic to fetch the NEXT ID using your exact password
    int nextId = 101; // Starts at 101
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/HospitalDB", "root", "I@m2w312@nannu");
        java.sql.Statement st = con.createStatement();
        java.sql.ResultSet rs = st.executeQuery("SELECT MAX(PatientID) FROM Patients");
        if(rs.next()) {
            int currentMax = rs.getInt(1);
            if(currentMax >= 101) {
                nextId = currentMax + 1;
            } else if (currentMax > 0) {
                nextId = currentMax + 1;
            }
        }
        con.close();
    } catch(Exception e) { 
        e.printStackTrace(); 
    }
%>

<body>
    <div class="container mt-5 col-md-8">
        <h2 class="neon-text fw-bold mb-4">>> INIT: PATIENT_DATA_ENTRY</h2>
        <div class="neon-border p-5">
            <form action="addPatient" method="post">
                <div class="row g-4">
                    <div class="col-md-4">
                        <label class="text-secondary">PATIENT_ID</label>
                        <input type="number" name="id" class="form-control fw-bold" value="<%= nextId %>" readonly>
                        <small class="text-muted">READ_ONLY // AUTO_CALCULATED</small>
                    </div>
					     <div class="col-md-8">
					    <label class="text-secondary">PATIENT_NAME</label>
					    <input 
					        type="text" 
					        name="name" 
					        class="form-control" 
					        pattern="[A-Za-z\s]+" 
					        title="Please enter only letters and spaces." 
					        required>
					</div>
                    <div class="col-md-4">
                       <label class="text-secondary">AGE</label>
                        <input type="number" name="age" class="form-control" min="0" max="120" required>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">GENDER</label>
                        <select name="gender" class="form-select">
                            <option value="Male">MALE</option>
                            <option value="Female">FEMALE</option>
                            <option value="Female">TRANSGENDER</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">ADMIT_DATE</label>
                        <input type="date" name="date" id="dateField" class="form-control" required>
                    </div>
                    <div class="col-md-6">
					    <label class="text-secondary">WHAT IS THE REASON FOR YOUR VISIT?</label>
					    <select name="ailment" class="form-control" required>
					        <option value="" disabled selected>-- Select an option --</option>    
					        <option value="Fever/Cold">Fever, Cold, or Flu</option>
					        <option value="Stomach Pain">Stomach Pain or Indigestion</option>
					        <option value="Body Ache">Body Ache / Muscle Pain</option>
					        <option value="Headache">Headache or Migraine</option>
					        <option value="Injury">Injury (Cut, Fall, or Bruise)</option>
					        <option value="Skin Issue">Skin Rash or Allergy</option>
					        <option value="Breathing Issue">Difficulty Breathing / Cough</option>
					        <option value="Checkup">Routine Health Checkup</option>
					        <option value="Other">Other (Not listed)</option>
					    </select>
					</div>
                    <div class="col-md-6">
				    <label class="text-secondary">ASSIGNED DOCTOR</label>
				    <select name="doctor" class="form-control" required>
				        <option value="" disabled selected>-- Select a Specialist --</option>
				        
				        <optgroup label="Heart Specialists (Cardiologists)">
				            <option value="Dr. Devi Shetty">Dr. Devi Shetty (Narayana Health)</option>
				            <option value="Dr. C.N. Manjunath">Dr. C.N. Manjunath (Jayadeva Institute)</option>
				            <option value="Dr. Sreekanth Shetty">Dr. Sreekanth Shetty (Sakra World Hospital)</option>
				        </optgroup>
				
				        <optgroup label="General Physicians (Fever, Flu, General Health)">
				            <option value="Dr. Raja Selvarajan">Dr. Raja Selvarajan (Bangalore)</option>
				            <option value="Dr. Shivaprasad">Dr. Shivaprasad (North Karnataka)</option>
				            <option value="Dr. Raghu Janardhan">Dr. Raghu Janardhan (Internal Medicine)</option>
				        </optgroup>
				
				        <optgroup label="Orthopedics (Bones & Joints)">
				            <option value="Dr. Basavaraj Kyavater">Dr. Basavaraj Kyavater (Joint Replacement)</option>
				            <option value="Dr. Chandrashekar P">Dr. Chandrashekar P (Orthopaedics)</option>
				            <option value="Dr. Manish HP">Dr. Manish HP (Robotic Surgery)</option>
				        </optgroup>
				
				        <optgroup label="Gynaecology (Women's Health)">
				            <option value="Dr. Shanthala Thuppanna">Dr. Shanthala Thuppanna</option>
				            <option value="Dr. Ashwini M R">Dr. Ashwini M R</option>
				            <option value="Dr. Shubha Rao">Dr. Shubha Rao</option>
				        </optgroup>
				
				        <optgroup label="Paediatrics (Child Specialists)">
				            <option value="Dr. Ali Kumble">Dr. Ali Kumble (Mangalore)</option>
				            <option value="Dr. Deepa Patil">Dr. Deepa Patil</option>
				        </optgroup>
				    </select>
				</div>
                </div>
                <div class="mt-5 d-flex justify-content-between">
                    <a href="index.jsp" class="btn btn-outline-light px-5">ABORT</a>
                    <button type="submit" class="btn btn-neon px-5">COMMIT_DATA</button>
                </div>
            </form>
        </div>
        <div class="mt-5 pt-4 text-secondary small border-top border-secondary opacity-50">
            SYSTEM_STATUS: ONLINE // ENCRYPTION: ACTIVE // © 2026 IRANNA M Warad
        </div>
    </div>

    <script>
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("dateField").setAttribute('max', today);
    </script>
</body>
</html>