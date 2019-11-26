# C-Sharp Snippets

[TOC]

## See Also
- [ ] `[StructLayout(LayoutKind.Explicit)]`
- [ ]  `System.Convert.ChangeType(Object, Type)`


## DbContext.GetValidationErrors
```cs
static Logger log = NLog.LogManager.GetCurrentClassLogger();
public static string WriteValidationErrors(IEnumerable<System.Data.Entity.Validation.DbEntityValidationResult> pValidationError)
{
	StringBuilder lsErrorMessage = new StringBuilder();
	int liCount = 0;
	foreach (System.Data.Entity.Validation.DbEntityValidationResult item in pValidationError)
	{
		lsErrorMessage.AppendFormat("State: {0} -> For {1}", item.Entry.State, item.Entry.Entity.ToString());
		liCount = 0;
		foreach (System.Data.Entity.Validation.DbValidationError vError in item.ValidationErrors)
		{
			liCount++;
			lsErrorMessage.AppendFormat("\t{0}\t{1}\t{2}", liCount, vError.PropertyName, vError.ErrorMessage);
		}
	}
	return lsErrorMessage.ToString();
}
```

## GetSecurePWD
```cs
public static string GetToken(string psPWD_Text)
{
	// do input validations
	string lsPwdTxt = psPWD_Text;

	System.Security.Cryptography.SHA256 sha256 = new System.Security.Cryptography.SHA256Managed();
	byte[] sha256Bytes = System.Text.Encoding.Default.GetBytes(lsPwdTxt);
	byte[] cryString = sha256.ComputeHash(sha256Bytes);
	// Inspect this BitConverter.ToString(cryString);
	string sha256Str = string.Empty;
	for (int i = 0; i < cryString.Length; i++)
	{
		sha256Str += cryString[i].ToString("X");
	}
	return sha256Str;
}
```

## Get Short Code v1
```
System.Threading.Thread.Sleep(MI_THREAD_SLEEP);
byte[] labSeed = BitConverter.GetBytes(DateTime.UtcNow.Ticks);
string lsCode = (BitConverter.ToInt32(labSeed, 0) ^ BitConverter.ToInt32(labSeed, 4)).ToString("X") + "YZ";
return string.Format("{0}-{1}-{2}", lsCode.Substring(0, 3), lsCode.Substring(3, 2), lsCode.Substring(5,3));
```
## Get Short Code v2
> tested with dotnet core 3.0

```cs
readonly static string[] BASE_CODES = new string[] {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "a", "A", "b", "B", "c", "C", "d", "D", "e", "E",
    "f", "F", "g", "G", "h", "H", "i", "I", "j", "J",
    "k", "K", "l", "L", "m", "M", "n", "N", "o", "O",
    "p", "P", "q", "Q", "r", "R", "s", "S", "t", "T",
    "u", "U", "v", "V", "w", "W", "x", "X", "y", "Y",
    "z", "Z",
    };
readonly static long NEW_BASE = BASE_CODES.Length;    // Can also be hardcoded.

/// <summary>
/// Generates short unique codes that are sortable.
/// Codes are based on timestamp, and uniqueness is guaranteed for one instance.
/// Uses <see cref="GetShortCode(System.Int32)"/> to process the code generation
/// </summary>
/// <param name="MaxLen">Length of the code desired, excluding formatting text</param>
/// <returns>code in format xxx-xxx-xxx...</returns>
/// <remarks>
/// Baseline date is 2019 Nov 11
/// 9 digits guarantee unique codes for 42.11 years
/// 8 digits guarantee unique codes for 00.08 years
/// </remarks>
/// permission
public static string GetShortCode(int MaxLen = 9){
  const long BASELINE_DATE = 637090074000000000;
  // System.Threading.Thread.Sleep(1);  // Uncomment line if Values are same cross multiple calls.
  return ConvertBase62(System.DateTime.UtcNow.Ticks - BASELINE_DATE, MaxLen);
}
// using System.Collections.Generic;
private static string ConvertBase62(long plBase10, int MaxLen = 9)
{
  List<long> lasCodes = new List<long>();
  bool lbDo = true;
  int liIdx = 0;

  // Generate code
  while (lbDo)
  {
    lasCodes.Add(plBase10 % NEW_BASE);
    plBase10 = plBase10 / NEW_BASE;
    liIdx++;
    if (NEW_BASE > plBase10)
    {
      lbDo = false;
      lasCodes.Add((int)plBase10);
    }
    else
    {
      lbDo = liIdx < MaxLen;
    }
  }

  // Prepare code for formatting
  string lsCode = "";
  lasCodes.Reverse();
  lasCodes.ForEach(vItem => { lsCode += BASE_CODES[vItem]; });
  lsCode = lsCode.PadLeft(MaxLen, '0');

  // Format and return
  return string.Format("{0}-{1}-{2}", lsCode.Substring(0, 3), lsCode.Substring(3, 3), lsCode.Substring(6));
}
```


## ReturnStatus
```cs
public class ReturnStatus
{
	public ReturnStatus()
	{
		Code = -1;
		Message = string.Empty;
		Exceptions = new List<Exception>();
	}

    /// <summary>
    /// Status Code of the Action Performed by the function
    /// </summary>
    public int Code { get; set; }

    /// <summary>
    /// Text message summurizing the outcome of exception
    /// </summary>
    public string Message { get; set; }

    /// <summary>
    /// Collection of all exceptions that occurred in the function while executing
    /// </summary>
    public List<Exception> Exceptions { get; set; }

}
```
