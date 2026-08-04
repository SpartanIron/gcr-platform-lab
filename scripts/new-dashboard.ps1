# ==========================================================
# GCR Platform Lab
# Dashboard Project Bootstrap
# Creates the initial Platform Dashboard project
# ==========================================================

Clear-Host

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " GCR Platform Dashboard Bootstrap" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

$projectRoot = "apps\platform-dashboard"

$folders = @(
    $projectRoot,
    "$projectRoot\public",
    "$projectRoot\src"
)

foreach ($folder in $folders) {

    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Force -Path $folder | Out-Null
        Write-Host "[+] Created $folder" -ForegroundColor Green
    }
    else {
        Write-Host "[=] Exists   $folder" -ForegroundColor Yellow
    }
}

# ----------------------------------------------------------
# Dockerfile
# ----------------------------------------------------------

@'
FROM nginx:alpine

COPY public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
'@ | Set-Content "$projectRoot\Dockerfile"

# ----------------------------------------------------------
# nginx.conf
# ----------------------------------------------------------

@'
server {

    listen 80;

    server_name localhost;

    root /usr/share/nginx/html;

    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

}
'@ | Set-Content "$projectRoot\nginx.conf"

# ----------------------------------------------------------
# README
# ----------------------------------------------------------

@'
# Platform Dashboard

This application provides the web interface for the
GCR Platform Lab.

## Technology

- HTML
- CSS
- JavaScript
- NGINX
- Docker
- Kubernetes
'@ | Set-Content "$projectRoot\README.md"

# ----------------------------------------------------------
# index.html
# ----------------------------------------------------------

@'
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>GCR Platform Dashboard</title>

<link rel="stylesheet" href="style.css">

</head>

<body>

<header>

<h1>🚀 GCR Platform Dashboard</h1>

<p>Platform Engineering Bootcamp</p>

</header>

<section class="cards">

<div class="card">

<h2>Kubernetes</h2>

<p id="cluster">Running</p>

</div>

<div class="card">

<h2>Environment</h2>

<p>Docker Desktop</p>

</div>

<div class="card">

<h2>Version</h2>

<p>1.0</p>

</div>

</section>

<script src="app.js"></script>

</body>

</html>
'@ | Set-Content "$projectRoot\public\index.html"

# ----------------------------------------------------------
# style.css
# ----------------------------------------------------------

@'
body{

    margin:0;

    background:#0f172a;

    color:white;

    font-family:Segoe UI,Arial,sans-serif;

}

header{

    background:#111827;

    text-align:center;

    padding:30px;

}

.cards{

    display:flex;

    justify-content:center;

    gap:20px;

    padding:40px;

}

.card{

    width:250px;

    background:#1e293b;

    border-radius:12px;

    padding:20px;

    box-shadow:0 0 15px rgba(0,0,0,.4);

}

.card h2{

    color:#38bdf8;

}
'@ | Set-Content "$projectRoot\public\style.css"

# ----------------------------------------------------------
# app.js
# ----------------------------------------------------------

@'
console.log("Platform Dashboard Loaded");

document.getElementById("cluster").innerHTML = "Healthy";
'@ | Set-Content "$projectRoot\public\app.js"

Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host " Dashboard Project Created Successfully!" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

tree $projectRoot /F