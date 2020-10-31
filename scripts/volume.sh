#!/bin/bash
sinkName=$(pacmd info | grep 'Default sink' | awk '{print $4}')
sinkNumber=$(pacmd info | grep "sink:.*$sinkName" | awk '{print $2}')

getVolume() {
 volumeInput=$(pactl list sinks)
 currentVolume=$(echo "${volumeInput#*Sink #$sinkNumber}" | grep -E 'V.*-left' | grep -oE '[0-9]+%' | tail -n 1)
 echo Volume: "$currentVolume"
}

case "$1" in
 up) pactl set-sink-volume @DEFAULT_SINK@ +5%; getVolume;;
 down) pactl set-sink-volume @DEFAULT_SINK@ -5%; getVolume;;
 mute) muted=$(pactl list sinks | grep -E 'Name: $DEFAULT_SINK$|Mute' | grep "yes")
       if [ -z "$muted" ]; then
        pactl set-sink-mute "0" "1"
	echo "Muted"
       else
        pactl set-sink-mute "0" "0"
	getVolume
       fi;;
 list) getVolume;;
esac
