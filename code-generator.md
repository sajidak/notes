# Code Generator
> TODO: write Java equivalent code too.

Console (or IU) to generate code strings, using GUUID as seed

## Inputs

|  S# | Parameter         | Type      | Description                                              |
| ---:|:----------------- |:--------- |:-------------------------------------------------------- |
|   1 | Iterations        | Number    | Number of iterations to run in the batch                 |
|   2 | Segment Size      | Number    | Number of characters per segment                         |
|   3 | Segments per Code | Number    | Number of segments per code string                       |
|   4 | Segment Seperator | Character | Character to use for seperating segments. Default is `-` |


```cs
const int MI_GUID_LEN   = 32;
const int MI_MAX_LIMIT  = 10;
const int MI_CODE_COUNT = 0;
const int MI_GUID_COUNT = 1;

/// <summary>
/// Calculate Rounded number of GUIDs needed to generate Codes of given length
/// </summary>
/// <param name="piSegmentSize">Number of characters in each segment of the code</param>
/// <param name="piSegmentCount">Number of segments in each code</param>
/// <returns>Array of with counts of total GUIDs to be concatenated and the number of Codes that will be generated from thence. Used to calculate number of Codes for one run (iteration)</returns>
private static int[] getCounts(int piSegmentSize = 4, int piSegmentCount = 3)
{
  int[] laiCounts = new int[2];

  // GUUID will be 32 chars
  // Calculate possible count using segment size and segment count
  // Derive a formula to run the calculation in one step

  int liGuidLen = MI_GUID_LEN;    // starts with 32, and incremented by 32 per iteration
  int liCodeLen = piSegmentSize * piSegmentCount;
  int liGuidCount = 1;
  int liModulus = -1;
  int liReminder = 0; // .NET will truncate the fraction, and return only the whole number part

  // Add input parameter validation
  if ((piSegmentSize <= 0) || (piSegmentCount <= 0))
  {
    // log a  new ArgumentOutOfRangeException()
    // Caller should check for -ve values
    for (int i = 0; i < laiCounts.Length; i++) { laiCounts[i] = -1; }
  }

  bool lbDone = false;
  do
  {
    liReminder = liGuidLen / liCodeLen;
    liModulus = liGuidLen % liCodeLen;
    lbDone = (liModulus == 0) && (liReminder > 0);
    if (!lbDone)
    {
      liGuidLen += MI_GUID_LEN;
      liGuidCount++;
    }
    if (liGuidCount > MI_MAX_LIMIT) lbDone = true; // avoid infinite loop
  } while (!lbDone);

  if (liGuidCount > MI_MAX_LIMIT)
  {
    // Flag error condition
    Console.WriteLine("Needs more than 10 GUIDS, investigate use case");
  }

  laiCounts[MI_GUID_COUNT] = liGuidCount;
  laiCounts[MI_CODE_COUNT] = liReminder;

  return laiCounts;
}

/// <summary>
/// Generates Codes, and returns with one code per line
/// </summary>
/// <param name="piIterPerBatch">Number of times to repeat the code generation</param>
/// <param name="piSegSize">Number of characters in each segment of the code</param>
/// <param name="piSegCount">Number of segments in each code</param>
/// <param name="prSegSep">Character to use for seperating each segment of the code</param>
/// <returns>Generated Codes, one per line</returns>
public static string GenerateCodes(int piIterPerBatch, int piSegSize, int piSegCount, char prSegSep = '-')
{
  StringBuilder lsbDatas = new StringBuilder();
  string lsGUIDs = string.Empty;
  int liCodeCount, liGuidCount, liCodeSize;

  // Add input parameter validation
  if (
       (piIterPerBatch <= 0)
    || (piSegSize <= 0)
    || (piSegCount <= 0)
    )
  {
    // Setup validation error message, identify each individual failure
    lsbDatas.AppendLine("INPUT DATA FAILED VALIDATION");
    return lsbDatas.ToString(); // Should contain validation errors.
  }

  int[] laiCounts = getCounts(piSegSize, piSegCount);  
  liCodeCount = laiCounts[MI_CODE_COUNT];
  liGuidCount = laiCounts[MI_GUID_COUNT];

  // Get the full length code string data
  lsbDatas.Clear();
  for (int vGuidCount = 0; vGuidCount < liGuidCount * piIterPerBatch; vGuidCount++)
  {
    lsGUIDs += Guid.NewGuid().ToString("N");
    lsbDatas.Append(Guid.NewGuid().ToString("N"));
  }
  lsGUIDs = lsbDatas.ToString();

  string lsCode = string.Empty;
  liCodeSize = piSegSize * piSegCount;

  // Validate if we have enough chars
  if (liCodeSize * liCodeCount * piIterPerBatch > lsGUIDs.Length)
  {
    // Flag error condition
    Console.WriteLine("ERROR: (liCodeSize * liCodeCount > lsGUIDs.Length)");
    lsbDatas.AppendLine("ERROR: (liCodeSize * liCodeCount > lsGUIDs.Length)");
    return lsbDatas.ToString(); // Should contain appropiate error data.
  }

  // Process one code at a time
  lsbDatas.Clear();
  for (int viCode = 0; viCode < (liCodeSize * liCodeCount * piIterPerBatch); viCode += liCodeSize)
  {
    // Process one segment at a time
    lsCode = string.Empty;
    for (int viSeg = viCode; viSeg < viCode + liCodeSize; viSeg += piSegSize)
    {  lsCode += lsGUIDs.Substring(viSeg, piSegSize) + prSegSep;  }
    lsbDatas.AppendLine(lsCode.TrimEnd(prSegSep));
  }
  return lsbDatas.ToString();
}

```

## Others
### For non-critical codes (1)
```cs
const int MI_THREAD_SLEEP = 1;	// Need to change thread to get new timestamp
System.Threading.Thread.Sleep(MI_THREAD_SLEEP);
byte[] labSeed = BitConverter.GetBytes(DateTime.UtcNow.Ticks);
string lsCode = (BitConverter.ToInt32(labSeed, 0) ^ BitConverter.ToInt32(labSeed, 4)).ToString("X") + "YZ";
return string.Format("{0}-{1}-{2}", lsCode.Substring(0, 3), lsCode.Substring(3, 2), lsCode.Substring(5, 3));
```

### For non-critical codes (2)
```cs
for (int j = 0; j < 10; j++)
{
	lsData = DateTime.Now.Ticks.ToString("X").ToLower().PadLeft(16, '0');
	lsOut = string.Empty; for (int i = 12; i > 7; i -= 4) { lsOut += lsData.Substring(i, 4) + "-"; };
	lsOut = lsOut.TrimEnd('-');
	Console.WriteLine(lsOut);
	System.Threading.Thread.Sleep(1);
};
```
