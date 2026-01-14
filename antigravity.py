#!/usr/bin/env python3
"""
Antigravity Tool - Pull Metasploit Framework to Desktop
A security tool to clone and setup Metasploit Framework
"""

import os
import sys
import subprocess
import platform
from pathlib import Path


class AntigravityTool:
    """Tool to pull Metasploit Framework to the desktop"""
    
    def __init__(self):
        self.metasploit_repo = "https://github.com/rapid7/metasploit-framework.git"
        self.desktop_path = self.get_desktop_path()
        self.install_path = os.path.join(self.desktop_path, "metasploit-framework")
        
    def get_desktop_path(self):
        """Get the desktop path based on the operating system"""
        system = platform.system()
        home = str(Path.home())
        
        if system == "Windows":
            desktop = os.path.join(home, "Desktop")
        elif system == "Darwin":  # macOS
            desktop = os.path.join(home, "Desktop")
        else:  # Linux and others
            desktop = os.path.join(home, "Desktop")
            # Some Linux distributions use different paths
            if not os.path.exists(desktop):
                desktop = os.path.join(home, "Рабочий стол")  # Russian
            if not os.path.exists(desktop):
                desktop = home  # Fallback to home directory
        
        return desktop
    
    def check_git_installed(self):
        """Check if git is installed on the system"""
        try:
            subprocess.run(
                ["git", "--version"],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
            )
            return True
        except (subprocess.CalledProcessError, FileNotFoundError):
            return False
    
    def clone_metasploit(self):
        """Clone Metasploit Framework to desktop"""
        print(f"[*] Antigravity Tool - Metasploit Installer")
        print(f"[*] Target directory: {self.install_path}")
        
        # Check if git is installed
        if not self.check_git_installed():
            print("[!] Error: Git is not installed on this system")
            print("[!] Please install Git and try again")
            return False
        
        # Check if desktop directory exists
        if not os.path.exists(self.desktop_path):
            print(f"[!] Error: Desktop path not found: {self.desktop_path}")
            print(f"[*] Using home directory instead: {Path.home()}")
            self.desktop_path = str(Path.home())
            self.install_path = os.path.join(self.desktop_path, "metasploit-framework")
        
        # Check if metasploit already exists
        if os.path.exists(self.install_path):
            print(f"[!] Metasploit Framework already exists at: {self.install_path}")
            response = input("[?] Do you want to update it? (y/n): ")
            if response.lower() == 'y':
                return self.update_metasploit()
            else:
                print("[*] Aborted")
                return False
        
        # Clone the repository
        print(f"[*] Cloning Metasploit Framework...")
        print(f"[*] This may take a while depending on your internet connection...")
        
        try:
            subprocess.run(
                ["git", "clone", "--depth", "1", self.metasploit_repo, self.install_path],
                check=True
            )
            print(f"[+] Successfully cloned Metasploit Framework to: {self.install_path}")
            print(f"[+] Antigravity successful! Metasploit pulled to your desktop")
            return True
        except subprocess.CalledProcessError as e:
            print(f"[!] Error cloning repository: {e}")
            return False
    
    def update_metasploit(self):
        """Update existing Metasploit Framework installation"""
        print(f"[*] Updating Metasploit Framework at: {self.install_path}")
        
        try:
            subprocess.run(
                ["git", "-C", self.install_path, "pull"],
                check=True
            )
            print(f"[+] Successfully updated Metasploit Framework")
            return True
        except subprocess.CalledProcessError as e:
            print(f"[!] Error updating repository: {e}")
            return False
    
    def display_info(self):
        """Display information about Metasploit Framework"""
        print("\n" + "="*60)
        print("Metasploit Framework Information")
        print("="*60)
        print(f"Installation Path: {self.install_path}")
        print(f"Repository: {self.metasploit_repo}")
        print("\nNext Steps:")
        print("1. Navigate to the installation directory")
        print(f"   cd {self.install_path}")
        print("2. Follow Metasploit installation instructions:")
        print("   https://github.com/rapid7/metasploit-framework/wiki/Nightly-Installers")
        print("="*60 + "\n")


def main():
    """Main function to run the antigravity tool"""
    print("""
    ╔═══════════════════════════════════════════════════════╗
    ║         Antigravity Tool - Metasploit Puller         ║
    ║              Security Tool & Pen Tests                ║
    ╚═══════════════════════════════════════════════════════╝
    """)
    
    tool = AntigravityTool()
    
    if len(sys.argv) > 1:
        if sys.argv[1] in ["-h", "--help"]:
            print("Usage: python3 antigravity.py")
            print("\nThis tool clones Metasploit Framework to your desktop")
            print("Options:")
            print("  -h, --help     Show this help message")
            print("  -i, --info     Show installation information")
            sys.exit(0)
        elif sys.argv[1] in ["-i", "--info"]:
            tool.display_info()
            sys.exit(0)
    
    success = tool.clone_metasploit()
    
    if success:
        tool.display_info()
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
