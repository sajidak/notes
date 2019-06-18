# Imagemagik

## Links
- https://www.howtogeek.com/109369/how-to-quickly-resize-convert-modify-images-from-the-linux-terminal/
- https://guides.wp-bullet.com/batch-resize-images-using-linux-command-line-and-imagemagick/
- https://www.xnview.com/en/xnconvert/
  - UI Tools
  - **XnConvert-linux-x64.tgz**
  - XnConvert is a powerful and free cross-platform batch image processing,
  - allowing you to combine over 80 actions. Compatible with 500 formats.
  - It uses the batch processing module of XnViewMP
  - **XnViewMP-linux-x64.tgz**
  - XnView MP is a powerful picture viewer, browser and converter for Windows, Mac and Linux.
  - This software can read more than 500 formats change picture size, reduce picture file size and much more!
  - **XnSketch**

## Convert Usage
`convert [input-option] input-file [output-option] output-file`

### Convert options
	-resize geometry     resize the image

	-ping                efficiently determine image attributes
	-identify            identify the format and characteristics of the image

	-verbose             print detailed information about the image
	-contrast            enhance or reduce the image contrast
	-enhance             apply a digital filter to enhance a noisy image
	-equalize            perform histogram equalization to an image
	-normalize           transform image to span the full range of colors
	-quality value       JPEG/MIFF/PNG compression level

	-strip               strip image of all profiles and comments
	-features distance   analyze image features (e.g. contrast, correlation)
	-page geometry       size and location of an image canvas (setting)
	-draw string         annotate the image with a graphic primitive

	-magnify             double the size of the image with pixel art scaling
	-separate            separate an image channel into a grayscale image
	-write filename      write images to this file
***

## Commands
- Get Dimensions
	```sh
	identify -format "%wx%h" image.jpg
	```
- Converting Between Formats
	```sh
	convert howtogeek.png howtogeek.jpg
	```
- Resizing Images
	```sh
	convert example.png -resize 200x100 example.png
	```
- Batch processing
  - option 1
		```sh
		for file in *.png; do convert $file -rotate 90 rotated-$file; done
		```
  - Option 2
	```sh
	#!/usr/bin/env bash
	# Purpose: batch image resizer
	# Source: https://guides.wp-bullet.com
	# Author: Mike

	# absolute path to image folder
	FOLDER="/var/www/wp-bullet.com/wp-content/uploads"

	# max height
	WIDTH=540

	# max width
	HEIGHT=300

	#resize png or jpg to either height or width, keeps proportions using imagemagick
	#find ${FOLDER} -iname '*.jpg' -o -iname '*.png' -exec convert \{} -verbose -resize $WIDTHx$HEIGHT\> \{} \;

	#resize png to either height or width, keeps proportions using imagemagick
	#find ${FOLDER} -iname '*.png' -exec convert \{} -verbose -resize $WIDTHx$HEIGHT\> \{} \;

	#resize jpg only to either height or width, keeps proportions using imagemagick
	find ${FOLDER} -iname '*.jpg' -exec convert \{} -verbose -resize $WIDTHx$HEIGHT\> \{} \;
	```
  - Option 3
	```sh
	mkdir resize;
	IFS=$(echo -en "nb");
	for i in *; do
		echo $i; convert $i -resize 600^ resize/$i;
	done
	# The line IFS=$(echo -en "nb") is a bash trick to
	# handle situations where images file names have spaces
	```
