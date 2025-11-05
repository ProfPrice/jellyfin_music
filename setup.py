#!/usr/bin/env python3
"""
Setup script for Jellyfin Music Organizer
"""

from setuptools import setup, find_packages
import os

# Read the contents of README file
this_directory = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(this_directory, 'readme.md'), encoding='utf-8') as f:
    long_description = f.read()

# Read requirements
with open(os.path.join(this_directory, 'requirements.txt'), encoding='utf-8') as f:
    requirements = [line.strip() for line in f if line.strip() and not line.startswith('#')]

setup(
    name='jellyfin-music-organizer',
    version='3.06',
    author='Original Author',
    description='Organize music files for Jellyfin Media Server',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/ImKyleDouglas/jellyfin_music',
    packages=find_packages(),
    include_package_data=True,
    install_requires=requirements,
    entry_points={
        'console_scripts': [
            'jellyfin-music-organizer=jellyfin_music_organizer.main:main',
        ],
        'gui_scripts': [
            'jellyfin-music-organizer-gui=jellyfin_music_organizer.main:main',
        ],
    },
    package_data={
        'jellyfin_music_organizer': [
            '*.ico',
            'notification_audio/*.wav',
        ],
    },
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: End Users/Desktop',
        'Topic :: Multimedia :: Sound/Audio',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10',
        'Programming Language :: Python :: 3.11',
        'Programming Language :: Python :: 3.12',
        'Operating System :: POSIX :: Linux',
        'Environment :: X11 Applications :: Qt',
    ],
    python_requires='>=3.8',
    keywords='jellyfin music organizer media server audio',
)

