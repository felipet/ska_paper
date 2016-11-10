#######################################################
#       Makefile for compiling LaTeX projects         #
#                                                     #
# Author     : Felipe Torres González                 #
# Created on : 2015-05-04                             #
# Based on   : [ref1]                                 #
#######################################################

LATEX=pdflatex
LATEXMK=latexmk
LATEXOPT=xelatex

LATEX_SRC=paper_src
IMG_SRC=img

MAIN=$(LATEX_SRC)/ska_paper
SOURCES=$(MAIN).tex Makefile
FIGURES := $(shell ls $(IMG_SRC)/*)
OUT=build


all: $(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) -pdf $(MAIN).tex -outdir=$(OUT)

force:
	touch .refresh
	$(MAKE) $(MAIN).pdf

.PHONY: clean force all

clean:
	$(LATEXMK) -C $(MAIN).tex
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -rf $(OUT)







# [ref1]=http://blog.plesslweb.ch/post/6628144061/using-latexmk-and-make-for-building-latex
