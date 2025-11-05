# Migration from Windows to Linux

This document describes the migration of Jellyfin Music Organizer from a Windows-only application to a Linux-compatible tool.

## What Changed

### Project Structure

**Before (Windows):**
```
jellyfin_music/
├── Jellyfin Music Organizer.exe  (Windows executable)
└── Build Files/
    └── jellyfin_music_organizer_v3.06/  (Source code)
```

**After (Linux):**
```
jellyfin_music/
├── jellyfin_music_organizer/     (Python package)
│   ├── __init__.py
│   ├── main.py
│   ├── music_organizer.py
│   └── ... (other modules)
├── install.sh                     (Installation script)
├── jellyfin-music-organizer       (Launcher script)
├── jellyfin-music-organizer.desktop (Desktop integration)
├── requirements.txt               (Python dependencies)
├── setup.py                       (Package setup)
├── pyproject.toml                 (Modern Python packaging)
└── archive/
    └── windows/                   (Original Windows files)
```

### Code Changes

1. **Package Structure**
   - Moved source files to proper Python package (`jellyfin_music_organizer/`)
   - Added `__init__.py` for package initialization
   - Updated imports to use relative imports (`.module` instead of `module`)

2. **Entry Point**
   - Created `main()` function in `main.py` for proper entry point
   - Added console and GUI script entry points in `setup.py`

3. **Dependencies**
   - Created `requirements.txt` with all Python dependencies
   - Specified Ubuntu 24.04 compatible versions
   - Added PyQt5 multimedia support

4. **Installation**
   - Created automated installation script (`install.sh`)
   - Added support for virtual environment installation
   - Created desktop integration file

### Platform Compatibility

The application code itself required minimal changes because:
- PyQt5 is cross-platform
- File operations use Python's `pathlib` and `shutil` (cross-platform)
- The code already handled both forward and backslashes in paths

### New Features for Linux

1. **Desktop Integration**
   - `.desktop` file for Ubuntu application menu
   - Icon support in application launcher

2. **Package Management**
   - Installable via pip
   - Can be installed system-wide or in virtual environment
   - Proper Python package structure

3. **Easy Installation**
   - One-command installation script
   - Automatic dependency resolution
   - Virtual environment support

## Migration Steps Performed

1. ✅ Created proper Python package structure
2. ✅ Added `requirements.txt` with dependencies
3. ✅ Created `setup.py` and `pyproject.toml` for installation
4. ✅ Created launcher script (`jellyfin-music-organizer`)
5. ✅ Created `.desktop` file for GUI integration
6. ✅ Created installation script (`install.sh`)
7. ✅ Updated README with Ubuntu-specific instructions
8. ✅ Archived Windows files

## Testing Recommendations

Before deploying to production, test the following on Ubuntu 24.04:

1. **Installation**
   - [ ] Test automated installation with `install.sh`
   - [ ] Test manual installation steps
   - [ ] Test virtual environment installation
   - [ ] Test system-wide installation

2. **Functionality**
   - [ ] Launch application from terminal
   - [ ] Launch application from GUI menu
   - [ ] Test music folder selection
   - [ ] Test destination folder selection
   - [ ] Test organize functionality
   - [ ] Test error handling
   - [ ] Test settings persistence
   - [ ] Test audio notifications

3. **File Operations**
   - [ ] Test with various audio formats
   - [ ] Test with files containing special characters
   - [ ] Test duplicate file handling
   - [ ] Test error reporting exports

4. **Desktop Integration**
   - [ ] Verify application appears in menu
   - [ ] Verify icon displays correctly
   - [ ] Verify window management

## Known Considerations

1. **Audio Playback**
   - Requires `python3-pyqt5.qtmultimedia` system package
   - May need additional GStreamer plugins for some systems

2. **File Paths**
   - Linux uses forward slashes (already handled in code)
   - Case-sensitive file system (unlike Windows)

3. **Permissions**
   - User must have read access to source music folder
   - User must have write access to destination folder

## Backward Compatibility

The Windows version remains available in `archive/windows/` for users who need it. The `.exe` file can still be downloaded and used on Windows systems.

## Future Enhancements

Potential improvements for the Linux version:

- [ ] Add AppImage or Flatpak packaging
- [ ] Add to Ubuntu PPA for easier installation
- [ ] Add systemd service for background organization
- [ ] Add command-line interface option
- [ ] Add batch processing mode
- [ ] Add configuration file support

## Support

For issues specific to the Linux version, please open an issue on GitHub with:
- Ubuntu version
- Python version
- Installation method used
- Error messages or logs

