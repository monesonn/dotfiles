local ansicolors = require 'ansicolors'

local _version = 0.1

local banner = [[
             __         __
  __ _____ _/ /____ _  / /_ _____ _
 / // / _ `/ __/ _ `/ / / // / _ `/
 \_, /\_,_/\__/\_,_(_)_/\_,_/\_,_/
/___/ Audio download .lua script

]]

local env = {
    dir="$HOME/music",
    audio_ext='mp3',
    bitrate='128K',
    sample_rate='48000'
}

function help()
    print([[
Description: CLI-wrapper for youtube-dl written on Shell
Usage: $(basename $0) [options] [URL]

Options:
-p  --playlist  playlist   Download and convert playlist
-a  --audio     audio      Set audio extension
                           [default: mp3; aac, flac...]
-b  --bitrate   bitrate    Set audio bitrate
                           [default: 128K; 256K, 320K]
-s  --asr       asr        Set audio samplerate
                           [default: 48000; 44000, 41000]
-P  --path      path       Set path [default: ~/Music/yata]
-V  --verbose   verbose    Turn off quiet mode
-x  --sox       sox        Merge audio files from playlist
-B  --beets     beets      Add to library and add tags
-f  --find      find       Find videos in Youtube using ytfzf
-v  --version   version    -v for yta's version
                           --version for yta's and youtube-dl version
-h  --help      help       Show this help text

Example: yta https://youtu.be/[url]
         yta -p https://www.youtube.com/playlist?list=[url]
         yta -a=aac -s=44000 -b=256 https://youtu.be/[url]
         yta -f "Title in Youtube"
    ]])
end

help()
