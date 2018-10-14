# dotnet publish
> https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-publish?tabs=netcore21


## Notes
- Read from and add notes from
	- https://docs.microsoft.com/en-us/visualstudio/msbuild/walkthrough-creating-an-msbuild-project-file-from-scratch?view=vs-2017

Packs the application and its dependencies into a folder for deployment to a hosting system.

```sh
dotnet publish
	[<PROJECT>]
	[-c|--configuration]
	[-f|--framework]
	[--force]
	[--manifest]
	[--no-build]
	[--no-dependencies]
    [--no-restore]
	[-o|--output]
	[-r|--runtime]
	[--self-contained]
	[-v|--verbosity]
	[--version-suffix]

dotnet publish [-h|--help]
```


## Note 1
```xml
<ItemGroup>
   <Content Update="wwwroot\LicenceFiles" CopyToPublishDirectory="Never" />
</ItemGroup>
```
