#!/bin/bash

# H-X Antigravity Tool - Metasploit Installer
# This script pulls Metasploit Framework to your desktop

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════╗"
echo "║   H-X Antigravity Metasploit Installer   ║"
echo "║         Security Tool & Pen Tests        ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

# Determine Desktop directory
if [ -d "$HOME/Desktop" ]; then
    DESKTOP_DIR="$HOME/Desktop"
elif [ -d "$HOME/desktop" ]; then
    DESKTOP_DIR="$HOME/desktop"
else
    echo -e "${YELLOW}Desktop directory not found, using $HOME${NC}"
    DESKTOP_DIR="$HOME"
fi

INSTALL_DIR="$DESKTOP_DIR/H-X-Metasploit"

echo -e "${BLUE}[*]${NC} Installation directory: $INSTALL_DIR"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}[!] Git is not installed. Please install git first.${NC}"
    exit 1
fi

# Check if directory already exists
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}[!] Installation directory already exists.${NC}"
    read -p "Do you want to remove it and reinstall? (y/N): " -n 1 -r
    echo
    case "$REPLY" in
        [Yy]*)
            echo -e "${BLUE}[*]${NC} Removing existing installation..."
            rm -rf "$INSTALL_DIR"
            ;;
        *)
            echo -e "${YELLOW}[!] Installation cancelled.${NC}"
            exit 0
            ;;
    esac
fi

# Create installation directory
echo -e "${BLUE}[*]${NC} Creating installation directory..."
mkdir -p "$INSTALL_DIR"

# Clone Metasploit Framework
echo -e "${GREEN}[+]${NC} Pulling Metasploit Framework from GitHub..."
echo -e "${BLUE}[*]${NC} This may take a while depending on your internet connection..."

if git clone --depth 1 https://github.com/rapid7/metasploit-framework.git "$INSTALL_DIR/metasploit-framework"; then
    echo -e "${GREEN}[+]${NC} Metasploit Framework successfully pulled to desktop!"
else
    echo -e "${RED}[!] Failed to clone Metasploit Framework.${NC}"
    exit 1
fi

# Create launcher script
echo -e "${BLUE}[*]${NC} Creating antigravity launcher..."
cat > "$INSTALL_DIR/antigravity-launch.sh" << 'EOF'
#!/bin/bash

# H-X Antigravity Metasploit Launcher

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MSF_DIR="$SCRIPT_DIR/metasploit-framework"

echo "╔═══════════════════════════════════════════╗"
echo "║    H-X Antigravity Metasploit Launcher   ║"
echo "╚═══════════════════════════════════════════╝"
echo ""

if [ ! -d "$MSF_DIR" ]; then
    echo "[!] Metasploit Framework not found at: $MSF_DIR"
    exit 1
fi

cd "$MSF_DIR"

# Check if bundle is available
if command -v bundle &> /dev/null; then
    echo "[*] Starting Metasploit Console..."
    bundle exec ./msfconsole "$@"
else
    echo "[*] Starting Metasploit Console (direct)..."
    ./msfconsole "$@"
fi
EOF

chmod +x "$INSTALL_DIR/antigravity-launch.sh"

# Create README
cat > "$INSTALL_DIR/README.txt" << 'EOF'
H-X Antigravity Metasploit Tool
================================

This is the H-X Antigravity version of Metasploit Framework.

INSTALLATION NOTES:
-------------------
Metasploit Framework has been pulled to your desktop.

To complete the setup, you may need to install dependencies:
1. Ruby (version 3.0.0 or higher recommended)
2. PostgreSQL (optional, for database support)
3. Required gems

SETUP INSTRUCTIONS:
-------------------
1. Navigate to: metasploit-framework/
2. Install dependencies:
   - On Ubuntu/Debian: sudo apt-get install ruby-dev postgresql
   - On macOS: brew install ruby postgresql
3. Install gems: gem install bundler && bundle install

USAGE:
------
To launch Metasploit with the antigravity launcher:
  ./antigravity-launch.sh

Or directly:
  cd metasploit-framework
  ./msfconsole

DOCUMENTATION:
--------------
Official Metasploit documentation: https://docs.metasploit.com
Metasploit GitHub: https://github.com/rapid7/metasploit-framework

SECURITY WARNING:
-----------------
This tool is for authorized penetration testing and security research only.
Unauthorized access to computer systems is illegal.
EOF

# Create desktop shortcut (if desktop exists)
if [ -d "$DESKTOP_DIR" ] && [ "$DESKTOP_DIR" != "$HOME" ]; then
    echo -e "${BLUE}[*]${NC} Creating desktop launcher..."
    cat > "$DESKTOP_DIR/H-X-Antigravity-Metasploit.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=H-X Antigravity Metasploit
Comment=Launch Metasploit Framework via H-X Antigravity
Exec=$INSTALL_DIR/antigravity-launch.sh
Icon=utilities-terminal
Terminal=true
Categories=Security;System;
EOF
    chmod +x "$DESKTOP_DIR/H-X-Antigravity-Metasploit.desktop"
fi

# Final message
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║        Installation Complete! ✓           ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Installation Summary:${NC}"
echo -e "  Location: ${GREEN}$INSTALL_DIR${NC}"
echo -e "  Launcher: ${GREEN}$INSTALL_DIR/antigravity-launch.sh${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo -e "  1. Read the README: ${BLUE}$INSTALL_DIR/README.txt${NC}"
echo -e "  2. Install dependencies (Ruby, gems, etc.)"
echo -e "  3. Run: ${GREEN}cd $INSTALL_DIR && ./antigravity-launch.sh${NC}"
echo ""
echo -e "${YELLOW}Note:${NC} Metasploit requires Ruby and other dependencies to run."
echo -e "      See README.txt for detailed setup instructions."
echo ""
