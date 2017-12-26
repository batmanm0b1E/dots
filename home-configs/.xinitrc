numlockx &


exec openbox-session
xrdb ~/.Xresources
urxvtd -q -f -o &
rxset s 60 60
xset m 1/1
xset r rate 200 30
setxkbmap -option caps:escape