SOURCES = $(wildcard *.tex)
TARGETS = $(patsubst %.tex,%.svg,$(SOURCES))

all: $(TARGETS)

%.pdf: %.tex
	xelatex $<

%.svg: %.pdf
	pdf2svg $< $@

.PHONY: clean CLEAN
clean:
	latexmk -c

CLEAN: clean
	rm *.pdf &
	rm *.svg &
