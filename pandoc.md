# Pandoc Install and Start

# Notes
- What does this mean?
	- `Require skylighting >= 0.1.1.4`
- pdfLatex on Ubuntu
	- sudo apt-get install texlive-latex-base

# Install

## Windows
- https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-windows.msi
**Extract from MSI**
	- you can extract the pandoc and pandoc-citeproc executables from the MSI
`start /wait msiexec.exe /a pandoc-1.19.1-windows.msi /qn targetdir="%TEMP%\pandoc\"`
- **Depends**
	- For PDF output, you’ll also need to install LaTeX.
	- We recommend [MiKTeX](https://miktex.org/)


## Linux - using Debian package
- https://github.com/jgm/pandoc/releases/download/1.19.2.1/pandoc-1.19.2.1-1-amd64.deb
- extract files manually from deb, for custom location
- `ar p pandoc-1.19.2.1-1-amd64.deb data.tar.gz | tar xvz --strip-components 2 -C $HOME/.local/`

## from source, using stack
- https://github.com/jgm/pandoc/archive/1.19.2.1.tar.gz
- or development code by cloning the [repository](git clone https://github.com/jgm/pandoc)
- Install stack
- Change to pandoc source directory and run
```sh
stack setup
stack install --test
```
- stack setup will automatically download the ghc compiler if you don’t have it
- **NOTE:**
	- stack install will install the pandoc executable into ~/.local/bin, which you should add to your PATH
	- This process will take a while, and will consume a considerable amount of disk space.


# Dependencies

## stack - Install
`https://docs.haskellstack.org/en/stable/install_and_upgrade/`
- Linux - Option 1: Script
	- wget -qO- https://get.haskellstack.org/ | sh
- Linux - Option 2: Package
**Dependencies:**
- `g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git gnupg`
	- https://www.stackage.org/stack/linux-x86_64-static
	- Unpack the archive and place `stack` somewhere on your %PATH%
	- run stack from the terminal.
- **Linux Note: ** To get tab-completion of commands on bash, just run the following (or add it to .bashrc)
	- `eval "$(stack --bash-completion-script stack)"`
	- more info see https://docs.haskellstack.org/en/stable/shell_autocompletion/
- Windows
	- https://www.stackage.org/stack/windows-x86_64
	- Unpack the archive and place stack.exe somewhere on your %PATH%
	- run stack from the terminal.

## MiKTeX - Windows
`https://miktex.org/portable`
- MiKTeX Portable is distributed as a 7-Zip self-extracting archive
- https://miktex.org/download/ctan/systems/win32/miktex/setup/miktex-portable-2.9.6326.exe
- use the 7-Zip file manager to extract the files
