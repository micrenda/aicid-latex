PACKAGE = aicid
VERSION = 0.0.4
DISTDIR = dist
WORKDIR = $(DISTDIR)/$(PACKAGE)
ZIP = $(DISTDIR)/$(PACKAGE)-$(VERSION).zip

CTAN_FILES = \
	README.md \
	LICENSE \
	aicid.sty \
	aicid.tex \
	aicid.pdf \
	aicid-logo.pdf \
	example.tex

.PHONY: all doc example ctan clean

all: doc example

doc: aicid.pdf

example: example.pdf

aicid.pdf: aicid.tex aicid.sty aicid-logo.pdf
	pdflatex -interaction=nonstopmode -file-line-error aicid.tex
	pdflatex -interaction=nonstopmode -file-line-error aicid.tex

example.pdf: example.tex aicid.sty aicid-logo.pdf
	pdflatex -interaction=nonstopmode -file-line-error example.tex

ctan: aicid.pdf
	rm -rf $(WORKDIR) $(ZIP)
	mkdir -p $(WORKDIR)/logo-source
	cp $(CTAN_FILES) $(WORKDIR)/
	cp logo-source/aicid-logo.svg $(WORKDIR)/logo-source/
	cd $(DISTDIR) && zip -qr $(PACKAGE)-$(VERSION).zip $(PACKAGE)

clean:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.synctex.gz example.pdf
	rm -rf $(DISTDIR)
