#!/usr/bin/env bash

base='_latex_cmd_tmp_file_'
input_file=$base'input_.tex'
tex_output="$base.tex"
pdf_output="$base.pdf"
png_output="$base.png"

[ "$#" -lt 1 ] && exit 1

case $1 in
    '-i') nvim $input_file && input=$(cat $input_file) || exit 1 ;;
      * ) input=$@ ;;
esac
rm -f $input_file

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
$input
\end{varwidth}
\end{document}" > $tex_output && pdflatex --halt-on-error $tex_output > /dev/null &&
convert -density 600 $pdf_output -quality 600 $png_output &&
xclip -selection clipboard -t image/png -i $png_output ||
echo "something went wrong!"
if test -f $png_output; then
    feh $png_output
fi
rm -f $base.*
