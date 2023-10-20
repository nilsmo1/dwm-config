#!/usr/bin/env bash

base='_latex_cmd_tmp_file_'
tex_output="$base.tex"
pdf_output="$base.pdf"
png_output="$base.png"

echo "\documentclass[border=2pt]{standalone}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{euler}
\usepackage{newpxtext}
\usepackage{mathpartir}
\usepackage{stmaryrd}
\usepackage{varwidth}
\begin{document}
\begin{varwidth}{\linewidth}
$@
\end{varwidth}
\end{document}" > $tex_output && pdflatex --halt-on-error $tex_output > /dev/null &&
convert -density 300 $pdf_output -quality 500 $png_output &&
xclip -selection clipboard -t image/png -i $png_output ||
echo "something went wrong!"
feh $png_output
rm -f $base.*
