#!/bin/bash
set -e
xelatex -interaction=nonstopmode main.tex
rm -f main.aux main.log