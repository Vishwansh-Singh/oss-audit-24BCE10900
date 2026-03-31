#!/bin/bash
# Script 3 - Disk and Permission Auditor
# Author: Vishwansh Singh | Reg No: 24BCE10900
# Course: Open Source Software | Slot: A24
# Goes through some important Linux directories and prints
# their size and who owns them / what permissions they have

# list of directories I want to check
# these are the main ones that matter on any Linux system
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot")

echo "========================================"
echo "  Directory Audit Report"
echo "========================================"
echo ""
printf "%-18s %-22s %s\n" "Directory" "Permissions/Owner" "Size"
echo "----------------------------------------"

# looping through each directory in the list
for DIR in "${DIRS[@]}"; do

    # first checking if the directory actually exists
    if [ -d "$DIR" ]; then
        # ls -ld gives the long listing for the directory itself
        # awk pulls out just the permissions, owner, and group (fields 1, 3, 4)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives size in human readable format
        # 2>/dev/null suppresses permission errors in places like /home
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        printf "%-18s %-22s %s\n" "$DIR" "$PERMS" "$SIZE"
    else
        echo "$DIR -- not found on this system"
    fi
done

echo ""
echo "----------------------------------------"
echo " Checking Linux Kernel module directory:"
echo "----------------------------------------"

# uname -r gives the running kernel version
# using that to build the path to the modules folder
KVER=$(uname -r)
KMOD_DIR="/lib/modules/$KVER"

if [ -d "$KMOD_DIR" ]; then
    KPERMS=$(ls -ld "$KMOD_DIR" | awk '{print $1, $3, $4}')
    KSIZE=$(du -sh "$KMOD_DIR" 2>/dev/null | cut -f1)
    echo "Path        : $KMOD_DIR"
    echo "Permissions : $KPERMS"
    echo "Size        : $KSIZE"
else
    echo "Module directory not found for kernel $KVER"
fi

echo "========================================"
