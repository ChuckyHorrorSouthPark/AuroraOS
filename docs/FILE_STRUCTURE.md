# AuroraOS 1.0 - File Structure

## Complete Directory Hierarchy

```
/
├── bin/                          # Essential system binaries
│   ├── ls, cp, mv, rm, mkdir
│   ├── cat, echo, grep
│   └── sh, bash, zsh
│
├── sbin/                         # System administration binaries
│   ├── ifconfig, route
│   ├── mount, umount
│   ├── fsck, fdisk
│   └── systemctl
│
├── lib/                          # System libraries
│   ├── libc.so
│   ├── libm.so
│   ├── libpthread.so
│   ├── libssl.so
│   └── libcrypto.so
│
├── lib64/ (x86-64)              # 64-bit libraries
│   └── ld-linux-x86-64.so.2
│
├── etc/                          # System configuration files
│   ├── passwd                   # User accounts
│   ├── group                    # User groups
│   ├── shadow                   # Password hashes
│   ├── hosts                    # Hostname mapping
│   ├── hostname                 # System hostname
│   ├── fstab                    # Filesystem mount table
│   ├── sudoers                  # Sudo configuration
│   ├── ssh/                     # SSH configuration
│   │   ├── sshd_config
│   │   └── ssh_config
│   ├── ssl/                     # SSL certificates
│   │   ├── certs/
│   │   └── keys/
│   ├── systemd/                 # System service config
│   │   └── system/
│   ├── network/                 # Network config
│   │   ├── interfaces
│   │   └── resolv.conf
│   ├── cron.d/                  # Cron jobs
│   ├── logrotate.d/            # Log rotation config
│   ├── security/               # Security policies
│   └── auroraos.conf           # AuroraOS specific config
│
├── opt/                         # Optional software packages
│   ├── bin/                     # Third-party binaries
│   ├── lib/                     # Third-party libraries
│   └── share/                   # Third-party data files
│
├── usr/                         # User programs and data
│   ├── bin/                     # User binaries
│   │   ├── python, node, ruby
│   │   ├── git, svn
│   │   └── vim, nano, emacs
│   ├── sbin/                    # User admin binaries
│   ├── lib/                     # User libraries
│   │   ├── python3.11/
│   │   ├── node_modules/
│   │   └── java/
│   ├── local/                   # Locally compiled software
│   │   ├── bin/
│   │   ├── lib/
│   │   └── share/
│   ├── share/                   # Shared data files
│   │   ├── doc/                 # Documentation
│   │   ├── man/                 # Manual pages
│   │   ├── info/                # Info documentation
│   │   ├── fonts/               # System fonts
│   │   ├── icons/               # Icon files
│   │   ├── pixmaps/             # Image files
│   │   ├── applications/        # .desktop files
│   │   └── locale/              # Localization files
│   └── include/                 # C header files
│
├── var/                         # Variable data
│   ├── log/                     # System logs
│   │   ├── system.log
│   │   ├── kernel.log
│   │   ├── auth.log
│   │   ├── syslog
│   │   ├── audit/
│   │   ├── applications/
│   │   └── crash/
│   ├── run/                     # Runtime data
│   │   ├── pid files
│   │   └── sockets/
│   ├── cache/                   # Cache files
│   │   ├── apt/
│   │   ├── npm/
│   │   └── package-manager/
│   ├── spool/                   # Spool files
│   │   └── mail/
│   ├── tmp/                     # Temporary files
│   ├── backups/                 # Backup files
│   └── lib/                     # Variable state
│       ├── apt/
│       ├── dpkg/
│       └── systemd/
│
├── tmp/                         # Temporary files (cleared on boot)
│   └── (various temporary files)
│
├── home/                        # User home directories
│   ├── username1/
│   │   ├── Desktop/             # Desktop files
│   │   ├── Documents/           # Documents
│   │   ├── Downloads/           # Downloaded files
│   │   ├── Pictures/            # Photos and images
│   │   ├── Music/               # Music files
│   │   ├── Videos/              # Video files
│   │   ├── Public/              # Shared files
│   │   ├── .config/             # Application config
│   │   │   ├── auroraos/
│   │   │   ├── firefox/
│   │   │   ├── sublime-text/
│   │   │   └── ...
│   │   ├── .local/              # Local user data
│   │   │   ├── bin/
│   │   │   ├── lib/
│   │   │   ├── share/
│   │   │   ├── cache/
│   │   │   └── state/
│   │   ├── .ssh/                # SSH keys
│   │   │   ├── id_rsa
│   │   │   ├── id_rsa.pub
│   │   │   └── authorized_keys
│   │   ├── .gnupg/              # GPG keys
│   │   ├── .bash_history        # Command history
│   │   ├── .bashrc              # Shell configuration
│   │   ├── .profile             # Shell profile
│   │   └── .zshrc               # Zsh configuration
│   └── username2/
│
├── root/                        # Root user home directory
│   ├── (similar to /home/username/)
│
├── Applications/                # GUI Applications
│   ├── Pathfinder.app/
│   │   ├── Contents/
│   │   │   ├── MacOS/
│   │   │   │   └── Pathfinder   # Executable
│   │   │   ├── Resources/
│   │   │   │   ├── Images.xcassets/
│   │   │   │   └── Localizable.strings
│   │   │   └── Info.plist       # App metadata
│   │   └── (standard macOS app structure)
│   ├── Safari.app/
│   ├── Calendar.app/
│   ├── Notes.app/
│   ├── Photos.app/
│   ├── Music.app/
│   ├── GameCenter.app/
│   ├── AppStore.app/
│   ├── Settings.app/
│   ├── CodeForge.app/
│   ├── SketchFlow.app/
│   ├── CineStudio.app/
│   └── (100+ more applications)
│
├── Library/                     # System libraries and resources
│   ├── Frameworks/              # System frameworks
│   │   ├── Foundation.framework/
│   │   ├── AppKit.framework/
│   │   ├── CoreData.framework/
│   │   ├── Security.framework/
│   │   ├── AudioKit.framework/
│   │   ├── GraphicsEngine.framework/
│   │   ├── NetworkKit.framework/
│   │   └── AuroraAI.framework/
│   ├── Application Support/     # App-specific data
│   │   ├── AuroraOS/
│   │   ├── Safari/
│   │   ├── Mail/
│   │   ├── Calendar/
│   │   └── (per-app support files)
│   ├── Preferences/             # System preferences
│   │   ├── com.auroraos.*.plist
│   │   ├── com.apple.*.plist    # Legacy compat
│   │   └── (preference files)
│   ├── Caches/                  # System caches
│   │   ├── AuroraOS/
│   │   ├── CrashedReports/
│   │   ├── Downloaded/
│   │   └── (cache files)
│   ├── Fonts/                   # System fonts
│   │   ├── SanFranciscoPro-Regular.otf
│   │   ├── SFMono-Regular.otf
│   │   ├── Lyon-Regular.otf
│   │   └── (100+ fonts)
│   ├── Keyboard Layouts/        # Keyboard layouts
│   ├── ColorSync/               # Color management
│   ├── Audio/                   # Audio resources
│   │   └── Sounds/              # System sounds
│   └── Logs/                    # System logs
│       ├── AuroraOS/
│       ├── System/
│       ├── Crash Reports/
│       └── Diagnostic Reports/
│
├── System/                      # Core system files
│   ├── Library/                 # System library resources
│   │   ├── Frameworks/
│   │   ├── PrivateFrameworks/
│   │   ├── CoreServices/
│   │   ├── Extensions/
│   │   ├── Sounds/
│   │   ├── Fonts/
│   │   └── PreferencePanes/
│   ├── Resources/               # System resources
│   ├── CoreServices/            # Core services
│   │   ├── loginwindow
│   │   ├── Finder
│   │   └── SystemUIServer
│   ├── Preferences/             # System preferences
│   └── Themes/                  # Display themes
│
├── Volumes/                     # Mount points
│   ├── Macintosh HD/           # Primary volume
│   ├── External Drive/         # Mounted external drives
│   └── (other mount points)
│
├── dev/                         # Device files
│   ├── null, zero, random
│   ├── sda, sdb, sdc           # Block devices
│   ├── tty0, tty1              # Terminal devices
│   ├── mapper/                 # Device mapper
│   └── (character and block devices)
│
├── proc/                        # Process filesystem
│   ├── cpuinfo
│   ├── meminfo
│   ├── loadavg
│   ├── version
│   └── (process information)
│
├── sys/                         # System filesystem
│   ├── devices/
│   ├── module/
│   ├── kernel/
│   └── (kernel configuration)
│
├── run/                         # Runtime data (volatile)
│   ├── lock/
│   ├── mount/
│   ├── systemd/
│   └── (runtime files)
│
├── boot/                        # Boot files
│   ├── vmlinuz (kernel image)
│   ├── initramfs (initial ramdisk)
│   ├── EFI/
│   │   ├── BOOT/
│   │   └── AuroraOS/
│   └── (boot configuration)
│
└── root/ (/)                    # Root filesystem marker
```

---

## Application Bundle Structure

### Example: Pathfinder.app

```
Pathfinder.app/
├── Contents/
│   ├── MacOS/
│   │   └── Pathfinder              # Main executable
│   ├── Resources/
│   │   ├── Assets.xcassets/
│   │   │   ├── PathfinderIcon.imageset/
│   │   │   ├── FolderIcon.imageset/
│   │   │   └── FileIcon.imageset/
│   │   ├── en.lproj/              # English localization
│   │   │   ├── Main.storyboard
│   │   │   └── Localizable.strings
│   │   ├── fr.lproj/              # French localization
│   │   ├── de.lproj/              # German localization
│   │   └── es.lproj/              # Spanish localization
│   ├── Frameworks/
│   │   ├── Foundation.framework -> /System/Library/Frameworks/
│   │   └── AppKit.framework -> /System/Library/Frameworks/
│   ├── Plugins/
│   │   └── (optional plugins)
│   ├── Info.plist                 # Application metadata
│   ├── PkgInfo                    # Package info
│   └── _CodeSignature/
│       └── CodeResources          # Code signing data
```

---

## AuroraOS Specific Directories

### /Library/AuroraOS/

```
/Library/AuroraOS/
├── AuroraOS.preferences           # OS preferences
├── Security/
│   ├── Certificates/
│   ├── Keychains/
│   └── SecurityPolicy/
├── Themes/
│   ├── Aurora Light/
│   ├── Aurora Dark/
│   ├── Aurora Minimal/
│   └── (user themes)
├── Wallpapers/
│   ├── Aurora Mountains.heic
│   ├── Aurora Space.heic
│   └── (more wallpapers)
├── Sounds/
│   ├── Notification.caf
│   ├── Alert.caf
│   └── (system sounds)
├── Updates/
│   ├── Pending/
│   └── Installed/
├── Backups/
│   ├── System Backups/
│   └── User Backups/
└── Logs/
    ├── System.log
    ├── Kernel.log
    ├── Audit.log
    └── Performance.log
```

### /var/auroraos/

```
/var/auroraos/
├── cache/
│   ├── DNS/
│   ├── Downloads/
│   └── Temporary/
├── database/
│   ├── Spotlight/
│   ├── Metadata/
│   └── Caches/
├── logs/
│   ├── system.log
│   ├── security.log
│   └── (application logs)
└── services/
    ├── Aurora Cloud/
    ├── Game Center/
    ├── Nova AI/
    └── (service data)
```

---

## User Configuration Files

### Common Config Locations

```
~/.config/                    # Application configurations
~/.local/                     # Local user data
~/.cache/                     # User cache
~/.ssh/                       # SSH keys
~/.gnupg/                     # GPG keys
~/.bashrc                     # Bash configuration
~/.zshrc                      # Zsh configuration
~/.vimrc                      # Vim configuration
~/.gitconfig                  # Git configuration
```

---

## Important System Files

### Boot and Kernel

- `/boot/vmlinuz` - Kernel image
- `/boot/initramfs` - Initial ramdisk
- `/System/Library/CoreServices/boot.efi` - EFI bootloader
- `/etc/fstab` - Filesystem mount table

### System Configuration

- `/etc/hostname` - System hostname
- `/etc/hosts` - IP to hostname mapping
- `/etc/passwd` - User accounts
- `/etc/shadow` - Password hashes
- `/etc/sudoers` - Sudo configuration
- `/etc/systemd/system/` - System services

### Network Configuration

- `/etc/network/interfaces` - Network interfaces
- `/etc/resolv.conf` - DNS servers
- `/etc/systemd/network/` - NetworkD config

---

## Storage Recommendations

### Disk Space Allocation

**Minimum Installation**:
- System files: 20 GB
- Applications: 30 GB
- User data: 50 GB
- Cache/temp: 10 GB
- **Total**: 128 GB minimum

**Recommended Installation**:
- System files: 40 GB
- Applications: 100 GB
- User data: 300 GB
- Cache/temp: 50 GB
- **Total**: 512 GB recommended

### Cleanup Targets

**Safe to Delete**:
- `/tmp/` - Temporary files
- `/var/log/` - Old log files (30+ days)
- `~/.cache/` - Cache files
- `Downloads/` - Already installed files

**Not Safe to Delete**:
- `/System/` - System files
- `/Library/` - System libraries
- `/var/lib/` - Application databases
- `/etc/` - Configuration files

---

**AuroraOS 1.0 - File Structure Reference - Complete Directory Hierarchy**