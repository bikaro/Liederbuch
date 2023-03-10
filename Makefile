SHELL=/bin/bash -O extglob -c

all:
	python collectsongs.py
	pdflatex -shell-escape Liederbuch.tex
	pdflatex -shell-escape Liederbuch.tex

view:
	xdg-open Liederbuch.pdf &

clean:
	rm -f *.aux
	rm -f *.idx
	rm -f *.log
	rm -f *.abc
	rm -f *.eps
	rm -f *.ps
	rm -f *.lof
	rm -f *.toc
	rm -f lieder/*.aux
	rm -f -- !(Liederbuch).pdf

quick:
	pdflatex -shell-escape Liederbuch.tex
