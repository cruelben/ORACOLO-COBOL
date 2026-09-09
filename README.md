# ORACOLO-COBOL

A tiny, tongue-in-cheek COBOL program that asks for your name and responds with sarcastic commentary on COBOL's legendary verbosity — written mostly to poke fun at the language's 1959 origins while still being 100% functional code.

## What it does

- Asks for your name
- Counts its characters (using the wonderfully old-school `INSPECT ... TALLYING`)
- Judges you based on the length of your name
- Reminds you, at every step, that this could've been one line of Python

## Requirements

- [GnuCOBOL](https://sourceforge.net/projects/gnucobol/) (or any COBOL-85 compatible compiler)

On Debian/Ubuntu/WSL:
```bash
sudo apt update
sudo apt install gnucobol4
```
(package name may be `open-cobol` or `gnucobol` on some distros)

## How to run it

1. Save the code as `ORACOLO-COBOL.cob`
2. Compile it:
   ```bash
   cobc -x ORACOLO-COBOL.cob -o oracolo
   ```
3. Run it:
   ```bash
   ./oracolo
   ```
   On Windows, this produces `oracolo.exe`, which you can run directly.

### No install? Try it online

Paste the code into [OnlineGDB's COBOL compiler](https://www.onlinegdb.com/online_cobol_compiler) and hit Run.

## Example output

```
==========================================
   ORACOLO-COBOL, VERSIONE 1959 (SPIRITO)
==========================================
Come ti chiami, mortale?
Bruno

Ah, Bruno...
Ho impiegato 47 righe di codice per elaborare
il tuo nome. In Python bastava una riga.
Ma io sono COBOL. Io non corro. Io DICHIARO.

Nome corto, efficiente. Quasi non-COBOL.

La profezia e' compiuta. STOP RUN.
```

## License

Do whatever you want with it. It's COBOL — it's already lived longer than most software ever will.
