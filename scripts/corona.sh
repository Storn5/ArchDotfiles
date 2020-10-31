#!/bin/sh

curl -s https://corona-stats.online/ukraine | grep "Ukraine" | 
	sed "s/\s*//g ; s/║//g ; s/│/;/g ; s/\x1b\[[0-9;]*m//g" | 
	awk -F';' '{print "😷" $3 "(%{F#f50a3d}" $4 "%{F-}) 💀" $5 "(%{F#f50a3d}" $6 "%{F-})"}'
