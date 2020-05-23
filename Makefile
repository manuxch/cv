CV = MC-cv
CV-SRC = $(wildcard *.tex)
CV-BIB = $(wildcard *.bib)

TEXC := xelatex
TEXC_OPTS += -shell-escape

.PHONY: clean

run: $(CV).pdf

$(CV).pdf : $(CV).tex $(CV-SRC)
	$(TEXC) $(TEXC_OPTS) $(CV).tex -draftmode
	bibtex $(CV).aux
	$(TEXC) $(TEXC_OPTS) $(CV).tex 
	$(TEXC) $(TEXC_OPTS) $(CV).tex 

$(CV).aux : $(CV).aux $(CV-SRC) $(CV-BIB)
	$(TEXC) $(TEXC_OPTS) $(CV).tex -draftmode
	$(TEXC) $(TEXC_OPTS) $(CV).tex -draftmode

clean:
	@rm -f *.aux *log *nav *snm *toc *out *blg *bbl 

