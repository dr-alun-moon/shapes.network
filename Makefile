
all: library doc
doc: shapes.network.pdf
library: tikzlibraryshapes.network.code.tex

shapes.network.pdf: shapes.network.tex shapes.network.dtx tikzlibraryshapes.network.code.tex
	pdflatex -shell-escape shapes.network.tex

tikzlibraryshapes.network.code.tex: shapes.network.ins shapes.network.dtx
	tex shapes.network.ins

.PHONY: install clean really-clean
install: tikzlibraryshapes.network.code.tex
	install tikzlibraryshapes.network.code.tex ${HOME}/texmf/tex/
clean:
	rm -rf shapes.network.aux shapes.network.fdb_latexmk shapes.network.fls shapes.network.glo 
	rm -rf shapes.network.idx shapes.network.ilg shapes.network.ind shapes.network.log 
	rm -rf shapes.network.synctex.gz
really-clean: clean
	rm -rf tikzlibraryshapes.network.code.tex  shapes.network.pdf
