# Bash Notes

**Contents**
<!-- MDTOC maxdepth:6 firsth1:1 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [Bash Notes](#bash-notes)
   - [Replace Text Inline](#replace-text-inline)
      - [sed](#sed)
      - [awk](#awk)
      - [perl](#perl)
      - [Examples](#examples)

<!-- /MDTOC -->

## Enhance privilages
Recent releases of Ubuntu use pkexec, since gksu has been deprecated
**pkexec** - Execute a command as another user
```sh
pkexec [--version] [--disable-internal-agent] [--help]
pkexec [--user username] PROGRAM [ARGUMENTS...]
```

## Replace Text Inline
### sed
`sed -i 's/original/new/g' file.txt`

**Explanation:**
`sed` = Stream EDitor
`-i` = in-place (i.e. save back to the original file)

**Command string**
`s` = the substitute command
`original` = a regular expression describing the word to replace (or just the word itself)
`new` = the text to replace it with
`g` = global (i.e. replace all and not just the first occurrence)

`file.txt` = the file name

### awk
`awk '{gsub(/pattern/,"replacement-text")}' file`

### perl
`perl -pe 's/blue/azure/' input.txt`


### Examples
`sed -i 's/repeat/_repeat_/g' /home/sak/.atom/packages/atom-mdtoc/lib/toc-view.coffee`
