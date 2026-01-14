# H-X
security tool & pen tests

## Antigravity Tool - Metasploit Desktop Puller

A simple tool to pull (clone) Metasploit Framework to your desktop for easy access.

### Features
- Automatically detects your desktop path across different operating systems (Windows, macOS, Linux)
- Clones Metasploit Framework from the official repository
- Supports updating existing installations
- Simple command-line interface

### Requirements
- Python 3.x
- Git installed on your system

### Usage

#### Pull Metasploit to Desktop
```bash
python3 antigravity.py
```

This will clone the Metasploit Framework repository to your desktop directory.

#### Show Help
```bash
python3 antigravity.py --help
```

#### Show Installation Info
```bash
python3 antigravity.py --info
```

### What it does
1. Detects your desktop directory based on your operating system
2. Checks if Git is installed
3. Clones Metasploit Framework repository (using shallow clone for faster download)
4. Provides next steps for setting up Metasploit

### Note
After pulling Metasploit to your desktop, you'll need to follow the official Metasploit installation instructions to set up dependencies and run the framework.

Visit: https://github.com/rapid7/metasploit-framework
