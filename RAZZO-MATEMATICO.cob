IDENTIFICATION DIVISION.
PROGRAM-ID. RAZZO-MATEMATICO.
AUTHOR. UN-PROGRAMMATORE-NOSTALGICO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-SEME             PIC 9(8).
01 WS-CASUALE          PIC 9V9(4).
01 WS-A                PIC 9(2).
01 WS-B                PIC 9(2).
01 WS-OP-NUM           PIC 9.
01 WS-OP-SEGNO         PIC X.
01 WS-CORRETTA         PIC S9(4).
01 WS-RISPOSTA         PIC S9(4).
01 WS-PUNTI            PIC 9(4) VALUE 0.
01 WS-CARBURANTE       PIC 9(3) VALUE 100.
01 WS-ALTITUDINE       PIC 9(5) VALUE 0.
01 WS-ROUND            PIC 9(3) VALUE 0.
01 WS-CONTINUA         PIC X VALUE "S".

PROCEDURE DIVISION.
    DISPLAY "+------------------------------------------+".
    DISPLAY "|   RAZZO MATEMATICO - MISSIONE LUNA 1975   |".
    DISPLAY "+------------------------------------------+".
    DISPLAY "Risolvi i calcoli per far volare il razzo!".
    DISPLAY "Ogni errore ti costa carburante.".
    DISPLAY " ".

    PERFORM UNTIL WS-CARBURANTE = 0
                OR WS-ALTITUDINE >= 5000
                OR WS-CONTINUA = "N"

        ADD 1 TO WS-ROUND

        ACCEPT WS-SEME FROM TIME
        COMPUTE WS-CASUALE = FUNCTION RANDOM(WS-SEME)
        COMPUTE WS-A = (WS-CASUALE * 20) + 1

        COMPUTE WS-CASUALE = FUNCTION RANDOM
        COMPUTE WS-B = (WS-CASUALE * 20) + 1

        COMPUTE WS-CASUALE = FUNCTION RANDOM
        COMPUTE WS-OP-NUM = (WS-CASUALE * 3) + 1
        IF WS-OP-NUM > 3
            MOVE 3 TO WS-OP-NUM
        END-IF

        EVALUATE WS-OP-NUM
            WHEN 1
                MOVE "+" TO WS-OP-SEGNO
                COMPUTE WS-CORRETTA = WS-A + WS-B
            WHEN 2
                MOVE "-" TO WS-OP-SEGNO
                COMPUTE WS-CORRETTA = WS-A - WS-B
            WHEN OTHER
                MOVE "*" TO WS-OP-SEGNO
                COMPUTE WS-CORRETTA = WS-A * WS-B
        END-EVALUATE

        DISPLAY "ALTITUDINE: " WS-ALTITUDINE "m  CARBURANTE: "
            WS-CARBURANTE "%  PUNTI: " WS-PUNTI
        DISPLAY "QUANTO FA " WS-A " " WS-OP-SEGNO " " WS-B " ?"
        ACCEPT WS-RISPOSTA

        IF WS-RISPOSTA = WS-CORRETTA
            ADD 10 TO WS-PUNTI
            ADD 200 TO WS-ALTITUDINE
            DISPLAY ">>> ESATTO! RAZZO IN SALITA! +200m"
        ELSE
            SUBTRACT 25 FROM WS-CARBURANTE
            DISPLAY ">>> SBAGLIATO! ERA " WS-CORRETTA
                ". CARBURANTE IN CALO."
        END-IF

        IF WS-CARBURANTE > 0 AND WS-ALTITUDINE < 5000
            DISPLAY "Vuoi continuare? (S/N)"
            ACCEPT WS-CONTINUA
        END-IF
        DISPLAY " "
    END-PERFORM.

    DISPLAY "==============================================".
    EVALUATE TRUE
        WHEN WS-ALTITUDINE >= 5000
            DISPLAY "SEI ARRIVATO SULLA LUNA! MISSIONE COMPIUTA!"
        WHEN WS-CARBURANTE = 0
            DISPLAY "CARBURANTE ESAURITO. IL RAZZO E' PRECIPITATO."
        WHEN OTHER
            DISPLAY "MISSIONE ABBANDONATA."
    END-EVALUATE.
    DISPLAY "PUNTEGGIO FINALE: " WS-PUNTI " IN " WS-ROUND " ROUND.".
    DISPLAY "==============================================".
    STOP RUN.
