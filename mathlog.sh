#!/bin/bash

date_formatted=$(date +%Y%m%d)
pathname=/home/ds/Math/mathlog

function updateMaster {
    sect_name=$(date -d$date_formatted +%B\ %d,\ %Y) || exit 1
    sed -i "s/\%\%\%/\n\\\section{$sect_name}\n\\\input{$date_formatted.tex}\n\%\%\%/g" "$pathname/mathlog.tex"
    # to change: use absolute filepath. sed is begin finnicky however.
}

while getopts ":m:vd:c" opt; do
    case $opt in 
        d) date_formatted=$OPTARG ;;
        # set the date of your journal entry to a given date.
        v) evince ~/Math/mathlog/mathlog.pdf &
            exit 0 ;;
            # view the pdf
        m) if [ ! -e $pathname/$date_formatted'.tex' ]
        then
            updateMaster
        fi

        echo $OPTARG >> $pathname/$date_formated'.tex'
        exit 0 ;;
        # write a short journal entry without opening a text editor
        c) pdflatex -output-directory=$pathname mathlog.tex 
            exit 0 ;;
        # compiles
        \?)  echo "Invalid option -$OPTARG" >&2
            exit 1 ;;
    esac 
done 

if [ ! -e $pathname/$date_formatted'.tex' ]
then
    updateMaster
fi

vim $pathname/$date_formatted'.tex'
