#
# Status bar items
#
#
date_formatted=$(date +'%d-%m-%Y %H:%M:%S')
battery=$(acpi -b | awk -F'[,: ]' '{printf("%s [%s] [%2s:%2s:%2s]", $4,$6,$8,$9,$10)}')
brightness=$(light | cut -f 1 -d ".")

volume_info=$(amixer get Master | grep Right: | awk -F'[\[\]]' '{print $2,$4}')
volume_status=$(echo $volume_info | cut -f 2 -d " ")
volume=$(echo $volume_info | cut -f 1 -d " ")
volume="$(echo $volume_status | grep -q "on" && echo $volume_status | sed 's/on/🔈/')${volume}"
volume="$(echo $volume_status | grep -q "off" && echo $volume_status | sed 's/off/🔇/')${volume}"

echo "[🔆${brightness}] | [${volume}] | ${battery} | ${date_formatted}"
