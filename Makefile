LATEX = latex -file-line-error -halt-on-error
DVIPS = dvips
PSPDF = ps2pdf
RM = rm -f

VPATH = regex_examples

TARGET = regex
SRC_EXAMPLES = $(wildcard src_examples/*)
REGEX_EXAMPLES = $(notdir $(wildcard regex_examples/*.regex))
REGEX_SRC = $(patsubst %.regex,%.tex,$(REGEX_EXAMPLES))
SRC = $(TARGET).tex \
	  cheatsheet.sty \
	  escape_regex.sed \
	  $(SRC_EXAMPLES) \
	  $(REGEX_SRC)

.PHONY: open zip gzip clean
.INTERMEDIATE: $(REGEX_SRC)

$(TARGET).pdf: $(TARGET).ps
	$(PSPDF) $<

$(TARGET).ps: $(TARGET).dvi
	$(DVIPS) $<

$(TARGET).dvi: $(SRC)
	$(LATEX) $<

$(REGEX_SRC): %.tex: %.regex
	sed -f escape_regex.sed $< > $@

open: $(TARGET).pdf
	open $<

zip: $(TARGET).pdf
	zip $(TARGET).pdf.zip $<

gzip: $(TARGET).pdf
	gzip -c $< > $(TARGET).pdf.gz

clean:
	$(RM) *.log *.out *.aux *.dvi *.ps *.pdf *.zip *.gz
