REM this code is licenced under the GNU Public Licence see www.gnu.org for details
REM Copyright Jeff Davies Nov 2002

ON ERROR GOTO errorhandler
OPTION BASE 0

OPAND$ = COMMAND$

IF OPAND$ = "" THEN
  PRINT "NO FILE SPECIFIED!"
  END
END IF

PRINT "READING FILE "; OPAND$

x = 0
y = 1

SCREEN 9

OPEN OPAND$ FOR INPUT AS 1
WHILE NOT (EOF(1))
  A$ = INPUT$(1, 1)

  SELECT CASE A$
 
  CASE "0":
    x = x + 1
    PSET (x, y), 0
  CASE "1":
    x = x + 1
    PSET (x, y), 1
  CASE "2":
    x = x + 1
    PSET (x, y), 2
  CASE "3":
    x = x + 1
    PSET (x, y), 3
  CASE "4":
    x = x + 1
    PSET (x, y), 4
  CASE "5":
    x = x + 1
    PSET (x, y), 5
  CASE "6":
    x = x + 1
    PSET (x, y), 6
  CASE "7":
    x = x + 1
    PSET (x, y), 7
  CASE "8":
    x = x + 1
    PSET (x, y), 8
  CASE "9":
    x = x + 1
    PSET (x, y), 9
  CASE "A":
    x = x + 1
    PSET (x, y), 10
  CASE "B":
    x = x + 1
    PSET (x, y), 11
  CASE "C":
    x = x + 1
    PSET (x, y), 12
  CASE "D":
    x = x + 1
    PSET (x, y), 13
  CASE "E":
    x = x + 1
    PSET (x, y), 14
  CASE "F":
    x = x + 1
    PSET (x, y), 15
  CASE CHR$(13):
    xmax = x - 1
    x = 0
    y = y + 1
  CASE ELSE:
    REM IGNORE LF ETC
  END SELECT

WEND
ymax = y - 1

CLOSE 1

REM LOCATE 10, 22
REM INPUT "ENTER FILE NAME TO SAVE TO ", FILNAME$

FILNAME$ = OPAND$ + ".SPR"

reqdsize = 4 + INT(((xmax - 0 + 1) * (1) + 7) / 8) * 4 * ((y - 0) + 1)

REDIM graphic(reqdsize + 1)
GET (1, 1)-(20, 20), graphic
DEF SEG = VARSEG(graphic(0))
BSAVE FILNAME$, VARPTR(graphic(0)), reqdsize
DEF SEG

PRINT "X SIZE = "; xmax + 1
PRINT "Y SIZE = "; ymax + 1
PRINT
REM INPUT "PRESS ENTER TO CONTINUE", A$

END

errorhandler:
RESUME NEXT

