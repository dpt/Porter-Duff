# Makefile for Porter-Duff paper

# Dependencies:
# - pandoc
# - xelatex

# auto_identifiers	generate identifiers if none present in source (ON)
# citations		generate citations and bibliography (OFF)
# footnotes		generate footnotes (using [^1] syntax) (OFF)
# inline_notes		support inline footnotes^[like this] (OFF)
# raw_html		support raw HTML (OFF)
# simple_tables		support simpler table syntax (OFF)
# strikeout		support ~~strikeout~~ syntax (OFF)
# table_captions	support "Table: blah" after table turned into caption (OFF)
# tex_math_dollars	support $math$ (ON)
#
HTMLOPTIONS=-s --mathjax --from markdown+auto_identifiers+tex_math_dollars

# --variable mainfont=Baskerville
# --variable fontsize=12pt
PDFOPTIONS=-s --latex-engine=xelatex

#SOURCES := $(wildcard *.md)
SOURCES := Porter-Duff.md

OBJECTS := $(patsubst %.md, %.html, $(SOURCES)) \
	   $(patsubst %.md, %.pdf, $(SOURCES))

%.html: %.md
	pandoc $(HTMLOPTIONS) $< -o $@

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@

.PHONY: all
all: $(OBJECTS)

.PHONY: clean
clean:
	@echo 'Cleaning...'
	-rm -rf $(OBJECTS)

