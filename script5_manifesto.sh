#!/bin/bash
# Script 5 - Open Source Manifesto Generator
# Author: Vishwansh Singh | Reg No: 24BCE10900
# Course: Open Source Software | Slot: A24
# Asks you 3 questions and writes a short personal statement
# about open source based on your answers, saves it to a file

echo "========================================"
echo "  Open Source Manifesto Generator"
echo "========================================"
echo ""
echo "Answer 3 quick questions and I'll write"
echo "your personal open source statement."
echo ""

# read -p shows the question and waits for user to type something
read -p "1. One open-source tool you use every day: " TOOL
read -p "2. One word that 'freedom' means to you: " FREEDOM
read -p "3. One thing you'd build and share for free: " BUILD

# grabbing today's date for the file
TODAY=$(date '+%d %B %Y')

# output file named after the current user
OUTFILE="manifesto_$(whoami).txt"

# writing the header first, > creates/overwrites the file
echo "========================================" > "$OUTFILE"
echo "  MY OPEN SOURCE MANIFESTO"             >> "$OUTFILE"
echo "  Written on: $TODAY"                   >> "$OUTFILE"
echo "========================================" >> "$OUTFILE"
echo ""                                        >> "$OUTFILE"

# building the paragraph using the answers
# >> appends each line without overwriting what's already there
echo "I use $TOOL every single day without paying"       >> "$OUTFILE"
echo "for it. Someone built it, and then gave it away."  >> "$OUTFILE"
echo "That's not normal -- that's a choice. A choice"    >> "$OUTFILE"
echo "that says knowledge should belong to everyone."    >> "$OUTFILE"
echo ""                                                  >> "$OUTFILE"
echo "Freedom, to me, means $FREEDOM. And in software"  >> "$OUTFILE"
echo "that means being able to look inside the tools"    >> "$OUTFILE"
echo "I depend on -- not just use them blindly."         >> "$OUTFILE"
echo ""                                                  >> "$OUTFILE"
echo "Linus Torvalds just wanted a free OS for his PC."  >> "$OUTFILE"
echo "He shared it anyway. Now it runs the world."       >> "$OUTFILE"
echo "If I ever build $BUILD, I'll share it too."        >> "$OUTFILE"
echo "Because that's how I got everything I have."       >> "$OUTFILE"
echo ""                                                  >> "$OUTFILE"
echo "-- $(whoami), $TODAY"                              >> "$OUTFILE"
echo "========================================" >> "$OUTFILE"

echo ""
echo "Saved to: $OUTFILE"
echo ""

# alias concept: you could run this script faster with an alias like:
# alias manifesto='bash ~/script5_manifesto.sh'
# that's what aliases do - short names for longer commands

cat "$OUTFILE"
