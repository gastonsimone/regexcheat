LATEX = latex -file-line-error -halt-on-error
DVIPS = dvips
PSPDF = ps2pdf
RM = rm -f

VPATH = regex_examples:src_examples

TARGET = regex
EXAMPLES = example_perl.tex \
		   example_java.tex \
		   example_dnet.tex \
		   example_python.tex
REGEX_EXAMPLES = $(notdir $(wildcard regex_examples/*.regex))
REGEX_SRC = $(patsubst %.regex,%.tex,$(REGEX_EXAMPLES))
SRC = $(TARGET).tex \
	  cheatsheet.sty \
	  escape_regex.sed \
	  $(EXAMPLES) \
	  $(REGEX_SRC)

.PHONY: open zip gzip clean

$(TARGET).pdf: $(TARGET).ps
	$(PSPDF) $<

$(TARGET).ps: $(TARGET).dvi
	$(DVIPS) $<

$(TARGET).dvi: $(SRC)
	$(LATEX) $<

$(REGEX_SRC): %.tex: %.regex
	sed -f escape_regex.sed $< > $@

example_java.tex: example.java
	source-highlight -t4 -f latexcolor -i $< -o $@

example_perl.tex: finddbl.pl
	source-highlight -t4 -s perl -f latexcolor -i $< -o $@

example_dnet.tex: example.cs
	source-highlight -t4 -f latexcolor -i $< -o $@

example_python.tex: example.py
	source-highlight -t4 -f latexcolor -i $< -o $@

open: $(TARGET).pdf
	open $<

zip: $(TARGET).pdf
	zip $(TARGET).pdf.zip $<

gzip: $(TARGET).pdf
	gzip -c $< > $(TARGET).pdf.gz

clean:
	$(RM) *.log *.out *.aux *.dvi *.ps *.pdf *.zip *.gz $(EXAMPLES) $(REGEX_SRC)
