<!DOCTYPE html>
<html>
<head>
    <title>HMS | INPUT_MOD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --neon-green: #9BE931; --dark-bg: #0B0F1A; --panel-bg: rgba(22, 28, 42, 0.8); }
        body { background-color: var(--dark-bg); color: #fff; font-family: 'Courier New', Courier, monospace; }
        .neon-border { border: 1px solid var(--neon-green); box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); background: var(--panel-bg); }
        .btn-neon { background: var(--neon-green); color: var(--dark-bg); font-weight: bold; }
        .neon-text { color: var(--neon-green); text-shadow: 0 0 10px var(--neon-green); }
        input, select { background: rgba(255,255,255,0.05) !important; border: 1px solid rgba(155, 233, 49, 0.4) !important; color: var(--neon-green) !important; }
        input:focus, select:focus { box-shadow: 0 0 10px var(--neon-green) !important; }
    </style>
</head>
<body>
    <div class="container mt-5 col-md-8">
        <h2 class="neon-text fw-bold mb-4">>> INIT: PATIENT_DATA_ENTRY</h2>
        <div class="neon-border p-5 rounded">
            <form action="addPatient" method="post">
                <div class="row g-4">
                    <div class="col-md-4">
                        <label class="text-secondary">SYS_ID</label>
						<input type="number" name="id" class="form-control" min="1" required>
                    </div>
                    <div class="col-md-8">
                        <label class="text-secondary">PATIENT_NAME</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                       <label class="text-secondary">AGE</label>
						<input type="number" name="age" class="form-control" min="0" max="80" required>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">GENDER</label>
                        <select name="gender" class="form-select">
                            <option value="Male">MALE</option><option value="Female">FEMALE</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="text-secondary">ADMIT_DATE</label>
                        <input type="date" name="date" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="text-secondary">DIAGNOSIS / AILMENT</label>
                        <input type="text" name="ailment" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="text-secondary">ASSIGNED_DOC</label>
                        <input type="text" name="doctor" class="form-control" required>
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
</body>
</html>