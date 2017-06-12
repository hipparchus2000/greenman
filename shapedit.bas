REM this code is licenced under the GNU Public Licence see www.gnu.org for details
REM Copyright Jeff Davies Nov 2002

DECLARE SUB FILL (C AS INTEGER)
DECLARE SUB background ()
DECLARE SUB drawkey ()
DECLARE SUB drawcursor ()
DECLARE SUB drawgrid ()
DECLARE SUB redraw ()
DECLARE SUB savefile ()
DECLARE SUB loadfile ()
DECLARE SUB GO_UP ()
DECLARE SUB GO_DOWN ()
DECLARE SUB GO_LEFT ()
DECLARE SUB GO_RIGHT ()

SCREEN 9
DIM SHARED G(20, 20) AS INTEGER
DIM SHARED X, Y AS INTEGER
X = 1
Y = 1
FILL (7)
drawgrid
drawcursor

REM UP
ON KEY(11) GO_UP
KEY(11) ON
KEY 15, CHR$(160) + CHR$(72)
KEY(15) ON
ON KEY(15) GO_UP
KEY 19, CHR$(128) + CHR$(72)
KEY(19) ON
ON KEY(19) GO_UP

REM LEFT
ON KEY(12) GO_LEFT
KEY(12) ON
KEY 16, CHR$(160) + CHR$(75)
KEY(16) ON
ON KEY(16) GO_LEFT
KEY 20, CHR$(128) + CHR$(75)
KEY(20) ON
ON KEY(20) GO_LEFT

REM RIGHT
ON KEY(13) GO_RIGHT
KEY(13) ON
KEY 17, CHR$(160) + CHR$(77)
KEY(17) ON
ON KEY(17) GO_RIGHT
KEY 21, CHR$(128) + CHR$(77)
KEY(21) ON
ON KEY(21) GO_RIGHT

REM DOWN
ON KEY(14) GO_DOWN
KEY(14) ON
KEY 18, CHR$(160) + CHR$(80)
KEY(18) ON
ON KEY(18) GO_DOWN
KEY 22, CHR$(128) + CHR$(80)
KEY(22) ON
ON KEY(22) GO_DOWN


WHILE (A$ <> "Q")
    A$ = UCASE$(INKEY$)
    SELECT CASE A$
        CASE "0":
            G(X, Y) = 0
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "1":
            G(X, Y) = 1
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "2":
            G(X, Y) = 2
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "3":
            G(X, Y) = 3
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "4":
            G(X, Y) = 4
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "5":
            G(X, Y) = 5
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "6":
            G(X, Y) = 6
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "7":
            G(X, Y) = 7
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "8":
            G(X, Y) = 8
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "9":
            G(X, Y) = 9
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "A":
            G(X, Y) = 10
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "B":
            G(X, Y) = 11
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "C":
            G(X, Y) = 12
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "D":
            G(X, Y) = 13
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "E":
            G(X, Y) = 14
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF
        CASE "F":
            G(X, Y) = 15
            LINE ((X * 15) + 1, (Y * 15) + 1)-STEP(12, 12), G(X, Y), BF

        CASE "S":
            savefile
 
        CASE "L":
            loadfile

        CASE "G":
            background
    END SELECT

WEND

SCREEN 0
PRINT "Bye"
END


SUB GO_UP
Y = Y - 1
IF Y < 1 THEN Y = 1
drawgrid
drawcursor
END SUB

SUB GO_DOWN
Y = Y + 1
IF Y > 20 THEN Y = 20
drawgrid
drawcursor
END SUB

SUB GO_LEFT
X = X - 1
IF X < 1 THEN X = 1
drawgrid
drawcursor
END SUB

SUB GO_RIGHT
X = X + 1
IF X > 20 THEN X = 20
drawgrid
drawcursor
END SUB

SUB background
WHILE NOT (A$ = CHR$(27))
    A$ = INKEY$
    SELECT CASE A$
        CASE "0":
            C = 0
            FILL (C)
            A$ = CHR$(27)
        CASE "1":
            C = 1
            FILL (C)
            A$ = CHR$(27)
        CASE "2":
            C = 2
            FILL (C)
            A$ = CHR$(27)
        CASE "3":
            C = 3
            FILL (C)
            A$ = CHR$(27)
        CASE "4":
            C = 4
            FILL (C)
            A$ = CHR$(27)
        CASE "5":
            C = 5
            FILL (C)
            A$ = CHR$(27)
        CASE "6":
            C = 6
            FILL (C)
            A$ = CHR$(27)
        CASE "7":
            C = 7
            FILL (C)
            A$ = CHR$(27)
        CASE "8":
            C = 8
            FILL (C)
            A$ = CHR$(27)
        CASE "9":
            C = 9
            FILL (C)
            A$ = CHR$(27)
        CASE "A":
            C = 10
            FILL (C)
            A$ = CHR$(27)
        CASE "B":
            C = 11
            FILL (C)
            A$ = CHR$(27)
        CASE "C":
            C = 12
            FILL (C)
            A$ = CHR$(27)
        CASE "D":
            C = 13
            FILL (C)
            A$ = CHR$(27)
        CASE "E":
            C = 14
            FILL (C)
            A$ = CHR$(27)
        CASE "F":
            C = 15
            FILL (C)
            A$ = CHR$(27)
    END SELECT
WEND
END SUB

SUB drawcursor
LINE (X * 15, Y * 15)-STEP(14, 14), 12, B
END SUB

SUB drawgrid
REM DRAW GRID
FOR X1 = 1 TO 20
    FOR Y1 = 1 TO 20
        LINE (X1 * 15, Y1 * 15)-STEP(14, 14), 7, B
    NEXT Y1
NEXT X1

drawkey

END SUB

SUB drawkey
FOR X1 = 0 TO 15
    LINE (394, 54 + (X1 * 14))-STEP(14, 14), X1, BF
    LINE (394, 54 + (X1 * 14))-STEP(14, 14), 7, B
NEXT X1

LOCATE 5, 53
PRINT "0"
LOCATE 6, 53
PRINT "1"
LOCATE 7, 53
PRINT "2"
LOCATE 8, 53
PRINT "3"
LOCATE 9, 53
PRINT "4"
LOCATE 10, 53
PRINT "5"
LOCATE 11, 53
PRINT "6"
LOCATE 12, 53
PRINT "7"
LOCATE 13, 53
PRINT "8"
LOCATE 14, 53
PRINT "9"
LOCATE 15, 53
PRINT "A"
LOCATE 16, 53
PRINT "B"
LOCATE 17, 53
PRINT "C"
LOCATE 18, 53
PRINT "D"
LOCATE 19, 53
PRINT "E"
LOCATE 20, 53
PRINT "F"
END SUB

SUB FILL (C AS INTEGER)
FOR X1 = 1 TO 20
    FOR Y1 = 1 TO 20
        G(X1, Y1) = C
    NEXT Y1
NEXT X1
redraw
drawgrid
drawcursor
END SUB

SUB loadfile
SCREEN 0
INPUT "LOAD FROM FILENAME ", FILNAME$
OPEN FILNAME$ FOR INPUT AS 1
X = 1
Y = 1
WHILE NOT (EOF(1))
    A$ = UCASE$(INPUT$(1, 1))
    SELECT CASE A$
        CASE "0":
            G(X, Y) = 0
            X = X + 1
        CASE "1":
            G(X, Y) = 1
            X = X + 1
        CASE "2":
            G(X, Y) = 2
            X = X + 1
        CASE "3":
            G(X, Y) = 3
            X = X + 1
        CASE "4":
            G(X, Y) = 4
            X = X + 1
        CASE "5":
            G(X, Y) = 5
            X = X + 1
        CASE "6":
            G(X, Y) = 6
            X = X + 1
        CASE "7":
            G(X, Y) = 7
            X = X + 1
        CASE "8":
            G(X, 1) = 8
            X = X + 1
        CASE "9":
            G(X, Y) = 9
            X = X + 1
        CASE "A":
            G(X, Y) = 10
            X = X + 1
        CASE "B":
            G(X, Y) = 11
            X = X + 1
        CASE "C":
            G(X, Y) = 12
            X = X + 1
        CASE "D":
            G(X, Y) = 13
            X = X + 1
        CASE "E":
            G(X, Y) = 14
            X = X + 1
        CASE "F":
            G(X, Y) = 15
            X = X + 1
        CASE CHR$(13):
            Y = Y + 1
            X = 1
    END SELECT
WEND
CLOSE 1

SCREEN 9

redraw
X = 1
Y = 1
drawcursor

END SUB

SUB redraw

drawgrid

REM COLOR BOXES
FOR X2 = 1 TO 20
    FOR Y2 = 1 TO 20
        LINE ((X2 * 15) + 1, (Y2 * 15) + 1)-STEP(12, 12), G(X2, Y2), BF
    NEXT Y2
NEXT X2

END SUB

SUB savefile
    
SCREEN 0

INPUT "SAVE TO FILENAME ", FILNAME$
OPEN FILNAME$ FOR OUTPUT AS 1
FOR Y1 = 1 TO 20
    FOR X1 = 1 TO 20
        SELECT CASE G(X1, Y1)
            CASE 0:
                PRINT #1, "0";
            CASE 1:
                PRINT #1, "1";
            CASE 2:
                PRINT #1, "2";
            CASE 3:
                PRINT #1, "3";
            CASE 4:
                PRINT #1, "4";
            CASE 5:
                PRINT #1, "5";
            CASE 6:
                PRINT #1, "6";
            CASE 7:
                PRINT #1, "7";
            CASE 8:
                PRINT #1, "8";
            CASE 9:
                PRINT #1, "9";
            CASE 10:
                PRINT #1, "A";
            CASE 11:
                PRINT #1, "B";
            CASE 12:
                PRINT #1, "C";
            CASE 13:
                PRINT #1, "D";
            CASE 14:
                PRINT #1, "E";
            CASE 15:
                PRINT #1, "F";
        END SELECT
    NEXT X1
    PRINT #1,
NEXT Y1
CLOSE 1
     

SCREEN 9
redraw
drawcursor

END SUB

