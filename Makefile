.PHONY: uplatex lualatex xelatex clean

# NOTE: ./.latexmkrc sets some setting for tex/bib tools
# -pvc : very cool option to enable continuous build
LATEXMK_OPT :=
TARGET := slide

lualatex: $(TARGET).tex refs.bib
	latexmk $(TARGET) -gg -pdflua $(LATEXMK_OPT)

updatex: $(TARGET).tex refs.bib
	latexmk $(TARGET) -gg -pdfdvi $(LATEXMK_OPT)

xelatex: $(TARGET).tex refs.bib
	latexmk $(TARGET) -gg -pdfxe $(LATEXMK_OPT)

clean:
	latexmk -C
	rm -fv $(TARGET).bbl $(TARGET).nav $(TARGET).snm $(TARGET).run.xml
