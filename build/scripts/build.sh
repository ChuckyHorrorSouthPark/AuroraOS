#!/bin/bash

# AuroraOS Build Script - macOS DMG Installer Creator
# This script packages AuroraOS documentation into a macOS DMG installer

set -e

VERSION="1.0.0"
BUILD_DIR="./build"
DIST_DIR="./dist"
TEMP_DIR="/tmp/auroraos_build"
DMG_NAME="AuroraOS-${VERSION}.dmg"
DMG_PATH="${DIST_DIR}/${DMG_NAME}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== AuroraOS DMG Build Script ===${NC}"
echo -e "${YELLOW}Version: ${VERSION}${NC}"

# Cleanup function
cleanup() {
    echo -e "${YELLOW}Cleaning up temporary files...${NC}"
    rm -rf "${TEMP_DIR}"
}

trap cleanup EXIT

# Step 1: Create necessary directories
echo -e "${YELLOW}Creating build directories...${NC}"
mkdir -p "${DIST_DIR}"
mkdir -p "${TEMP_DIR}/AuroraOS"
mkdir -p "${TEMP_DIR}/dmg_temp"

# Step 2: Copy documentation files
echo -e "${YELLOW}Copying documentation...${NC}"
cp -r docs "${TEMP_DIR}/AuroraOS/"
cp README.md "${TEMP_DIR}/AuroraOS/"
cp LICENSE "${TEMP_DIR}/AuroraOS/" 2>/dev/null || true

# Step 3: Create an installer app structure
echo -e "${YELLOW}Creating application structure...${NC}"
mkdir -p "${TEMP_DIR}/AuroraOS/AuroraOS.app/Contents/MacOS"
mkdir -p "${TEMP_DIR}/AuroraOS/AuroraOS.app/Contents/Resources"

# Create Info.plist
cat > "${TEMP_DIR}/AuroraOS/AuroraOS.app/Contents/Info.plist" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>en</string>
    <key>CFBundleExecutable</key>
    <string>AuroraOS</string>
    <key>CFBundleIdentifier</key>
    <string>com.auroraos.installer</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>AuroraOS</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
</dict>
</plist>
EOF

# Create a launcher script
cat > "${TEMP_DIR}/AuroraOS/AuroraOS.app/Contents/MacOS/AuroraOS" << 'EOF'
#!/bin/bash
open -a "System Events" -j "tell application \"Finder\"
    activate
    open (POSIX file \"$(dirname \"$0\")/../../docs\") as alias
end tell"
EOF

chmod +x "${TEMP_DIR}/AuroraOS/AuroraOS.app/Contents/MacOS/AuroraOS"

# Step 4: Create DMG
echo -e "${YELLOW}Creating DMG file...${NC}"

# Create a temporary DMG
hdiutil create -volname "AuroraOS ${VERSION}" \
    -srcfolder "${TEMP_DIR}/AuroraOS" \
    -ov -format UDZO \
    "${DMG_PATH}"

# Step 5: Verify
echo -e "${GREEN}✓ DMG created successfully!${NC}"
ls -lh "${DMG_PATH}"

echo -e "${GREEN}=== Build Complete ===${NC}"
echo -e "${YELLOW}Output: ${DMG_PATH}${NC}"
echo -e "${YELLOW}Size: $(du -h \"${DMG_PATH}\" | cut -f1)${NC}"
