# Bitbucket.org

## Comments:
- You are adding Class Diagrams by Lucidchart to the oblak Bitbucket account.
- You are adding Planio to the oblak Bitbucket account (need to signup)
- **embed md in web page**
	- http://strapdownjs.com/
	- https://zerodevx.github.io/zero-md/
	- https://daringfireball.net/projects/markdown/
	- https://github.com/markdown-it/markdown-it
	- https://github.com/chjj/marked/ `<script src="lib/marked.js"></script>`
	- https://github.com/isagalaev/highlight.js

## Wiki
- Wiki uses the [Markdown](http://daringfireball.net/projects/markdown/) syntax
- Syntax highlighting with [Pygments](http://pygments.org/) library
- is actually a git repository
- `$ git clone https://oblak@bitbucket.org/oblak/<repo-name>/wiki`

## Boards
Trello's board, lists and cards enable you to organize and prioritize your projects in a fun, flexible and rewarding way.

## Repository
**link to existing Local**
```sh
# Step 1: Switch to repository's directory
cd /path/to/your/repo
# Step 2: Connect existing repository to Bitbucket
git remote add origin https://oblak@bitbucket.org/oblak/<repo-name>.git
git push -u origin master
```

**Clone, to start from scratch**
```sh
git clone https://oblak@bitbucket.org/oblak/<repo-name>.git
cd <repo-name> echo "# My project's README" >> README.md
git add README.md
git commit -m "Initial commit" git
push -u origin master
```

## Pipelines
- Build, test and deploy with Pipelines
- Fast CI/CD in the cloud,
- quick and easy to get going


## Other
- https://trello.com/power-ups
- https://mockflow.com/apps/wireframepro/
- https://mockflow.com/apps/styleguide/
- https://info.trello.com/power-ups/corrello
- http://info.trello.com/power-ups/featuring (for module management)
- https://info.trello.com/power-ups/harvest
- https://info.trello.com/power-ups/includer
- https://info.trello.com/power-ups/jira
-

### Hipchat
- Bitbucket Server can send a notifications to a HipChat room for activities performed in a Bitbucket Server project or repository, and it works with HipChat Server or Cloud
- **Cloud** https://www.stride.com/
- **Self Hosted** https://www.atlassian.com/software/hipchat

## Confluence
- Create, organize, and discuss work with your team
- Spaces, Pages, Blogs, Files, Macros
- Collaboration


## Trello Boards
https://www.atlassian.com/software/trello
The visual way for teams to collaborate on any project
- **Jira + Trello**
- Track issue status company-wide
- Create from scratch or link existing Jira issues to Trello cards.
- See an attached Jira issue's status, priority, assignee, and more.
- **Bitbucket + Trello**
- Get perspective on your code
- Keep projects organized by attaching Bitbucket branches, commits, and pull requests to Trello cards.
- Get important info like status updates and code reviewers in Trello.
- **Confluence + Trello**
- Team it up
- Create new Confluence pages directly from Trello cards.
- See who created a page and when it was created.
- **Hipchat + Trello**
- Communicate seamlessly
- Make collaboration and organization an email-free process.
- Get Trello notifications by connecting your boards to Hipchat rooms.
