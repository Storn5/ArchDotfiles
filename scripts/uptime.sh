#!/bin/sh

text=$(uptime | sed 's/,//g')
if [ $(echo $text | wc -w) -gt 10 ]; then
	echo "Up $(echo $text | awk '{print "0:" $3}')"
else
	echo "Up $(echo $text | awk '{print $3}')"
fi
