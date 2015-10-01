NAME=PorterDuff

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


.PHONY: all
all: html pdf


html: $(NAME).html

$(NAME).html: $(NAME).md

%.html: %.md
	pandoc $(HTMLOPTIONS) $< -o $@


pdf: $(NAME).pdf

$(NAME).pdf: $(NAME).md

%.pdf: %.md
	pandoc $(PDFOPTIONS) $< -o $@


.PHONY: clean
clean:
	@echo 'Cleaning...'
	-rm -rf $(NAME).html $(NAME).pdf

