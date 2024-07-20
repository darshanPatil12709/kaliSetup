#!/bin/bash

# Update and upgrade the system
echo "[*] Updating and upgrading the system..."
apt update && apt upgrade -y

# Install additional tools
echo "[*] Installing additional tools..."
apt install -y \
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
apt install -y python3-pip
pip3 install updog
pip3 install impacket

# Create a directory for GitHub repos
mkdir -p /opt/github

# Clone useful GitHub repositories
echo "[*] Cloning useful GitHub repositories..."
cd /opt/github

git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git
git clone https://github.com/DominicBreuker/pspy.git
git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/samratashok/nishang.git
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/danielmiessler/SecLists.git

# Install and setup Golang
echo "[*] Installing and setting up Golang..."
apt install -y golang
echo 'export GOROOT=/usr/lib/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Install additional Go tools
echo "[*] Installing Go tools..."
go install github.com/OJ/gobuster/v3@latest
go install github.com/ffuf/ffuf@latest

# Setup Metasploit database
echo "[*] Setting up Metasploit database..."
msfdb init

# Final cleanup
echo "[*] Cleaning up..."
apt autoremove -y
apt clean

echo "[+] Setup complete! Your Kali VM should now be better equipped for pentesting."
echo "[!] Remember to reboot your system to ensure all changes take effect."

