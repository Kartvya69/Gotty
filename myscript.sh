#!/bin/bash

# Clear the console
clear

# Function to install Node.js using fnm
install_nodejs() {
    echo "Installing Node.js with fnm..."
    # Install fnm (Fast Node Manager)
    curl -fsSL https://fnm.vercel.app/install | bash
    # Activate fnm by sourcing bash profile
    source ~/.bashrc
    # Install and use Node.js version 20
    fnm use --install-if-missing 20
    echo "Node.js installation completed."
}

# Function to install McsManager
install_mcsmanager() {
    echo "Installing McsManager..."
    # Navigate to the root directory
    cd /
    # Download and extract McsManager
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz
    tar -zxf mcsmanager_linux_release.tar.gz

    # Navigate to /mcsmanager/daemon and run npm install
    cd /mcsmanager/daemon
    npm install

    # Navigate to /mcsmanager/web and run npm install
    cd /mcsmanager/web
    npm install

    # Final step: lead the user to the /mcsmanager directory
    cd /mcsmanager
    echo "McsManager installation completed, you are now in the /mcsmanager directory."
}

# Menu options
echo "Please select an option:"
echo "1) Install Node.js"
echo "2) Install McsManager"
echo "3) Cancel"

# Read user choice
read -p "Enter your choice [1-3]: " choice

# Handle user choice
case $choice in
    1)
        install_nodejs
        ;;
    2)
        install_mcsmanager
        ;;
    3)
        echo "Operation cancelled."
        ;;
    *)
        echo "Invalid choice, please try again."
        ;;
esac
