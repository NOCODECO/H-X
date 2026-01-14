# H-X Antigravity Metasploit - Quick Reference

## One-Line Install
```bash
git clone https://github.com/NOCODECO/H-X.git && cd H-X && ./antigravity-install.sh
```

## Quick Commands

### Install
```bash
./antigravity-install.sh
```

### Update
```bash
./antigravity-update.sh
```

### Launch
```bash
cd ~/Desktop/H-X-Metasploit && ./antigravity-launch.sh
```

## What Gets Installed

```
~/Desktop/H-X-Metasploit/
├── metasploit-framework/    # The full Metasploit Framework
├── antigravity-launch.sh    # Launcher script
└── README.txt               # Setup instructions

~/Desktop/
└── H-X-Antigravity-Metasploit.desktop  # Desktop shortcut
```

## Common Issues

| Issue | Solution |
|-------|----------|
| "Git not found" | Install git: `apt install git` or `brew install git` |
| "Ruby version too old" | Install Ruby 3.0+: `rbenv install 3.1.0` |
| "Bundle install fails" | Install deps: `apt install build-essential` |
| "Permission denied" | Make executable: `chmod +x antigravity-install.sh` |

## Platform-Specific Setup

### Ubuntu/Debian
```bash
sudo apt-get update
sudo apt-get install -y ruby-full build-essential postgresql
```

### macOS
```bash
brew install ruby postgresql
```

### After Install
```bash
cd ~/Desktop/H-X-Metasploit/metasploit-framework
gem install bundler
bundle install
```

## First Steps After Installation

1. Install dependencies (see above)
2. Launch Metasploit: `./antigravity-launch.sh`
3. Try: `msfconsole` and then type `help`
4. Search exploits: `search apache`
5. Get help: Type `help` in msfconsole

## Links

- 📖 [Full Usage Guide](USAGE.md)
- 🏠 [Metasploit Docs](https://docs.metasploit.com)
- 💻 [Metasploit GitHub](https://github.com/rapid7/metasploit-framework)
- 🎓 [Metasploit Unleashed Training](https://www.offensive-security.com/metasploit-unleashed/)

## Support

- H-X Issues: [GitHub Issues](https://github.com/NOCODECO/H-X/issues)
- Metasploit Issues: [Metasploit GitHub](https://github.com/rapid7/metasploit-framework/issues)
