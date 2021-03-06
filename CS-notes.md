# C-Sharp Snippets

[TOC]

## See Also
- Add links to follow up on


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
## String to Bytes
```cs
byte[] toBytes = Encoding.ASCII.GetBytes(somestring);
// reverse
string something = Encoding.ASCII.GetString(toBytes);
```

## Long to Bytes
```cs
byte[] bytes;
long longValue = 1234567891011121314;
bytes = BitConverter.GetBytes(longValue);
// reverse
long longValueBack = BitConverter.ToInt64(bytes, 0);
```

`BitConverter.ToUInt64 Method (Byte[], Int32)` Returns a 64-bit unsigned integer converted from eight bytes at a specified position in a byte array.

## DateTime.Ticks Property
`public long Ticks { get; }`
- Gets the number of ticks that represent the date and time of this instance
- A single tick represents one hundred nanoseconds or one ten-millionth of a second
- There are 10,000 ticks in a millisecond, or 10 million ticks in a second
- The value of this property represents the number of 100-nanosecond intervals that have elapsed since `12:00:00 midnight, January 1, 0001`
- `12:00:00 midnight, January 1, 0001` represents `DateTime.MinValue`
- Does not include the number of ticks that are attributable to leap seconds

## Base64
### System.Convert.ToBase64String
Converts the value of an array of 8-bit unsigned integers to its equivalent string representation that is encoded with base-64 digits.
```cs
public static string ToBase64String (
	  byte[] inArray
	, Base64FormattingOptions options
	);
//
[System.Flags]
public enum Base64FormattingOptions{
	InsertLineBreaks, // Inserts line breaks after every 76 characters in the string representation.
	None,
}
```
- The base-64 digits in ascending order from zero are the uppercase characters "A" to "Z", the lowercase characters "a" to "z", the numerals "0" to "9", and the symbols "+" and "/". The valueless character, "=", is used for trailing padding.
- The `ToBase64String` method is designed to process a single byte array that contains all the data to be encoded. To encode data from a stream, use the `System.Security.Cryptography.ToBase64Transform` class

### System.Convert.FromBase64String
Converts the specified string, which encodes binary data as base-64 digits, to an equivalent 8-bit unsigned integer array
```cs
public static byte[] FromBase64String(
	string s
)
```
- all white-space characters are ignored
- The `FromBase64Stringmethod` is designed to process a single string that contains all the data to be decoded. To decode base-64 character data from a stream, use the `System.Security.Cryptography.FromBase64Transform` class.

### Base64CharArray
`public static int ToBase64CharArray (byte[] inArray, int offsetIn, int length, char[] outArray, int offsetOut);`
Converts a subset of an 8-bit unsigned integer array to an equivalent subset of a Unicode character array encoded with base-64 digits. Parameters specify the subsets as offsets in the input and output arrays, and the number of elements in the input array to convert.

`public static byte[] FromBase64CharArray (char[] inArray, int offset, int length);`
Converts a subset of a Unicode character array, which encodes binary data as base-64 digits, to an equivalent 8-bit unsigned integer array. Parameters specify the subset in the input array and the number of elements to convert.

## Convert.ToUInt64 Method
Namespace: System
Converts a specified value to a 64-bit unsigned integer.
