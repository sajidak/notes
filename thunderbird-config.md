# Thunderbird Config
`Thu, 21-Sep-2017 12:09:12 +0530`
> Required for each Profile

**Contents:**
<!-- MDTOC maxdepth:6 firsth1:0 numbering:0 flatten:0 bullets:1 updateOnSave:1 -->

- [Working Notes](#working-notes)
- [Inbox Columns](#inbox-columns)
- [General](#general)
- [Extensions](#extensions)
   - [CardBook](#cardbook)
   - [SmartTemplate4](#smarttemplate4)
   - [Stationery](#stationery)
- [Broken Extensions](#broken-extensions)
   - [Super Date Format](#super-date-format)
   - [Profile Buttons](#profile-buttons)
- [Extensions - Other](#extensions-other)
- [Custom Templates](#custom-templates)
   - [SmartTemplate4 - Reply Quote header](#smarttemplate4-reply-quote-header)
   - [SmartTemplate4 - Forward Quote Header](#smarttemplate4-forward-quote-header)
   - [Stationery - Default Template](#stationery-default-template)
- [Notes:](#notes)
   - [Zoho mail configuration](#zoho-mail-configuration)

<!-- /MDTOC -->
***

## Working Notes
- **Default Charset** `ISO-8859-1`
- `cat /70_Current/Mailbox/profiles.ini > ~/.thunderbird/profiles.ini`

***
## Inbox Columns
- Threads
- Attachments
- From
- Subject
- Date

***
## General
- Extension Preferences stored in `~/.thunderbird/c1fvpy7s.default/prefs.js`
	- try copy into new profile, see if settings replicated
- `Menu` > `Preferences` > `Account Settings`
	- [x] `Attach the signature from a file instead (text, HTML, or image):`
	```html
	Regards,
	<br>FIRST-NAME.
	<br>
	<br>
	<div class="mail-sig">
	<b>FIRST MIDDLE SURNAME</b>
	<br>DESIGNATION
	<br>+91 0000 1111 00
	</div>
	```

***
## Extensions
### CardBook
- Disable `Unique source for contacts`

### SmartTemplate4
- `Write`, `Reply` & `Forward`
    - [x] `Use instead of default quote header`
    - [x] `use HTML (e.g. <b>bold</b>)`
- `Write`, `Reply` & `Forward` > `Replace line breaks with <br>`
	- First `checked`, restart and then `unchecked`
	- (Uncheck after a restart, if untouched is treated as checked)
- `Global Settings` > `Advanced Functions` > `Support Stationery addon` = *checked*
- `Advanced` > `Global Settings`
	- [x] `Process Signature`
	- [x] `Replace line breaks in plain text signature with <br>`
	- [x] `Support Stationery addons`
	- [x] `Insert Space to highlight %cursor%`
	- [x] `Display button in status bar`
	- [ ] Others keep unchecked
- **See**
	- In Advanced Settings, `Remove email address unless .......`

### Stationery
- Needed for global template
- `Options` > `Number of rows in Addressing Widget`
	- `<default>`

***
## Broken Extensions
### Super Date Format
- `%d-%b-%y %H:%M`
- not compatible with current version
### Profile Buttons
- Useful for current usage
- not compatible with current version, after v42.0
- try 'ProfileSwitcher' (also broken)

***
## Extensions - Other
- **Theme Font & Size Changer**
	- Optional, to customize appearance

- **ImportExportTools**
	- Optional, useful for exporting mails to offline accounts

- **Manually sort folders**
	- not much used, optional

- **Profile Folder Button**
	- Opens the profile folder, in default application

- **Cardbook**
	- Need to understand

- **Contact Tabs**
	- works only with Thunderbird address books
	- supports all fields of Thunderbird's default address book as well as those added gContactSync when viewing a contact

***
## Custom Templates
### SmartTemplate4 - Reply Quote header
```html
<hr><b>From:</b> %from% &lt;%from(mail)%&gt;
<br><b>Sent:</b> %X:=sent% %A%, %d% %B%, %Y% %H%:%M% %date_tz% (%tz_name(1)%)
[[<br><b>To:</b> %to(name,bracketMail(angle))%]][[<br><b>Cc:</b> %cc(name,bracketMail(angle))%]]
<br><b>Subject:</b> %subject%
<br>
```

### SmartTemplate4 - Forward Quote Header
```html
<hr><b>From:</b> %from% &lt;%from(mail)%&gt;
<br><b>Sent:</b> %X:=sent% %A%, %d% %B%, %Y% %H%:%M% %date_tz% (%tz_name(1)%)
[[<br><b>To:</b> %to(name,bracketMail(angle))%]][[<br><b>Cc:</b> %cc(name,bracketMail(angle))%]]
<br><b>Subject:</b> %subject%
```

### Stationery - Default Template
```html
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
  <!-- <meta http-equiv="Content-type" content="text/html;charset=UTF-8"> -->
  <style>
    * {
      font-family: Calibri, Carlito, Arial, "Lucida Sans Unicode", sans-serif;
      font-size: 12pt;
    }
    .mail-sig{
      /* top | right | bottom | left */
      margin: 0rem 0rem 0rem 0.5rem;
      padding: 0.5rem;
      border: 1px solid #aaa;
      border-left: 3px solid #f61515;
      background-color: rgba(240, 240, 255, 0.9);
      display: block;
    }
    blockquote.cite[type=cite]{
      margin: 0px !Important;
      padding: 0px !Important;
      border-width: 0px !Important;
    }
  </style>
</head>
<body>

  <div>
    <p>Hi %cursor%,</p>
  </div>

  <br>
  %sig(html)%

  <br>
  %quoteHeader%

  %quotePlaceholder%

</body>
</html>
```

***
## Notes:
### Zoho mail configuration
- Server Settings
	- `imappro.zoho.com:993`
	- `smtp.zoho.com:465`
	- SSL/TLS
	- Normal Password

***
Last Updated: `Fri, 03-Nov-2017 22:49:13.501 +0530`
