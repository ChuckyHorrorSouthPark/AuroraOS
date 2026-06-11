# AuroraOS Build Script - Windows EXE Installer Creator
# This script packages AuroraOS documentation into a Windows EXE installer
# Requires NSIS (Nullsoft Scriptable Install System) to be installed

param(
    [string]$Version = "1.0.0",
    [string]$BuildDir = ".\build",
    [string]$DistDir = ".\dist"
)

$ErrorActionPreference = "Stop"

# Colors for output
function Write-ColorOutput($message, $color) {
    Write-Host $message -ForegroundColor $color
}

Write-ColorOutput "=== AuroraOS Windows EXE Build Script ===" "Green"
Write-ColorOutput "Version: $Version" "Yellow"

# Step 1: Create necessary directories
Write-ColorOutput "Creating build directories..." "Yellow"
New-Item -ItemType Directory -Force -Path "$DistDir" | Out-Null
New-Item -ItemType Directory -Force -Path "$BuildDir\temp\AuroraOS" | Out-Null
New-Item -ItemType Directory -Force -Path "$BuildDir\temp\AuroraOS\docs" | Out-Null

# Step 2: Copy documentation files
Write-ColorOutput "Copying documentation..." "Yellow"
Copy-Item -Path "docs\*" -Destination "$BuildDir\temp\AuroraOS\docs\" -Recurse -Force
Copy-Item -Path "README.md" -Destination "$BuildDir\temp\AuroraOS\" -Force
Copy-Item -Path "LICENSE" -Destination "$BuildDir\temp\AuroraOS\" -ErrorAction SilentlyContinue

# Step 3: Create installation directory structure
Write-ColorOutput "Creating installation package structure..." "Yellow"
New-Item -ItemType Directory -Force -Path "$BuildDir\temp\AuroraOS\bin" | Out-Null

# Create a launcher batch file
$launcherScript = @"
@echo off
REM AuroraOS Documentation Launcher
cd /d "%~dp0"
start "" explorer.exe "docs\README.md"
@echo AuroraOS documentation opened in default browser.
pause
"@

$launcherScript | Out-File -FilePath "$BuildDir\temp\AuroraOS\bin\Launch-AuroraOS.bat" -Encoding ASCII

# Step 4: Check if NSIS is installed
Write-ColorOutput "Checking for NSIS installation..." "Yellow"

$nsisPath = "C:\Program Files (x86)\NSIS\makensis.exe"
if (-Not (Test-Path $nsisPath)) {
    $nsisPath = "C:\Program Files\NSIS\makensis.exe"
}

if (-Not (Test-Path $nsisPath)) {
    Write-ColorOutput "WARNING: NSIS not found. Creating installer without NSIS compilation." "Yellow"
    Write-ColorOutput "To create proper EXE installers, install NSIS from: https://nsis.sourceforge.io/Download" "Yellow"
    
    # Create a simple ZIP archive as fallback
    Write-ColorOutput "Creating ZIP archive as fallback..." "Yellow"
    $zipPath = "$DistDir\AuroraOS-$Version.zip"
    Compress-Archive -Path "$BuildDir\temp\AuroraOS\*" -DestinationPath $zipPath -Force
    Write-ColorOutput "✓ ZIP archive created: $zipPath" "Green"
} else {
    # Step 5: Create NSIS installer script
    Write-ColorOutput "Creating NSIS installer script..." "Yellow"
    
    $nsisScript = @"
; AuroraOS Installer Script
; Generated automatically by build.ps1

!include "MUI2.nsh"

; Name and file
Name "AuroraOS $Version"
OutFile "$DistDir\AuroraOS-$Version.exe"
InstallDir "`$PROGRAMFILES\AuroraOS"

; MUI Settings
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_LANGUAGE "English"

; Installer sections
Section "Install"
  SetOutPath "`$INSTDIR"
  File /r "$BuildDir\temp\AuroraOS\*.*"
  
  ; Create Start Menu shortcut
  CreateDirectory "`$SMPROGRAMS\AuroraOS"
  CreateShortcut "`$SMPROGRAMS\AuroraOS\AuroraOS Documentation.lnk" "`$INSTDIR\bin\Launch-AuroraOS.bat"
  CreateShortcut "`$SMPROGRAMS\AuroraOS\Uninstall.lnk" "`$INSTDIR\uninstall.exe"
  
  ; Create desktop shortcut
  CreateShortcut "`$DESKTOP\AuroraOS.lnk" "`$INSTDIR\bin\Launch-AuroraOS.bat"
SectionEnd

; Uninstaller
Section "Uninstall"
  RMDir /r "`$INSTDIR"
  RMDir /r "`$SMPROGRAMS\AuroraOS"
  Delete "`$DESKTOP\AuroraOS.lnk"
SectionEnd
"@

    $nsisScript | Out-File -FilePath "$BuildDir\auroraos.nsi" -Encoding ASCII
    
    # Step 6: Compile with NSIS
    Write-ColorOutput "Compiling installer with NSIS..." "Yellow"
    & $nsisPath "$BuildDir\auroraos.nsi"
    
    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput "✓ EXE installer created successfully!" "Green"
        $exePath = "$DistDir\AuroraOS-$Version.exe"
        Get-Item $exePath | ForEach-Object {
            Write-ColorOutput "Size: $([math]::Round($_.Length / 1MB, 2)) MB" "Yellow"
        }
    } else {
        Write-ColorOutput "ERROR: NSIS compilation failed!" "Red"
        exit 1
    }
}

# Step 7: Create build manifest
Write-ColorOutput "Creating build manifest..." "Yellow"

$manifest = @{
    BuildDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Version = $Version
    Files = @(
        Get-ChildItem -Path $DistDir -File | ForEach-Object { $_.Name }
    )
} | ConvertTo-Json

$manifest | Out-File -FilePath "$DistDir\BUILD_MANIFEST.json" -Encoding UTF8

Write-ColorOutput "=== Build Complete ===" "Green"
Write-ColorOutput "Output directory: $DistDir" "Yellow"
Get-ChildItem -Path $DistDir | ForEach-Object {
    Write-ColorOutput "  - $($_.Name) ($([math]::Round($_.Length / 1MB, 2)) MB)" "Yellow"
}
