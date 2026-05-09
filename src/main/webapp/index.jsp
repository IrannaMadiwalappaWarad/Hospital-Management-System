<!DOCTYPE html>
<html>
<head>
    <title>HMS | OS_V1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
   <style>
    :root { 
        --glass-bg: rgba(255, 255, 255, 0.7);
        --main-purple: #6366f1;
        --soft-gradient: linear-gradient(135deg, #e0e7ff 0%, #f3f4f6 100%);
    }
    
    body { 
        background: var(--soft-gradient);
        color: #1f2937; 
        font-family: 'Inter', sans-serif; 
        margin: 0;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .neon-text { 
        background: linear-gradient(to right, #4f46e5, #9333ea);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        font-weight: bold;
        font-size: clamp(2rem, 5vw, 4rem); 
    }

    .neon-border { 
        background: var(--glass-bg);
        backdrop-filter: blur(15px);
        border: 1px solid rgba(255, 255, 255, 0.4);
        box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
        border-radius: 20px; 
        transition: 0.4s;
    }

    .neon-border:hover { 
        background: rgba(255, 255, 255, 0.9);
        transform: scale(1.02); 
    }

    .btn-neon { 
        background: white; 
        border: 2px solid var(--main-purple); 
        color: var(--main-purple); 
        border-radius: 50px;
        padding: 8px 30px;
        font-weight: bold;
        transition: 0.3s; 
    }

    .btn-neon:hover { 
        background: var(--main-purple); 
        color: white; 
    }
</style>
</head>
<body>
    <div class="container text-center">
        <h1 class="fw-bold neon-text mb-5">
            <i class="fas fa-heartbeat me-2"></i>HOSPITAL OS_ v1.0
        </h1>
        
        <div class="row g-4 justify-content-center">
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="neon-border p-5">
                    <i class="fas fa-user-plus fa-3x mb-4 neon-text"></i>
                    <h4 class="fw-bold">PATIENT_ADD</h4>
                    <p class="small text-secondary mb-4">Register new Patient data to core.</p>
                    <a href="patientadd.jsp" class="btn btn-neon w-100 py-2">Initialize</a>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <div class="neon-border p-5">
                    <i class="fas fa-database fa-3x mb-4 neon-text"></i>
                    <h4 class="fw-bold">CORE_RECORDS</h4>
                    <p class="small text-secondary mb-4">Access and modify encrypted directory.</p>
                    <a href="displayPatients" class="btn btn-neon w-100 py-2">Access DB</a>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-4">
                <div class="neon-border p-5">
                    <i class="fas fa-terminal fa-3x mb-4 neon-text"></i>
                    <h4 class="fw-bold">REPORT_GEN</h4>
                    <p class="small text-secondary mb-4">Execute analytical data queries.</p>
                    <a href="reports.jsp" class="btn btn-neon w-100 py-2">Execute</a>
                </div>
            </div>
        </div>
        
        <div class="mt-5 pt-4 text-secondary small border-top border-secondary opacity-50">
            SYSTEM_STATUS: ONLINE // ENCRYPTION: ACTIVE // © 2026 IRANNA M Warad
        </div>
    </div>
</body>
</html>