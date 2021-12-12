all:
	python collectsongs.py
	pdflatex Liederbuch.tex
	makeindex Liederbuch.idx -s indexstyle.ist
	pdflatex Liederbuch.tex

view:
	xdg-open Liederbuch.pdf &

clean:
	rm *.aux
	rm *.ind
	rm *.idx
	rm *.ilg
	rm *.log
	rm *.out
	rm *.pdf
	rm *.*~

quick:
	pdflatex Liederbuch.tex
