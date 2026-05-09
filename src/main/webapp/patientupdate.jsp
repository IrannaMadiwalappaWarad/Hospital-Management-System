<%@ page import="com.model.Patient" %>
<% 
    // Fetch the patient object passed from UpdatePatientServlet
    Patient p = (Patient) request.getAttribute("p"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>HMS | UPDATE_MOD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
<body>
    <div class="container mt-5 col-md-8">
        <div class="d-flex justify-content-between border-bottom pb-2 mb-4" style="border-color: var(--neon-green) !important;">
            <h2 class="neon-text fw-bold">>> OVERRIDE: RECORD #<%= p.getPatientID() %></h2>
            <a href="displayPatients" class="btn btn-outline-light">CANCEL</a>
        </div>
        <div class="neon-border p-5 rounded">
            <form action="updatePatient" method="post">
                <input type="hidden" name="id" value="<%= p.getPatientID() %>">
                
                <div class="row g-4">
                    <div class="col-md-8">
                        <label class="text-secondary">PATIENT_NAME</label>
						<input type="text" name="name" class="form-control" 
						       pattern="[A-Za-z\s]+" 
						       title="Please enter only letters and spaces. Numbers are not allowed." 
						       value="<%= p.getPatientName() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">AGE</label>
                        <input type="number" name="age" class="form-control" value="<%= p.getAge() %>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">GENDER</label>
                        <select name="gender" class="form-select">
                            <option value="Male" <%= p.getGender().equals("Male") ? "selected" : "" %>>MALE</option>
                            <option value="Female" <%= p.getGender().equals("Female") ? "selected" : "" %>>FEMALE</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">ADMIT_DATE</label>
                        <input type="date" name="date" class="form-control" value="<%= p.getAdmissionDate() %>" required>
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
                <div class="mt-5">
                    <button type="submit" class="btn btn-neon w-100 py-2">EXECUTE_UPDATE</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>