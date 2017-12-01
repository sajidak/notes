# The Go Programming Language
26 Nov 2017

## Install the Go tools
- Download the archive and extract it into /usr/local, creating a Go tree in /usr/local/go.
	- For example:
	`tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz`
- Choose the archive file appropriate for your installation. For instance, if you are installing Go version 1.2.1 for 64-bit x86 on Linux, the archive you want is called `go1.9.2.linux-amd64.tar.gz`.
- (Typically these commands must be run as root or through sudo.)
- Add `/usr/local/go/bin` to the PATH environment variable. You can do this by
	- adding this line to your `/etc/profile` (for a system-wide installation)
	- or `$HOME/.profile` (for user-only installation)
	`export PATH=$PATH:/usr/local/go/bin`

### Installing to a custom location
- The Go binary distributions assume they will be installed in `/usr/local/go` (or `c:\Go` under Windows), but it is possible to install the Go tools to a different location. In this case you must set the GOROOT environment variable to point to the directory in which it was installed.
- For example, if you installed Go to your home directory you should add commands like the following to `$HOME/.profile`:
```sh
	export GOROOT=$HOME/go1.X
	export PATH=$PATH:$GOROOT/bin
```
- **Note:** `GOROOT` must be set only when installing to a custom location.

### Custom commend set


## Uninstalling Go
- To remove an existing Go installation from your system delete the go directory. This is usually `/usr/local/go` under Linux, Mac OS X, and FreeBSD or `c:\Go` under Windows.
- You should also remove the Go bin directory from your `PATH` environment variable. Under Linux and FreeBSD you should edit `/etc/profile` or `$HOME/.profile`.
