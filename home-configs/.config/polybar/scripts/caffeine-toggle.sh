#!/usr/bin/env bash


# if the script is passed --toggle
if [[ "$1" == *toggle* ]]; then

    # if caffeine is running kill it
    if pgrep caffeine >/dev/null; then

        killall caffeine

    else  # otherwise start it and fork to background

        caffeine &>/dev/null &

    fi

    # exit or get caught in the infinite loop
    exit 0

fi


# infinite loop for polybar
while true; do

    # caffeine is running
    if pgrep caffeine >/dev/null; then

        # Change Me
        echo "%{F#B13F47}"

    else  # otherwise it must not be... LOL

        # Change Me
        echo "%{F#DFE1E8}"

    fi


    # sleep interval... Change the responsiveness
    sleep 2

done
