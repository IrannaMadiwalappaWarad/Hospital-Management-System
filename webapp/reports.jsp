<!DOCTYPE html>
<html>
<head>
    <title>HMS | REPORT_GEN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --neon-green: #9BE931; --dark-bg: #0B0F1A; --panel-bg: rgba(22, 28, 42, 0.8); }
        body { background-color: var(--dark-bg); color: #fff; font-family: 'Courier New', Courier, monospace; }
        .neon-border { border: 1px solid var(--neon-green); box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); background: var(--panel-bg); }
        .btn-neon { background: transparent; border: 1px solid var(--neon-green); color: var(--neon-green); transition: 0.3s; }
        .btn-neon:hover { background: var(--neon-green); color: var(--dark-bg); }
        .neon-text { color: var(--neon-green); text-shadow: 0 0 10px var(--neon-green); }
        input { background: rgba(255,255,255,0.05) !important; border: 1px solid rgba(155, 233, 49, 0.4) !important; color: var(--neon-green) !important; }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between border-bottom pb-3 mb-5" style="border-color: var(--neon-green) !important;">
            <h2 class="neon-text fw-bold">>> ANALYTICS &amp; REPORTS</h2>
            <a href="index.jsp" class="btn btn-outline-light">MAIN_MENU</a>
        </div>

        <div class="row g-5">
            <div class="col-md-6">
                <div class="neon-border p-4 rounded h-100">
                    <h4 class="mb-4 text-light"><i class="fas fa-calendar-alt text-info me-2"></i> TIME_RANGE_QUERY</h4>
                    <form action="generateReport" method="get">
                        <label>START_DATE</label>
                        <input type="date" name="startDate" class="form-control mb-3" required>
                        <label>END_DATE</label>
                        <input type="date" name="endDate" class="form-control mb-4" required>
                        <button type="submit" class="btn btn-neon w-100 py-2">RUN_QUERY</button>
                    </form>
                </div>
            </div>

            <div class="col-md-6">
                <div class="neon-border p-4 rounded mb-4">
                    <h4 class="mb-3 text-light"><i class="fas fa-user-md text-warning me-2"></i> DOCTOR_QUERY</h4>
                    <form action="displayPatients" method="get" class="d-flex gap-2">
                        <input type="hidden" name="type" value="doctor">
                        <input type="text" name="val" class="form-control" placeholder="Doc Name (e.g. Smith)" required>
                        <button type="submit" class="btn btn-neon px-4">RUN</button>
                    </form>
                </div>

                <div class="neon-border p-4 rounded">
                    <h4 class="mb-3 text-light"><i class="fas fa-virus text-danger me-2"></i> AILMENT_QUERY</h4>
                    <form action="displayPatients" method="get" class="d-flex gap-2">
                        <input type="hidden" name="type" value="ailment">
                        <input type="text" name="val" class="form-control" placeholder="Disease (e.g. Fever)" required>
                        <button type="submit" class="btn btn-neon px-4">RUN</button>
                    </form>
                </div>
            </div>
        </div>
           <div class="mt-5 pt-4 text-secondary small border-top border-secondary opacity-50">
            			SYSTEM_STATUS: ONLINE // ENCRYPTION: ACTIVE // © 2026 IRANNA M Warad
        </div>
    </div>
</body>
</html>