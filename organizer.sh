#!/bin/bash
# organizer.sh - organize files by extension
# WARNING: This script MOVES files. Run with backup.

SOURCE_DIR="$HOME/practice/downloads"

echo "=== File Organizer ==="
echo "Source: $SOURCE_DIR"
echo ""

# Gumawa ng target folders kung wala pa
mkdir -p "$SOURCE_DIR/Images"
mkdir -p "$SOURCE_DIR/Docs"
mkdir -p "$SOURCE_DIR/Videos"
mkdir -p "$SOURCE_DIR/Others"

for file in "$SOURCE_DIR"/*; do
    filename=$(basename "$file")
    
    # Skip 'yung folders mismo (para hindi i-move 'yung Images/ papasok sa sarili niya)
    if [[ -d "$file" ]]; then
        continue
    fi
    
    if [[ "$filename" == *.jpg || "$filename" == *.png || "$filename" == *.gif ]]; then
        target="Images"
    elif [[ "$filename" == *.pdf || "$filename" == *.docx || "$filename" == *.txt ]]; then
        target="Docs"
    elif [[ "$filename" == *.mp4 || "$filename" == *.mkv ]]; then
        target="Videos"
    else
        target="Others"
    fi
    
    echo "Moving: $filename  → $target/"
    mv -n "$file" "$SOURCE_DIR/$target/"
done

echo ""
echo "=== Done ==="