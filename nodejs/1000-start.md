# Nodejs Starter notes

## app.js
- http://localhost:3000
	```js
	const http = require('http');

	const hostname = '127.0.0.1';
	const port = 3000;

	const server = http.createServer((req, res) => {
	  res.statusCode = 200;
	  res.setHeader('Content-Type', 'text/plain');
	  res.end('Hello World\n');
	});

	server.listen(port, hostname, () => {
	  console.log(`Server running at http://${hostname}:${port}/`);
	});
	```

## Anatomy of an HTTP Transaction
https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/

```js
const http = require('http');
const server = http.createServer((request, response) => {
  // magic happens here!
});

// Same as

const server = http.createServer();
server.on('request', (request, response) => {
  // the same kind of magic happens here!
});
```

- to actually serve requests, the listen method needs to be called on the server object.
- The request object is an instance of IncomingMessage.
- all headers are represented in lower-case only
- see also `rawHeaders`

### request object
- The request object that's passed in to a handler implements the ReadableStream interface.
- see modules `concat-stream`, `body`


### 'error' event
- If you don't have a listener for that event, the error will be thrown, which could crash your Node.js program.
```js
request.on('error', (err) => {
  // This prints the error message and stack trace to `stderr`.
  console.error(err.stack);
});
```

### response object
- an instance of `ServerResponse`, which is a `WritableStream`
	- response.statusCode
	- response.setHeader('Content-Type', 'application/json');
- explicitly write the headers to the response stream
```js
response.writeHead(200, {
  'Content-Type': 'application/json',
  'X-Powered-By': 'bacon'
});
```
- `response.write('<html>');`
- `response.end('<html><body><h1>Hello, World!</h1></body></html>');`
- the request object is a ReadableStream and the response object is a WritableStream. That means we can use pipe to direct data from one to the other.
	- `request.pipe(response);`
	-
