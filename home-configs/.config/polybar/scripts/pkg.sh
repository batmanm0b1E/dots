#!/usr/bin/env bash

pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)
check=$((pac + aur))

if [[ "$pac" > "1" ]]; then
  echo $pac 

else
  echo  

fi
