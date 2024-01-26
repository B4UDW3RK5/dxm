#!/bin/sh

# path to the data .csv file
DATA_FILE="/Users/cat/dxm.csv"

# if an integer is provided...
if [ "$#" -eq 1 ]; then
    # ...timestamp it...
    timestamp=$(date +%s)
    #calculate the mg
    dose=$(echo "$1 * 30" | bc)
    # ...and add it all to the end of the csv
    echo "$timestamp,$1,$dose" >> "$DATA_FILE"
# if no integer is provided...
else
    # ...return the last entry of the .csv...
    last_line=$(tail -n 1 "$DATA_FILE")
    # ...convert the epoch timestamp, quantity and dose to variables...
    IFS=, read -r timestamp count dose <<< "$last_line"
    # ...and print them
    echo "$timestamp,$count,$dose"
fi