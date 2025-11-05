from PyQt5.QtWidgets import QApplication
import qdarkstyle
import sys

# Other classes within files
from .music_organizer import MusicOrganizer


def main():
    """Main entry point for the application"""
    app = QApplication(sys.argv)
    app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())
    window = MusicOrganizer()
    sys.exit(app.exec_())


# Create and run application
if __name__ == '__main__':
    main()
    