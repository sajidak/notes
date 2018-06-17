# Github Statistics

`https://github.com/aapi-io/cloud-administration/graphs/contributors?from=2018-06-10&to=2018-06-16&type=c`

## Links
- https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History
- https://git-scm.com/docs/git-shortlog
- https://developer.github.com/v3/repos/statistics/
- https://coderwall.com/p/pek-yg/git-statistics-for-repo-per-author
- https://gist.github.com/eyecatchup/3fb7ef0c0cbdb72412fc
- https://stackoverflow.com/questions/1265040/how-to-count-total-lines-changed-by-a-specific-author-in-a-git-repository
- https://github.com/IonicaBizau/git-stats
- https://github.com/arzzen/git-quick-stats
- https://github.com/ActivityWatch/contributor-stats
-




## Samples
```sh
git log --shortstat --pretty="%cE" | sed 's/\(.*\)@.*/\1/' | grep -v "^$" | awk 'BEGIN { line=""; } !/^ / { if (line=="" || !match(line, $0)) {line = $0 "," line }} /^ / { print line " # " $0; line=""}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\1 0 insertions\(+\), \2/;s/\(\+\)$/\(\+\), 0 deletions\(-\)/;s/insertions?\(\+\), //;s/ deletions?\(-\)//' | awk 'BEGIN {name=""; files=0; insertions=0; deletions=0;} {if ($1 != name && name != "") { print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net"; files=0; insertions=0; deletions=0; name=$1; } name=$1; files+=$2; insertions+=$3; deletions+=$4} END {print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net";}'
```

`git shortlog -s -n`

```sh
$ git log --shortstat --author="Vorname Nachname" | grep -E "fil(e|es) changed" | awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -
```

```sh
git log --pretty=format:'' --numstat "$@" | awk 'NF' | awk '{insertions+=$1; deletions+=$2} END {print NR, "files changed,", insertions, "insertions(+),", deletions, "deletions(+)"}';
```

## Reference
### git-log

`git log [<options>] [<revision range>] [[\--] <path>…​]`

--no-decorate
--decorate[=short|full|auto|no]
--use-mailmap
--since=<date>
--after=<date>
    Show commits more recent than a specific date.
--no-merges
    Do not print commits with more than one parent. This is exactly the same as --max-parents=1.
--single-worktree
--pretty[=<format>]
--format=<format>
--name-only

    Show only names of changed files.
--name-status

    Show only names and status of changed files. See the description of the --diff-filter option on what the status letters mean.


## Trails
git log --no-merges --since 2018-06-10 --name-only
git log --no-merges --since 2018-05-24 --use-mailmap --name-status --decorate=short --pretty="%cE"
git log --no-merges --since 2018-05-24 --use-mailmap --name-status --decorate=short --pretty="%cE"


git log --no-merges --since 2018-05-26 --before 2018-05-29 --name-only
