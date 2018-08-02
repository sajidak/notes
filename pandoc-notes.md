---
title: Pandoc Working Notes
date: Sat, 24-Feb-2018 18:14:24.101 +0530
---

```sh
SRC_DIR="/path/to/folder";  # Note: no end `/`
/usr/bin/pandoc -f markdown -t html5 -N -p -s --self-contained --toc --toc-depth=3 -o Development-Guidelines.html --highlight-style=pygments ${SRC_DIR}/Development-Guidelines.md
```

# Notes
- Convert ODT to PDF
	```sh
	soffice --headless --convert-to pdf libre-office-writer-ocument.odt
	```
- https://github.com/jgm/pandoc/wiki/Pandoc-Tricks
- http://www.bibtex.org/Format/
- http://rtalbert.org/how-i-wrote-my-book/
- http://textcite.sourceforge.net/index.html



# Pandoc Parameters
## Part 1
```txt {.numberLines}
--list-input-formats
--list-output-formats

--list-extensions
--list-highlight-languages
--list-highlight-styles
--file-scope
-M KEY[=VAL], --metadata=KEY[:VAL]

-s, --standalone
--template=FILE
--eol=crlf|lf|native
--toc, --table-of-contents
--toc-depth=NUMBER
--highlight-style=STYLE|FILE
--print-highlight-style=STYLE|FILE

--self-contained
--ascii
-N, --number-sections
--section-divs
-c URL, --css=URL
--reference-doc=FILE


pandoc -D *FORMAT*
```

## Part 2
```txt {.numberLines}
  -f FORMAT, -r FORMAT  --from=FORMAT, --read=FORMAT
  -t FORMAT, -w FORMAT  --to=FORMAT, --write=FORMAT
  -o FILENAME           --output=FILENAME
  -p                    --preserve-tabs
  -s                    --standalone
  -N                    --number-sections
                        --verbose

                        --toc, --table-of-contents
                        --toc-depth=NUMBER
                        --highlight-style=STYLE
                        --self-contained
  -c URL                --css=URL

                        --list-input-formats
                        --list-output-formats
                        --list-extensions
                        --list-highlight-languages
                        --list-highlight-styles
                            pygments
                            tango
                            espresso
                            zenburn
                            kate
                            monochrome
                            breezedark
                            haddock
```

## Part 3: Markdown extensions
`Extension: footnotes`
```txt {.numberLines}
- space_in_atx_header
- implicit_header_references
- backtick_code_blocks
	- `{#mycode .numberLines startFrom="100"}`
- fancy_lists
- example_lists
- table_captions
- pipe_tables
- pandoc_title_block
- yaml_metadata_block
- inline_code_attributes
- {.smallcaps} or [Small caps]
- footnotes

Markdown variants
- markdown_mmd (MultiMarkdown)
	- pipe_tables, raw_html, markdown_attribute, mmd_link_attributes, tex_math_double_backslash, intraword_underscores, mmd_title_block, footnotes, definition_lists, all_symbols_escapable, implicit_header_references, auto_identifiers, mmd_header_identifiers, shortcut_reference_links, implicit_figures, superscript, subscript, backtick_code_blocks, spaced_reference_links, raw_attribute.
- gfm (GitHub-Flavored Markdown)
	- pipe_tables, raw_html, fenced_code_blocks, auto_identifiers, ascii_identifiers, backtick_code_blocks, autolink_bare_uris, intraword_underscores, strikeout, hard_line_breaks, emoji, shortcut_reference_links, angle_brackets_escapable.
```

# variables
```txt {.numberLines}
title, author, date
toc
toc-title

<title>$title$</title>

pandoc_title_block
% title
% author(s) (separated by semicolons)
% date

---
title:  'This is the title: it contains a colon'
author:
- Author One
- Author Two
tags: [nothing, nothingness]
abstract: |
  This is the abstract.

  It consists of two paragraphs.
...

```

# Paramater oprions
## Output formats
> shortlisted by interest
- docx
- epub
- epub2
- epub3
- gfm
- html5
- json
- man
- markdown
- markdown_github
- markdown_mmd
- markdown_phpextra
- markdown_strict
- odt
- opendocument
- plain
- pptx
- revealjs
- rtf
- s5
- slideous
- slidy
- texinfo
- textile
