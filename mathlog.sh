#!/bin/bash

date_formatted=$(date +%Y%m%d)
pathname=~/Math/mathlog/

while getopts ":m:vd:" opt; do
    case $opt in 
        v) evince ~/Math/mathlog/mathlog.pdf &
            exit 0 ;;
        m) if [ ! -e $pathname$date_formatted".tex" ]
        then
            # append \input whatever to mathlog.tex
        fi

        echo $OPTARG >> $pathname$date_formated".tex"
        exit 0 ;;
        d) date_formatted=$OPTARG ;;
        \?)  echo "Invalid option -$OPTARG" >&2
            exit 1 ;;
    esac 
done 

if [ ! -e $pathname$date_formatted".tex" ]
then
    # append \input whatever to mathlog.tex
fi

vim $pathname$date_formatted".tex"
