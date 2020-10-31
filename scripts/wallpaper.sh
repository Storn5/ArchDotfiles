#!/bin/sh

n=$(( $(ls /home/storn/wallpapers/ | wc -l) - 1 ))
i=$(( (RANDOM % $n) + 1 ))
echo $i
cp /home/storn/wallpapers/$i.jpg /home/storn/wallpapers/cur_wallpaper.jpg
hsetroot -cover /home/storn/wallpapers/cur_wallpaper.jpg
