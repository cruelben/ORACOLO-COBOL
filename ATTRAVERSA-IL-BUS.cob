IDENTIFICATION DIVISION.
PROGRAM-ID. ATTRAVERSA-IL-BUS.
AUTHOR. UN-PROGRAMMATORE-NOSTALGICO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-SEME             PIC 9(8).
01 WS-CASUALE          PIC 9V9(4).
01 WS-DADO             PIC 9.
01 WS-RIGA             PIC 9 VALUE 5.
01 WS-VITE             PIC 9 VALUE 3.
01 WS-PUNTI            PIC 9(4) VALUE 0.
01 WS-ROUND            PIC 9(3) VALUE 0.
01 WS-MOSSA            PIC X.
01 WS-CONTINUA         PIC X VALUE "S".

PROCEDURE DIVISION.
    DISPLAY "+------------------------------------------+".
    DISPLAY "|   ATTRAVERSA IL BUS - DATA CROSSING 1981  |".
    DISPLAY "+------------------------------------------+".
    DISPLAY "Un pacchetto dati deve attraversare 5 corsie".
    DISPLAY "piene di BUG per raggiungere l'OUTPUT.".
    DISPLAY "[A] Avanza (rischi un urto)   [F] Fermo (aspetta)".
    DISPLAY " ".

    PERFORM UNTIL WS-RIGA = 0 OR WS-VITE = 0 OR WS-CONTINUA = "N"
        ADD 1 TO WS-ROUND

        DISPLAY "CORSIA: " WS-RIGA "  VITE: " WS-VITE
            "  PUNTI: " WS-PUNTI
        DISPLAY "Cosa fai? (A = Avanza, F = Fermo)"
        ACCEPT WS-MOSSA

        IF WS-MOSSA = "A" OR WS-MOSSA = "a"
            ACCEPT WS-SEME FROM TIME
            COMPUTE WS-CASUALE = FUNCTION RANDOM(WS-SEME)
            COMPUTE WS-DADO = (WS-CASUALE * 6) + 1
            IF WS-DADO > 6
                MOVE 6 TO WS-DADO
            END-IF

            IF WS-DADO <= 2
                SUBTRACT 1 FROM WS-VITE
                DISPLAY ">>> BUG IN ARRIVO! COLLISIONE! -1 VITA."
            ELSE
                SUBTRACT 1 FROM WS-RIGA
                ADD 15 TO WS-PUNTI
                DISPLAY ">>> VIA LIBERA! AVANZI DI UNA CORSIA. +15 PUNTI."
            END-IF
        ELSE
            DISPLAY ">>> ASPETTI IN CORSIA, NESSUN RISCHIO."
        END-IF

        IF WS-RIGA > 0 AND WS-VITE > 0
            DISPLAY "Vuoi continuare? (S/N)"
            ACCEPT WS-CONTINUA
        END-IF
        DISPLAY " "
    END-PERFORM.

    DISPLAY "==============================================".
    EVALUATE TRUE
        WHEN WS-RIGA = 0
            DISPLAY "PACCHETTO CONSEGNATO! DATI SALVATI!"
        WHEN WS-VITE = 0
            DISPLAY "PACCHETTO CORROTTO. TRASMISSIONE FALLITA."
        WHEN OTHER
            DISPLAY "TRASMISSIONE INTERROTTA."
    END-EVALUATE.
    DISPLAY "PUNTEGGIO FINALE: " WS-PUNTI " IN " WS-ROUND " ROUND.".
    DISPLAY "==============================================".
    STOP RUN.
