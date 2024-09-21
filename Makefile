# Makefile for quarto-example

PRINT = @echo '==>  '

QMD_FILES := $(wildcard *.qmd)
HTML_FILES := $(QMD_FILES:%.qmd=%.html)
HTML_FILES_DIRS := $(QMD_FILES:%.qmd=%_files)

.PHONY: all html

all: html

html: $(HTML_FILES)
	$(PRINT) "html done."

%.html: %.qmd
	quarto render $< --to html

JUNK = *.log
OUTS = $(HTML_FILES) $(HTML_FILES_DIRS)

clean:
	@rm -f $(JUNK)
	$(PRINT) "make $@ done."

## clean up everything including the output
realclean: clean
	@rm -rf $(OUTS)
	$(PRINT) "make $@ done."

