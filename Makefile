# Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=%.html)

.PHONY: all html

all: html

html: $(HTML_FILES) index.html
	$(PRINT) "html done."

%.html: %.qmd
	quarto render $< --to html

JUNK = *.log
OUTS = *.html

clean:
	@rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
realclean: clean
	@rm -f $(OUTS)
	$(PRINT) "make $@ done."

