REM this code is licenced under the GNU Public Licence see www.gnu.org for details
REM Copyright Jeff Davies Nov 2002

REM ON ERROR GOTO errorhandler
OPTION BASE 0

opand$ = COMMAND$

IF opand$ = "" THEN
  PRINT "NO FILE SPECIFIED!"
  END
END IF

vpage = 1
apage = 0
SCREEN 9, 0, apage, vpage

speedidx = 10

xmaxx = 40
ymax = 40
reqdsize = 4 + INT(((xmaxx - 0 + 1) * (1) + 7) / 8) * 4 * ((ymax - 0) + 1)

REDIM graphic(reqdsize + 1)
DEF SEG = VARSEG(graphic(0))
BLOAD opand$, VARPTR(graphic(0))
DEF SEG

X = 0
Y = 0

PUT (X, Y), graphic(0), OR
vpage = 0
apage = 1
SCREEN 9, 0, apage, vpage
PCOPY vpage, apage

WHILE a$ <> "Q"
  a$ = UCASE$(INKEY$)
  IF a$ <> "" THEN
    SELECT CASE a$
    CASE "4":
      PUT (X, Y), graphic(0), XOR
      X = X - speedidx
      IF X < 0 THEN X = 0
      PUT (X, Y), graphic(0), XOR
    CASE "6":
      PUT (X, Y), graphic(0), XOR
      X = X + speedidx
      IF X > (640 - 40) THEN X = (640 - 40)
      PUT (X, Y), graphic(0), XOR
    CASE "8":
      PUT (X, Y), graphic(0), XOR
      Y = Y - speedidx
      IF Y < 0 THEN Y = 0
      PUT (X, Y), graphic(0), XOR
    CASE "2":
      PUT (X, Y), graphic(0), XOR
      Y = Y + speedidx
      IF Y > (350 - 40) THEN Y = (350 - 40)
      PUT (X, Y), graphic(0), XOR
    CASE "P":
      LOCATE 15, 1
      COLOR 0
      PRINT "                               "
      LOCATE 15, 1
      INPUT "ENTER X,Y", X, Y
      PSET (X, Y), 15
    END SELECT
 
    IF vpage = 0 THEN
      vpage = 1
      apage = 0
    ELSE
      vpage = 0
      apage = 1
    END IF

    SCREEN 9, 0, apage, vpage
    PCOPY vpage, apage
  END IF
WEND




SCREEN 0

END

errorhandler:
RESUME NEXT

