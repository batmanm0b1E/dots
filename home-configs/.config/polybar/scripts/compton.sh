#!/usr/bin/env bash

#The icon that would change color
on="  "
off="  "
if pgrep -x "compton" > /dev/null
then
	echo "$on"
else
	echo "%{F#777773}$on"
fi
