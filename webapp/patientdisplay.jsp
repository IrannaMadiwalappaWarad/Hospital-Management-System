<%@ page import="java.util.*, com.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <title>HMS | DATABASE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        :root { 
            --neon-green: #9BE931; 
            --dark-bg: #0B0F1A; 
            --panel-bg: rgba(22, 28, 42, 0.8); 
        }
        body { 
            background-color: var(--dark-bg); 
            color: #fff; 
            font-family: 'Courier New', Courier, monospace; 
            max-width: 100vw; 
            overflow-x: hidden; 
        }
        .neon-border { 
            border: 1px solid var(--neon-green); 
            box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); 
            background: var(--panel-bg); 
            border-radius: 8px;
        }
        .btn-neon { 
            border: 1px solid var(--neon-green); 
            color: var(--neon-green); 
            background: transparent; 
            transition: 0.3s; 
        }
        .btn-neon:hover { 
            background: var(--neon-green); 
            color: var(--dark-bg); 
        }
        .neon-text { 
            color: var(--neon-green); 
            text-shadow: 0 0 10px var(--neon-green); 
        }
        .table-dark { 
            --bs-table-bg: transparent; 
            color: white; 
        }
        td, th { 
            border-bottom: 1px solid rgba(155,233,49,0.3) !important; 
            padding: 12px 15px !important; 
            white-space: nowrap; /* Keeps text on one line so columns stay neat */
        }
        
        /* The magic fix for the "overlapping" scrollbar */
        .table-responsive::-webkit-scrollbar { height: 8px; }
        .table-responsive::-webkit-scrollbar-track { background: var(--dark-bg); }
        .table-responsive::-webkit-scrollbar-thumb { background: var(--neon-green); border-radius: 4px; }
    </style>    
</head>

<script>
// Here I replaced the standard browser-native confirm() method with a Custom Promise-based Modal system (SweetAlert2).
//Why I use SweetAlert2. It provides beautiful, customizable popups that don't have that "localhost" text.
function confirmDelete(id) {
    Swal.fire({
        title: 'SYSTEM ALERT',
        text: "ARE YOU SURE YOU WANT TO ERASE PATIENT #" + id + "?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#9BE931', // My fav Neon Green
        cancelButtonColor: '#d33',
        confirmButtonText: 'YES, WIPE DATA',
        cancelButtonText: 'ABORT',
        background: '#0B0F1A', //Dark BG
        color: '#fff',
        customClass: {
            popup: 'neon-border' // I'm reusing css here
        }
    }).then((result) => {
        if (result.isConfirmed) {
            // Redirect to the servlet if confirmed
            window.location.href = 'deletePatient?id=' + id;
        }
    })
}
</script>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3" style="border-color: var(--neon-green) !important;">
            <h2 class="neon-text fw-bold m-0">
                <i class="fas fa-server me-2"></i>
                <%= request.getAttribute("title") != null ? request.getAttribute("title") : "CORE_RECORDS" %>
            </h2>
            <div>
                <button onclick="window.print()" class="btn btn-neon me-2"><i class="fas fa-print"></i> PRINT</button>
                <a href="index.jsp" class="btn btn-outline-light"><i class="fas fa-home"></i> EXIT</a>
            </div>
        </div>

        <div class="neon-border p-4 rounded">
            <div class="table-responsive">
                <table class="table table-dark table-hover mb-0">
                    <thead>
                        <tr class="neon-text">
                            <th>Patient_ID</th>
                            <th>NAME</th>
                            <th>AGE/GEN</th>
                            <th>AILMENT</th>
                            <th>ASSIGNED_DOC</th>
                            <th>ADMIT_DATE</th>
                            <th>CMD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            @SuppressWarnings("unchecked")
                            List<Patient> list = (List<Patient>) request.getAttribute("list");
                            if(list != null && !list.isEmpty()) {
                                for(Patient p : list) {
                        %>
                        <tr>
                            <td class="fw-bold text-light">#<%= p.getPatientID() %></td>
                            <td><%= p.getPatientName() %></td>
                            <td><%= p.getAge() %> / <%= p.getGender().charAt(0) %></td>
                            <td>
                                <span class="badge" style="background: rgba(155,233,49,0.2); color: var(--neon-green); border: 1px solid var(--neon-green);">
                                    <%= p.getAilment() %>
                                </span>
                            </td>
                            <td>Dr. <%= p.getAssignedDoctor() %></td>
                            <td><%= p.getAdmissionDate() %></td>
                            <td>
                                <a href="updatePatient?id=<%= p.getPatientID() %>" class="btn btn-sm btn-outline-info"><i class="fas fa-pen"></i></a>
								<a href="javascript:void(0)" class="btn btn-sm btn-outline-danger" onclick="confirmDelete('<%= p.getPatientID() %>')"><i class="fas fa-trash"></i></a>                            
							</td>
                        </tr>
                        <% } } else { %>
                        <tr><td colspan="7" class="text-center py-5 text-secondary">ERR: NO_DATA_FOUND</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div> </div>
             <div class="mt-5 pt-4 text-secondary small border-top border-secondary opacity-50">
            SYSTEM_STATUS: ONLINE // ENCRYPTION: ACTIVE // © 2026 IRANNA M Warad
        	</div>
    </div>
</body>
</html>