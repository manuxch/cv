# Uso:  make          -> compila las tres versiones en build/
#       make cv       -> sólo la completa (también: breve, eng)
#       make clean    -> borra build/
LATEXMK = latexmk

.PHONY: all cv breve eng clean

all: cv breve eng

cv:
	$(LATEXMK) MC-cv.tex
breve:
	$(LATEXMK) MC-cv-breve.tex
eng:
	$(LATEXMK) MC-cv-short-eng.tex

clean:
	$(LATEXMK) -C MC-cv.tex MC-cv-breve.tex MC-cv-short-eng.tex
	rm -rf build
