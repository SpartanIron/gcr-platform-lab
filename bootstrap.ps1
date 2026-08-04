# ==========================================================
# GCR Platform Lab Bootstrap
# Platform Engineering Bootcamp
# ==========================================================

Clear-Host

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " GCR Platform Lab Bootstrap" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Current Directory:" -ForegroundColor Yellow
Get-Location
Write-Host ""

# ----------------------------------------------------------
# Folder Structure
# ----------------------------------------------------------

$folders = @(
    ".github",
    ".github\workflows",

    "docs",
    "docs\architecture",
    "docs\bootcamp",
    "docs\runbooks",
    "docs\adr",
    "docs\troubleshooting",

    "diagrams",

    "kubernetes",
    "kubernetes\namespaces",
    "kubernetes\deployments",
    "kubernetes\services",
    "kubernetes\networking",
    "kubernetes\storage",
    "kubernetes\security",

    "helm",

    "monitoring",

    "logging",

    "security",

    "ai-platform",

    "scripts",

    "labs"
)

Write-Host "Creating folders..." -ForegroundColor Green
Write-Host ""

foreach ($folder in $folders)
{
    if (!(Test-Path $folder))
    {
        Write-Host " [+] $folder"
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
    else
    {
        Write-Host " [=] $folder already exists"
    }
}

Write-Host ""
Write-Host "Creating placeholder files..." -ForegroundColor Green
Write-Host ""

# ----------------------------------------------------------
# Git Placeholder Files
# ----------------------------------------------------------

$gitkeepFiles = @(
    ".github\workflows\.gitkeep",

    "docs\architecture\.gitkeep",
    "docs\bootcamp\.gitkeep",
    "docs\runbooks\.gitkeep",
    "docs\adr\.gitkeep",
    "docs\troubleshooting\.gitkeep",

    "diagrams\.gitkeep",

    "kubernetes\namespaces\.gitkeep",
    "kubernetes\deployments\.gitkeep",
    "kubernetes\services\.gitkeep",
    "kubernetes\networking\.gitkeep",
    "kubernetes\storage\.gitkeep",
    "kubernetes\security\.gitkeep",

    "helm\.gitkeep",

    "monitoring\.gitkeep",

    "logging\.gitkeep",

    "security\.gitkeep",

    "ai-platform\.gitkeep",

    "scripts\.gitkeep",

    "labs\.gitkeep"
)

foreach ($file in $gitkeepFiles)
{
    if (!(Test-Path $file))
    {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host " [+] $file"
    }
}

Write-Host ""
Write-Host "==============================================" -ForegroundColor Green
Write-Host " Bootstrap Complete!" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host ""

tree /F