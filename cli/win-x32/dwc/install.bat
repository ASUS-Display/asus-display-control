@echo off
:: Copyright (c) 2026 ASUSTeK Computer Inc. All rights reserved.
::
:: install.bat - Launcher for install.ps1
::
:: Double-click this file or run it from a Command Prompt to install dwc.exe.
:: It will attempt to run the PowerShell installer with administrator privileges.

echo Launching installer...
echo.

:: Request elevation via PowerShell's Start-Process -Verb RunAs
PowerShell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0install.ps1""' -Verb RunAs -Wait"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [WARN] Elevation was declined or failed. Retrying without elevation...
    echo        dwc.exe will be installed for the current user only.
    echo.
    PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
)

echo.
pause
