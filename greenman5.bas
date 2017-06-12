REM this code is licenced under the GNU Public Licence see www.gnu.org for details
REM Copyright Jeff Davies Nov 2002

CHDIR "programs\greenman\greenman"

DECLARE SUB loadscreenmap ()
DECLARE SUB screenmap ()
DECLARE SUB flippage ()
DECLARE SUB repaint ()

REM **************************** INITIALISE *****************************


PRINT "Use 4,6 for left/right use 8/2 for up/down, press Enter to continue."
INPUT a$

OPTION BASE 0
DIM SHARED vpage, apage AS INTEGER
vpage = 1
apage = 0
SCREEN 9, 0, apage, vpage

REM **************** LOAD SCREEN MAP -> THIS HAS A CHARACTER FOR *******
REM ******************** EVERY 20 BY 20 BLOCK **************************
REM ***************** SCREEN 640 x 350 => 32 x 17 **********************
REM ******************** CONTAINS "A" TO "Z" ***************************
DIM SHARED sm$(16)
DIM SHARED x, y AS INTEGER
loadscreenmap

REM **************************** WORK OUT SIZE FOR ARRAY **************
xmaxx = 20
ymax = 20
reqdsize = 4 + INT(((xmaxx - 0 + 1) * (1) + 7) / 8) * 4 * ((ymax - 0) + 1)

REM **************************** LOAD PLAYER GRAPHIC *****************
REDIM graphic(reqdsize + 1)
DEF SEG = VARSEG(graphic(0))
BLOAD "spr\homer.spr", VARPTR(graphic(0))
DEF SEG


REM **************************** LOAD SCREENMAP GRAPHICS *****************
REDIM SHARED sma(reqdsize + 1)
DEF SEG = VARSEG(sma(0))
BLOAD "spr\sma.spr", VARPTR(sma(0))
DEF SEG

REDIM SHARED smb(reqdsize + 1)
DEF SEG = VARSEG(smb(0))
BLOAD "spr\smb.spr", VARPTR(smb(0))
DEF SEG

REDIM SHARED smc(reqdsize + 1)
DEF SEG = VARSEG(smc(0))
BLOAD "spr\smc.spr", VARPTR(smc(0))
DEF SEG

REDIM SHARED smd(reqdsize + 1)
DEF SEG = VARSEG(smd(0))
BLOAD "spr\smd.spr", VARPTR(smd(0))
DEF SEG

ON ERROR GOTO errorhandler

REDIM SHARED sme(reqdsize + 1)
DEF SEG = VARSEG(sme(0))
BLOAD "spr\apple.spr", VARPTR(sme(0))
DEF SEG

REDIM SHARED smf(reqdsize + 1)
DEF SEG = VARSEG(smf(0))
BLOAD "spr\banana.spr", VARPTR(smf(0))
DEF SEG

REDIM SHARED smg(reqdsize + 1)
DEF SEG = VARSEG(smg(0))
BLOAD "spr\rocket.spr", VARPTR(smg(0))
DEF SEG

REDIM SHARED smh(reqdsize + 1)
DEF SEG = VARSEG(smh(0))
BLOAD "spr\castle.spr", VARPTR(smh(0))
DEF SEG

REDIM SHARED smi(reqdsize + 1)
DEF SEG = VARSEG(smi(0))
BLOAD "spr\smi.spr", VARPTR(smi(0))
DEF SEG

REDIM SHARED smj(reqdsize + 1)
DEF SEG = VARSEG(smj(0))
BLOAD "spr\smj.spr", VARPTR(smj(0))
DEF SEG

ON ERROR GOTO 0

screenmap


REM ***************** DRAW INITIAL PLAYER *****************************
x = 0
y = 0
PUT (x, y), graphic(0), PSET


REM ******* FLIP THE PAGE ********
vpage = 0
apage = 1
SCREEN 9, 0, apage, vpage
PCOPY vpage, apage

REM ********* GAME LOOP ************************************************
WHILE a$ <> "q"
    a$ = LCASE$(INKEY$)
    IF a$ <> "" THEN
        SELECT CASE a$
            REM ****************** LEFT ***************
            CASE "4":
                IF x > 0 THEN
                    this$ = UCASE$(MID$(sm$(y), x + 1 - 1, 1))
                    IF this$ = "E" OR this$ = "F" OR this$ = "G" OR this$ = "H" THEN this$ = "B"
                    IF this$ = "B" THEN
                        repaint
                        x = x - 1
                        PUT (x * 20, y * 20), graphic(0), PSET
                    END IF
                END IF
                REM ****************** RIGHT **************
            CASE "6":
                IF x < 30 THEN
                    this$ = UCASE$(MID$(sm$(y), x + 1 + 1, 1))
                    IF this$ = "E" OR this$ = "F" OR this$ = "G" OR this$ = "H" THEN this$ = "B"
                    IF this$ = "B" THEN
                        repaint
                        x = x + 1
                        PUT (x * 20, y * 20), graphic(0), PSET
                    END IF
                END IF
                REM ****************** UP *****************
            CASE "8":
                IF y > 0 THEN
                    this$ = UCASE$(MID$(sm$(y - 1), x + 1, 1))
                    IF this$ = "E" OR this$ = "F" OR this$ = "G" OR this$ = "H" THEN this$ = "B"
                    IF this$ = "B" THEN
                        repaint
                        y = y - 1
                        PUT (x * 20, y * 20), graphic(0), PSET
                    END IF
                END IF
                REM ****************** DOWN ***************
            CASE "2":
                IF y < 15 THEN
                    this$ = UCASE$(MID$(sm$(y + 1), x + 1, 1))
                    IF this$ = "E" OR this$ = "F" OR this$ = "G" OR this$ = "H" THEN this$ = "B"
                    IF this$ = "B" THEN
                        repaint
                        y = y + 1
                        PUT (x * 20, y * 20), graphic(0), PSET
                    END IF
                END IF
  
            CASE "R":
                screenmap
                PUT (x * 20, y * 20), graphic(0), PSET

                REM ****************** SPACE BAR ***************
            CASE " ", CHR$(13):
                this$ = UCASE$(MID$(sm$(y), x + 1, 1))
                SELECT CASE this$
                    CASE "E":
                        REM apple
                        CHDIR "c:\mario"
                        SHELL "c:\mario\df.exe"
                        CHDIR "c:\qb"
                    CASE "F":
                        REM banana
                        CHDIR "c:\jill"
                        SHELL "c:\jill\jill.exe"
                        CHDIR "c:\qb"
                    CASE "G":
                        REM rocket
                        CHDIR "c:\keen"
                        SHELL "c:\keen\keen1.exe"
                        CHDIR "c:\qb"
                    CASE "H":
                        REM castle
                        CHDIR "c:\fun23"
                        SHELL "c:\fun23\fun23.exe"
                        CHDIR "c:\qb"
                END SELECT


                SCREEN 0
                CLS

                SCREEN 9
                CLS
                SCREEN 9, 0, 1, 0
                CLS
                loadscreenmap
                screenmap
                PUT (x * 20, y * 20), graphic(0), PSET

                PCOPY 1, 0
                apage = 1
                vpage = 0


        END SELECT

        flippage

    END IF
WEND

SCREEN 0

END

errorhandler:
RESUME NEXT

SUB flippage
REM ******** FLIP THE PAGE **************
IF vpage = 0 THEN
    vpage = 1
    apage = 0
ELSE
    vpage = 0
    apage = 1
END IF

SCREEN 9, 0, apage, vpage
PCOPY vpage, apage

END SUB

SUB loadscreenmap

OPEN "screen.map" FOR INPUT AS 1
FOR x1 = 0 TO 16
    LINE INPUT #1, sm$(x1)
NEXT x1
CLOSE 1

END SUB

SUB repaint
this$ = UCASE$(MID$(sm$(y), x + 1, 1))
SELECT CASE this$
    CASE "A":
        PUT (x * 20, y * 20), sma(0), PSET
    CASE "B":
        PUT (x * 20, y * 20), smb(0), PSET
    CASE "C":
        PUT (x * 20, y * 20), smc(0), PSET
    CASE "D":
        PUT (x * 20, y * 20), smd(0), PSET
    CASE "E":
        PUT (x * 20, y * 20), sme(0), PSET
    CASE "F":
        PUT (x * 20, y * 20), smf(0), PSET
    CASE "G":
        PUT (x * 20, y * 20), smg(0), PSET
    CASE "H":
        PUT (x * 20, y * 20), smh(0), PSET
    CASE "I":
        PUT (x * 20, y * 20), smi(0), PSET
    CASE "J":
        PUT (x * 20, y * 20), smj(0), PSET
END SELECT

END SUB

SUB screenmap
REM **************** DRAW SCREEN GRAPHICS *****************************
FOR y1 = 0 TO 15
    FOR x1 = 0 TO 30
        this$ = UCASE$(MID$(sm$(y1), x1 + 1, 1))
        SELECT CASE this$
            CASE "A":
                PUT (x1 * 20, y1 * 20), sma(0), PSET
            CASE "B":
                PUT (x1 * 20, y1 * 20), smb(0), PSET
            CASE "C":
                PUT (x1 * 20, y1 * 20), smc(0), PSET
            CASE "D":
                PUT (x1 * 20, y1 * 20), smd(0), PSET
            CASE "E":
                PUT (x1 * 20, y1 * 20), sme(0), PSET
            CASE "F":
                PUT (x1 * 20, y1 * 20), smf(0), PSET
            CASE "G":
                PUT (x1 * 20, y1 * 20), smg(0), PSET
            CASE "H":
                PUT (x1 * 20, y1 * 20), smh(0), PSET
            CASE "I":
                PUT (x1 * 20, y1 * 20), smi(0), PSET
            CASE "J":
                PUT (x1 * 20, y1 * 20), smj(0), PSET
        END SELECT
    NEXT x1
NEXT y1

END SUB

