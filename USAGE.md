# H-X Antigravity Metasploit Tool - Usage Examples

## Installation

### Step 1: Install Metasploit to Desktop
```bash
./antigravity-install.sh
```

This will:
- Clone Metasploit Framework to `~/Desktop/H-X-Metasploit/`
- Create an antigravity launcher
- Set up a desktop shortcut

### Step 2: Install Dependencies

#### On Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install -y ruby-full build-essential zlib1g-dev postgresql libpq-dev
```

#### On macOS:
```bash
brew install ruby postgresql
```

### Step 3: Install Ruby Gems
```bash
cd ~/Desktop/H-X-Metasploit/metasploit-framework
gem install bundler
bundle install
```

## Launching Metasploit

### Method 1: Using Antigravity Launcher
```bash
cd ~/Desktop/H-X-Metasploit
./antigravity-launch.sh
```

### Method 2: Direct Launch
```bash
cd ~/Desktop/H-X-Metasploit/metasploit-framework
./msfconsole
```

### Method 3: Desktop Shortcut
Double-click the "H-X Antigravity Metasploit" icon on your desktop.

## Updating Metasploit

To update your Metasploit installation:
```bash
./antigravity-update.sh
```

## Example Workflows

### Basic Port Scanning
```bash
# Launch msfconsole
./antigravity-launch.sh

# Inside msfconsole:
use auxiliary/scanner/portscan/tcp
set RHOSTS 192.168.1.1
set PORTS 1-1000
run
```

### Search for Exploits
```bash
# Inside msfconsole:
search apache
search type:exploit platform:linux
```

### Using Modules
```bash
# Inside msfconsole:
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
exploit
```

## Troubleshooting

### Issue: Ruby version too old
**Solution**: Install a newer version of Ruby (3.0.0+)
```bash
# Using rbenv
rbenv install 3.1.0
rbenv global 3.1.0
```

### Issue: Bundle install fails
**Solution**: Install development dependencies
```bash
sudo apt-get install build-essential libreadline-dev libssl-dev libpq-dev
```

### Issue: Permission denied
**Solution**: Make scripts executable
```bash
chmod +x antigravity-install.sh
chmod +x antigravity-update.sh
```

## Security Best Practices

1. **Always get authorization** before testing systems
2. **Use in isolated environments** (VMs, labs) when practicing
3. **Keep Metasploit updated** regularly
4. **Document your testing activities**
5. **Follow responsible disclosure** for vulnerabilities found

## Additional Resources

- [Metasploit Unleashed](https://www.offensive-security.com/metasploit-unleashed/) - Free training
- [Metasploit Documentation](https://docs.metasploit.com/)
- [Rapid7 Blog](https://blog.rapid7.com/)
- [Exploit Database](https://www.exploit-db.com/)

## Support

For issues with the H-X Antigravity tool, please open an issue on the GitHub repository.

For Metasploit-specific issues, refer to:
- [Metasploit Framework GitHub Issues](https://github.com/rapid7/metasploit-framework/issues)
- [Metasploit Community](https://github.com/rapid7/metasploit-framework/discussions)
