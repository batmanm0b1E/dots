#!/bin/sh
sed -i \
         -e 's/#eceff4/rgb(0%,0%,0%)/g' \
         -e 's/#2e3440/rgb(100%,100%,100%)/g' \
    -e 's/#eceff4/rgb(50%,0%,0%)/g' \
     -e 's/#d8dee9/rgb(0%,50%,0%)/g' \
     -e 's/#eceff4/rgb(50%,0%,50%)/g' \
     -e 's/#2e3440/rgb(0%,0%,50%)/g' \
	$@