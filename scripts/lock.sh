#!/bin/sh

font="sans-serif"
IMG="/home/storn/imgs/lockwall.jpg"
LOCK="/home/storn/imgs/lock.png"
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=7:2:5:2:5:2,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2+50" -vframes 1 $IMG -loglevel quiet

i3lock \
		-i "$IMG" \
		--timepos='x+335:h-620' \
		--datepos='x+43:h-570' \
		--verifpos='x+1150:h-334' \
		--wrongpos='x+1150:h-334' \
		--clock --date-align 1 \
		--insidecolor=517ec500 --ringcolor=517ec500 --line-uses-inside \
		--keyhlcolor=517ec599 --bshlcolor=bf535799 --separatorcolor=517ec500 \
		--insidevercolor=6187c5ff --insidewrongcolor=bf7377ff \
		--ringvercolor=517ec5ff --ringwrongcolor=bf5357ff \
		--radius=227 --ring-width=20 --indpos='x+683:h-334' \
		--veriftext='Please wait...' --wrongtext='Wrong password' \
		--verifcolor="517ec5ff" --layoutcolor="ffffffff" --timecolor="ffffffff" --datecolor="ffffffff" --wrongcolor="bf5357ff" \
		--time-font="$font" --date-font="$font" --layout-font="$font" --verif-font="$font" --wrong-font="$font" \
		--noinputtext='' --force-clock --pass-media-keys -n --keylayout 0 \
		--layout-align 1 --timesize=150 --datesize=30 --verifsize=40 --layoutsize=20 --wrongsize=40 \
		#--datestr "Enter your password..." \
		#--indpos='x+280:h-70'\

rm $IMG
