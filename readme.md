# Jellyfin Music Organizer v3.06

![1689769189707](image/readme/1689769189707.png)

Jellyfin Music Organizer will automatically sort your music into folders that Jellyfin can read.

**Now available for Linux (Ubuntu 24.04)!** This tool was originally Windows-only but has been migrated to work natively on Linux systems.

## Features

- Automatically organizes music files by Artist/Album structure
- Supports multiple audio formats
- GUI application built with PyQt5
- Dark theme interface
- Audio notifications for completion and errors
- Handles duplicate files with replace/skip options
- Error reporting with detailed metadata information
- Export error reports to TXT, CSV, Excel, or JSON

## Folder Structure

This will create a folder structure like this:

![1688631211429](image/readme/1688631211429.png)

## Installation (Ubuntu 24.04)

### Quick Install

```bash
# Clone the repository
git clone https://github.com/ImKyleDouglas/jellyfin_music.git
cd jellyfin_music

# Run the installation script
./install.sh
```

The installation script will:
- Install system dependencies (Python3, PyQt5)
- Install Python package dependencies
- Set up the application
- Create desktop integration (optional)

### Manual Installation

If you prefer to install manually:

```bash
# Install system dependencies
sudo apt update
sudo apt install -y python3 python3-pip python3-pyqt5 python3-pyqt5.qtmultimedia

# Install Python dependencies
pip3 install --user -r requirements.txt

# Install the application
pip3 install --user -e .

# (Optional) Install desktop integration
mkdir -p ~/.local/share/applications
cp jellyfin-music-organizer.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

## Usage

### Running the Application

After installation, you can run the application in several ways:

1. **From the terminal:**
   ```bash
   jellyfin-music-organizer
   ```

2. **Using the launcher script:**
   ```bash
   ./jellyfin-music-organizer
   ```

3. **From the applications menu:**
   Search for "Jellyfin Music Organizer" in your Ubuntu applications menu

### How to Use

1. **Select your music folder**
   - Click the music folder button
   - Choose the folder containing your unorganized music
   - The program will search all subfolders automatically

2. **Select your destination folder**
   - Click the destination folder button
   - Choose where you want the organized music to be saved

3. **Click the 'Organize' button**
   - The application will scan for music files
   - Progress bar will show the organization progress
   - You'll see how many songs were found

4. **Handle duplicates (if any)**
   - If files already exist in the destination, you'll be asked to replace or skip

   ![1689769250156](image/readme/1689769250156.png)

5. **Review any errors**
   - If files are missing artist or album metadata, an error window will appear
   - Export error reports for troubleshooting

   ![1689769284799](image/readme/1689769284799.png)

6. **Copy to Jellyfin**
   - Copy the organized folder structure to your Jellyfin Media Server music location
   - Done!

## Settings

The settings window allows you to:
- Mute all audio notifications
- Set default music folder location
- Set default destination folder location

![1689773000219](image/readme/1689773000219.png)

## Supported Audio Formats

The following audio file formats are supported:
- `.aif`, `.aiff` - Audio Interchange File Format
- `.ape` - Monkey's Audio
- `.flac` - Free Lossless Audio Codec
- `.m4a`, `.m4b`, `.m4r` - MPEG-4 Audio
- `.mp2`, `.mp3`, `.mp4` - MPEG Audio
- `.mpc` - Musepack
- `.ogg` - Ogg Vorbis
- `.opus` - Opus Audio
- `.wav` - Waveform Audio
- `.wma` - Windows Media Audio

## Important Notes

- **All songs must have artist and album metadata** - Use a tool like [Mp3tag](https://www.mp3tag.de/en/) to add missing metadata
- **Files are copied, not moved** - Your original files remain untouched
- **Subfolders are scanned** - The application will find music files in all subdirectories

## Requirements

- Ubuntu 24.04 LTS (or compatible Linux distribution)
- Python 3.8 or higher
- PyQt5
- See `requirements.txt` for full Python dependencies

## Development

To run from source without installing:

```bash
# Install dependencies
pip3 install -r requirements.txt

# Run directly
python3 -m jellyfin_music_organizer.main
```

## Legacy Windows Version

The original Windows `.exe` file has been archived in the repository. If you need the Windows version, it's still available in the repository files.

## License

MIT License (assumed - please add appropriate license file)

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.
