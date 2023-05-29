#!/bin/sh

set -eu

CONVERT_OPTIONS="-strip -resize 800x"

build() {
    echo "Optimizing images..."
    n=1
    for i in input/*;
    do
        echo "$i -> output/$n.jpg"
        convert $i $CONVERT_OPTIONS output/$n.jpg
        n=$((n+1))
    done

    echo "Building..."
    pdflatex main.tex
}

clean() {
    rm -v output/*.jpg main.aux main.log main.pdf
}

[ "$#" = 0 ] && build && exit
[ "$1" = "clean" ] && clean && exit
[ "$1" = "all" ] && clean && build && exit
