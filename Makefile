# Uso:  make          -> compila las tres versiones en build/
#       make cv       -> sólo la completa (también: breve, eng)
#       make publish  -> compila todo y deja los PDF públicos en pdf/
#       make clean    -> borra build/
LATEXMK = latexmk

.PHONY: all cv breve eng publish clean

all: cv breve eng

cv:
	$(LATEXMK) MC-cv.tex
breve:
	$(LATEXMK) MC-cv-breve.tex
eng:
	$(LATEXMK) MC-cv-short-eng.tex

# Compila todo y copia los PDF a pdf/ con los nombres públicos (los que sirve Pages).
# Esos tres archivos son los que se commitean y se publican.
publish: all
	mkdir -p pdf
	cp build/MC-cv.pdf           pdf/cv.pdf
	cp build/MC-cv-breve.pdf     pdf/cv-breve.pdf
	cp build/MC-cv-short-eng.pdf pdf/cv-short-en.pdf

clean:
	$(LATEXMK) -C MC-cv.tex MC-cv-breve.tex MC-cv-short-eng.tex
	rm -rf build
