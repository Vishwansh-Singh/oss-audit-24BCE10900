#!/bin/bash
# Script 1 - System Identity Report
# Author: Vishwansh Singh | Reg No: 24BCE10900
# Course: Open Source Software | Slot: A24
# What this does: prints basic info about the system like a welcome screen
# I used this to understand how to pull live system data using variables

# storing my name and software choice as variables
STUDENT_NAME="Vishwansh Singh"
SOFTWARE="Linux Kernel"

# using command substitution to grab system info
# uname -r gives kernel version, whoami gives current user
KERNEL=$(uname -r)
USERNAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)

# date with a custom format so it looks readable
TODAY=$(date '+%d %B %Y, %H:%M:%S')

# getting distro name from os-release file
# had to use grep and cut to extract just the name part
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# the linux kernel is covered under GPL v2
LICENCE="GNU General Public License v2 (GPL v2)"

echo "========================================"
echo "  Open Source Audit -- $STUDENT_NAME"
echo "  Software Chosen : $SOFTWARE"
echo "========================================"
echo ""
echo "Distribution  : $DISTRO"
echo "Kernel Version: $KERNEL"
echo "Logged in as  : $USERNAME"
echo "Home Directory: $HOME_DIR"
echo "System Uptime : $UPTIME"
echo "Date and Time : $TODAY"
echo ""
echo "----------------------------------------"
echo "OS Licence: $LICENCE"
echo ""
echo "The Linux Kernel is free software. Anyone"
echo "can use, study, modify and share it freely"
echo "as long as they follow the GPL v2 terms."
echo "========================================"
