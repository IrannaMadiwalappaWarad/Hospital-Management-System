<!DOCTYPE html>
<html>
<head>
    <title>HMS | OS_V1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            margin: 0;
            /* Changed height to min-height to allow scrolling on small screens */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
        }

        .container {
            padding: 30px 15px;
        }

        .neon-text { 
            color: var(--neon-green); 
            text-shadow: 0 0 10px var(--neon-green);
            /* Fluid typography: shrinks on small screens */
            font-size: clamp(1.8rem, 6vw, 4rem); 
        }

        .neon-border { 
            border: 1px solid var(--neon-green); 
            box-shadow: 0 0 15px rgba(155, 233, 49, 0.2); 
            background: var(--panel-bg); 
            backdrop-filter: blur(10px); 
            border-radius: 15px; 
            transition: 0.3s;
            height: 100%; /* Ensures cards in a row have equal height */
        }

        .neon-border:hover { 
            box-shadow: 0 0 25px rgba(155, 233, 49, 0.6); 
            transform: translateY(-10px); 
        }

        .btn-neon { 
            background: transparent; 
            border: 1px solid var(--neon-green); 
            color: var(--neon-green); 
            text-transform: uppercase; 
            letter-spacing: 2px; 
            font-weight: bold; 
            transition: 0.4s; 
        }

        .btn-neon:hover { 
            background: var(--neon-green); 
            color: var(--dark-bg); 
            box-shadow: 0 0 20px var(--neon-green); 
        }

        /* Fix for smaller screens to prevent content cut-off */
        @media (max-width: 768px) {
            body {
                align-items: flex-start; /* Start from top on mobile */
            }
            .neon-border {
                padding: 30px !important;
            }
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