IDENTIFICATION DIVISION.
PROGRAM-ID. COBOL-ORACLE.
AUTHOR. A-NOSTALGIC-PROGRAMMER.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NAME           PIC X(20).
01 WS-NAME-LENGTH    PIC 9(2).

PROCEDURE DIVISION.
    DISPLAY "==========================================".
    DISPLAY "   COBOL-ORACLE, 1959 EDITION (IN SPIRIT)".
    DISPLAY "==========================================".
    DISPLAY "What is your name, mortal?".
    ACCEPT WS-NAME.

    INSPECT WS-NAME TALLYING WS-NAME-LENGTH
        FOR CHARACTERS BEFORE SPACE.

    DISPLAY " ".
    DISPLAY "Ah, " WS-NAME "...".
    DISPLAY "It took me 47 lines of code to process".
    DISPLAY "your name. In Python, one line would do.".
    DISPLAY "But I am COBOL. I do not rush. I DECLARE.".
    DISPLAY " ".

    IF WS-NAME-LENGTH > 8
        DISPLAY "Your name is as long as a DIVISION."
        DISPLAY "Respect."
    ELSE
        DISPLAY "Short name, efficient. Barely COBOL at all."
    END-IF.

    DISPLAY " ".
    DISPLAY "The prophecy is fulfilled. STOP RUN.".
    STOP RUN.
