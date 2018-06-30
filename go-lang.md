# The Go Programming Language
26 Nov 2017

## Public Hosting
- https://www.clever-cloud.com/golang-hosting
- http://www.golang-cloud.com/
- https://medium.freecodecamp.org/
- https://medium.com/
- http://www.appscale.com/
- https://www.openshift.com/
-





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

## Uninstalling Go
- To remove an existing Go installation from your system delete the go directory. This is usually `/usr/local/go` under Linux, Mac OS X, and FreeBSD or `c:\Go` under Windows.
- You should also remove the Go bin directory from your `PATH` environment variable. Under Linux and FreeBSD you should edit `/etc/profile` or `$HOME/.profile`.

## Command go
**See** https://golang.org/cmd/go

Go is a tool for managing Go source code.

Usage:
`go command [arguments]`

The commands are:
| Command    | Description                                    |
| ---------- | ---------------------------------------------- |
| `build`    | compile packages and dependencies              |
| `clean`    | remove object files                            |
| `doc`      | show documentation for package or symbol       |
| `env`      | print Go environment information               |
| `bug`      | start a bug report                             |
| `fix`      | run go tool fix on packages                    |
| `fmt`      | run gofmt on package sources                   |
| `generate` | generate Go files by processing source         |
| `get`      | download and install packages and dependencies |
| `install`  | compile and install packages and dependencies  |
| `list`     | list packages                                  |
| `run`      | compile and run Go program                     |
| `test`     | test packages                                  |
| `tool`     | run specified go tool                          |
| `version`  | print Go version                               |
| `vet`      | run go tool vet on packages                    |

Use "`go help [topic]`" for more information about that topic.

### clean - Remove object files
Usage:
`go clean [-i] [-r] [-n] [-x] [build flags] [packages]`

Clean removes object files from package source directories. The go command builds most objects in a temporary directory, so go clean is mainly concerned with object files left by other tools or by manual invocations of go build.

Specifically, clean removes the following files from each of the source directories corresponding to the import paths:

| Directory      | Note                                      |
| -------------- | ----------------------------------------- |
| _obj/          | old object directory, left from Makefiles |
| _test/         | old test directory, left from Makefiles   |
| _testmain.go   | old gotest file, left from Makefiles      |
| test.out       | old test log, left from Makefiles         |
| build.out      | old test log, left from Makefiles         |
| *.[568ao]      | object files, left from Makefiles         |
|                |                                           |
| DIR(.exe)      | from go build                             |
| DIR.test(.exe) | from go test -c                           |
| MAINFILE(.exe) | from go build MAINFILE.go                 |
| *.so           | from SWIG                                 |

In the list, DIR represents the final path element of the directory, and MAINFILE is the base name of any Go source file in the directory that is not included when building the package.
The `-i` flag causes clean to remove the corresponding installed archive or binary (what 'go install' would create).
The `-n` flag causes clean to print the remove commands it would execute, but not run them.
The `-r` flag causes clean to be applied recursively to all the dependencies of the packages named by the import paths.
The `-x` flag causes clean to print remove commands as it executes them.

For more about build flags, see 'go help build'.
For more about specifying packages, see 'go help packages'.


### list - List packages
Usage:
`go list [-e] [-f format] [-json] [build flags] [packages]`

List lists the packages named by the import paths, one per line.

The default output shows the package import path:
`bytes`
`encoding/json`
`github.com/gorilla/mux`
`golang.org/x/net/html`


### get - Download and install packages and dependencies
Usage:
`go get [-d] [-f] [-fix] [-insecure] [-t] [-u] [build flags] [packages]`

Get downloads the packages named by the import paths, along with their dependencies. It then installs the named packages, like 'go install'.

The `-d` flag instructs get to stop after downloading the packages; that is, it instructs get not to install the packages.
The `-f` flag, valid only when -u is set, forces get -u not to verify that each package has been checked out from the source control repository implied by its import path. This can be useful if the source is a local fork of the original.
The `-fix` flag instructs get to run the fix tool on the downloaded packages before resolving dependencies or building the code.
The `-insecure` flag permits fetching from repositories and resolving custom domains using insecure schemes such as HTTP. Use with caution.
The `-t` flag instructs get to also download the packages required to build the tests for the specified packages.
The `-u` flag instructs get to use the network to update the named packages and their dependencies. By default, get uses the network to check out missing packages but does not use it to look for updates to existing packages.
The `-v` flag enables verbose progress and debug output.

Get also accepts build flags to control the installation. See 'go help build'.
When checking out a new package, get creates the target directory GOPATH/src/\<import-path\>. If the GOPATH contains multiple entries, get uses the first one. For more details see: 'go help gopath'.
When checking out or updating a package, get looks for a branch or tag that matches the locally installed version of Go. The most important rule is that if the local installation is running version "go1", get searches for a branch or tag named "go1". If no such version exists it retrieves the default branch of the package.
When go get checks out or updates a Git repository, it also updates any git submodules referenced by the repository.
Get never checks out or updates code stored in vendor directories.

For more about specifying packages, see 'go help packages'.
For more about how 'go get' finds source code to download, see 'go help importpath'.
See also: go build, go install, go clean.


### install - Compile and install packages and dependencies
Usage:
`go install [build flags] [packages]`

Install compiles and installs the packages named by the import paths, along with their dependencies.

For more about the build flags, see 'go help build'.
For more about specifying packages, see 'go help packages'.
See also: go build, go get, go clean

### fix - Run go tool fix on packages
Usage:
`go fix [packages]`

Fix runs the Go fix command on the packages named by the import paths.

For more about fix, see 'go doc cmd/fix'. For more about specifying packages, see 'go help packages'.
To run fix with specific options, run 'go tool fix'.
See also: go fmt, go vet.


### build - Compile packages and dependencies
Usage:
`go build [-o output] [-i] [build flags] [packages]`

Build compiles the packages named by the import paths, along with their dependencies, but it does not install the results.

- If the arguments to build are a list of .go files, build treats them as a list of source files specifying a single package.
- When compiling a single main package, build writes the resulting executable to an output file named after the first source file ('go build ed.go rx.go' writes 'ed' or 'ed.exe') or the source code directory ('go build unix/sam' writes 'sam' or 'sam.exe'). The '.exe' suffix is added when writing a Windows executable.
- When compiling multiple packages or a single non-main package, build compiles the packages but discards the resulting object, serving only as a check that the packages can be built.
- When compiling packages, build ignores files that end in '_test.go'.
- The `-o` flag, only allowed when compiling a single package, forces build to write the resulting executable or object to the named output file, instead of the default behavior described in the last two paragraphs.
- The `-i` flag installs the packages that are dependencies of the target.

The build flags are shared by the build, clean, get, install, list, run, and test commands:
| Flag    | Description                                                                                                                                |
| ------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `-a`    | force rebuilding of packages that are already up-to-date.                                                                                  |
| `-n`    | print the commands but do not run them.                                                                                                    |
| `-p n`  | the number of programs, such as build commands or test binaries, that can be run in parallel. The default is the number of CPUs available. |
| `-race` | enable data race detection. Supported only on linux/amd64, freebsd/amd64, darwin/amd64 and windows/amd64.                                  |
| `-msan` | enable interoperation with memory sanitizer. Supported only on linux/amd64, and only with Clang/LLVM as the host C compiler.               |
| `-v`    | print the names of packages as they are compiled.                                                                                          |
| `-work` | print the name of the temporary work directory and do not delete it when exiting.                                                          |
| `-x`    | print the commands.                                                                                                                        |

| Flag                     | Description                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-asmflags 'flag list'`  | arguments to pass on each go tool asm invocation.                                                                                                                                                                                                                                                                                                                       |
| `-buildmode mode`        | build mode to use. See 'go help buildmode' for more.                                                                                                                                                                                                                                                                                                                    |
| `-compiler name`         | name of compiler to use, as in runtime.Compiler (gccgo or gc).                                                                                                                                                                                                                                                                                                          |
| `-gccgoflags 'arg list'` | arguments to pass on each gccgo compiler/linker invocation.                                                                                                                                                                                                                                                                                                             |
| `-gcflags 'arg list'`    | arguments to pass on each go tool compile invocation.                                                                                                                                                                                                                                                                                                                   |
| `-installsuffix suffix`  | a suffix to use in the name of the package installation directory, in order to keep output separate from default builds. If using the -race flag, the install suffix is automatically set to race or, if set explicitly, has _race appended to it. Likewise for the -msan flag. Using a -buildmode option that requires non-default compile flags has a similar effect. |
| `-ldflags 'flag list'`   | arguments to pass on each go tool link invocation.                                                                                                                                                                                                                                                                                                                      |
| `-linkshared`            | link against shared libraries previously created with -buildmode=shared.                                                                                                                                                                                                                                                                                                |
| `-pkgdir dir`            | install and load all packages from dir instead of the usual locations. For example, when building with a non-standard configuration, use -pkgdir to keep generated packages in a separate location.                                                                                                                                                                     |
| `-tags 'tag list'`       | a space-separated list of build tags to consider satisfied during the build. For more information about build tags, see the description of build constraints in the documentation for the go/build package.                                                                                                                                                             |
| `-toolexec 'cmd args'`   | a program to use to invoke toolchain programs like vet and asm. For example, instead of running asm, the go command will run `cmd args /path/to/asm <arguments for asm>`.                                                                                                                                                                                               |

All the flags that take a list of arguments accept a space-separated list of strings. To embed spaces in an element in the list, surround it with either single or double quotes.

For more about specifying packages, see 'go help packages'. For more about where packages and binaries are installed, run 'go help gopath'. For more about calling between Go and C/C++, run 'go help c'.

**Note:** Build adheres to certain conventions such as those described by 'go help gopath'. Not all projects can follow these conventions, however. Installations that have their own conventions or that use a separate software build system may choose to use lower-level invocations such as 'go tool compile' and 'go tool link' to avoid some of the overheads and design decisions of the build tool.

See also: go install, go get, go clean.



***
