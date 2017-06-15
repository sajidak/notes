# Thunderbird Config
> Required for each Profile

cat /media/sak/70_Current/Mailbox/profiles.ini > ~/.thunderbird/profiles.ini

CardBook
Manually sort folders
Profile Buttons
SmartTemplate4
Stationery
Super Date Format %d-%b-%y %H:%M
Theme Font & Size Changer

? Copy Folder

## Inbox Columns
- Threads
- Attachments
- From
- Subject
- Date

## General
- Extension Preferences stored in `~/.thunderbird/c1fvpy7s.default/prefs.js`
	- try copy into new profile, see if settings replicated

## Plugin - Smart Template 4
- `Reply` & `Forward` > `Replace line breaks with <br>`
	- First `checked`, restart and then `unchecked`
	-
- `Global Settings` > `Advanced Functions` > `Support Stationery addon` = *checked*

# Extensions
- Cardbook
	- Need to understand
- Contact Tabs
	- works only with Thunderbird address books
	- supports all fields of Thunderbird's default address book as well as those added gContactSync when viewing a contact

# Notes:
- `/media/sak/70_Current/Mailbox/tb-profiles.ini`
- XPIs at `/media/sak/70_Current/Downloads/thunderbird-extns/*xpi`
- sh `sudo rsync -nvhr /media/sak/70_Current/Downloads/thunderbird-extns/*xpi /usr/lib/thunderbird-addons/extensions/`

# Migration:
```bash
# Cleanup junk
rm -vfr /home/sak/.thunderbird/c1fvpy7s.default
rm -vf /home/sak/.thunderbird/profiles.ini

# Update with new profile


```
