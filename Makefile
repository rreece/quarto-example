## Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=docs/%.html)
BIB_TXT_FILES := $(sort $(wildcard bibs/*.txt))

.PHONY: all html project_html pdf publish clean realclean

all: project_html

## create html
#html: $(HTML_FILES)
html: project_html

docs/%.html: %.qmd _quarto.yml bibs/mybib.bib
	quarto render $< --to html --no-clean --quiet
	$(PRINT) "make $@ done."


project_html: $(QMD_FILES) _quarto.yml bibs/mybib.bib
	quarto render --to html
	$(PRINT) "make $@ done."


## create pdf
pdf: $(QMD_FILES) _quarto.yml bibs/mybib.bib
	quarto render --to pdf --no-clean
	$(PRINT) "make $@ done."


## create bibs/mybib.bib from bibs/*.txt
bibs/mybib.bib: $(BIB_TXT_FILES)
	@if [ -z "$(BIB_TXT_FILES)" ] ; \
	then \
		echo "==>   ERROR: No bibliography files found in bibs/." ; \
		exit 1 ; \
	else \
		python scripts/markdown2bib.py --out=bibs/mybib.bib $(BIB_TXT_FILES) ; \
	fi
	$(PRINT) "make $@ done."


## publish
publish: html
	quarto publish gh-pages --no-prompt --no-browser


## clean up
JUNK = *.log

clean:
	rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
OUTS = docs _freeze bibs/mybib.bib jupyter_files

realclean: clean
	rm -rf $(OUTS)
	$(PRINT) "make $@ done."

