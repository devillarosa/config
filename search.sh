#!/bin/bash
# V1.1

INFILE=false
SEARCHFOR=

for var in "$@"
do
    if [ $var == "-if" ] || [ $var == "--infile" ]; then
		INFILE=true	
    elif [ $var == "-h" ] || [ $var == "--help" ]; then
        echo "##############################################################################################################"
        echo "search.sh [-if,--infile] [-h,--help] searchTerm"
        echo ""
        echo "This script will search recursively from your current directory for filenames for 'searchTerm', ignoring case."
        echo ""
        echo "OPTIONAL PARAMETERS:"
        echo "[-if, --infile] - Instead of searching for filenames, search inside all files below this directory and list the files that contain searchTerm."
        echo "[-h,--help] - You will see this output."
        echo "##############################################################################################################"
        exit
    elif [ ${var:0:1} == "-" ]; then
        echo "### ERROR: Unknown param: $var"
        echo "### Use search.sh --help for parameters to use."
        exit
    else
		SEARCHFOR=$var
	fi
done



if [ $INFILE = "true" ]; then
	grep -Ril "$SEARCHFOR"
else
	find ./ -iname "*$SEARCHFOR*"
fi
