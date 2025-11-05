#!/bin/bash
# Verification script for Jellyfin Music Organizer installation

echo "=========================================="
echo "Jellyfin Music Organizer - Installation Verification"
echo "=========================================="
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check counter
CHECKS_PASSED=0
CHECKS_FAILED=0

# Function to check and report
check_item() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓${NC} $2"
        ((CHECKS_PASSED++))
    else
        echo -e "${RED}✗${NC} $2"
        ((CHECKS_FAILED++))
    fi
}

# Check Python version
echo "Checking Python installation..."
python3 --version &> /dev/null
check_item $? "Python 3 is installed"

PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
if (( $(echo "$PYTHON_VERSION >= 3.8" | bc -l) )); then
    check_item 0 "Python version $PYTHON_VERSION is >= 3.8"
else
    check_item 1 "Python version $PYTHON_VERSION is >= 3.8 (found $PYTHON_VERSION)"
fi

echo ""
echo "Checking system dependencies..."

# Check PyQt5
dpkg -l | grep python3-pyqt5 &> /dev/null
check_item $? "python3-pyqt5 is installed"

# Check PyQt5 multimedia
dpkg -l | grep python3-pyqt5.qtmultimedia &> /dev/null
check_item $? "python3-pyqt5.qtmultimedia is installed"

echo ""
echo "Checking Python packages..."

# Check if packages are importable
python3 -c "import PyQt5" &> /dev/null
check_item $? "PyQt5 is importable"

python3 -c "import mutagen" &> /dev/null
check_item $? "mutagen is importable"

python3 -c "import qdarkstyle" &> /dev/null
check_item $? "qdarkstyle is importable"

python3 -c "from jellyfin_music_organizer import __version__" &> /dev/null
check_item $? "jellyfin_music_organizer package is installed"

echo ""
echo "Checking executable files..."

# Check launcher script
if [ -f "jellyfin-music-organizer" ] && [ -x "jellyfin-music-organizer" ]; then
    check_item 0 "jellyfin-music-organizer launcher exists and is executable"
else
    check_item 1 "jellyfin-music-organizer launcher exists and is executable"
fi

# Check if command is in PATH
which jellyfin-music-organizer &> /dev/null
check_item $? "jellyfin-music-organizer is in PATH"

echo ""
echo "Checking package structure..."

# Check package directory
if [ -d "jellyfin_music_organizer" ]; then
    check_item 0 "jellyfin_music_organizer package directory exists"
else
    check_item 1 "jellyfin_music_organizer package directory exists"
fi

# Check main files
[ -f "jellyfin_music_organizer/__init__.py" ]
check_item $? "jellyfin_music_organizer/__init__.py exists"

[ -f "jellyfin_music_organizer/main.py" ]
check_item $? "jellyfin_music_organizer/main.py exists"

[ -f "jellyfin_music_organizer/music_organizer.py" ]
check_item $? "jellyfin_music_organizer/music_organizer.py exists"

# Check resources
[ -f "jellyfin_music_organizer/Octopus.ico" ]
check_item $? "Icon file exists"

[ -d "jellyfin_music_organizer/notification_audio" ]
check_item $? "Notification audio directory exists"

echo ""
echo "Checking configuration files..."

[ -f "requirements.txt" ]
check_item $? "requirements.txt exists"

[ -f "setup.py" ]
check_item $? "setup.py exists"

[ -f "pyproject.toml" ]
check_item $? "pyproject.toml exists"

echo ""
echo "=========================================="
echo "Verification Summary"
echo "=========================================="
echo -e "${GREEN}Passed: $CHECKS_PASSED${NC}"
echo -e "${RED}Failed: $CHECKS_FAILED${NC}"
echo ""

if [ $CHECKS_FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed! Installation looks good.${NC}"
    echo ""
    echo "You can now run the application with:"
    echo "  jellyfin-music-organizer"
    exit 0
else
    echo -e "${YELLOW}⚠ Some checks failed. Please review the output above.${NC}"
    echo ""
    echo "To fix issues, try running:"
    echo "  ./install.sh"
    exit 1
fi

