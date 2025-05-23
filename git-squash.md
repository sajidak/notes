
```sh
# Checkout the branch you want to merge into
git checkout main

# Make sure your branch is up-to-date
git pull origin main

# Squash merge the feature branch
git merge --no-commit --squash feature-xyz

# Commit the squashed changes
git commit -m "Squashed merge of feature-xyz into main"

# Push the result to repository
git push origin main

git branch -d feature-xyz             # delete local
git push origin --delete feature-xyz  # delete remote

***
To type multi line commit mesage in a text editor
git config --global core.editor "code --wait"

or 
git commit  -m "feat: Add user onboarding flow" \
            -m "This squashed commit includes all changes from feature-xyz:" \
            -m "- Added welcome screen" \
            -m "- Integrated auth API" \
            -m "- Handled edge case for password reset"

equivalent to
feat: Add user onboarding flow

This squashed commit includes all changes from feature-xyz:
- Added welcome screen
- Integrated auth API
- Handled edge case for password reset

```
***

- Using SurceTree
    - In SourceTree, double-click on main to check it out.
    - Fetch & pull the latest changes
    - Use the “Pull” button to make sure main is up-to-date.
    - Click Merge (top menu)
    - In the merge dialog, select your source branch (e.g., feature-xyz).
    - ✅ Check the option “Squash commits” before confirming.
    - Complete the merge
    - SourceTree will stage all changes as one.
    - It’ll prompt you to write a commit message — this is the single commit that represents all the work.
    - Push to Bitbucket
    - Click "Push" to send your squashed merge to the remote repo.

***
## Reference 
> abridged for readability
> To be formatted
> Further reading
> - https://git-scm.com/book/en/v2/Git-Tools-Advanced-Merging

https://git-scm.com/docs/git-merge
```
git merge [-n] [--stat] [--no-commit] [--squash] [--[no-]edit]
	[--no-verify] [-s <strategy>] [-X <strategy-option>] [-S[<keyid>]]
	[--[no-]allow-unrelated-histories]
	[--[no-]rerere-autoupdate] [-m <msg>] [-F <file>]
	[--into-name <branch>] [<commit>…​]
git merge (--continue | --abort | --quit)

into the current branch

--commit
--no-commit

    Perform the merge and commit the result. This option can be used to override --no-commit.

    With --no-commit perform the merge and stop just before creating a merge commit, to give the user a chance to inspect and further tweak the merge result before committing.

    Note that fast-forward updates do not create a merge commit and therefore there is no way to stop those merges with --no-commit. Thus, if you want to ensure your branch is not changed or updated by the merge command, use --no-ff with --no-commit.

--ff
--no-ff
--ff-only

    Specifies how a merge is handled when the merged-in history is already a descendant of the current history. --ff is the default unless merging an annotated (and possibly signed) tag that is not stored in its natural place in the refs/tags/ hierarchy, in which case --no-ff is assumed.

    With --ff, when possible resolve the merge as a fast-forward (only update the branch pointer to match the merged branch; do not create a merge commit). When not possible (when the merged-in history is not a descendant of the current history), create a merge commit.

    With --no-ff, create a merge commit in all cases, even when the merge could instead be resolved as a fast-forward.

    With --ff-only, resolve the merge as a fast-forward when possible. When not possible, refuse to merge and exit with a non-zero status.

--squash
--no-squash

    Produce the working tree and index state as if a real merge happened (except for the merge information), but do not actually make a commit, move the HEAD, or record $GIT_DIR/MERGE_HEAD (to cause the next git commit command to create a merge commit). This allows you to create a single commit on top of the current branch whose effect is the same as merging another branch (or more in case of an octopus).

    With --no-squash perform the merge and commit the result. This option can be used to override --squash.

    With --squash, --commit is not allowed, and will fail.

-v
--verbose

    Be verbose.
```
---
> To update branch before PR, merge changes done in target branch since diverge
> with feature branch current
```
git merge --verbose --ff-only --no-commit <branch-to-merge-from>
```

***
https://git-scm.com/docs/git-commit
```
git commit [-a | --interactive | --patch] [-s] [-v] [-u[<mode>]] [--amend] [--dry-run] [(-c | -C | --squash) <commit> | --fixup [(amend|reword):]<commit>] [-F <file> | -m <msg>] [--reset-author] [--allow-empty] [--allow-empty-message] [--no-verify] [-e] [--author=<author>] [--date=<date>] [--cleanup=<mode>] [--[no-]status] [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]] [(--trailer <token>[(=|:)<value>])…​] [-S[<keyid>]] [--] [<pathspec>…​]

-F <file>
--file=<file>

    Take the commit message from <file>. Use - to read the message from the standard input.

-m <msg>
--message=<msg>

    Use <msg> as the commit message. If multiple -m options are given, their values are concatenated as separate paragraphs.

    The -m option is mutually exclusive with -c, -C, and -F.

-e
--edit

    Let the user further edit the message taken from <file> with -F <file>, command line with -m <message>, and from <commit> with -C <commit>.

-v
--verbose

    Show unified diff between the HEAD commit and what would be committed at the bottom of the commit message template to help the user describe the commit by reminding what changes the commit has. Note that this diff output doesn’t have its lines prefixed with #. This diff will not be a part of the commit message. See the commit.verbose configuration variable in git-config[1].

    If specified twice, show in addition the unified diff between what would be committed and the worktree files, i.e. the unstaged changes to tracked files.

--dry-run

    Do not create a commit, but show a list of paths that are to be committed, paths with local changes that will be left uncommitted and paths that are untracked.
```
---
> Merge several commits into main branch as one commit
> with main branch as current
```
git merge --squash <feature-branch>
```

***




















