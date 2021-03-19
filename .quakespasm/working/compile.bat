@echo off

cd\
cd C:\Users\Void\Desktop\Quake\working


echo Copying Files...
copy C:\Users\Void\Desktop\Quake\id1\maps\testWildebrook.map C:\Users\Void\Desktop\Quake\working


echo Converting map...


echo --------------QBSP--------------
C:\Users\Void\Desktop\Quake\tools\ericw-tools-v0.18\bin\qbsp.exe testWildebrook

echo --------------VIS---------------
C:\Users\Void\Desktop\Quake\tools\ericw-tools-v0.18\bin\vis.exe testWildebrook
pause

echo -------------LIGHT--------------
C:\Users\Void\Desktop\Quake\tools\ericw-tools-v0.18\bin\light.exe testWildebrook

copy testWildebrook.bsp C:\Users\Void\Desktop\Quake\ID1\maps
copy testWildebrook.pts C:\Users\Void\Desktop\Quake\ID1\maps
copy testWildebrook.lit C:\Users\Void\Desktop\Quake\ID1\maps
pause
cd\
cd C:\Users\Void\Desktop\Quake
quakespasm -width 1366 -height 768 - bpp 32 +map testWildebrook
