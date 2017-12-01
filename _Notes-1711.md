
# 14 Nov 2017

- https://stackify.com/net-core-2-0-changes/
- https://blogs.msdn.microsoft.com/webdev/2017/08/14/announcing-asp-net-core-2-0/

## Custom MVC Identity
- MVC 6
	- http://www.dotnetcurry.com/aspnet-mvc/1229/user-authentication-aspnet-mvc-6-identity
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity-custom-storage-providers
	- https://leastprivilege.com/2015/07/21/the-state-of-security-in-asp-net-5-and-mvc-6-claims-authentication/
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/identity?tabs=visual-studio%2Caspnetcore2x
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/accconfirm?tabs=aspnetcore2x%2Csql-server#prevent-login-at-registration
	- https://docs.microsoft.com/en-us/aspnet/core/security/enforcing-ssl
	- https://docs.microsoft.com/en-us/aspnet/core/security/authentication/2fa
	- https://identityserver4.readthedocs.io/en/release/
- MVC 5
	- http://logcorner.com/customize-aspnet-identity-external-database-storage/
	- http://logcorner.com/how-to-customize-asp-net-identity-roles-with-external-database-storage-step-by-step/
		- (Appears to be duplicate)

## Web API Clients
- https://www.httpmaster.net/compare - httpmaster_exp_3.9.2.msi
- https://www.getpostman.com/
	- https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en
	- Postman-win64-5.3.2-Setup.exe
	- Postman-linux-x64-5.3.2.tar.gz
- https://www.soapui.org/
	- SoapUI-5.3.0-windows-bin.zip, no java
	- SoapUI-5.3.0-win32-standalone-bin.zip, with java
	- https://b537910400b7ceac4df0-22e92613740a7dd1247910134033c0d1.ssl.cf5.rackcdn.com/soapui/5.3.0/SoapUI-5.3.0-windows-bin.zip
- https://github.com/restsharp/RestSharp
	- easy to use Assemblies for .NET 4.5.2 and .NET Standard 2.0
- http://unirest.io/net.html
	- looks interesting

## Joeffice
http://www.joeffice.com/
http://www.joeffice.com/joeffice.sh
- Open Source Java-based office suite
- works with Microsoft document formats (docx, xslx, pptx)
- currently under heavy development and an alpha version will be available within a few days
[joeffice.sh](/media/sak/70_Current/Downloads/New/joeffice.sh)


# 08 Nov 2017

## VPUML Connection
- Driver: [jtds-1.3.3.jar](http://jtds.sourceforge.net/)
- Hostname: localhost
- Port Number: 48229

- For Port Number, Open **SQL Server Configuration Manager**
	- Navigate Tree to, **SQL Server Network Configuration** > **Protocols for (Server-Instance-Name)**
	- In Right Pane, Select **TCP/IP** and open **Properties**
	- In TCP/IP Properties
		- Select **IP Addresses** pane
		- Scroll to **IPAll** section (At bottom)
		- Copy value of feild **TCP Dynamic Ports** (Default: 48229)
	- Default port 1433 will NOT work
	- Port Number must be allowed incoming connections in **Firewall**
		- **TODO:** Turn off firewall rule and verify

## JDBC Drivers
| Database   | URL                                                            |
| ---------- | -------------------------------------------------------------- |
| SQL Server | http://jtds.sourceforge.net/                                   |
| SQL Server | https://www.microsoft.com/en-in/download/details.aspx?id=11774 |
| MySQL      | http://dev.mysql.com/downloads/                                |
| PostgreSQL | http://jdbc.postgresql.org/download.html                       |
| SQLite     | http://www.xerial.org/trac/Xerial/wiki/SQLiteJDBC              |


## Markdown Syntax
I get 10 times more traffic from [Google] [1] than from
[Yahoo] [2] or [MSN] [3].

  [1]: http://google.com/        "Google"
  [2]: http://search.yahoo.com/  "Yahoo Search"
  [3]: http://search.msn.com/    "MSN Search"

### Cross-references (MultiMarkdown)
https://bywordapp.com/markdown/guide.html

Clicking [here][section-preview] will lead you to the **Preview** section.

### Footnotes
https://rephrase.net/box/word/footnotes/syntax/

Footnotes[^1] are added in-text like so:

`Footnotes[^1] are added in-text like so ...`

And with a matching footnote definition at the end of the document:

```
[^1]:
Footnotes are the mind killer.
Footnotes are the little-death that brings total obliteration.
I will face my footnotes.
```
Note the caret/circumflex/hat ("^"). As with reference-style links, the line-break after the colon is optional.

**Footnote Contents**
As with list items, any subsequent paragraphs inside a note should be indented[^2].

#### Inline Footnotes
`I met Jim [^jim](My old college roommate) at the station.`

I met Jim [^jim](My old college roommate) at the station.

Inline notes will work even without the identifier:
`I met Jim [^](My old college roommate) at the station.`

# 09 Nov 2017
> From `Novelty-Data/VVC/Docs-MD/_Notes.md`

## Clean generated files
Run the following command from the folder, will not work recusrively
`rm -v *.pdf *.html`

**Remove files or directories**
```bash
rm [OPTION]... [FILE]...

OPTIONS
       -r, -R, --recursive
              remove directories and their contents recursively
       -d, --dir
              remove empty directories
       -v, --verbose
              explain what is being done
       --help display this help and exit
       --version
              output version information and exit
```

## Javascript date formatting
- https://date-fns.org/
