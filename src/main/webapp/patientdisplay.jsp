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
        --main-indigo: #4f46e5;
        --table-row-hover: rgba(79, 70, 229, 0.05);
    }
    
    body { 
        background: #f8fafc; /* Clean off-white */
        color: #0f172a; 
        font-family: 'Inter', sans-serif;
    }

    .neon-border { 
        background: white;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }

    /* Fixed Table Visibility */
    .table-dark { color: #1e293b !important; }
    
    .table thead th { 
        color: var(--main-indigo); 
        background: #f1f5f9;
        border-bottom: 2px solid #e2e8f0 !important;
        font-weight: 700;
    }

    .table tbody tr:hover { background-color: var(--table-row-hover); }

    /* Button visibility fixes */
    .btn-outline-info { color: #0891b2; border-color: #0891b2; }
    .btn-outline-info:hover { background: #0891b2; color: white; }
    
    .btn-outline-danger { color: #dc2626; border-color: #dc2626; }
    .btn-outline-danger:hover { background: #dc2626; color: white; }

    /* Navigation button visibility */
    .btn-outline-light { border-color: #94a3b8; color: #475569; }
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
    <div class="container mt-4">
        <div class="border-bottom pb-3 mb-5" style="border-color: var(--neon-green) !important;">
            
            <div class="d-flex gap-2 mb-3">
                <a href="reports.jsp" class="btn btn-outline-info btn-sm">
                    <i class="fas fa-arrow-left me-2"></i>BACK_TO_ANALYTICS
                </a>
                <h2 class="neon-text fw-bold m-0">
                <i class="fas fa-server me-2"></i>
                <%= request.getAttribute("title") != null ? request.getAttribute("title") : "CORE_RECORDS" %>
            </h2>
            
                <div class="ms-auto d-flex gap-2">
                <button onclick="window.print()" class="btn btn-neon btn-sm">
                    <i class="fas fa-print me-1"></i>PRINT
                </button>
                <a href="index.jsp" class="btn btn-outline-light btn-sm">
                    <i class="fas fa-home me-1"></i>EXIT
                </a>
            </div>
        </div>
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
                            <td> <%= p.getAilment() %></td>
                            <td><%= p.getAssignedDoctor() %></td>
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
            </div> 
             </div> 
               <div class="mt-5 pt-4 text-secondary small border-top border-secondary opacity-50">
            SYSTEM_STATUS: ONLINE // ENCRYPTION: ACTIVE // © 2026 IRANNA M Warad
        </div>
</body>
</html>