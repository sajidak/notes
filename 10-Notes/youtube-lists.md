# List all videos in Channel

## APIs
- https://www.codexworld.com/get-videos-from-youtube-channel-data-api-v3-php/
- try
	- `https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId=FAIZAN E MARIFAT&maxResults=50`
	- `https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId=UC-lRMwVPJ7jVf6BL_C6IpyQ&maxResults=50`
- Worked
	- https://developers.google.com/apis-explorer/?hl=en_US#p/youtube/v3/youtube.search.list
	- Channel ID = UC-lRMwVPJ7jVf6BL_C6IpyQ
	- GET https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UC-lRMwVPJ7jVf6BL_C6IpyQ&maxResults=50&order=date&key={YOUR_API_KEY}
	- GET https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UC-lRMwVPJ7jVf6BL_C6IpyQ&maxResults=50&order=date&publishedBefore=2016-09-08T17%3A55%3A38.000Z&key={YOUR_API_KEY}
- With paging
	- GET https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UC-lRMwVPJ7jVf6BL_C6IpyQ&maxResults=50&order=date&pageToken=CDIQAA&fields=items(id(kind%2CvideoId)%2Csnippet(publishedAt%2Ctitle))%2CnextPageToken%2CpageInfo%2CtokenPagination&key={YOUR_API_KEY}
	- youtube-lists-results-c.html
	- youtube-lists-results-d.html
	- 
- API-KEY
	- https://console.developers.google.com/apis/library/youtube.googleapis.com?id=125bab65-cfb6-4f25-9826-4dcc309bc508
	- https://developers.google.com/youtube/v3/guides/authentication


## Publisher
Khateeb-e-Dakan Peer-e-Tariqath Sufi e millat Hazrat Al-Haj Dr. Sufi Abdul Khader Basha Saheb Khadri Chisti Shazili, M.A. Phd. 

**Bani Khankha-e-Khadriya-wa-Baitul irfan**
- Adoni ( A.P) 
- India,
- Phone 
	- 08512 252902
	- 09885452902
	- 09448171786
	- 09886307786


## Page Source
```html
<div id="dismissable" class="style-scope ytd-grid-video-renderer">
	<ytd-thumbnail use-hovered-property="" width="210" class="style-scope ytd-grid-video-renderer">
	<a id="thumbnail" class="yt-simple-endpoint inline-block style-scope ytd-thumbnail" aria-hidden="true" tabindex="-1" rel="null" href="/watch?v=TRDY0RTdx6U">
	
	<!-- SECTION OF INTEREST - BEGIN -->
		<yt-img-shadow
			class="style-scope ytd-thumbnail no-transition"
			style="background-color: transparent;"
			loaded="">
			<img
				id="img"
				class="style-scope yt-img-shadow"
				alt=""
				src="https://i.ytimg.com/vi/IlizMRKuj10/hqdefault.jpg?sqp=-oaymwEjCPYBEIoBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&amp;rs=AOn4CLCMFU5soOxyW6hxPb7JHT9gVlC0qQ"
				width="210">
			</yt-img-shadow>
	<!-- SECTION OF INTEREST - END -->

      <div id="overlays" class="style-scope ytd-thumbnail">
		  <ytd-thumbnail-overlay-time-status-renderer class="style-scope ytd-thumbnail" overlay-style="DEFAULT">
			  <span class="style-scope ytd-thumbnail-overlay-time-status-renderer" aria-label="4 minutes, 52 seconds">4:52</span>
			</ytd-thumbnail-overlay-time-status-renderer>
		</div>
      <div id="mouseover-overlay" class="style-scope ytd-thumbnail"></div>
      <div id="hover-overlays" class="style-scope ytd-thumbnail"></div>
    </a>
  </ytd-thumbnail>
  <div id="details" class="style-scope ytd-grid-video-renderer">
	  <div id="meta" class="style-scope ytd-grid-video-renderer">
		  	<h3 class="style-scope ytd-grid-video-renderer">
			  <ytd-badge-supported-renderer class="style-scope ytd-grid-video-renderer" disable-upgrade="" hidden=""></ytd-badge-supported-renderer>
			  <a 
				  id="video-title" 
				  class="yt-simple-endpoint style-scope ytd-grid-video-renderer" 
				  aria-label="KARAMATE AUOLIA ALLAH by FAIZAN E MARIFAT 9 years ago 4 minutes, 52 seconds 40,965 views" 
				  title="KARAMATE AUOLIA ALLAH" href="/watch?v=TRDY0RTdx6U">KARAMATE AUOLIA ALLAH</a>
			</h3>
			<div id="metadata-container" class="grid style-scope ytd-grid-video-renderer" meta-block="">
				<div id="metadata" class="style-scope ytd-grid-video-renderer">
					<div id="byline-container" class="style-scope ytd-grid-video-renderer" hidden="">
						<yt-formatted-string id="byline" ellipsis-truncate="" class="style-scope ytd-grid-video-renderer" title=""></yt-formatted-string>
						<ytd-badge-supported-renderer class="style-scope ytd-grid-video-renderer" disable-upgrade="" hidden=""></ytd-badge-supported-renderer>
				</div>
				<div id="metadata-line" class="style-scope ytd-grid-video-renderer">
					<span class="style-scope ytd-grid-video-renderer">40K views</span>
					<span class="style-scope ytd-grid-video-renderer">9 years ago</span>
					<template is="dom-repeat" strip-whitespace="" class="style-scope ytd-grid-video-renderer"></template>
					</div>
					</div>
					<div id="additional-metadata-line" class="style-scope ytd-grid-video-renderer">
						<template is="dom-repeat" strip-whitespace="" class="style-scope ytd-grid-video-renderer"></template>
						</div></div></div><ytd-badge-supported-renderer class="style-scope ytd-grid-video-renderer" disable-upgrade="" hidden=""></ytd-badge-supported-renderer><div id="menu" class="style-scope ytd-grid-video-renderer"><ytd-menu-renderer class="style-scope ytd-grid-video-renderer">
    
    <div id="top-level-buttons" class="style-scope ytd-menu-renderer"></div>
    <yt-icon-button id="button" class="dropdown-trigger style-scope ytd-menu-renderer"><button id="button" class="style-scope yt-icon-button" aria-label="Action menu">
      <yt-icon class="style-scope ytd-menu-renderer"><svg viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" focusable="false" style="pointer-events: none; display: block; width: 100%; height: 100%;" class="style-scope yt-icon"><g class="style-scope yt-icon">
        <path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" class="style-scope yt-icon"></path>
      </g></svg>
    
    
  </yt-icon>
	</button></yt-icon-button>
```

### HTML Extract
> see youtube-lists-extract.html

### Video details - API
```json
{
	"kind": "youtube#videoListResponse",
	"etag": "\"XpPGQXPnxQJhLgs6enD_n8JR4Qk/DRJX0AYp4Vs73YdytiANH1zIaaQ\"",
	"pageInfo": {
		"totalResults": 1,
		"resultsPerPage": 1
	},
	"items": [
		{
			"kind": "youtube#video",
			"etag": "\"XpPGQXPnxQJhLgs6enD_n8JR4Qk/MKGWV1ukp9Mme1dhCSS1AkFoNDQ\"",
			"id": "lF_Br64AD2Y",
			"snippet": {
				"publishedAt": "2011-10-15T06:00:21.000Z",
				"channelId": "UC-lRMwVPJ7jVf6BL_C6IpyQ",
				"title": "MAQSAD E AOULIYA PART 3.flv",
				"description": "Khateeb-e-Dakan Peer-e-Tariqath Al-Haj Dr. Sufi Abdul Khader Basha Saheb Khadri Chisti Shazili, M.A. Phd. Bani Khankha-e-Khadriya-wa-Baitul irfan,Adoni ( A.P) India,Phone 08512 252902,09885452902,09448171786,09886307786",
				"thumbnails": {
					"default": {
						"url": "https://i.ytimg.com/vi/lF_Br64AD2Y/default.jpg",
						"width": 120,
						"height": 90
					},
					"medium": {
						"url": "https://i.ytimg.com/vi/lF_Br64AD2Y/mqdefault.jpg",
						"width": 320,
						"height": 180
					},
					"high": {
						"url": "https://i.ytimg.com/vi/lF_Br64AD2Y/hqdefault.jpg",
						"width": 480,
						"height": 360
					}
				},
				"channelTitle": "FAIZAN E MARIFAT",
				"tags": [
					"URS HUZUR ABBA DURVESH BABA",
					"SHIMOGA",
					"KARNATAKA",
					"INDIA"
				],
				"categoryId": "27",
				"liveBroadcastContent": "none",
				"localized": {
					"title": "MAQSAD E AOULIYA PART 3.flv",
					"description": "Khateeb-e-Dakan Peer-e-Tariqath Al-Haj Dr. Sufi Abdul Khader Basha Saheb Khadri Chisti Shazili, M.A. Phd. Bani Khankha-e-Khadriya-wa-Baitul irfan,Adoni ( A.P) India,Phone 08512 252902,09885452902,09448171786,09886307786"
				}
			},
			"contentDetails": {
				"duration": "PT15M10S",
				"dimension": "2d",
				"definition": "sd",
				"caption": "false",
				"licensedContent": true,
				"projection": "rectangular"
			},
			"statistics": {
				"viewCount": "266",
				"likeCount": "5",
				"dislikeCount": "0",
				"favoriteCount": "0",
				"commentCount": "0"
			}
		}
	]
}
```
