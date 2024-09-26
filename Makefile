## Makefile for quarto-example

PRINT = @echo '==>  '

# TODO: automatically get these from _quarto.yml
OUTPUT := Quarto-Example
OUTDIR := _site
BIBLIO := bibs/mybib.bib

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=$(OUTDIR)/%.html)
BIB_TXT_FILES := $(sort $(wildcard bibs/*.txt))

.PHONY: all html project_html pdf bib clean realclean check check_pdf publish

all: project_html

## create html
html: $(HTML_FILES)
	$(PRINT) "make $@ done."

$(OUTDIR)/%.html: %.qmd _quarto.yml $(BIBLIO)
	quarto render $< --to html --no-clean --quiet
	$(PRINT) "make $@ done."

project_html: $(QMD_FILES) _quarto.yml $(BIBLIO)
	quarto render --to html
	$(PRINT) "make $@ done."


## create pdf
pdf: $(QMD_FILES) _quarto.yml $(BIBLIO)
	quarto render --to pdf --no-clean
	$(PRINT) "make $@ done."


## create bibs/mybib.bib from bibs/*.txt
bib: $(BIBLIO)

$(BIBLIO): $(BIB_TXT_FILES)
	@if [ -z "$(BIB_TXT_FILES)" ] ; \
	then \
		echo "==>   ERROR: No bibliography files found in bibs/." ; \
		exit 1 ; \
	else \
		python scripts/markdown2bib.py --out=$(BIBLIO) $(BIB_TXT_FILES) ; \
	fi
	$(PRINT) "make $@ done."


## clean up
JUNK = *.log index_files jupyter_files

clean:
	rm -rf $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
OUTS = $(OUTDIR) _freeze $(BIBLIO)

realclean: clean
	rm -rf $(OUTS)
	$(PRINT) "make $@ done."

## check that outputs exists for tests
check:
	@if [ ! -f $(OUTDIR)/index.html ]; then \
		echo "Error: index.html does not exist." ; \
		exit 1 ; \
	fi
	$(PRINT) "make $@ done."

check_pdf:
	@if [ ! -f $(OUTDIR)/$(OUTPUT).pdf ]; then \
		echo "Error: $(OUTPUT).pdf does not exist." ; \
		exit 1 ; \
	fi
	$(PRINT) "make $@ done."


### publish
#publish: html
#	quarto publish gh-pages --no-prompt --no-browser

