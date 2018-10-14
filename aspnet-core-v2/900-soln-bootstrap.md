# Command set

```sh
mkdir RNv2; cd RNv2;
dotnet new sln;

mkdir -vp rn.Utils;cd rn.Utils;
dotnet new classlib --language "C#" --framework netcoreapp2.1;
dotnet add package NLog;
touch README.md;
mkdir -vp Constants; 	# for constants and enum definitions
touch Constants/README.md;
cd ..;

mkdir -vp rn.Efc;cd rn.Efc;
dotnet new classlib --language "C#" --framework netcoreapp2.1;
dotnet add package NLog;
dotnet add Microsoft.EntityFrameworkCore.Design
dotnet add Pomelo.EntityFrameworkCore.MySql
touch README.md;
mkdir -vp DbFuncs;
touch DbFuncs/README.md;
cd ..;

mkdir -vp webrn;cd webrn;
dotnet new mvc --language "C#" -au Individual;
dotnet add package NLog;
dotnet add package NLog.Web.AspNetCore;
dotnet add Pomelo.EntityFrameworkCore.MySql
touch README.md;
mkdir -vp Core; 	# for Interfaces and app specific classes
touch Core/README.md;
touch NLog.config;
touch NLog.Development.config;
cd ..;

# Add project references
# dotnet add [<PROJECT>] reference [-f|--framework] <PROJECT_REFERENCES> [-h|--help]
dotnet add rn.Efc/rn.Efc.csproj reference rn.Utils/rn.Utils.csproj
dotnet add rn.web/rn.web.csproj reference rn.Utils/rn.Utils.csproj rn.Efc/rn.Efc.csproj

# All all the projects to solution
dotnet sln RNv2.sln add **/*.csproj

# All supporting files
mkdir 01-Notes;
touch 01-Notes/_local-notes.md;
mkdir x-out;	# folder for generated outputs
touch /x-out/README.md;
mkdir x-out/publish2host;
touch LICENSE;
touch .gitignore;
touch README.md;

# back to init dir
cd ..;

```
