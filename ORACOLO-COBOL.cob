IDENTIFICATION DIVISION.
PROGRAM-ID. ORACOLO-COBOL.
AUTHOR. UN-PROGRAMMATORE-NOSTALGICO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NOME           PIC X(20).
01 WS-LUNGHEZZA-NOME PIC 9(2).

PROCEDURE DIVISION.
    DISPLAY "==========================================".
    DISPLAY "   ORACOLO-COBOL, VERSIONE 1959 (SPIRITO)".
    DISPLAY "==========================================".
    DISPLAY "Come ti chiami, mortale?".
    ACCEPT WS-NOME.

    INSPECT WS-NOME TALLYING WS-LUNGHEZZA-NOME
        FOR CHARACTERS BEFORE SPACE.

    DISPLAY " ".
    DISPLAY "Ah, " WS-NOME "...".
    DISPLAY "Ho impiegato 47 righe di codice per elaborare".
    DISPLAY "il tuo nome. In Python bastava una riga.".
    DISPLAY "Ma io sono COBOL. Io non corro. Io DICHIARO.".
    DISPLAY " ".

    IF WS-LUNGHEZZA-NOME > 8
        DISPLAY "Il tuo nome e' lungo quanto una DIVISION."
        DISPLAY "Rispetto."
    ELSE
        DISPLAY "Nome corto, efficiente. Quasi non-COBOL."
    END-IF.

    DISPLAY " ".
    DISPLAY "La profezia e' compiuta. STOP RUN.".
    STOP RUN.
