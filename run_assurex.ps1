$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendDir = Join-Path $root "assurex_web\backend"
$frontendDir = Join-Path $root "assurex_web\frontend"

Write-Host "Starting AssureX backend..."
Start-Process -FilePath "python" -ArgumentList "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000" -WorkingDirectory $backendDir -NoNewWindow

Start-Sleep -Seconds 3

Write-Host "Starting AssureX frontend..."
Start-Process -FilePath "npm" -ArgumentList "run", "dev", "--", "--host", "0.0.0.0", "--port", "5173" -WorkingDirectory $frontendDir -NoNewWindow

Write-Host "AssureX is running."
Write-Host "Backend: http://localhost:8000/health"
Write-Host "Frontend: http://localhost:5173/"
