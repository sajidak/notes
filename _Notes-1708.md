
# Sun 15-Oct-2017

[TOC]

## HTML to PDF Converters
* wkhtmltopdf
	* https://wkhtmltopdf.org
	* needs wrapper to set all appropiate defaults
* jsPDF
	* https://github.com/MrRio/jsPDF
	* Client-side JavaScript PDF generation for everyone.
* html-pdf
	* https://www.npmjs.com/package/html-pdf
	* needs a wrapper and npm to generate

## Markdown to HTML Converters
* Showdown
	* https://github.com/showdownjs/showdown
* markdown-js
	* https://github.com/evilstreak/markdown-js
	* limited functionality?
* marked
	* https://github.com/chjj/marked
	* A markdown parser and compiler. Built for speed.
* Strapdown.js
	* http://strapdownjs.com
	* Cross-browser compatible (tested with mobile Safari, IE 8/9, Firefox, Chrome)
	* Github-flavored Markdown (tables, syntax highlighting, etc)
	* Themeable

> look at phantom js usage


# Sat, 14-Oct-2017

## Markdown Parsers
- https://github.com/chjj/marked
	- https://www.npmjs.com/package/marked
	- A full-featured markdown parser and compiler, written in JavaScript. ..
- https://github.com/showdownjs/showdown
	- ShowdownJS is a free library
- strapdownjs.com
	- Create Markdown documents using JavaScript and Bootstrap themes. ...
- https://github.com/evilstreak/markdown-js
	- get
- https://github.com/iwasrobbed/Down
	- Blazing fast Markdown rendering in Swift, built upon cmark.
- https://github.com/atlassian/commonmark-java
	- Java implementation of CommonMark, a specification of the Markdown format .... Java library for parsing and rendering Markdown text according to the
- https://github.com/github/markup
- https://typora.io/#linux



# Fri, 29-Sep-2017

## Sessions in MVC5
- http://benjii.me/2015/07/using-sessions-and-httpcontext-in-aspnet5-and-mvc6/
- TempData
	- property of the ControllerBase class
	- ecommended to type-cast the value when TempData value is used for processing
	- The Life time of the TempData can be managed using the Keep() method

## Authentication
	- http://www.dotnetcurry.com/aspnet-mvc/957/aspnet-mvc-authentication-filters
	- https://docs.microsoft.com/en-us/aspnet/identity/overview/features-api/account-confirmation-and-password-recovery-with-aspnet-identity
	- * https://docs.microsoft.com/en-us/aspnet/identity/overview/extensibility/overview-of-custom-storage-providers-for-aspnet-identity
	- http://aspnet.codeplex.com/SourceControl/latest#Samples/MVC/BasicAuthentication/ReadMe.txt
	- http://aspnet.codeplex.com/SourceControl/latest#Samples/MVC/EnumSample/ReadMe.txt


## IIS Alternates
- Open up msconfig -> go to boot tab -> select Safe boot (Minimal) -> Apply -> Okay
- https://www.codeproject.com/Reference/1085768/List-of-Portable-ASP-NET-Server
- use asp.next and self host. This current only a RC candidate.
- http://docs.asp.net/en/latest/conceptual-overview/aspnet.html#servers


## Email clients for linux
### Nylas Mail
https://nylas.com/

### Evolution
and change the format of the Date column
https://wiki.gnome.org/Apps/Evolution

### KMail
KMail is best suited in KDE desktop environment.
https://www.kde.org/applications/internet/kmail/

### Geary
GNOME 3
```sh
sudo add-apt-repository ppa:geary-team/releases
sudo apt-get update
sudo apt-get install geary
```
No real development since March 2017.
https://wiki.gnome.org/Apps/Geary

### Pantheon Mail
Mail is an email client for elementary OS
https://launchpad.net/pantheon-mail

### Sylpheed
http://sylpheed.sraoss.jp/en/

### Claws
light weight, lower functionality
custom date format in the message list
http://www.claws-mail.org/

### Trojita Email Client
**looks good**
```sh
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/jkt-gentoo:/trojita/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/trojita.list"
wget http://download.opensuse.org/repositories/home:jkt-gentoo:trojita/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo apt update && sudo apt install trojita
```


# Wed, 13-Sep-2017
## Upwork
https://www.upwork.com/
Upwork is a great place to find more clients, and to run and grow your own freelance business.


# Mon, 14-Aug-2017
## Online tests - aptean
- www.indiabix.com  [General online tests]
- www.kent.ac.uk/careers/psychotests.htm
- www.testprep-online.com/criteria-ccat-sample-test
- samplewonderlictest.com

## Remote Access Software - Linux
- Vinagre
	- sudo apt-get install vinagre
- Remmina
	- **Install**
	```
	sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
	sudo apt-get update
	sudo apt-get install remmina remmina-plugin-rdp libfreerdp-plugins-standard
	```
	- **list plugins** `apt-cache search remmina-plugin`
	- **Close all running instances** `sudo killall remmina`

# Wed, 09-Aug-2017
## Images - Bulk renamer
### Advanced Renamer
- https://www.advancedrenamer.com/
- Windows only
### Bulk Rename Utility
- http://www.bulkrenameutility.co.uk/Main_Intro.php
- Windows
- Only selected files are processed
- http://www.bulkrenameutility.co.uk/Downloads/BRU_Manual.pdf
- http://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
### Advanced Renamer
- https://www.advancedrenamer.com/
- Windows
- https://www.advancedrenamer.com/user_guide/gettingstarted
### Fast File Renamer
- http://www.fastfilerenamer.com/
- Windows
- http://www.freebyte.net/download/fastfilerenamer.zip
- http://www.freebyte.net/download/ffr_manual.zip
### vRenamer
- https://vrenamer.com/
- Java
- https://sourceforge.net/projects/vrenamer/files/1.5.8/vRenamer_1.5.8.jar/download
- `/30-EXT/jre1.8.0_144/bin/java -jar /home/sak/Downloads/vRenamer_1.5.8.jar`



# Tue, 01-Aug-2017
## Citibank
Netbanking Number `1860 210 2484` or + `91 22 4955 2484`

- `0` for executive

- As you are unable to connect to our officers, I will help you with the interactive voice response flow accordingly you will be connected to our officers.
	- Once you are connected to our helpline,
		- Please choose the language of your choice
		- Post Choosing the language please press `*2` on your phone
		- Followed by `#`
		- After that please press `3`
	-  And then your call will be connected to 'Product Information Desk', one of officers will assist you.

## TODO
- [ ] Reset APIN (_Needs Mobile access_)
- [x] Request new checque book

## Statements
| card |     Due     |  Pay Txn Id  |
| ---- | -----------:| ------------ |
|      |             |              |
| 8440 | 1,09,203.23 | 901 008 0419 |
| 1818 |    2,420.05 |              |
|      |             |              |

2 09 914.88
1 00 711 65
