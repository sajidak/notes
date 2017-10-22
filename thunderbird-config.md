# Thunderbird Config
> Required for each Profile
`Thu, 21-Sep-2017 12:09:12 +0530`

cat /media/sak/70_Current/Mailbox/profiles.ini > ~/.thunderbird/profiles.ini

## Working Notes
- hotmail sending is broken
	- due to an extension

## Inbox Columns
- Threads
- Attachments
- From
- Subject
- Date

## General
- Extension Preferences stored in `~/.thunderbird/c1fvpy7s.default/prefs.js`
	- try copy into new profile, see if settings replicated

## Extensions
### CardBook
- Disable `Unique source for contacts`




### Manually sort folders
- not much used, optional

### Profile Buttons
- Useful for current usage
- not compatible with current version, after v42.0
- try 'ProfileSwitcher'

### SmartTemplate4
- `Reply` & `Forward` > `Replace line breaks with <br>`
	- First `checked`, restart and then `unchecked`
	-
- `Global Settings` > `Advanced Functions` > `Support Stationery addon` = *checked*
- **See**
	- In Advanced Settings, `Remove email address unless .......`

### Stationery
- Needed for global template
- **See** in options
	- `Number of rows in Addressing Widget`

### Super Date Format
- `%d-%b-%y %H:%M`
- not compatible with

### Theme Font & Size Changer
- Optional, to customize appearance

### ImportExportTools
- useful for exporting mails to offline accounts

## Extensions - Other
- **Profile Folder Button**
	- Opens the profile folder, in default application

- **Cardbook**
	- Need to understand
- **Contact Tabs**
	- works only with Thunderbird address books
	- supports all fields of Thunderbird's default address book as well as those added gContactSync when viewing a contact

## SmartTemplate4 Quote Headers
### Reply Quote header
```html
<hr><b>From:</b> %from% &lt;%from(mail)%&gt;
<br><b>Sent:</b> %X:=sent% %A%, %d% %B%, %Y% %H%:%M% %date_tz% (%tz_name(1)%)
[[<br><b>To:</b> %to(name,bracketMail(angle))%]][[<br><b>Cc:</b> %cc(name,bracketMail(angle))%]]
<br><b>Subject:</b> %subject%
<br>
```

### Forward Quote Header
```html
<hr><b>From:</b> %from% &lt;%from(mail)%&gt;
<br><b>Sent:</b> %X:=sent% %A%, %d% %B%, %Y% %H%:%M% %date_tz% (%tz_name(1)%)
[[<br><b>To:</b> %to(name,bracketMail(angle))%]][[<br><b>Cc:</b> %cc(name,bracketMail(angle))%]]
<br><b>Subject:</b> %subject%
```

## Notes:
- `/media/sak/70_Current/Mailbox/tb-profiles.ini`
- XPIs at `/media/sak/70_Current/Downloads/thunderbird-extns/*xpi`
- sh `sudo rsync -nvhr /media/sak/70_Current/Downloads/thunderbird-extns/*xpi /usr/lib/thunderbird-addons/extensions/`

## Migration:
```bash
# Cleanup junk
rm -vfr /home/sak/.thunderbird/c1fvpy7s.default
rm -vf /home/sak/.thunderbird/profiles.ini

# Update with new profile


```
