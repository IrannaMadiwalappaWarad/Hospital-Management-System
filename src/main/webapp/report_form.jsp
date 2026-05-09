<!DOCTYPE html>
<html>
<head>
    <title>HMS | REPORT_PARAMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --neon-green: #9BE931; --dark-bg: #0B0F1A; --panel-bg: rgba(22, 28, 42, 0.8); }
        body { background-color: var(--dark-bg); color: #fff; font-family: 'Courier New', Courier, monospace; }
        .neon-border { border: 1px solid var(--neon-green); box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); background: var(--panel-bg); }
        .btn-neon { background: transparent; border: 1px solid var(--neon-green); color: var(--neon-green); font-weight: bold; transition: 0.3s; }
        .btn-neon:hover { background: var(--neon-green); color: var(--dark-bg); }
        .neon-text { color: var(--neon-green); text-shadow: 0 0 10px var(--neon-green); }
        input, select { background: rgba(255,255,255,0.05) !important; border: 1px solid rgba(155, 233, 49, 0.4) !important; color: var(--neon-green) !important; }
    </style>
</head>
<body>
    <div class="container mt-5 col-md-6">
        <div class="border-bottom pb-3 mb-5" style="border-color: var(--neon-green) !important;">
            <div class="d-flex gap-2 mb-3">
                <a href="index.jsp" class="btn btn-outline-light btn-sm"><i class="fas fa-home me-1"></i> MAIN_MENU</a>
            </div>
            <h2 class="neon-text fw-bold m-0">>> SET_REPORT_CRITERIA</h2>
        </div>

        <div class="neon-border p-4 mb-4 rounded">
            <h5 class="text-light mb-3"><i class="fas fa-calendar-alt text-info me-2"></i> 1. DATE RANGE TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="date">
                <div class="col-md-5"><input type="date" name="start" class="form-control" required></div>
                <div class="col-md-5"><input type="date" name="end" class="form-control" required></div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>

        <div class="neon-border p-4 mb-4 rounded">
            <h5 class="text-light mb-3"><i class="fas fa-user-md text-warning me-2"></i> 2. DOCTOR TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="doctor">
                <div class="col-md-10">
                    <select name="docName" class="form-control" required>
                        <option value="" disabled selected>Select Doctor...</option>
                        <option value="Dr. Devi Shetty">Dr. Devi Shetty</option>
                        <option value="Dr. C.N. Manjunath">Dr. C.N. Manjunath</option>
                        <option value="Dr. Shivaprasad">Dr. Shivaprasad</option>
                    </select>
                </div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>

        <div class="neon-border p-4 rounded">
            <h5 class="text-light mb-3"><i class="fas fa-virus text-danger me-2"></i> 3. AILMENT TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="ailment">
                <div class="col-md-10">
                    <select name="ailmentName" class="form-control" required>
                        <option value="" disabled selected>Select Ailment...</option>
                        <option value="Fever/Cold">Fever, Cold, or Flu</option>
                        <option value="Stomach Pain">Stomach Pain</option>
                        <option value="Headache">Headache</option>
                    </select>
                </div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>
    </div>
</body>
</html>