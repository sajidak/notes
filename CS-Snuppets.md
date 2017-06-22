# C-Sharp Snippets

## GUID Structure
System (in mscorlib.dll)
### public static Guid NewGuid()
### Guid.ToString Method (String)
- The following table shows the accepted format specifiers for the format parameter.
- "0" represents a digit; hyphens ("-"), braces ("{", "}"), and parentheses ("(", ")") appear as shown.
- The hexadecimal digits a through f are lowercase in the returned string. To convert them to uppercase, call the String.ToUpper method on the returned string.

| **Specifier** |                                   **Format of return value**                                    |
| ------------- | ----------------------------------------------------------------------------------------------- |
| **N**         | 32 digits:                                                                                      |
|               | `00000000000000000000000000000000`                                                                |
| **D**         | 32 digits separated by hyphens:                                                                 |
|               | `00000000-0000-0000-0000-000000000000`                                                            |
| **B**         | 32 digits separated by hyphens, enclosed in braces:                                             |
|               | `{00000000-0000-0000-0000-000000000000}`                                                          |
| **P**         | 32 digits separated by hyphens, enclosed in parentheses:                                        |
|               | `(00000000-0000-0000-0000-000000000000)`                                                          |
| **X**         | Four hexadecimal values enclosed in braces,                                                     |
|               | where the fourth value is a subset of eight hexadecimal values that is also enclosed in braces: |
|               | `{0x00000000,0x0000,0x0000,{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}}`                            |
