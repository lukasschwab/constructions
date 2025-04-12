SOURCES = $(wildcard construction-*.tex)
TARGETS = $(patsubst %.tex,%.svg,$(SOURCES))

all: $(TARGETS)

%.pdf: %.tex preamble.tex
	xelatex $<

%.svg: %.pdf
	pdf2svg $< $@

.PHONY: clean CLEAN
clean:
	latexmk -c
