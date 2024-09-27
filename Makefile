## Makefile for quarto-example
##
##-----------------------------------------------------------------------------

SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c


##-----------------------------------------------------------------------------
## helpers and settings
##-----------------------------------------------------------------------------

PRINT = @echo '==>  '

# TODO: automatically get these from _quarto.yml
OUTPUT := Quarto-Example
OUTDIR := _site
BIBLIO := bibs/mybib.bib

#OUTPUT := $(shell grep '^output:'_quarto.yml | head -n1 | sed -e 's/output:[[:space:]]*//' | tr -d "'" | tr -d '"')

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=$(OUTDIR)/%.html)
BIB_TXT_FILES := $(sort $(wildcard bibs/*.txt))


##-----------------------------------------------------------------------------
## main targets
##-----------------------------------------------------------------------------

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


## create bibliography
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
		echo "Error: $(OUTDIR)/index.html does not exist." ; \
		exit 1 ; \
	fi
	$(PRINT) "Checked. $(OUTDIR)/index.html exists."
	$(PRINT) "make $@ done."

check_pdf:
	@if [ ! -f $(OUTDIR)/$(OUTPUT).pdf ]; then \
		echo "Error: $(OUTDIR)/$(OUTPUT).pdf does not exist." ; \
		exit 1 ; \
	fi
	$(PRINT) "Checked. $(OUTDIR)/$(OUTPUT).pdf exists."
	$(PRINT) "make $@ done."


### publish
#publish: html
#	quarto publish gh-pages --no-prompt --no-browser

