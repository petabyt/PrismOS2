DECLARE SUB writeText (Text AS STRING, x!, y!)
DECLARE SUB fillDesktop ()
CLS
SCREEN 12

REM Make the desktop
fillDesktop

REM Print demo text
writeText "AB", 10, 10

SUB fillDesktop
        FOR x = 1 TO 480
                LINE (0, x)-(480, x), 3
        NEXT x
END SUB

SUB newWindow
        LINE (10, 50)-(50, 50), 1

END SUB

SUB writeText (Text AS STRING, x, y)
        chars$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
        DIM dat(LEN(chars$)) AS STRING

        REM Character Data Values
        dat(1) = "01110100011000110001111111000110001"
        dat(2) = "11110100011000111110100011000111110"
        
        wid = 0
        FOR i = 1 TO LEN(Text)
                cur$ = MID$(Text$, i, 1)
                col = 0
                FOR N = 1 TO LEN(chars$)
                        IF MID$(chars$, N, 1) = cur$ THEN
                                px = wid + x
                                py = y
                                counter = 1
                                FOR L = 1 TO 7
                                        FOR O = 1 TO 5
                                               IF MID$(dat(N), counter, 1) = "1" THEN
                                                        PSET (px, py), col
                                                       
                                                        
                                               END IF
                                               px = px + 1
                                               counter = counter + 1
                                        NEXT O
                                        px = px - 5
                                        py = py + 1
                                NEXT L
                        END IF
                NEXT N
                wid = wid + 6
        NEXT i
END SUB

