# csproj format for .NET Core
> https://docs.microsoft.com/en-us/dotnet/core/tools/csproj

## Gen Notes
- see the whole project as MSBuild sees it
	- dotnet msbuild -pp:fullproject.xml
	- `fullproject.xml` will have details

## PackageReference
`<PackageReference Include="<package-id>" Version="" PrivateAssets="" IncludeAssets="" ExcludeAssets="" />`

- IncludeAssets attribute specifies what assets belonging to the package specified by `<PackageReference>` should be consumed.
- ExcludeAssets attribute specifies what assets belonging to the package specified by `<PackageReference>` should not be consumed.
- PrivateAssets attribute specifies what assets belonging to the package specified by `<PackageReference>` should be consumed but that they should not flow to the next project.
- These attributes can contain one or more of the following items:
    - `Compile` – the contents of the lib folder are available to compile against.
    - `Runtime` – the contents of the runtime folder are distributed.
    - `ContentFiles` – the contents of the contentfiles folder are used.
    - `Build` – the props/targets in the build folder are used.
    - `Native` – the contents from native assets are copied to the output folder for runtime.
    - `Analyzers` – the analyzers are used.

## Properties
- version
	```xml
	<PropertyGroup>
	  <VersionPrefix>1.0.0</VersionPrefix>
	  <VersionSuffix>alpha</VersionSuffix>
	</PropertyGroup>
	```

- Other common root-level options
	```xml
	<PropertyGroup>
	  <Authors>Anne;Bob</Authors>
	  <Company>Contoso</Company>
	  <NeutralLanguage>en-US</NeutralLanguage>
	  <AssemblyTitle>My library</AssemblyTitle>
	  <Description>This is my library. And it's really great!</Description>
	  <Copyright>Nugetizer 3000</Copyright>
	  <UserSecretsId>xyz123</UserSecretsId>
	</PropertyGroup>
	```
- Common pack options
```xml
<PropertyGroup>
  <!-- summary is not migrated from project.json, but you can use the <Description> property for that if needed. -->
  <PackageTags>machine learning;framework</PackageTags>
  <PackageReleaseNotes>Version 0.9.12-beta</PackageReleaseNotes>
  <PackageIconUrl>http://numl.net/images/ico.png</PackageIconUrl>
  <PackageProjectUrl>http://numl.net</PackageProjectUrl>
  <PackageLicenseUrl>https://raw.githubusercontent.com/sethjuarez/numl/master/LICENSE.md</PackageLicenseUrl>
  <PackageRequireLicenseAcceptance>false</PackageRequireLicenseAcceptance>
  <RepositoryType>git</RepositoryType>
  <RepositoryUrl>https://raw.githubusercontent.com/sethjuarez/numl</RepositoryUrl>
  <!-- owners is not supported in MSBuild -->
</PropertyGroup>
```

- scripts
```xml
<Target Name="MyPreCompileTarget" BeforeTargets="Build">
  <Exec Command="generateCode.cmd" />
</Target>

<Target Name="MyPostCompileTarget" AfterTargets="Publish">
  <Exec Command="obfuscate.cmd" />
  <Exec Command="removeTempFiles.cmd" />
</Target>
```

- files
```xml
<ItemGroup>
  <Compile Include="..\Shared\*.cs" Exclude="..\Shared\Not\*.cs" />
  <EmbeddedResource Include="..\Shared\*.resx" />
  <Content Include="Views\**\*" PackagePath="%(Identity)" />
  <None Include="some/path/in/project.txt" Pack="true" PackagePath="in/package.txt" />

  <None Include="notes.txt" CopyToOutputDirectory="Always" />
  <!-- CopyToOutputDirectory = { Always, PreserveNewest, Never } -->

  <Content Include="files\**\*" CopyToPublishDirectory="PreserveNewest" />
  <None Include="publishnotes.txt" CopyToPublishDirectory="Always" />
  <!-- CopyToPublishDirectory = { Always, PreserveNewest, Never } -->
</ItemGroup>
```

## MSBuild
> https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-project-file-schema-reference?view=vs-2017

- Item element
	```xml
	<Item Include="*.cs"
	        Exclude="MyFile.cs"
	        Remove="RemoveFile.cs"
	        Condition="'String A'=='String B'" >
	    <ItemMetadata1>...</ItemMetadata1>
	    <ItemMetadata2>...</ItemMetadata2>
	</Item>
	```
- x
- 
