#!/bin/sh

# path to the data .csv file
DATA_FILE="/Users/cat/dxm.csv"

# if an integer is provided...
if [ "$#" -eq 1 ]; then
    # ...timestamp it...
    timestamp=$(date +%s)
    # ...and add it to the end of the csv
    echo "$timestamp,$1" >> "$DATA_FILE"
# if no integer is provided...
else
    # ...return the last entry of the .csv...
    last_line=$(tail -n 1 "$DATA_FILE")
    # ...convert the timestamp and value to variables...
    IFS=, read -r timestamp value <<< "$last_line"
    # ...and print them
    echo "$value@$timestamp"
fi