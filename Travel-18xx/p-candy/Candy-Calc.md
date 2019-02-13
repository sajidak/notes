# Candy Calculator

## Files:
- `file:///mnt/sdcard/XFER/working/p-candy/candy-calc.html`
- `file:///storage/sdcard0/XFER/working/candy-calc.html`


## Features
1. Show Cart details
	a. Cart ID
	b. Cart driver name
2. Show list of products
3. For each product, show
	a. Product (Price)
	b. Load Count
	c. Return Count
	d. Sold Count
4. Calculate Sales
	a. Sold count
	b. Sale value, per product
	c. Sale value, total
	d. Commission
	e. Remittance
5. Reset form
6. Current products are
	a. 2
	b. 3
	c. 5
	d. 7


### Future Enhancements
1. Manage day sheet
2. Cloud storage for anywhere access
3. Dashboard for current status
4. Day open and Day close events
5. Subscribed event notifications


## Notes:
1. Lang & locale
	a. `gu gujarati`
	b. `hi hindi`
	c. `ur urdu`
	d. `<html lang="en-US">`
	
2. char spacing css
```
letter-spacing: 3px;
/* Global values */ 
letter-spacing: inherit; 
letter-spacing: initial; 
letter-spacing: unset;
```

3. border shadow css
```
box-shadow: 10px 10px 5px #888888;
box-shadow: none|h-shadow v-shadow blur spread color |inset|initial|inherit;
border-bottom: 1px solid red
```

4. select all text on focus css
`element.addEventListener(event, function, useCapture);`

5. Multiple feilds with same name
```
var values = [];
var fields = document.getElementsByName("items[]");
for(var i = 0; i < fields.length; i++) {
    values.push(fields[i].value);
}
```

6. Text shadow:
	a. `text-shadow: h-shadow v-shadow blur-radius color|none|initial|inherit;`
	b. `text-shadow: 2px 2px 8px #FF0000;`
	c. `text-shadow: #777 1px 3px 0px, #aaa 1px 13px 5px;`

7. Snippets
	a. `<!DOCTYPE html> `
	b. `<meta charset="utf-8" />`
	c. `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
	d. `var x = document.getElementById("myForm").elements.length;`
	e. `document.formname.elementname`
	f. `document.getElementsByName('mail_format');`
	g. `var x = document.forms["myForm"]["fname"].value;`
	h. `defaultValue - Sets or returns the default value of a number field`
	g. `list - Returns a reference to the datalist that contains the number field`
	h. `input[type=text]:focus {width: 250px;}`
	i. `form[“txtArea”].length`
	j. `txtS[i].value.length`
	k. `<div lang="fr">`
	l. `pattern="\d{1,15}" required`
	j. `font-weight: bold;`
	k. `text-align: left; left, right, or center`
	l. `display: inline-block;`
	m. `document.getElementById('txtText').disabled = true;`
	n. `Math.round(x) - Returns the value of a number rounded to the nearest integer.`
	m. `/* border-width: top right bottom left */ border-width: 1px 2em 0 4rem;`
	n. `line-height: 1.2;`
	o. `margin: 10px 5px 10px 5px;`
	
8. Gujarati texts
	- ફેરીયા
	- લારી
	- કનટી
	- લોડ
	- રીટન
	- વેપાર
	- કમીશન
	- આપવાના
	- કુલ વેપાર
	- લાજવાબ ગૃહ ઉઘોગ
	- બોરસદ
	- કેનડી
	- calculate = ગોઠવણી કરવી
	- calc = ગણકયંત્ર
	- reset = ફરીથી સેટ કરો
