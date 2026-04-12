<%@ page import="java.util.*, com.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>HMS | REPORT_DATA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --neon-green: #9BE931; --dark-bg: #0B0F1A; --panel-bg: rgba(22, 28, 42, 0.8); }
        body { background-color: var(--dark-bg); color: #fff; font-family: 'Courier New', Courier, monospace; }
        .neon-border { border: 1px solid var(--neon-green); box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); background: var(--panel-bg); }
        .btn-neon { border: 1px solid var(--neon-green); color: var(--neon-green); background: transparent; transition: 0.3s; }
        .btn-neon:hover { background: var(--neon-green); color: var(--dark-bg); }
        .neon-text { color: var(--neon-green); text-shadow: 0 0 10px var(--neon-green); }
        .table-dark { --bs-table-bg: transparent; color: white; }
        td, th { border-bottom: 1px solid rgba(155,233,49,0.3) !important; padding: 15px !important; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3" style="border-color: var(--neon-green) !important;">
            <h2 class="neon-text fw-bold m-0">>> <%= request.getAttribute("reportTitle") %></h2>
            <div>
                <button onclick="window.print()" class="btn btn-neon me-2">PRINT_DATA</button>
                <a href="report_form.jsp" class="btn btn-outline-light">NEW_QUERY</a>
            </div>
        </div>

        <div class="neon-border p-4 rounded">
            <table class="table table-dark table-hover mb-0">
                <thead>
                    <tr class="neon-text">
                        <th>ID</th><th>PATIENT_NAME</th><th>AGE</th><th>GENDER</th><th>AILMENT</th><th>DOCTOR</th><th>ADMITTED</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        @SuppressWarnings("unchecked")
                        List<Patient> list = (List<Patient>) request.getAttribute("reportList");
                        if(list != null && !list.isEmpty()) {
                            for(Patient p : list) {
                    %>
                    <tr>
                        <td class="fw-bold">#<%= p.getPatientID() %></td>
                        <td><%= p.getPatientName() %></td>
                        <td><%= p.getAge() %></td>
                        <td><%= p.getGender() %></td>
                        <td class="text-warning"><%= p.getAilment() %></td>
                        <td class="text-info"><%= p.getAssignedDoctor() %></td>
                        <td><%= p.getAdmissionDate() %></td>
                    </tr>
                    <% } } else { %>
                    <tr><td colspan="7" class="text-center py-5 text-secondary">NO MATCHING RECORDS FOUND IN DATABASE.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>