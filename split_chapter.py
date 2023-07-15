import re

<img class="intro-right" src="/images/art-1689.png">

# Read the input file
input_file = "tmp.md"
with open(input_file, "r") as file:
    file_content = file.read()

<img class="intro-right" src="/images/art-1689.png">

# Split the content into chapters
chapter_regex = r"# Chapter ([0-9]+):"
chapters = re.split(chapter_regex, file_content)

<img class="intro-right" src="/images/art-1689.png">

# Remove leading and trailing whitespace from chapter titles
chapter_titles = [chapter.strip() for chapter in chapters[1::2]]

<img class="intro-right" src="/images/art-1689.png">

# Create separate files for each chapter
chapter_separator = "1689-"
for i, title in enumerate(chapter_titles):
    chapter_number = str(i + 1).zfill(2)
    chapter_content = chapters[(2 * i) + 2]

    # Generate the filename
    filename = f"{chapter_separator}{chapter_number}-0-index.md"

    # Write the chapter content to the file
    with open(filename, "w") as chapter_file:
        chapter_file.write(f"# {title}\n\n{chapter_content}")
