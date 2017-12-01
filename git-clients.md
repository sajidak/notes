# Git Clients
https://git-scm.com/
> On review done, arrange in personal preference order
Only clients for Windows and Linux are looked at

## Notes
> Move to seperate file, at earliset convenience
|                       |                                   |
| --------------------- | --------------------------------- |
| The HEAD              | last commit snapshot, next parent |
| The Index             | proposed next commit snapshot     |
| The Working Directory | sandbox                           |

`reset` command
1. Move whatever branch HEAD points to (stop if --soft)
2. THEN, make the Index look like that (stop here unless --hard)
3. THEN, make the Working Directory look like that
4. Also see _Reset with a Path_

|                            | head | index | work dir | wd safe |
| -------------------------- | ---- | ----- | -------- | ------- |
| **Commit Level**           |      |       |          |         |
| reset --soft `[commit]`    | REF  | NO    | NO       | YES     |
| reset `[commit]`           | REF  | YES   | NO       | YES     |
| reset --hard `[commit]`    | REF  | YES   | YES      | NO      |
| checkout `[commit]`        | HEAD | YES   | YES      | YES     |
| **File Level**             |      |       |          |         |
| reset (commit) `[file]`    | NO   | YES   | NO       | YES     |
| checkout (commit) `[file]` | NO   | YES   | YES      | NO      |

## Aurees
https://aurees.com/
- merge with preview
- only exe availaible for download

## Git Cola
https://git-cola.github.io/
- Python (v2 + v3)
- git-dag a Git history visualizer
- Stage sections of file

## gitg
https://wiki.gnome.org/Apps/Gitg
- Gnome GUI client for viewing Git repositories
- msi for windows, package for linux
- Overview of recently used repositories
- Comprehensive repository history
- Staging area to compose yur commit
- Open or Clone Repository
- User Information
- last updated `2016-04-05`

## GitForce
https://sites.google.com/site/gitforcetool/
- C# and .NET 3.5 framework
- Linux with mono
- for diff needs meld, Diffuse, Xxdiff, TKDiff or KDiff3

## GitHub Desktop
https://desktop.github.com/
- only msi availaible for download, see linux instructions
- Simple and easy to use for basic operations
- https://gist.github.com/derhuerst/1b15ff4652a867391f03#file-linux-md
-

## Git GUI
https://www.kernel.org/pub/software/scm/git/docs/git-gui.html
- Tcl/Tk based GUI front-end for Git
- mainly focuses on commit generation by enabling users to make changes to their repository by generating new commits, amending existing ones, building branches
- perform local merges, and fetch/push to remote repositories


## GitEye
https://www.collab.net/products/giteye
- simple and intuitive GUI client
- bitbucket linking needs commandline

## CodeReview
http://fabricesalvaire.github.io/CodeReview/
- Python 3.4 and Qt5
- CodeReview provides to executable pyqgit and diff-viewer
- CodeReview features:
	- display and browse the log and paches of a Git repository
	- diff side by side using Patience algorithm
	- watch for file system changes
- Diff viewer features:
	- stage/unstage file
	- number of context lines
	- font size
	- line number mode
	- align mode
	- complete mode
	- highlight mode

## Git Extensions
http://gitextensions.github.io/
- Git Extensions is the only graphical user interface for Git that allows you control Git without using the command line.
- Git Extensions runs on multiple platforms using Mono
- Windows Explorer integration for Git
- Visual Studio (2010/2012/2013/2015) plugin for Git
- Feature rich user interface for Git
- Single installer installs Git for Windows, GitExtensions and the mergetool KDiff3
	- 60.6 MB GitExtensions-2.50.02-SetupComplete.msi
	- 14.9 MB GitExtensions-2.50.02-Setup.msi

## Git WebUI
https://github.com/alberthier/git-webui


## GITK (Generalized Interface Toolkit)
http://gitk.sourceforge.net/

## Gitter Desktop Client
https://gitlab.com/gitlab-org/gitter/desktop/
- build easy on linux
- build for win, with additional setup
- node.js and npm3+ based

## Gitkraken
https://www.gitkraken.com/
- msi for windows, deb for linux
- free for non-commercial use
-

***
## Other
### Diffuse
http://diffuse.sourceforge.net/about.html
- graphical tool for merging and comparing text files
- ability to compare and merge an arbitrary number of files side-by-side (n-way merges)
- line matching can be manually corrected by the user
- ability to directly edit files
- syntax highlighting
- Bazaar, CVS, Darcs, Git, Mercurial, Monotone, RCS, Subversion, and SVK support
- support for UTF-8 encoded unicode
- unlimited undo
- easy keyboard navigation
- Needs Python >= 2.4 and PyGTK >= 2.10
