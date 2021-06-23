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
wifi_power=$(nmcli dev status | grep -iw 'wifi' | head -n 1 | awk '{print $3}')
wifi_name=$(iw dev wlp1s0 link | grep SSID | cut -d: -f2)
wifi_name_short=$(printf "%s" $wifi_name | cut -c 1-11)

if [ $wifi_power = "connected" ]; then
    wifi_icon=""
elif [ $wifi_power =~ "connecting*" ]; then
    wifi_icon=""
else
    wifi_icon="睊"
fi

sc_wifi="$wifi_icon  $wifi_name_short"

# Bluetooth
bluetooth_power=$(bluetoothctl show | grep -i powered | cut -d: -f2-)
bluetooth_name=$(bluetoothctl info | grep -i name | cut -d ':' -f2-)

if [ $bluetooth_power = "yes" ]; then
    sc_bluetooth="$bluetooth_name"
else
    sc_bluetooth=""
fi

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

sc_brightness="$brightness_icon  $current_brightness_rounded%"

# Currently playing
artist=$(playerctl metadata "artist")
title=$(playerctl metadata "title")

# track=$(printf "%s" "$artist - $title")
# track_short=$(printf "%s" "$artist - $title" | cut -c 1-21)

if [ -z $title ]; then
    sc_track=""
else
    sc_track="  $(printf "%s " $title | cut -c 1-50) |"
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

sc_volume="$sink_icon $current_volume%"
sc_micro="$source_icon $current_source_volume%"

# Memory
current_mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
current_mem_rounded=`printf "%.2f" $current_mem`

# CPU
current_cpu=$(cat /proc/stat | grep 'cpu ' | awk '{print ($2+$4)*100/($2+$4+$5)}')
current_cpu_rounded=`printf "%.2f" $current_cpu`

# Battery

# More universal
# battery_level=$(cat /sys/class/power_supply/BAT0/capacity || cat /sys/class/power_supply/BAT1/capacity) 2>/dev/null
# battery_status=$(cat /sys/class/power_supply/BAT0/status || cat /sys/class/power_supply/BAT1/status) 2>/dev/null

# Less universal
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
battery_status=$(cat /sys/class/power_supply/BAT1/status)

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

sc_battery="$battery_icon $battery_level%"

# Keyboard
keyboard_layout=`swaymsg -t get_inputs | grep -m1 'xkb_active_layout_name' | cut -d '"' -f4`

# " $name@$hostname  " \
printf "%s" \
    "$sc_track " \
    "$sc_wifi " \
    "$sc_bluetooth | " \
    "$sc_brightness " \
    "$sc_volume " \
    "$sc_micro | " \
    "  $current_cpu_rounded% " \
    "  $current_mem_rounded% " \
    "↑$uptime_formatted " \
    " $linux_version | " \
    "  $keyboard_layout | " \
    "$sc_battery | " \
    "  $date_formatted"
