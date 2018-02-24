---
title: Pandoc Working Notes
date: Sat, 24-Feb-2018 18:14:24.101 +0530
---

```sh
SRC_DIR="/path/to/folder";  # Note: no end `/`
/usr/bin/pandoc -f markdown -t html5 -N -p -s --self-contained --toc --toc-depth=3 -o Development-Guidelines.html --highlight-style=pygments ${SRC_DIR}/Development-Guidelines.md

```

# Pandoc Parameters
## Part 1
```
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
```
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

# variables
```
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
