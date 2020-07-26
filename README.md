# mediamonkey-now-playing
A simple autoscript for Media Monkey which outputs the currently playing song to a file.

## Installation
This script is designed for Windows only.

Copy NowPlayingTxt.vbs to the folder _MediaMonkey Install Dir_/Scripts/Auto (e.g. C:\Program Files (x86)\MediaMonkey\Scripts\Auto). Admin privileges may be required.

## Usage
The currently playing song will be output to the file "C:\Temp\NowPlaying.txt", in the format "[Artist Name - ][Album Name - ]Track Title", where the parts in brackets are optionally ommitted from the track name if they cannot be determined.
