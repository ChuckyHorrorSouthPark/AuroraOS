# AuroraOS 1.0 - Installation Guide

## System Requirements

### Minimum Specifications

- **CPU**: Dual-core processor (ARM64 or x86-64)
- **RAM**: 8 GB
- **Storage**: 128 GB SSD
- **Display**: 1024x768 or higher
- **Network**: Broadband internet (for initial setup)
- **Virtual Machine**: UTM, VMware Fusion, VirtualBox, Parallels Desktop, or QEMU

### Recommended Specifications

- **CPU**: Quad-core or better
- **RAM**: 16 GB
- **Storage**: 512 GB SSD
- **GPU**: Dedicated graphics card with 2GB+ VRAM
- **NPU**: Neural Processing Unit for AI acceleration
- **Display**: 2560x1600 or higher

---

## Pre-Installation

### Backup Your Data

Before installing AuroraOS 1.0, ensure all critical data is backed up:

```bash
# On macOS or existing AuroraOS
# Use Time Machine or Aurora Cloud backup
```

### Verify System Requirements

Check your hardware:
```bash
# On macOS
system_profiler SPHardwareDataType
system_profiler SPStorageDataType

# On Linux
lscpu
df -h
```

### Download AuroraOS

**Official Download**: https://download.auroraos.io

**Available Formats**:
- `.iso` - ISO image for virtual machines
- `.vmdk` - For VMware
- `.vdi` - For VirtualBox
- `.qcow2` - For QEMU/KVM
- `.vhdx` - For Hyper-V

**File Size**: ~4.5 GB

---

## Installation Methods

### Method 1: Virtual Machine (Recommended for Testing)

#### UTM (macOS with Apple Silicon)

**Steps**:
1. Download and install UTM from https://mac.getutm.app
2. Download AuroraOS ISO
3. Create new virtual machine in UTM
4. Configure:
   - CPU: 4 cores
   - RAM: 8 GB
   - Storage: 128 GB
   - Display: 1920x1080
5. Mount AuroraOS ISO
6. Boot and follow installation wizard
7. Complete setup assistant

#### VMware Fusion

**Steps**:
1. Install VMware Fusion (Pro or Player)
2. Create new virtual machine
3. Select "Install from disc image"
4. Choose AuroraOS ISO
5. Configure hardware:
   - Processors: 4
   - RAM: 8 GB
   - Hard disk: 128 GB
6. Complete installation
7. Install VMware Tools
8. Start first boot

#### VirtualBox

**Steps**:
1. Install VirtualBox from https://www.virtualbox.org
2. Create new machine:
   - Name: AuroraOS
   - Type: Other
   - Version: Other/Unknown
   - RAM: 8192 MB
   - Storage: 128 GB (VDI)
3. Settings → Storage → Attach ISO
4. Boot and install
5. Install Guest Additions after OS boots

#### Parallels Desktop

**Steps**:
1. Open Parallels Desktop
2. File → Create New
3. Select "Install AuroraOS from DVD/Image file"
4. Choose ISO file
5. Configure:
   - Processors: 4
   - RAM: 8 GB
6. Complete wizard
7. Start installation

#### QEMU/KVM

**Steps**:
```bash
# Create disk image
qemu-img create -f qcow2 auroraos.qcow2 128G

# Run VM
qemu-system-aarch64 \
  -M virt \
  -cpu host \
  -smp 4 \
  -m 8G \
  -hda auroraos.qcow2 \
  -cdrom auroraos.iso \
  -enable-kvm \
  -display gtk
```

### Method 2: Bare Metal Installation

#### Creating Bootable USB Drive

**On macOS**:
```bash
# Identify USB drive
diskutil list

# Unmount drive
diskutil unmountDisk /dev/diskX

# Write ISO
sudo dd if=auroraos.iso of=/dev/rdiskX bs=1m
sudo diskutil ejectDisk /dev/diskX
```

**On Linux**:
```bash
# Identify USB drive
lsblk

# Write ISO
sudo dd if=auroraos.iso of=/dev/sdX bs=1M
sudo sync
```

**On Windows**:
- Use Rufus (https://rufus.ie)
- Or use PowerISO
- Or use Image Writer

#### Boot from USB

1. Insert bootable USB drive
2. Restart computer
3. Hold boot key:
   - **Mac**: Hold Option key
   - **PC**: F12, F2, Del, or Esc (varies by manufacturer)
4. Select USB drive from boot menu
5. Press Enter

#### Installation Wizard

**Screen 1: Welcome**
- Select language
- Select keyboard layout
- Click "Continue"

**Screen 2: Software License Agreement**
- Review agreement
- Click "Agree" if accepted

**Screen 3: Disk Selection**
- Select destination disk
- Warning: This will erase the disk
- Click "Continue"

**Screen 4: Installation Options**
- **Upgrade**: Keep existing data
- **Erase and Install**: Fresh installation (recommended)
- Select option
- Click "Continue"

**Screen 5: Erase Confirmation**
- Confirm disk to erase
- Enter admin password
- Click "Erase and Install"

**Installation Progress**
- Installation begins (10-30 minutes)
- Do not power off during installation
- Progress indicator shows status

**Screen 6: Setup Assistant**
- Complete initial setup:
  - Create user account
  - Set password
  - Configure time zone
  - Enable/disable features
  - Sign in to Aurora Account (optional)

---

## Post-Installation

### Initial Setup

#### Create User Account

1. Enter full name
2. Set username (alphanumeric, no spaces)
3. Set strong password
4. Confirm password
5. Continue

#### Time Zone Configuration

1. Select region
2. Select city/time zone
3. Enable automatic time zone (recommended)
4. Continue

#### Network Configuration

1. Select Wi-Fi network or wired connection
2. Enter password if needed
3. Test connection
4. Continue

#### Aurora Account Setup (Optional)

1. Sign in with existing account or create new
2. Enable iCloud-like features (optional)
3. Configure sync preferences
4. Continue

#### Privacy & Security

1. Review privacy settings
2. Configure crash reporting
3. Set up biometric authentication (if available)
4. Continue

#### Feature Configuration

1. Enable/disable Dashboard
2. Configure Dock preferences
3. Set default applications
4. Complete setup

### First Boot

**Desktop Appears**:
- Welcome screen with tips
- Desktop with default wallpaper
- Menu bar and Dock ready
- Ready to use

### System Updates

**Check for Updates**:
```bash
# Via settings
Settings → System → Software Update

# Via command line
softwareupdate -l
softwareupdate -i -a
```

### Install Additional Software

**App Store**:
1. Open App Store from Dock
2. Browse or search for applications
3. Click Install
4. Authenticate with Apple ID
5. Wait for installation

**Third-Party Installers**:
1. Download `.dmg` file
2. Open DMG file
3. Drag application to Applications folder
4. Eject the DMG

**Package Manager**:
```bash
# Using APM
apm install package-name

# Using Homebrew
brew install package-name
```

---

## Troubleshooting

### Installation Hangs

**Solution**:
1. Wait 30 minutes (installation can be slow)
2. Check disk space (128 GB minimum required)
3. Try again with USB boot in BIOS mode instead of UEFI

### Insufficient Storage

**Solution**:
1. Allocate more space to virtual machine
2. Or delete unnecessary files before reinstalling
3. Minimum required: 128 GB

### Network Connection Issues

**Solution**:
1. Check internet connection
2. Disable VPN if active
3. Try wired connection instead of Wi-Fi
4. Check firewall settings

### Virtual Machine Performance

**Solution**:
1. Allocate more CPU cores
2. Increase RAM allocation
3. Enable GPU acceleration in VM settings
4. Check host system resources

### Boot Issues

**Solution**:
1. Verify ISO file integrity (check SHA-256 hash)
2. Re-create bootable USB
3. Try different USB port
4. Check BIOS settings (disable Secure Boot if needed)

---

## Configuration After Installation

### System Preferences

**Access Settings**:
- Click Apple menu → Settings
- Or open Settings app from Dock

**Common Configurations**:
- Display brightness and resolution
- Sound volume and effects
- Network Wi-Fi/Bluetooth
- User accounts and passwords
- Accessibility options
- Privacy and security
- Energy saver (battery/sleep)

### Desktop Customization

**Change Wallpaper**:
1. Right-click desktop
2. Select "Change Desktop Background"
3. Choose from gallery
4. Or upload custom image

**Configure Dock**:
1. System menu → Dock Preferences
2. Adjust size, position, magnification
3. Enable/disable auto-hide
4. Customize applications

**Multiple Desktops**:
1. Mission Control (F3 or Ctrl+Up)
2. Click + to add new desktop
3. Swipe to switch between desktops
4. Configure hot corners

### User Accounts

**Create Additional User Account**:
1. Settings → Users & Groups
2. Click + to add new user
3. Choose account type (Standard or Admin)
4. Set name and password
5. Enable/disable features
6. Click "Create User"

**Switch Users**:
- Click user icon in menu bar
- Select user to switch to
- Or use Cmd+Q to logout

---

## Migration from Other Systems

### From macOS

**Using Migration Assistant**:
1. Open Migration Assistant (Applications/Utilities)
2. Select "From a Mac, Time Machine backup, or startup disk"
3. Select source Mac or backup
4. Select data to transfer
5. Enter administrator password
6. Wait for migration to complete

**Manual Migration**:
1. Backup to external drive on macOS
2. Connect external drive to AuroraOS
3. Open Pathfinder
4. Copy files to appropriate locations
5. Reinstall applications from App Store

### From Windows

**Using Migration Assistant**:
1. Run Migration Assistant on Windows PC
2. Follow prompts to prepare migration
3. Connect PC to AuroraOS over network
4. Select data to transfer
5. Wait for migration

**Manual Migration**:
1. Export data from Windows applications
2. Use cloud services (OneDrive, Google Drive) to transfer files
3. Download files on AuroraOS
4. Reinstall equivalent applications

---

## Registration & Activation

### Register AuroraOS

1. After installation, open Settings
2. Go to System → About
3. Click "Register"
4. Enter product key (if applicable)
5. Activate online or via phone

### Licensing

**Home Edition**:
- Personal use only
- Single user per license
- Lifetime license
- Free updates

**Professional Edition**:
- Business use allowed
- Includes business applications
- Priority support
- Professional features

**Enterprise Edition**:
- Volume licensing
- Network deployment
- Custom support agreement
- Advanced security features

---

## Uninstallation

### Complete Uninstall (Erase and Install Different OS)

1. Create bootable USB of other operating system
2. Boot from USB
3. Run installation for different OS
4. Select disk to erase
5. Complete installation

### Reinstall AuroraOS

1. Create bootable USB with AuroraOS ISO
2. Boot from USB
3. Run installation wizard
4. Select "Erase and Install"
5. Confirm and complete installation

---

## Getting Help

### Support Resources

- **Official Website**: https://www.auroraos.io
- **Support Portal**: https://support.auroraos.io
- **Community Forums**: https://forums.auroraos.io
- **Documentation**: https://docs.auroraos.io
- **Contact Support**: support@auroraos.io

### Diagnostics

**Generate Diagnostic Report**:
```bash
# Create diagnostic file
system_profiler SPHardwareDataType > diagnostic.txt

# Or use Settings
Settings → System → Report...
```

---

**AuroraOS 1.0 - Installation Guide - Complete Setup Instructions**