#!/bin/bash

# H-X Antigravity Tool - Metasploit Updater
# This script updates your Metasploit installation

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
echo "║    H-X Antigravity Metasploit Updater    ║"
echo "╚═══════════════════════════════════════════╝"
echo -e "${NC}"

# Determine Desktop directory
if [ -d "$HOME/Desktop" ]; then
    DESKTOP_DIR="$HOME/Desktop"
elif [ -d "$HOME/desktop" ]; then
    DESKTOP_DIR="$HOME/desktop"
else
    DESKTOP_DIR="$HOME"
fi

INSTALL_DIR="$DESKTOP_DIR/H-X-Metasploit"
MSF_DIR="$INSTALL_DIR/metasploit-framework"

# Check if installation exists
if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${RED}[!] H-X Metasploit installation not found at: $INSTALL_DIR${NC}"
    echo -e "${YELLOW}[*] Please run antigravity-install.sh first.${NC}"
    exit 1
fi

if [ ! -d "$MSF_DIR" ]; then
    echo -e "${RED}[!] Metasploit Framework directory not found at: $MSF_DIR${NC}"
    exit 1
fi

echo -e "${BLUE}[*]${NC} Found installation at: $INSTALL_DIR"
echo -e "${BLUE}[*]${NC} Updating Metasploit Framework..."

cd "$MSF_DIR"

# Check if it's a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}[!] Not a git repository. Cannot update.${NC}"
    exit 1
fi

# Pull latest changes
echo -e "${GREEN}[+]${NC} Pulling latest updates from GitHub..."
if git pull origin master; then
    echo -e "${GREEN}[+]${NC} Metasploit Framework successfully updated!"
else
    echo -e "${YELLOW}[!] Update may have encountered issues.${NC}"
    echo -e "${YELLOW}[*] You may need to manually resolve conflicts or reinstall.${NC}"
fi

# Update gems if bundler is available
if command -v bundle &> /dev/null; then
    echo -e "${BLUE}[*]${NC} Updating Ruby gems..."
    bundle install
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Update Complete! ✓              ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
echo ""
