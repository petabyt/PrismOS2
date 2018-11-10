DECLARE SUB newWindow (title AS STRING, content AS STRING, x!, y!, w!, h!)
DECLARE SUB writeText (Text AS STRING, x!, y!)
DECLARE SUB fillDesktop ()

CLS
SCREEN 12

REM Last pressed key
DIM lastPressed AS STRING

REM Mouse/Key Control and Screen refresh
DIM KeyPress AS STRING
DIM mx AS INTEGER
DIM my AS INTEGER
DIM mspeed AS INTEGER

mx = 200
my = 200
mspeed = 5

REM             --------------- Main Loop ----------------
DO
        KeyPress = UCASE$(INKEY$)
        writeText lastPressed, 10, 10

        IF KeyPress = CHR$(0) + CHR$(72) THEN
                my = my - mspeed
        ELSEIF KeyPress = CHR$(0) + CHR$(80) THEN
                my = my + mspeed
        ELSEIF KeyPress = CHR$(0) + CHR$(75) THEN
                mx = mx - mspeed
        ELSEIF KeyPress = CHR$(0) + CHR$(77) THEN
                mx = mx + mspeed
        END IF

        IF NOT KeyPress = "" THEN
                lastPressed = KeyPress
        END IF

        REM Desktop
        fillDesktop

        REM Welcome Window
        newWindow "Welcome to PrismOS", "This version of PrismOS is still in\early alpha stages and does not\really do anything. \\  `", 50, 50, 200, 200

        REM Mouse
        PSET (mx, my), 5
        CLS

LOOP UNTIL KeyPress = "Q"

SUB fillDesktop
        FOR x = 1 TO 480
                LINE (0, x)-(640, x), 3
        NEXT x
END SUB

SUB newWindow (title AS STRING, content AS STRING, x, y, w, h)
              
        REM Make the background
        FOR i = 1 TO h - 12
                LINE (x, y + i)-(x + w, y + i), 15
        NEXT i

        REM Now the popup outline
        LINE (x, y)-(x + w, y), 0
        LINE (x, y + 12)-(x + w, y + 12), 0
        LINE (x, y)-(x, y + 12), 0
        LINE (x + w, y)-(x + w, y + 12), 0
        LINE (x, y + 12)-(x, y + h - 12), 0
        LINE (x + w, y + 12)-(x + w, y + h - 12), 0
        LINE (x, y + h - 12)-(x + w, y + h - 12), 0

        REM Now print the title and content
        writeText title, x + 3, y + 3
        writeText content, x + 3, y + 15
END SUB

SUB refreshScreen
        CLS
        
END SUB

SUB writeText (Text AS STRING, x, y)

        REM Yay - the alphabet!
        chars$ = "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz1234567890!.,?`"
        DIM dat(LEN(chars$)) AS STRING

        REM Character Data Values
        dat(1) = "01110100011000110001111111000110001"
        dat(2) = "11110100011000111110100011000111110"
        dat(3) = "01111100001000010000100001000001111"
        dat(4) = "11110100011000110001100011000111110"
        dat(5) = "11111100001000011111100001000011111"
        dat(6) = "11111100001000011111100001000010000"
        dat(7) = "01111100001000010011100011000101111"
        dat(8) = "10001100011000111111100011000110001"
        dat(9) = "10000100001000010000100001000010000"
        dat(10) = "00001000010000100001000010000111110"
        dat(11) = "10001100101010011000101001001010001"
        dat(12) = "10000100001000010000100001000011111"
        dat(13) = "10001110111010110001100011000110001"
        dat(14) = "10001110011010110011100011000110001"
        dat(15) = "01110100011000110001100011000101110"
        dat(16) = "11110100011000111110100001000010000"
        dat(17) = "01110100011000110001100011001101111"
        dat(18) = "11110100011000110001111101000110001"
        dat(19) = "01111100001000001110000010000111110"
        dat(20) = "11111001000010000100001000010000100"
        dat(21) = "10001100011000110001100011000101110"
        dat(22) = "10001100011000110001100010101000100"
        dat(23) = "10001100011000110001101011101110001"
        dat(24) = "10001100010101000100010101000110001"
        dat(25) = "10001100011000101110001000010000100"
        dat(26) = "11111000010001000100010001000011111"
        dat(27) = "00000000000000000000000000000000000"
        dat(28) = "00000011100000101111100011000101111"
        dat(29) = "10000100001111010001100011000111110"
        dat(30) = "00000000000111010001100001000101110"
        dat(31) = "00001000010111110001100011000101111"
        dat(32) = "00000000000111010001111111000001111"
        dat(33) = "00110010010100011100010000100001000"
        dat(34) = "00000011111000110001011110000111110"
        dat(35) = "10000100001000011110100011000110001"
        dat(36) = "10000000001000010000100001000010000"
        dat(37) = "00001000000001100001000011000101110"
        dat(38) = "10000100001000110010111001001010001"
        dat(39) = "10000100001000010000100001000011000"
        dat(40) = "00000000001111010101101011010110101"
        dat(41) = "00000000001111010001100011000110001"
        dat(42) = "00000000000111010001100011000101110"
        dat(43) = "00000000000111001001011100100001000"
        dat(44) = "00000000000011101001001110000100001"
        dat(45) = "00000000001011111000100001000010000"
        dat(46) = "00000000000111110000011100000111110"
        dat(47) = "00100001000111000100001000010000011"
        dat(48) = "00000000001000110001100011001101101"
        dat(49) = "00000000001000110001100010101000100"
        dat(50) = "00000000001000110001101011111110101"
        dat(51) = "00000000001000101010001000101010001"
        dat(52) = "00000000001000110001011110000111110"
        dat(53) = "00000000001111100010001000100011111"
        dat(54) = "11000010000100001000010000100001000"
        dat(55) = "01110100010000100110010001000011111"
        dat(56) = "3"
        dat(57) = "4"
        dat(58) = "5"
        dat(59) = "6"
        dat(60) = "7"
        dat(61) = "8"
        dat(62) = "9"
        dat(63) = "0"
        dat(64) = "10000100001000010000100000000010000"
        dat(65) = "00000000000000000000000000000010000"
        dat(66) = ","
        dat(67) = "?"
        dat(68) = "00000010100101000000001001000101110"

        wid = 0
        lin = 0
        FOR i = 1 TO LEN(Text)
                cur$ = MID$(Text$, i, 1)
                col = 0

                REM Breaklines
                IF cur$ = "\" THEN
                        lin = lin + 10
                        wid = -6
                END IF

                REM Print the text from the custom font
                FOR N = 1 TO LEN(chars$)
                        IF MID$(chars$, N, 1) = cur$ THEN
                                px = wid + x
                                py = lin + y
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

                REM Custom spaces for different letters
                IF MID$(Text$, i, 1) = "I" THEN
                        wid = wid + 2
                ELSEIF MID$(Text$, i, 1) = "i" THEN
                        wid = wid + 2
                ELSEIF MID$(Text$, i, 1) = "1" THEN
                        wid = wid + 3
                ELSEIF MID$(Text$, i, 1) = "l" THEN
                        wid = wid + 2
                ELSE
                        wid = wid + 6
                END IF
        NEXT i
END SUB

