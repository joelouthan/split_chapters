#!/bin/bash

<img class="intro-right" src="/images/art-1689.png">

# Read the input file
input_file="tmp.md"
file_content=$(<"$input_file")

<img class="intro-right" src="/images/art-1689.png">

# Split the content into chapters
chapter_regex="# Chapter ([0-9]+):"
chapter_separator="1689-"

<img class="intro-right" src="/images/art-1689.png">

# Remove leading spaces and trailing newlines from the file content
file_content=$(echo "$file_content" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

<img class="intro-right" src="/images/art-1689.png">

# Split the content into chapters using the chapter regex
IFS=$'\n' read -rd '' -a chapters <<< "$(echo "$file_content" | awk -v regex="$chapter_regex" -v separator="$chapter_separator" 'BEGIN { chapter_num = "" } $0 ~ regex { chapter_num = sprintf("%02d", $2); print chapter_num } { print $0 }')"

<img class="intro-right" src="/images/art-1689.png">

# Create separate files for each chapter
current_chapter=""
current_file=""
for line in "${chapters[@]}"; do
    if [[ $line =~ ^[0-9]+ ]]; then
        chapter_num="${BASH_REMATCH[0]}"
        if [[ $chapter_num != $current_chapter ]]; then
            current_chapter=$chapter_num
            current_file="${chapter_separator}${chapter_num}-0-index.md"
            echo "# Chapter $chapter_num" > "$current_file"
        fi
    else
        echo "$line" >> "$current_file"
    fi
done
