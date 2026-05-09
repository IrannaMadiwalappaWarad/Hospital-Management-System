<!DOCTYPE html>
<html>
<head>
    <title>HMS | REPORT_GEN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            
            <select name="val" class="form-control" required>
                <option value="" disabled selected>Select Doctor...</option>
                <optgroup label="Heart Specialists">
                    <option value="Dr. Devi Shetty">Dr. Devi Shetty</option>
                    <option value="Dr. C.N. Manjunath">Dr. C.N. Manjunath</option>
                    <option value="Dr. Sreekanth Shetty">Dr. Sreekanth Shetty</option>
                </optgroup>
                <optgroup label="General Physicians">
                    <option value="Dr. Raja Selvarajan">Dr. Raja Selvarajan</option>
                    <option value="Dr. Shivaprasad">Dr. Shivaprasad</option>
                    <option value="Dr. Raghu Janardhan">Dr. Raghu Janardhan</option>
                </optgroup>
                <optgroup label="Orthopedics">
                    <option value="Dr. Basavaraj Kyavater">Dr. Basavaraj Kyavater</option>
                    <option value="Dr. Chandrashekar P">Dr. Chandrashekar P</option>
                    <option value="Dr. Manish HP">Dr. Manish HP</option>
                </optgroup>
                <optgroup label="Gynaecology">
                    <option value="Dr. Shanthala Thuppanna">Dr. Shanthala Thuppanna</option>
                    <option value="Dr. Ashwini M R">Dr. Ashwini M R</option>
                    <option value="Dr. Shubha Rao">Dr. Shubha Rao</option>
                </optgroup>
                <optgroup label="Paediatrics">
                    <option value="Dr. Ali Kumble">Dr. Ali Kumble</option>
                    <option value="Dr. Deepa Patil">Dr. Deepa Patil</option>
                </optgroup>
            </select>
            
            <button type="submit" class="btn btn-neon px-4">RUN</button>
        </form>
    </div>

    <div class="neon-border p-4 rounded">
        <h4 class="mb-3 text-light"><i class="fas fa-virus text-danger me-2"></i> AILMENT_QUERY</h4>
        <form action="displayPatients" method="get" class="d-flex gap-2">
            <input type="hidden" name="type" value="ailment">
            
            <select name="val" class="form-control" required>
                <option value="" disabled selected>Select Ailment...</option>
                <option value="Fever/Cold">Fever, Cold, or Flu</option>
                <option value="Stomach Pain">Stomach Pain or Indigestion</option>
                <option value="Body Ache">Body Ache / Muscle Pain</option>
                <option value="Headache">Headache or Migraine</option>
                <option value="Injury">Injury (Cut, Fall, or Bruise)</option>
                <option value="Skin Issue">Skin Rash or Allergy</option>
                <option value="Breathing Issue">Difficulty Breathing / Cough</option>
                <option value="Checkup">Routine Health Checkup</option>
                <option value="Other">Others(Not Listed)</option>
            </select>

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