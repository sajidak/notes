# HTML5 Geolocation
> The Geolocation API allows the user to provide their location to web applications if they so desire.
> For privacy reasons, the user is asked for permission to report location information.

## Links
- https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API
- https://developers.google.com/maps/documentation/geolocation/intro

## Concepts and usage
- accessed via a call to Navigator.geolocation
- diferent ways:
	- `Geolocation.getCurrentPosition()`
	- `Geolocation.watchPosition()`
		- You can use `watchPosition()` without an initial `getCurrentPosition()` call.
		- `watchPosition()` method returns an ID number
		- use ID value with the `clearWatch()` method to stop watching the location

- Both method calls takes up to three arguments
	- A mandatory success callback
		- callback executes with a `GeolocationPosition` object as its only parameter,
	- An optional error callback
		- callback executes with a `GeolocationPositionError` object as its only parameter
	- An optional `PositionOptions` object
		- provides options for retrieval of the position data


## Examples
### https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API
```js
function geo_success(position) {
  do_something(position.coords.latitude, position.coords.longitude);
}

function geo_error() {
  alert("Sorry, no position available.");
}

var geo_options = {
  enableHighAccuracy: true,
  maximumAge        : 30000,
  timeout           : 27000
};

var wpid = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);
```

### https://hacks.mozilla.org/2013/10/who-moved-my-geolocation/
```js
var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
};

function success(pos) {
    var crd = pos.coords;

    console.log('Your current position is:');
    console.log('Latitude : ' + crd.latitude);
    console.log('Longitude: ' + crd.longitude);
    console.log('More or less ' + crd.accuracy + ' meters.');
};

function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
};

navigator.geolocation.getCurrentPosition(success, error, options);
```


## Interfaces

### GeolocationPosition
- GeolocationPosition.coords [GeolocationCoordinates]
- GeolocationPosition.timestamp [DOMTimeStamp]

### GeolocationCoordinates
- GeolocationCoordinates.latitude [double]
	- latitude in decimal degrees
- GeolocationCoordinates.longitude [double]
	- longitude in decimal degrees
- GeolocationCoordinates.altitude [double]
- GeolocationCoordinates.accuracy [double]
- GeolocationCoordinates.altitudeAccuracy [double]
- GeolocationCoordinates.heading [double]
- GeolocationCoordinates.speed [double]

### GeolocationPositionError
- GeolocationPositionError.code [unsigned short]
	- 1 = PERMISSION_DENIED
	- 2 = POSITION_UNAVAILABLE
	- 3 = TIMEOUT
- GeolocationPositionError.message [DOMString]

### PositionOptions
- PositionOptions.enableHighAccuracy [Boolean]
	- true | [false]
- PositionOptions.timeout [positive long]
	- maximum length of time (in milliseconds) the device is allowed to take in order to return a position
	- [Infinity]
- PositionOptions.maximumAge [positive long]
	- maximum age in milliseconds of a possible cached position that is acceptable to return
	- If set to 0, it means that the device cannot use a cached position and must attempt to retrieve the real current position
	- If set to Infinity the device must return a cached position regardless of its age
	- [0]

## See Also
- https://developer.mozilla.org/en-US/docs/Web/API/Clipboard
	- Clipboard.writeText()
