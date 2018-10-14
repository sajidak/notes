# for .NET Core 2 Console application
> https://github.com/NLog/NLog.Extensions.Logging/wiki/Getting-started-with-.NET-Core-2---Console-application

- Add dependency
```sh
dotnet add package NLog
```
- Create a nlog.config file
- Write log messages
```cs
var logger = NLog.LogManager.GetCurrentClassLogger();
logger.Info("Hello World");
```

## Log levels
- Trace
- Debug
- Info
- Error
- Fatal

## Best Practices for Logging
1. Logger should be a static variable in each class
2. Logger should handle string formatting
3. Logger should be given the Exception
4. Validate XML configuration from NLog.config
5. Remember to Flush

## Notes
- `<nlog throwExceptions="true">`
- formatting is controlled by the datatype of the parameter:
    - string: surrounded with double quotes, e.g "hello"
    - number: no quotes
    - null: printed as NULL
    - list/ienumerable/array: "item1", "item2"
    - dictionary: "key1"="value1", "key2"="value2"
    - objects: ToString()
    - `@` will format the object as JSON
    - `$` forces ToString()


## Structured logging

e.g.:
```cs
logger.Info("Logon by {user} from {ip_address}", "Kenny", "127.0.0.1"); // Logon by "Kenny" from "127.0.0.1"
logger.Debug("{shopitem} added to basket by {user}", new { Id=6, Name = "Jacket", Color = "Orange" }, "Kenny");
```
