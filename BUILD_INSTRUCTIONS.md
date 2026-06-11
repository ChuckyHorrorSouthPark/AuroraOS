# AuroraOS Build Instructions

This document explains how to build the AuroraOS installers for macOS (DMG) and Windows (EXE).

## Overview

The build system automatically packages the AuroraOS documentation into platform-specific installers using:
- **macOS**: Shell script that creates a DMG (Disk Image) file
- **Windows**: PowerShell script that uses NSIS (Nullsoft Scriptable Install System)

## Automatic Builds (GitHub Actions)

The easiest way to build installers is through **GitHub Actions**, which happens automatically when you:

1. **Push to main branch** - When documentation files are updated
2. **Create a Release** - When you publish a new GitHub release
3. **Manual Trigger** - Run the workflow manually from GitHub Actions

### Accessing Built Installers

1. Go to [GitHub Actions](https://github.com/ChuckyHorrorSouthPark/AuroraOS/actions)
2. Find the "Build Installers" workflow run
3. Download artifacts from the workflow summary:
   - `macos-dmg-installer` - Contains AuroraOS-1.0.0.dmg
   - `windows-exe-installer` - Contains AuroraOS-1.0.0.exe
   - `windows-zip-archive` - Contains AuroraOS-1.0.0.zip
   - `checksums` - Contains SHA256SUMS file

## Manual Build (Local Machine)

### Prerequisites

#### For macOS:
- macOS 10.13 or later
- Xcode Command Line Tools: `xcode-select --install`
- Bash shell

#### For Windows:
- Windows 7 or later
- PowerShell 5.0 or later
- NSIS (Nullsoft Scriptable Install System)
  - Download: https://nsis.sourceforge.io/Download
  - Or install via Chocolatey: `choco install nsis`

### macOS Build (Local)

```bash
# 1. Navigate to repository
cd AuroraOS

# 2. Make build script executable
chmod +x build/scripts/build.sh

# 3. Run the build script
./build/scripts/build.sh

# 4. Find the DMG in the dist/ directory
ls -lh dist/AuroraOS-*.dmg
```

**Output**: `dist/AuroraOS-1.0.0.dmg`

### Windows Build (Local)

```powershell
# 1. Open PowerShell as Administrator

# 2. Navigate to repository
cd AuroraOS

# 3. Run the build script
.\build\scripts\build.ps1

# 4. Find the installer in the dist/ directory
Get-Item dist/AuroraOS-*
```

**Outputs**:
- `dist/AuroraOS-1.0.0.exe` (if NSIS is installed)
- `dist/AuroraOS-1.0.0.zip` (fallback, if NSIS not available)

## Build Process Details

### macOS DMG Build Process

1. **Create temporary directories** for build staging
2. **Copy documentation** files from `docs/` folder
3. **Create macOS app structure** with proper Info.plist
4. **Generate launcher script** to open documentation
5. **Build DMG image** using `hdiutil`
6. **Clean up** temporary files

### Windows EXE Build Process

1. **Create installation directory structure**
2. **Copy documentation** files from `docs/` folder
3. **Generate launcher batch file** (Launch-AuroraOS.bat)
4. **Create NSIS script** from template configuration
5. **Compile with NSIS** to generate EXE installer
6. **Create checksums** for verification
7. **Fallback to ZIP** if NSIS not available

## Installer Features

### macOS DMG

- Complete documentation in `/docs` subdirectory
- AuroraOS.app launcher application
- Drag-and-drop installation
- Size: ~10-15 MB (depending on documentation)

### Windows EXE

- Complete documentation installation
- Start Menu shortcuts for quick access
- Desktop shortcut creation
- Uninstaller included
- Registry entries for proper Windows integration
- Size: ~15-20 MB (depending on documentation)

### Fallback ZIP (Windows)

- If NSIS is not installed, build system creates a ZIP archive
- Contains all documentation files
- Can be extracted manually
- Size: ~5-10 MB

## Customization

### Change Installer Version

Edit the version in:
- `build/scripts/build.sh` (line: `VERSION="1.0.0"`)
- `build/scripts/build.ps1` (parameter: `-Version "1.0.0"`)
- `build/nsis/auroraos-installer.nsi.template` (line: `!define VERSION "1.0.0"`)

### Add Custom Icons (Windows)

1. Create 256x256 PNG icons
2. Convert to ICO format: `magick convert logo.png -define icon:auto-resize=256,128,96,64,48,32,16 logo.ico`
3. Place in `build/icons/auroraos.ico`
4. NSIS will automatically use them

### Add Custom Images (Windows)

1. Create custom header image (150x57 pixels)
2. Create custom welcome image (164x314 pixels)
3. Save as BMP files in `build/images/`
4. Update paths in `build/nsis/auroraos-installer.nsi.template`

## Troubleshooting

### macOS Build Issues

**Error: "hdiutil not found"**
- Solution: Ensure you're on macOS with Xcode Command Line Tools installed

**Error: "Permission denied"**
- Solution: Run `chmod +x build/scripts/build.sh` to make script executable

### Windows Build Issues

**Error: "makensis.exe not found"**
- Solution: Install NSIS from https://nsis.sourceforge.io/Download
- Or: `choco install nsis`
- The build will automatically fallback to creating a ZIP archive

**Error: "File not found" in NSIS**
- Solution: Ensure all documentation files exist in the `docs/` directory
- Check paths in `build/nsis/auroraos-installer.nsi.template`

**PowerShell Execution Policy**
- If script won't run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

## Distributing Installers

### Method 1: GitHub Releases
1. Create a new GitHub Release
2. Build workflow automatically attaches installers
3. Users can download from the release page

### Method 2: Manual Upload
1. Build installers locally
2. Upload files from `dist/` directory to a hosting service
3. Share download links with users

### Method 3: Direct Repository
1. Commit built installers to repository (not recommended due to file size)
2. Users can download from repository releases

## Verification

### Verify Downloaded Installers

After downloading, verify file integrity using SHA256:

```bash
# macOS/Linux
sha256sum AuroraOS-1.0.0.dmg
sha256sum AuroraOS-1.0.0.exe

# Windows PowerShell
certUtil -hashfile AuroraOS-1.0.0.dmg SHA256
certUtil -hashfile AuroraOS-1.0.0.exe SHA256
```

Compare the output with the SHA256SUMS file from the build artifacts.

## Next Steps

1. **Test installers** on actual macOS and Windows machines
2. **Create GitHub Release** to distribute installers
3. **Add installer icons** for better branding
4. **Create installation guide** for end users

## Support

For build issues or questions:
1. Check this document's Troubleshooting section
2. Review GitHub Actions workflow logs
3. Open an issue on GitHub repository

---

**Last Updated**: 2026-06-11
**Build System Version**: 1.0.0
