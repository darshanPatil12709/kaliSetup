#!/bin/bash

# Update and upgrade the system
echo "[*] Updating and upgrading the system..."
sudo apt update && apt upgrade -y

# Install additional tools
echo "[*] Installing additional tools..."
sudo apt install -y \
    gobuster \
    seclists \
    feroxbuster \
    bloodhound \
    neo4j \
    powershell \
    crackmapexec \
    impacket-scripts \
    shellter \
    webshells \
    responder \
    evil-winrm \
    proxychains4 \
    sqlmap

# Install pip and Python tools
echo "[*] Installing Python tools..."
sudo apt install -y python3-pip
pip3 install updog
pip3 install impacket

# Create a directory for GitHub repos
sudo mkdir -p /opt/github

# Clone useful GitHub repositories
echo "[*] Cloning useful GitHub repositories..."
cd /opt/github

sudo git clone https://github.com/carlospolop/PEASS-ng.git
sudo git clone https://github.com/rebootuser/LinEnum.git
sudo git clone https://github.com/DominicBreuker/pspy.git
sudo git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git
sudo git clone https://github.com/PowerShellMafia/PowerSploit.git
sudo git clone https://github.com/samratashok/nishang.git
sudo git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
sudo git clone https://github.com/danielmiessler/SecLists.git
sudo git clone  https://github.com/dirkjanm/krbrelayx

# Install and setup Golang
echo "[*] Installing and setting up Golang..."
sudo apt install golang -y

# Install additional Go tools
echo "[*] Installing Go tools..."
sudo go install github.com/OJ/gobuster/v3@latest
sudo go install github.com/ffuf/ffuf@latest

# Final cleanup
echo "[*] Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "[+] Setup complete! Your Kali VM should now be better equipped for pentesting."
echo "[!] Remember to reboot your system to ensure all changes take effect."

