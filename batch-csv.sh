#!/bin/bash
## Differences between Windows and OS: 1. utf8 in Windows while UTF-8 in OS; 2.-o in Windows while > in OS
f=$(ls data | head -n1)
head -n1 data/$f | iconv -f GB2312 -t utf8 -o outputs/export.csv 
cp outputs/export.csv outputs/import.csv
for f in $(ls data | grep '^e'); do
tail -n +2 data/$f | iconv -f GB2312 -t utf8 >> outputs/export.csv;
done
for f in $(ls data | grep '^i'); do
tail -n +2 data/$f | iconv -f GB2312 -t utf8 >> outputs/import.csv;
done
head -n100 outputs/import.csv > sample.csv
