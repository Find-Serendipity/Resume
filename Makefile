SOURCES = $(wildcard *.tex)
PDFS = $(patsubst %.tex,%.pdf,${SOURCES})

.PHONY: all
all: ${PDFS}

%.pdf: %.tex
	@pdflatex -halt-on-error $<

.PHONY: clean
clean:
	@rm *.log *.aux *.out
