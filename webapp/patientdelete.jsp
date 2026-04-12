<!DOCTYPE html>
<html>
<head>
    <title>HMS | Confirm Delete</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container text-center">
        <div class="col-md-5 mx-auto card shadow-lg p-5 border-0" style="border-radius: 25px;">
            <div class="text-danger mb-4">
                <i class="fas fa-exclamation-triangle fa-4x"></i>
            </div>
            <h2 class="fw-bold">Are you sure?</h2>
            <p class="text-secondary">You are about to delete Patient ID: <strong>#<%= request.getParameter("id") %></strong>. This action cannot be undone.</p>
            <div class="mt-4">
                <a href="deletePatient?id=<%= request.getParameter("id") %>" class="btn btn-danger px-4 py-2 rounded-pill me-2">Yes, Delete Record</a>
                <a href="viewRecords" class="btn btn-light px-4 py-2 rounded-pill border">Cancel</a>
            </div>
        </div>
    </div>
</body>
</html>