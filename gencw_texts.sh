#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <characters>"
    exit 1
fi

characters="$1"

for i in 00 01 02 03 04 05 06 07 08 09 10
do
    cat deutsch.txt | ./wordmix.pl "$characters" >cwwords_$i.txt
    cat cwwords_$i.txt | ebook2cw -p -w 14 -e 10 -f 800 \
	    -o cwwords_${i} -t "DH3IKO CW Wordmix $i"
done
