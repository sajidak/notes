# Notes 2018 Sep 16

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
