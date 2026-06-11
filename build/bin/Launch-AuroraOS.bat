@echo off
REM AuroraOS Documentation Launcher
REM This batch file opens the AuroraOS documentation in your default application

setlocal enabledelayedexpansion

REM Get the directory where this batch file is located
set "SCRIPT_DIR=%~dp0"
set "DOCS_DIR=%SCRIPT_DIR%..\docs\README.md"
set "INSTALL_DIR=%SCRIPT_DIR%.."

REM Colors and formatting
cls
color 0A
echo.
echo    ======================================
echo    AuroraOS Documentation Launcher
echo    Version 1.0.0
echo    ======================================
echo.

REM Check if documentation exists
if exist "%DOCS_DIR%" (
    echo [*] Opening AuroraOS Documentation...
    echo [*] Path: %DOCS_DIR%
    echo.
    
    REM Try to open with default application
    start "" "%DOCS_DIR%"
    
    echo [+] Documentation launched successfully!
    echo.
    echo [*] If the documentation doesn't open, you can manually open:
    echo     %INSTALL_DIR%\README.md
    echo.
    timeout /t 3 /nobreak
) else (
    echo [ERROR] Documentation not found!
    echo [ERROR] Expected path: %DOCS_DIR%
    echo.
    echo [*] Please check that AuroraOS is properly installed.
    echo.
    pause
    exit /b 1
)

REM Show file explorer with docs folder
echo.
echo [*] Opening documentation folder...
start "" explorer.exe "%INSTALL_DIR%\docs"

echo [+] All done! You can close this window.
echo.
timeout /t 2 /nobreak
