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
        :root { --neon-green: #9BE931; --dark-bg: #0B0F1A; --panel-bg: rgba(22, 28, 42, 0.8); }
        body { background-color: var(--dark-bg); color: #fff; font-family: 'Courier New', Courier, monospace; }
        .neon-border { border: 1px solid var(--neon-green); box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); background: var(--panel-bg); }
        .btn-neon { background: var(--neon-green); color: var(--dark-bg); font-weight: bold; transition: 0.3s; }
        .btn-neon:hover { box-shadow: 0 0 15px var(--neon-green); }
        .neon-text { color: var(--neon-green); text-shadow: 0 0 10px var(--neon-green); }
        input, select { background: rgba(255,255,255,0.05) !important; border: 1px solid rgba(155, 233, 49, 0.4) !important; color: var(--neon-green) !important; }
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
                        <input type="text" name="name" class="form-control" value="<%= p.getPatientName() %>" required>
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
                        <label class="text-secondary">DIAGNOSIS / AILMENT</label>
                        <input type="text" name="ailment" class="form-control" value="<%= p.getAilment() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label class="text-secondary">ASSIGNED_DOC</label>
                        <input type="text" name="doctor" class="form-control" value="<%= p.getAssignedDoctor() %>" required>
                    </div>
                </div>
                <div class="mt-5">
                    <button type="submit" class="btn btn-neon w-100 py-2">EXECUTE_UPDATE</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>