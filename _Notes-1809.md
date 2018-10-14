# Notes 2018 Sep 16

Sun, 07-Oct-2018 00:12:35.788 +0530

## Ubu8ntu Fonts
- fonts-liberation2
	- Fonts with the same metrics as Times, Arial and Courier (v2)
- fonts-liberation
	- Fonts with the same metrics as Times, Arial and Courier
- fonts-arkpandora
	- Replacement fonts for Microsoft's Arial, Times, and Verdana fonts
- fonts-urw-base35
	- font set metric-compatible with the 35 PostScript Level 2 Base Fonts
- fonts-gfs-artemisia
	- greek font (Times Greek-like)

Sun, 16-Sep-2018 21:57:02.360 +0530

## Mavenlink
- https://www.mavenlink.com/
- Mavenlink API documentation
	- http://developer.mavenlink.com/beta/
- Free personal account
	- https://app.mavenlink.com/signup/free

### API - Timesheet Submission
- http://developer.mavenlink.com/timesheet_submissions/
- Getting a Single TimesheetSubmission
- Creating a new TimesheetSubmission
- Resolutions
	- Approve
	- Reject
	- Cancel

### Possiblities
> Partial list, supporting CRUD ops
- Account Invitations
- Account Memberships -C
- Backup Approver Associations


## Convert String to Stream
- http://www.csharp411.com/c-convert-string-to-stream-and-stream-to-string/
	```cs
	byte[] byteArray = Encoding.ASCII.GetBytes( test );
	MemoryStream stream = new MemoryStream( byteArray );
	// and back
	StreamReader reader = new StreamReader( stream );
	string text = reader.ReadToEnd();
	```
- http://www.codedigest.com/CodeDigest/169-Convert-String-Variable-to-Stream-and-Stream-to-String-Variable-in-C-.aspx
	```cs
	string str = "ASP.Net is great!";
	byte[] bytes = Encoding.ASCII.GetBytes(str);
	MemoryStream stream = new MemoryStream(bytes);
	```

# CS - JSON to XML
```cs
XmlDocument doc = (XmlDocument)JsonConvert.DeserializeXmlNode(json);
// or
XNode node = JsonConvert.DeserializeXNode(json, "Root");
```
