REM this code is licenced under the GNU Public Licence see www.gnu.org for details
REM Copyright Jeff Davies Nov 2002

WHILE NOT (a$ = "q")
  a$ = INKEY$
  IF a$ <> "" THEN
    FOR X = 1 TO LEN(a$)
      PRINT HEX$(ASC(MID$(a$, 1, 1)));
    NEXT X
    PRINT
  END IF
WEND
 

