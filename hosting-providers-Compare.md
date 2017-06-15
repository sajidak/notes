# $5 Packs
|  #  |   Provider   | Disk | DB  | Sites | VD  | SubDom | MSSQL DBs | MySQL DBs | Domain |   emails   |                              |
| --- | ------------ | ---- | --- | ----- | --- | ------ | --------- | --------- | ------ | ---------- | ---------------------------- |
| 2   | myasp.net    | *    | *   | 6     | y   | ?      | 6         | 6         | $10    | *          | *mdb, `URL Rewrite Module 2` |
| 3   | arvixe.com   | *    | *   | 1     | y   | *      | 5         | 5         | $10    | *          | *mdb                         |
| 4   | winhost.com  | 3G   | 1G  | ?     | ?   | *      | 1 /500M   | 1 /500m   | ?      | 250 / 500M | EF, ReportViewer             |
| 5   | host4asp.net | *    | *   | 6     | ?   | *      | 10GB /db  | *         | $13    | 30         | $6/1y $5/2y $4/3y            |


# $3 Packs
|  #  |   Provider   | Disk | DB  | Sites | VD  | SubDom | MSSQL DBs | MySQL DBs | Domain | emails |             |
| --- | ------------ | ---- | --- | ----- | --- | ------ | --------- | --------- | ------ | ------ | ----------- |
| 1   | myasp.net    | *    | *   | 1     | *   | *      | 1         | 1         | $10    | *      | *mdb        |
| 2   | host4asp.net | 10G  | ?   | 1     | ?   | *      | 10GB /db  | *         | $13    | 10     | $4/1y $3/2y |


## Notes:
- non-transactional MySQL 5.5 database
- URL Rewrite
	- https://docs.microsoft.com/en-us/iis/extensions/url-rewrite-module/using-global-and-distributed-rewrite-rules
	- `URL Rewrite Module 2`
	- HTTP Redirect
	- https://host4asp.net/top-iis-rewrite-rules/
		- Specific Subdomain Redirection
		- blog.mysite.com/someentry/ to mysite.com/blog/entry/
	- https://docs.microsoft.com/en-us/iis/extensions/url-rewrite-module/creating-rewrite-rules-for-the-url-rewrite-module
		- rewrite rules are stored either in the ApplicationHost.config file or in Web.config files
		```xml
		<rewrite>
		  <rules>
		    <rule name="Rewrite to article.aspx">
		      <match url="^article/([0-9]+)/([_0-9a-z-]+)" />
		      <action type="Rewrite" url="article.aspx?id={R:1}&amp;title={R:2}" />
		    </rule>
		  </rules>
		</rewrite>
		```
		- rewrite rule, redirect rule, access block rule
- URL Rewrite Module 2
	- https://www.iis.net/downloads/microsoft/url-rewrite
	- [Samples](http://download.microsoft.com/download/3/9/E/39E30671-7AD2-4902-B56B-C300D862595E/RewriteExtensibility.msi)
	-
