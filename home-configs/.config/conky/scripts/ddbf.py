#! /usr/bin/python
import sys, os
command = sys.argv[1]
##fi, f, fe = os.popen3('deadbeef --nowplaying "%l"')
fi, f, fe = os.popen3('deadbeef --nowplaying ' + command)
c = f.readlines()
if (sys.argv[1] == '%l' or sys.argv[1] == '%e') and sys.argv[2] == 's':
    if c[0] != 'nothing':
        c = c[0].split(':')
        c = int(c[0]) * 60 + int(c[1])
    else:
        c = 0
elif (sys.argv[1] == '%l' or sys.argv[1] == '%e') and sys.argv[2] != 's':
    c = c[0]
else:
    if not not c:
        c = c[0]
    else:
        c = ''
print(c)