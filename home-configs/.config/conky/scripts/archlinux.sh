#!/bin/bash
#
# Script by damo, borrowed with love by Dobbie03

URL="https://bbs.archlinux.org/extern.php?action=feed&type=atom"

# comment out this loop if you  aren't using NetworkManager
while ! pidof nm-applet &>/dev/null;do 
    exit
done

# get the forum output:
# extract text between "CDATA[" and "]]" (Post title text)
# cut first line with tail
# keep first 6 lines from result of tail

curl -s -u "$PWORD" "$URL" | grep "<title" | grep -o -P '(?<=CDATA\[).*(?=\]\])'| tail -n +2 | head -n 6
