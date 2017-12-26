#!/usr/bin/env bash

pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)

check=$((pac + aur))
if [[ "$check" > "0" ]]
then
    echo %{F#81A2BE}$pac %{F#81A2BE}  %{F#81A2BE} $aur
fi

exit 0