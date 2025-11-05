#!/bin/bash
# Installation script for Jellyfin Music Organizer on Ubuntu 24.04

set -e  # Exit on error

echo "=========================================="
echo "Jellyfin Music Organizer - Installation"
echo "=========================================="
echo ""

# Check if running on Ubuntu
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" != "ubuntu" ]; then
        echo "Warning: This script is designed for Ubuntu 24.04"
        echo "Current OS: $ID $VERSION_ID"
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi

# Update package list
echo "Updating package list..."
sudo apt update

# Install system dependencies
echo "Installing system dependencies..."
sudo apt install -y python3 python3-pip python3-venv python3-pyqt5 python3-pyqt5.qtmultimedia

# Check if virtual environment should be used
read -p "Install in virtual environment? (recommended) (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Create virtual environment
    echo "Creating virtual environment..."
    python3 -m venv venv
    
    # Activate virtual environment
    source venv/bin/activate
    
    # Upgrade pip
    echo "Upgrading pip..."
    pip install --upgrade pip
    
    # Install Python dependencies
    echo "Installing Python dependencies..."
    pip install -r requirements.txt
    
    # Install the package in development mode
    echo "Installing Jellyfin Music Organizer..."
    pip install -e .
    
    echo ""
    echo "=========================================="
    echo "Installation Complete!"
    echo "=========================================="
    echo ""
    echo "To run the application:"
    echo "  1. Activate the virtual environment: source venv/bin/activate"
    echo "  2. Run: jellyfin-music-organizer"
    echo ""
    echo "Or use the launcher script: ./jellyfin-music-organizer"
    echo ""
else
    # Install system-wide
    echo "Installing Python dependencies system-wide..."
    pip3 install --user -r requirements.txt
    
    # Install the package
    echo "Installing Jellyfin Music Organizer..."
    pip3 install --user -e .
    
    # Copy desktop file
    echo "Installing desktop integration..."
    mkdir -p ~/.local/share/applications
    cp jellyfin-music-organizer.desktop ~/.local/share/applications/
    
    # Update desktop database
    if command -v update-desktop-database &> /dev/null; then
        update-desktop-database ~/.local/share/applications
    fi
    
    echo ""
    echo "=========================================="
    echo "Installation Complete!"
    echo "=========================================="
    echo ""
    echo "To run the application:"
    echo "  - From terminal: jellyfin-music-organizer"
    echo "  - From applications menu: Search for 'Jellyfin Music Organizer'"
    echo "  - Using launcher script: ./jellyfin-music-organizer"
    echo ""
    echo "Note: You may need to log out and log back in for the"
    echo "application menu entry to appear."
    echo ""
fi

