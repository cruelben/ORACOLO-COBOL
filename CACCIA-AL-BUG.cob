IDENTIFICATION DIVISION.
PROGRAM-ID. CACCIA-AL-BUG.
AUTHOR. UN-PROGRAMMATORE-NOSTALGICO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-SEME            PIC 9(8).
01 WS-CASUALE         PIC 9V9(4).
01 WS-TANA-BUG        PIC 9.
01 WS-MOSSA           PIC 9.
01 WS-PUNTI           PIC 9(4) VALUE 0.
01 WS-VITE            PIC 9 VALUE 3.
01 WS-ROUND           PIC 9(2) VALUE 0.
01 WS-CONTINUA        PIC X VALUE "S".

PROCEDURE DIVISION.
    DISPLAY "+----------------------------------------+".
    DISPLAY "|    C A C C I A   A L   B U G  - 1982    |".
    DISPLAY "+----------------------------------------+".
    DISPLAY "Un BUG si nasconde in una delle 5 tane.".
    DISPLAY "Indovina la tana (1-5) e schiaccialo!".
    DISPLAY " ".

    PERFORM UNTIL WS-VITE = 0 OR WS-CONTINUA = "N"
        ADD 1 TO WS-ROUND
        ACCEPT WS-SEME FROM TIME
        COMPUTE WS-CASUALE = FUNCTION RANDOM(WS-SEME)
        COMPUTE WS-TANA-BUG = (WS-CASUALE * 5) + 1
        IF WS-TANA-BUG > 5
            MOVE 5 TO WS-TANA-BUG
        END-IF

        DISPLAY "ROUND " WS-ROUND " -- PUNTI: " WS-PUNTI
            " -- VITE: " WS-VITE
        DISPLAY "[1] [2] [3] [4] [5]"
        DISPLAY "In quale tana colpisci?"
        ACCEPT WS-MOSSA

        IF WS-MOSSA = WS-TANA-BUG
            ADD 10 TO WS-PUNTI
            DISPLAY ">>> SCHIACCIATO! Il bug era nella tana "
                WS-TANA-BUG ". +10 PUNTI!"
        ELSE
            SUBTRACT 1 FROM WS-VITE
            DISPLAY ">>> MANCATO! Il bug era nella tana "
                WS-TANA-BUG ". -1 VITA."
        END-IF

        IF WS-VITE > 0
            DISPLAY "Vuoi continuare? (S/N)"
            ACCEPT WS-CONTINUA
        END-IF
        DISPLAY " "
    END-PERFORM.

    DISPLAY "==========================================".
    IF WS-VITE = 0
        DISPLAY "GAME OVER. IL BUG HA VINTO."
    ELSE
        DISPLAY "HAI ABBANDONATO LA CACCIA."
    END-IF
    DISPLAY "PUNTEGGIO FINALE: " WS-PUNTI " IN " WS-ROUND " ROUND.".
    DISPLAY "==========================================".
    STOP RUN.
