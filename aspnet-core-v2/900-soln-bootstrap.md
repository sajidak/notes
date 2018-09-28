# Command set

```sh
mkdir RamzanNoveltyV2; cd RamzanNoveltyV2;
dotnet new sln;

mkdir rn.web; cd rn.web;
dotnet new mvc --language "C#" -au Individual
cd ..
# dotnet sln RamzanNoveltyV2.sln add rn.web/rn.web.csproj


mkdir rn.Efc; cd rn.Efc;
dotnet new classlib --language "C#" --framework netcoreapp2.1
cd ..
# dotnet sln RamzanNoveltyV2.sln add rn.Efc/rn.Efc.csproj

mkdir rn.Utils; cd rn.Utils;
dotnet new classlib --language "C#" --framework netcoreapp2.1
cd ..
# dotnet sln RamzanNoveltyV2.sln add rn.Utils/rn.Utils.csproj

## New set

dotnet sln RamzanNoveltyV2.sln add **/*.csproj

# dotnet add [<PROJECT>] reference [-f|--framework] <PROJECT_REFERENCES> [-h|--help]

dotnet add rn.Efc/rn.Efc.csproj reference rn.Utils/rn.Utils.csproj
dotnet add rn.web/rn.web.csproj reference rn.Utils/rn.Utils.csproj rn.Efc/rn.Efc.csproj

```
