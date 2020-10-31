#!/bin/sh

install=$(head /var/log/pacman.log -c 11 | sed 's/\[//g')
install=$(date -d "$install" '+%s')
cur=$(date '+%s')
echo "Age $(( (cur - install) / 86400 ))d"
