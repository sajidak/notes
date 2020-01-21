# Notes 1808

17603 KCG YPR EXP

https://trainstatus.info/running-status/17603-kcg-ypr-exp-today

https://enquiry.indianrail.gov.in/mntes/q?opt=TrainRunning&subOpt=ShowRunC
https://erail.in/train-running-status/17603?from=SHNR&date=18-Aug-2018&t=636702250431716381

https://enquiry.indianrail.gov.in/ntes/index.html


## 2018 Aug 18
### ion-datepicker
- https://github.com/misha130/ion-datepicker
- package.json
	```json
	"license": "MIT",
    "dependencies": {},
	"peerDependencies": {
	  "ionic-angular": "~3.9.2",
	  "@angular/common": "~5.0.0",
	  "@angular/core": "~5.0.0",
	  "@angular/forms": "~5.0.0",
	  "@angular/http": "~5.0.0",
	  "@angular/platform-browser": "~5.0.0",
	  "@angular/platform-browser-dynamic": "~5.0.0",
	  "ionicons": "3.0.0",
	  "rxjs": "5.5.2",
	  "connect": "^3.6.3",
	  "sw-toolbox": "3.6.0",
	  "zone.js": "0.8.18",
	  "typescript": "~2.4.2"
	},
	"devDependencies": {
	  "@angular/compiler": "~5.0.0",
	  "@angular/compiler-cli": "~5.0.0"
	}
	```
-  ion-datepicker/demo/src/pages/home/home.ts
	```ts
	import { Component, ViewChild } from '@angular/core';
	import { NavController } from 'ionic-angular';
	import { DatePickerDirective } from 'ion-datepicker';
	@Component({
	  selector: 'page-home',
	  templateUrl: 'home.html',
	  providers: [DatePickerDirective],
	})
	export class HomePage {
	  @ViewChild(DatePickerDirective) public datepicker: DatePickerDirective;
	```
-  ion-datepicker/demo/src/pages/home/home.html
	```html
	<span ion-datepicker
	 [(value)]="initDate"
	 locale="en-US"
	 clear
	 class="ScheduleDate">
		<span>{{initDate | date}}
			<ion-icon name="clipboard" item-left ></ion-icon>
		</span>
	</span>
	```
-  ion-datepicker/demo/src/app/app.module.ts
	```ts
	import { DatePickerModule } from '../../../dist';
	```

### Markdown addons
All
https://github.com/simov/markdown-viewer

firefox
https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer-webext/?src=search
https://addons.mozilla.org/en-US/firefox/addon/gitlab-markdown-viewer/?src=search
https://addons.mozilla.org/en-US/firefox/addon/markdown-editor-firefox/?src=search

Chrome
https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk/related?hl=en
https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl/related?hl=en


### Blockchain Fundamentals
https://msdn.microsoft.com/magazine/mt829707

### Git Repos
```
https://github.com/viaetruck
https://firament@github.com/viaetruck/vtrkUI_dev.git
https://firament@github.com/viaetruck/vtrkAPI_dev.git
https://firament@github.com/viaetruck/vtrkUI_pro.git
https://firament@github.com/viaetruck/vtrkAPI_prod.git
```

### Try - look and feel in html5
```html
<input type="datetime-local">
```
