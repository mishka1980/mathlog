#!/bin/bash

date_formatted=$(date +%Y%m%d)
sect_name=$(date +%B\ %d,\ %Y)
pathname=~/Math/mathlog/

function updateMaster {
    sed -i "s/\%\%\%/\n\\\section{$sect_name}\n\\\input{$date_formatted.tex}\n\%\%\%/g" '/home/ds/Math/mathlog.tex'
}


while getopts ":m:vd:" opt; do
    case $opt in 
        v) evince ~/Math/mathlog/mathlog.pdf &
            exit 0 ;;
        m) if [ ! -e $pathname$date_formatted".tex" ]
        then
            updateMaster
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
    updateMaster
fi

vim $pathname$date_formatted".tex"
