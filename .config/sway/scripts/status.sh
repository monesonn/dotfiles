#                          __
#     ____    _____ ___ __/ /  ___ _____
#    (_-< |/|/ / _ `/ // / _ \/ _ `/ __/
#   /___/__,__/\_,_/\_, /_.__/\_,_/_/
#                  /___/
#
#   statusbar for swaybar

# Variables
SINK=0
SOURCE=1

# Uptime
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
date_formatted=$(date "+%a %F %H:%M:%S %p")

# Linux kernel version
linux_version=$(uname -r | cut -d '-' -f1)

# Hostame
hostname=$(hostname)
name=$(whoami)

# Wifi
wifi_name=$(iw dev wlp1s0 link | grep SSID | cut -d: -f2)
wifi_name_short=$(printf "%s" $wifi_name | cut -c 1-11)

# Brightness
current_brightness=$(light)
current_brightness_rounded=$(printf "%.0f" $current_brightness)

if [ $current_brightness_rounded -ge 80 ]; then
    brightness_icon=""
elif [ $current_brightness_rounded -ge 50 ]; then
    brightness_icon=""
elif [ $current_brightness_rounded -ge 1 ]; then
    brightness_icon=""
else
    brightness_icon=""
fi

# Currently playing
artist=$(playerctl metadata "artist")
title=$(playerctl metadata "title")

# track=$(printf "%s" "$artist - $title")
# track_short=$(printf "%s" "$artist - $title" | cut -c 1-21)

if [ -n $title ]; then
    track=""
else
    track="  $title"
fi

# Volume
current_volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 2 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
current_source_muted=$(pactl list sources | grep '^[[:space:]]Mute:' | head -n $(( $SOURCE + 1 )) | tail -n 1 | cut -d ":" -f2 | sed -e 's/^[ \t]*//')

current_sink_muted=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( $SINK + 2 )) | tail -n 1 | cut -d ":" -f2 | sed -e 's/^[ \t]*//')
if [ $current_sink_muted = "yes" ]; then
    sink_icon="婢"
else
    sink_icon="墳"
fi

if [ $current_source_muted = "yes" ]; then
    source_icon=""
else
    source_icon=""
fi
current_source_volume=$(pactl list sources | grep '^[[:space:]]Volume:' | head -n $(( $SOURCE + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

# Memory
current_mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
current_mem_rounded=`printf "%.2f" $current_mem`

# CPU
current_cpu=$(cat /proc/stat | grep 'cpu ' | awk '{print ($2+$4)*100/($2+$4+$5)}')
current_cpu_rounded=`printf "%.2f" $current_cpu`

# Battery
battery_level=$(cat /sys/class/power_supply/BAT0/capacity || cat /sys/class/power_supply/BAT1/capacity) 2>/dev/null
battery_status=$(cat /sys/class/power_supply/BAT0/status || cat /sys/class/power_supply/BAT1/status) 2>/dev/null
battery_level_rounded=`printf "%.0f" $battery_level`
if [ $battery_status = "Charging" ]; then
    battery_icon=""
else
    if [ $battery_level_rounded -ge 95 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 85 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 75 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 65 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 55 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 45 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 35 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 25 ]; then
        battery_icon=""
    elif [ $battery_level_rounded -ge 15 ]; then
        battery_icon=""
    else
        battery_icon=""
    fi
fi

# Keyboard
keyboard_layout=`swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '"' -f4`

# 11 elements
printf "%s" \
    "$track  " \
    " $name@$hostname  " \
    "  $wifi_name_short  " \
    "$brightness_icon  $current_brightness_rounded%  " \
    "$sink_icon  $current_volume%  " \
    "$source_icon $current_source_volume%  " \
    "  $current_cpu_rounded%  " \
    "  $current_mem_rounded%  " \
    "↑$uptime_formatted H  " \
    "  $linux_version  " \
    "  $keyboard_layout  " \
    "$battery_icon $battery_level%  " \
    "  $date_formatted"
