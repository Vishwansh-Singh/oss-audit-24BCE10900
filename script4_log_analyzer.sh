#!/bin/bash
# Script 4 - Log File Analyzer
# Author: Vishwansh Singh | Reg No: 24BCE10900
# Course: Open Source Software | Slot: A24
# Reads a log file line by line and counts how many times
# a keyword appears, then shows the last few matching lines
#
# Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]
# Example: ./script4_log_analyzer.sh /var/log/messages error

# $1 is the log file path passed when running the script
LOGFILE=$1

# $2 is the keyword, defaulting to "error" if not given
KEYWORD=${2:-"error"}

# this counter will track how many matches we find
COUNT=0

# making sure the user actually gave a file path
if [ -z "$LOGFILE" ]; then
    echo "Please provide a log file path."
    echo "Usage: $0 <logfile> [keyword]"
    exit 1
fi

# checking the file exists before trying to read it
if [ ! -f "$LOGFILE" ]; then
    echo "Error: $LOGFILE not found."
    exit 1
fi

# if the file is there but completely empty, no point continuing
if [ ! -s "$LOGFILE" ]; then
    echo "The file $LOGFILE is empty, nothing to search."
    exit 0
fi

echo "========================================"
echo "  Log File Analyzer"
echo "  File   : $LOGFILE"
echo "  Keyword: $KEYWORD"
echo "========================================"
echo ""

# reading the file line by line using while read
# IFS= and -r make sure spacing and backslashes are preserved correctly
while IFS= read -r LINE; do

    # checking each line for the keyword, -i makes it case insensitive
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # incrementing counter when match found
    fi

done < "$LOGFILE"

# printing the final count
echo "Keyword '$KEYWORD' was found $COUNT time(s) in $LOGFILE"
echo ""

# showing the last 5 lines that matched so you can see context
echo "Last 5 matching lines:"
echo "----------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5
echo "========================================"
