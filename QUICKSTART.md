# Quick Start Guide - Ubuntu 24.04

Get Jellyfin Music Organizer running on Ubuntu in just a few minutes!

## Installation (One Command)

```bash
git clone https://github.com/ImKyleDouglas/jellyfin_music.git
cd jellyfin_music
./install.sh
```

That's it! The script will handle everything.

## Running the Application

After installation, run:

```bash
jellyfin-music-organizer
```

Or search for "Jellyfin Music Organizer" in your applications menu.

## First Time Use

1. **Click "Select Music Folder"**
   - Choose the folder with your unorganized music
   - Can contain subfolders - they'll all be scanned

2. **Click "Select Destination Folder"**
   - Choose where you want organized music saved
   - This will create Artist/Album folder structure

3. **Click "Organize"**
   - Watch the progress bar
   - Handle any duplicate file prompts
   - Review any error reports

4. **Copy to Jellyfin**
   - Copy the organized folder to your Jellyfin music directory
   - Scan library in Jellyfin
   - Enjoy!

## Common Issues

### Application won't start
```bash
# Make sure dependencies are installed
sudo apt install python3-pyqt5 python3-pyqt5.qtmultimedia
pip3 install --user -r requirements.txt
```

### "No module named 'jellyfin_music_organizer'"
```bash
# Install the package
pip3 install --user -e .
```

### Files missing artist/album info
Use [Mp3tag](https://www.mp3tag.de/en/) or similar tool to add metadata before organizing.

## Settings

Click the settings icon (⚙️) to:
- Mute audio notifications
- Set default folders
- Save preferences

## Need Help?

- Check the full [README.md](readme.md)
- Review [MIGRATION.md](MIGRATION.md) for technical details
- Open an issue on GitHub

## Supported Formats

✅ MP3, FLAC, M4A, OGG, OPUS, WAV, WMA, and more!

See README.md for complete list.

