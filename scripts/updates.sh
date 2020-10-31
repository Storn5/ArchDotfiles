#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
    updates_aur=0
fi

# updates=$(("$updates_arch" + "$updates_aur"))

if [ $updates_arch -gt 0 ] && [ $updates_aur -gt 0 ]; then
    echo "%{F#3cff00}$updates_arch %{T7}🔁%{T-} $updates_aur%{F-}"
elif [ $updates_arch -gt 0 ]; then
    echo "%{F#3cff00}$updates_arch%{F-} %{T7}🔁%{T-} $updates_aur"
elif [ $updates_aur -gt 0 ]; then
    echo "$updates_arch %{T7}🔁%{T-} %{F#3cff00}$updates_aur%{F-}"
else
    echo "$updates_arch %{T7}🔁%{T-} $updates_aur"
fi
