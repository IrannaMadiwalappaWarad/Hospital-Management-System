<!DOCTYPE html>
<html>
<head>
    <title>HMS | REPORT_PARAMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="d-flex justify-content-between mb-4">
            <h2 class="neon-text fw-bold">>> SET_REPORT_CRITERIA</h2>
            <a href="index.jsp" class="btn btn-outline-light">MAIN_MENU</a>
        </div>

        <div class="neon-border p-4 mb-4 rounded">
            <h5 class="text-light mb-3">1. DATE RANGE TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="date">
                <div class="col-md-5"><input type="date" name="start" class="form-control" required></div>
                <div class="col-md-5"><input type="date" name="end" class="form-control" required></div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>

        <div class="neon-border p-4 mb-4 rounded">
            <h5 class="text-light mb-3">2. DOCTOR TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="doctor">
                <div class="col-md-10"><input type="text" name="docName" class="form-control" placeholder="Enter Doctor Name" required></div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>

        <div class="neon-border p-4 rounded">
            <h5 class="text-light mb-3">3. AILMENT TARGET</h5>
            <form action="reportCriteria" method="get" class="row g-2">
                <input type="hidden" name="action" value="ailment">
                <div class="col-md-10"><input type="text" name="ailmentName" class="form-control" placeholder="Enter Ailment" required></div>
                <div class="col-md-2"><button type="submit" class="btn btn-neon w-100">RUN</button></div>
            </form>
        </div>
    </div>
</body>
</html>