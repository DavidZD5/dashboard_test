@echo off
setlocal
cd /d "%~dp0"
set "PORT=8000"

where py >nul 2>&1
if not errorlevel 1 (
    start "Servidor local del Dashboard" cmd /k "py -m http.server %PORT% --bind 127.0.0.1"
) else (
    where python >nul 2>&1
    if not errorlevel 1 (
        start "Servidor local del Dashboard" cmd /k "python -m http.server %PORT% --bind 127.0.0.1"
    ) else (
        echo No se encontro Python en este equipo.
        echo Puedes abrir el HTML directamente y cargar el Excel con el boton "Cargar otro Excel".
        pause
        exit /b 1
    )
)

timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:%PORT%/dashboard_academico_sistemas_corregido.html"
endlocal
