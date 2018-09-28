# git notes

- git config
	```
	git config -l

	-l
	--list
	    List all variables set in config file, along with their values.
	```
- `git remote -v`
	- to see the current remote URL
- `git remote set-url origin git@bitbucket.org:tutorials/tutorials.git.bitbucket.org.git`
	- to set new url

## Set username and email
```sh
# Set
git config user.name "FIRST_NAME LAST_NAME"
git config user.email "MY_NAME@example.com"

# View
cat .git/config
#  or
git config --list
#  or
git config user.name
git config user.email
```

## View Remote config
```sh
git remote show origin
# or
git remote -v
```

## Adding an existing project to GitHub
> https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/


- Initialize the local directory as a Git repository.
	- `git init`

- Add the files in your new local repository. This stages them for the first commit.
	```sh
	git add .
	# Adds the files in the local repository and stages them for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.
	```

- Commit the files that you've staged in your local repository.
	```sh
	git commit -m "First commit"
	# Commits the tracked changes and prepares them to be pushed to a remote repository. To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.
	```

- Copy the 'remote repository URL' of your GitHub repository.
	- e.g. `sajidak@https://github.com/sajidak/notes.git`

- In Terminal, add the URL for the remote repository where your local repository will be pushed.
	```sh
	git remote add origin 'remote repository URL'
	git remote -v
	git remote show origin
	```

- Add Remote-tracking
	```sh
	git branch --set-upstream-to origin/master
	git branch -vv
	```

- Push the changes in your local repository to GitHub.
	```sh
	git push origin master
	# Pushes the changes in your local repository up to the remote repository you specified as the origin
	```


## Add branch section
```
--set-upstream-to=<upstream>

    Set up <branchname>'s tracking information so <upstream> is considered <branchname>'s upstream branch. If no <branchname> is specified, then it defaults to the current branch.

git branch (--set-upstream-to=<upstream> | -u <upstream>) [<branchname>]

```
- Sample, not yet tried
```sh
git branch --set-upstream-to origin/master
# or
git branch -u origin/master

# View branch details
git branch -vv


```

## Push to multiple repos
- see
	- https://howto.lintel.in/git-how-to-push-code-to-multiple-remotes-simultaneously/
```sh
git remote set-url --add --push origin git@github.com/muccg/my-project.git
git remote set-url --add --push origin git@bitbucket.org/ccgmurdoch/my-project.git

git remote set-url --add --push [remote] [original repo URL]
git remote set-url --add --push [remote] [second repo URL]
```
- https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes
```sh
# git remote add <shortname> <url>
git remote add pb https://github.com/paulboone/ticgit
```
