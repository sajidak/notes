[TOC]

# jQuery tables

- http://holt59.github.io/datatable/


# Grub Themes
[Link](https://www.gnome-look.org/browse/cat/109/ord/latest/)

Steps:
- To install it, you have to uncompress the themes with that command (as super user with sudo or su according to your distro policy):
- `tar -zxvf Crunchy-GRUB2-themes.tar.gz -C /boot/grub`
- To active one of the theme, you have to edit the `/etc/default/grub` file by adding at least a `GRUB_THEME` line, for example:
	- `GRUB_THEME="/boot/grub/themes/Crunchy-simple-blue/theme.txt"`
- Then, don't forget to update your grub:
- `sudo update-grub `
- **Ref:**
  - http://wiki.rosalab.ru/en/index.php/Grub2_theme_/_reference
  - http://ubuntuforums.org/showthread.php?t=1534689

## Interesting Themes
- https://www.gnome-look.org/p/1111552/
- https://www.gnome-look.org/p/1160963/
-

# HDD Enclosures

## 2.5"
485	http://www.amazon.in/Terabyte-Drive-External-Enclosure-Laptop/dp/B01EJBAZQE/ref=sr_1_1/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-1&keywords=laptop+ssd+drives
477	http://www.amazon.in/Terabyte-USB-3-0-External-Enclosure/dp/B01046MYB2/ref=sr_1_11/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-11&keywords=laptop+ssd+drives

## Cable
369	http://www.amazon.in/USB-SATA-2-5-Hard-Drive/dp/B01N8T8DUJ/ref=sr_1_9/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-9&keywords=laptop+ssd+drives
465	http://www.amazon.in/Cables-Kart-USB-3-0-SATA/dp/B01FW7X3DG/ref=pd_sbs_23_7?_encoding=UTF8&psc=1&refRID=1XG6FEJJVTWKP5VVT858

## 9.5mm `Y`
599	http://www.amazon.in/Storite-Drive-Caddy-Laptop-Macbook/dp/B00HD7QQQA/ref=sr_1_3/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-3&keywords=laptop+ssd+drives
499	http://www.amazon.in/Laprite-Optical-Universal-Expand-Storage/dp/B01ENQDGPM/ref=sr_1_8/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-8&keywords=laptop+ssd+drives
599	http://www.amazon.in/gp/slredirect/picassoRedirect.html/ref=pa_sp_btf_computers_sr_pg2_3?ie=UTF8&adId=A0546772KIE1J5CEF8IA&url=http%3A%2F%2Fwww.amazon.in%2FStorite-Universal-Plastic-Material-DVD-ROM%2Fdp%2FB01AZ840RA%2Fref%3Dsr_1_51%3Fs%3Dcomputers%26ie%3DUTF8%26qid%3D1491476634%26sr%3D1-51-spons%26keywords%3Dlaptop%2Bssd%2Bdrives%26psc%3D1%26smid%3DA3FPNGXJ2Z95CC&qualifier=1491476634&id=4046991567322567&widgetName=sp_btf


## 12.7mm `N`
	http://www.amazon.in/CNCT-SATA-caddy-Universal-DVD-ROM/dp/B018LJGEUG/ref=sr_1_6/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-6&keywords=laptop+ssd+drives
599	http://www.amazon.in/ADMI-SATA-2nd-12-7mm-Universal/dp/B019IL7T8W/ref=sr_1_24/261-3868197-1678400?s=computers&ie=UTF8&qid=1491475528&sr=1-24&keywords=laptop+ssd+drives

## SSD
6325	http://www.amazon.in/WD-Green-240GB-Internal-WDS240G1G0A/dp/B01MDM3WI5/ref=sr_1_2?s=computers&ie=UTF8&qid=1491476406&sr=1-2&keywords=laptop+ssd+drives
3983	http://www.amazon.in/WD-Green-120GB-Internal-WDS120G1G0A/dp/B01M8HPL6Q/ref=sr_1_3?s=computers&ie=UTF8&qid=1491476506&sr=1-3&keywords=laptop+ssd+drives


---
# Favourite items can't be moved in mate-menu
499	https://bugs.launchpad.net/bugs/1628188

Edit file
`${HOME}/.config/mate-menu/applications.list`
and manually rearrange entries to get the order you like.
'Reload Plugins' applies the changes right away.

seenainkhan@gmail.com

---
# Bookmarks in Caja
`~/.config/user-dirs.dirs` -> test after logout

`echo "enabled=false" > ~/.config/user-dirs.conf`

`/etc/xdg/user-dirs.conf`

---
# Webfonts

## How:
1. Add a stylesheet link to request the desired web font(s):
```html
<link rel="stylesheet" type="text/css"
      href="https://fonts.googleapis.com/css?family=Font+Name">
```
2. Style an element with the requested web font, either in a stylesheet:
```css
.css-selector {
  font-family: 'Font Name', serif;
}
```

## Advanced:
To request multiple font families, separate the names with a pipe character (`|`).  e.g.
`https://fonts.googleapis.com/css?family=Tangerine|Inconsolata|Droid+Sans`

To request other styles or weights, append a colon (`:`) to the name of the font, followed by a list of styles or weights separated by commas (`,`).  e.g.
`https://fonts.googleapis.com/css?family=Tangerine:bold,bolditalic|Inconsolata:italic|Droid+Sans`

## Addl Info:
```html
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/carlito" type="text/css"/>
<link rel="stylesheet" media="screen" href="https://fontlibrary.org/face/caladea" type="text/css"/>
```

```css
p {
   font-family: 'CarlitoRegular';
   font-weight: normal;
   font-style: normal;
}
p {
   font-family: 'CaladeaRegular';
   font-weight: normal;
   font-style: normal;
}
```

## More Info:
-	`https://developers.google.com/fonts/docs/getting_started`
-	`https://developers.google.com/fonts/docs/webfont_loader`
-	`https://github.com/typekit/webfontloader`
-	`https://fontlibrary.org/en/font/carlito`
-	`https://fontlibrary.org/en/font/caladea`
-	`http://www.tug.dk/FontCatalogue/carlito/`
-	`http://www.tug.dk/FontCatalogue/caladea/`

# Onedrive/z.txt

# General clipboard items, for temporary recall.
Delete after use to keep this note clean

http://www.apta.com/resources/hottopics/circulators/Urban%20Circulator%20Presentations/Project-Management-Oversight.pdf
https://www.transit.dot.gov/regulations-and-guidance/project-management-oversight-pmo
