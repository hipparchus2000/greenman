Greenman

GAME4.BAS is the latest actual game (GAME1-3 were earlier versions).
GEDIT is for editing the shapes used in the game.

Currently execution of other programs by the kid selecting a target is
hardcoded into GAME4 which needs to be instead configured through a config file.

Keyview is (as I remember) a mini program to test scan codes.

CDSTART.BAS is a small program I used to make a bootable windows CD once.
(boots to a html page).


Editing shapes and comipiling to binary loadables:
edit shape with GEDIT  save text version of image as . (no extenion)
use process.bat (uses procgraf) to compile text shape to .spr file (binary screen shape).
**NOTE PROCESS.BAT used a QBASIC4.5 compiled version of PROCGRAF **

screen shapes are loaded by GAME4.bas according to positional information in screen.map.

NOTES ABOUT QUICKBASIC4.5

game4.bas runs ok with QBASIC 1.0 as shipped with DOS.
So if you want to see this work, search the web for QBASIC.EXE (the 1.0 version that
shipped with MS-DOS), download it, and load GAME4 into it.

(Over time I'll make SVGALIB and X11/Mac/Win32 versions  of this program, 
and generalise it to you don't need to compile it to change it's behaviour
ie behaviour will be modifyable through a config file and perhaps a tool).


Jeff Davies