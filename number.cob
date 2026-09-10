IDENTIFICATION DIVISION.
       PROGRAM-ID. CRUELCOBOL.
       AUTHOR. BRUNO.
       SYSTEM. IBM-370 MONOCHROME CRT.
       DATE-WRITTEN. 1982.

*================================================================*
* CRUELCOBOL - MAINFRAME REVERSE ENGINEERING CHALLENGE           *
* DEVELOPED BY BRUNO                                             *
*================================================================*

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SYSTEM-FLAGS.
           05  WS-GAME-OVER          PIC X(1)    VALUE 'N'.
           05  WS-CODE-MATCH         PIC X(1)    VALUE 'N'.
           05  WS-VALID-INPUT        PIC X(1)    VALUE 'N'.

       01  GAME-VARIABLES.
           05  WS-SECRET-CODE        PIC 9(2).
           05  WS-USER-INPUT-RAW     PIC X(2).
           05  WS-USER-GUESS         PIC 9(2).
           05  WS-ATTEMPTS-LEFT      PIC 9(1)    VALUE 6.
           05  WS-SEED               PIC 9(4)    VALUE 1982.

       01  DISPLAY-MESSAGES.
           05  WS-LOGO-LINE1  PIC X(60) VALUE
               "  CCCC  RRRR   U   U  EEEE  0000  CCCC  0000  BBBB   0000  L    ".
           05  WS-LOGO-LINE2  PIC X(60) VALUE
               " C      R   R  U   U  E     0  0 C      0  0 B   B  0  0 L    ".
           05  WS-LOGO-LINE3  PIC X(60) VALUE
               " C      RRRR   U   U  EEE   0  0 C      0  0 BBBB   0  0 L    ".
           05  WS-LOGO-LINE4  PIC X(60) VALUE
               " C      R  R   U   U  E     0  0 C      0  0 B   B  0  0 L    ".
           05  WS-LOGO-LINE5  PIC X(60) VALUE
               "  CCCC  R   R   UUU   EEEE  0000  CCCC  0000  BBBB   0000  LLLLL".

       PROCEDURE DIVISION.
       0000-MAIN-LOGIC.
           PERFORM 1000-DISPLAY-HEADER
           PERFORM 2000-GENERATE-SECRET-CODE
           PERFORM 3000-GAME-LOOP UNTIL WS-GAME-OVER = 'Y'
           PERFORM 4000-DISPLAY-FOOTER
           STOP RUN.

       1000-DISPLAY-HEADER.
           DISPLAY " "
           DISPLAY WS-LOGO-LINE1
           DISPLAY WS-LOGO-LINE2
           DISPLAY WS-LOGO-LINE3
           DISPLAY WS-LOGO-LINE4
           DISPLAY WS-LOGO-LINE5
           DISPLAY " "
           DISPLAY "============================================================"
           DISPLAY " IDENTIFICATION DIVISION."
           DISPLAY " PROGRAM-ID. MAINFRAME-CRUELCOBOL."
           DISPLAY " SYSTEM. IBM-370 MONOCHROME CRT DISPLAY."
           DISPLAY "============================================================"
           DISPLAY " SYS_INIT: CRUELCOBOL AVVIATO."
           DISPLAY " SYS_WARN: TROVA LA CHIAVE DI BYPASS A 2 CIFRE (10-99)."
           DISPLAY " ".

       2000-GENERATE-SECRET-CODE.
      * GENERAZIONE PSEUDO-RANDOM DEL CODICE TRA 10 E 99
           ACCEPT WS-SEED FROM TIME
           COMPUTE WS-SECRET-CODE = FUNCTION MOD(WS-SEED, 90) + 10.

       3000-GAME-LOOP.
           DISPLAY "------------------------------------------------------------"
           DISPLAY "TENTATIVI RIMASTI: " WS-ATTEMPTS-LEFT " | SISTEMA: BLOCCATO"
           DISPLAY "INPUT KEY (10-99) > " WITH NO ADVANCING
           ACCEPT WS-USER-INPUT-RAW

           PERFORM 3100-VALIDATE-INPUT

           IF WS-VALID-INPUT = 'Y'
               SUBTRACT 1 FROM WS-ATTEMPTS-LEFT
               IF WS-USER-GUESS = WS-SECRET-CODE
                   MOVE 'Y' TO WS-CODE-MATCH
                   MOVE 'Y' TO WS-GAME-OVER
                   DISPLAY " "
                   DISPLAY "> ACCESS GRANTED! CODICE CORRETTO: " WS-SECRET-CODE
                   DISPLAY "STATUS: MAINFRAME SBLOCCATO CON SUCCESSO."
               ELSE
                   IF WS-ATTEMPTS-LEFT = 0
                       MOVE 'Y' TO WS-GAME-OVER
                       DISPLAY " "
                       DISPLAY "> ACCESS DENIED! CODICE SECRET WAS: " WS-SECRET-CODE
                       DISPLAY "STATUS: SISTEMA BLOCCATO PERMANENTEMENTE."
                   ELSE
                       IF WS-USER-GUESS < WS-SECRET-CODE
                           DISPLAY "> INP: " WS-USER-GUESS " - CHECK: VALORE TROPPO BASSO"
                       ELSE
                           DISPLAY "> INP: " WS-USER-GUESS " - CHECK: VALORE TROPPO ALTO"
                       END-IF
                   END-IF
               END-IF
           ELSE
               DISPLAY "ERR: INSERIRE UN NUMERO VALIDO A 2 CIFRE (10-99)."
           END-IF.

       3100-VALIDATE-INPUT.
           IF WS-USER-INPUT-RAW IS NUMERIC
               MOVE WS-USER-INPUT-RAW TO WS-USER-GUESS
               IF WS-USER-GUESS >= 10 AND WS-USER-GUESS <= 99
                   MOVE 'Y' TO WS-VALID-INPUT
               ELSE
                   MOVE 'N' TO WS-VALID-INPUT
               END-IF
           ELSE
               MOVE 'N' TO WS-VALID-INPUT
           END-IF.

       4000-DISPLAY-FOOTER.
           DISPLAY " "
           DISPLAY "============================================================"
           DISPLAY "              [ SYSTEM DEVELOPED BY BRUNO ]                 "
           DISPLAY "============================================================"
           DISPLAY " ".