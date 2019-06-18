# dotnet-script

> run standalone c# files from terminal/command prompt
>	or use them as system commands

## Links
- https://github.com/filipw/dotnet-script
- https://www.hanselman.com/blog/CAndNETCoreScriptingWithTheDotnetscriptGlobalTool.aspx
- https://gldraphael.com/blog/csharp-scripts-using-dotnet-script/
- https://github.com/dotnet-state-machine/stateless

## Samples
- Pre-req
	```sh
	dotnet tool install -g dotnet-script
	```
- File (helloworld.csx)
	```cs
	#!/usr/bin/env dotnet-script
	Console.WriteLine("Hello world");
	```
- run
```sh
dotnet script helloworld.csx
```

## Debuggable
- init command
- creates a .csx (C# script) file
- along with an omnisharp.json file for intellisense
- and a VS Code launch.json file for debug support.
	```sh
	mkdir console
	cd console
	dotnet script init hello
	dotnet script hello.csx
	```
## with nugets (e.g. stateless)
- Create a new script using dotnet script init stateless
- Import the nuget package using the roslyn #r directive.
`#r "nuget: Stateless, 4.2.1"`
- Add using statements if needed
- stateless.csx
```cs
#!/usr/bin/env dotnet-script
#r "nuget: Stateless, 4.2.1"

// Copied from: https://github.com/dotnet-state-machine/stateless/blob/dev/example/OnOffExample/Program.cs
using Stateless;

const string on = "On";
const string off = "Off";
const char space = ' ';

// Instantiate a new state machine in the 'off' state
var onOffSwitch = new StateMachine<string, char>(off);

// Configure state machine with the Configure method, supplying the state to be configured as a parameter
onOffSwitch.Configure(off).Permit(space, on);
onOffSwitch.Configure(on).Permit(space, off);

Console.WriteLine("Press <space> to toggle the switch. Any other key will exit the program.");

while (true)
{
    Console.WriteLine("Switch is in state: " + onOffSwitch.State);
    var pressed = Console.ReadKey(true).KeyChar;

    // Check if user wants to exit
    if (pressed != space) break;

    // Use the Fire method with the trigger as payload to supply the state machine with an event.
    // The state machine will react according to its configuration.
    onOffSwitch.Fire(pressed);
}
```

## Debugging in VS Code
- While running the application you'll most likely see this error: "Cannot read keys when either application does not have a console or when console input has been redirected."
- because VS Code uses the Debug Console by default which does not support console input.
- You can change that by configuring it to use the integrated terminal instead,
- by adding a `"console": "integratedTerminal"` property to .vscode/launch.json.
- More information at https://github.com/OmniSharp/omnisharp-vscode/blob/master/debugger-launchjson.md#console-terminal-window
