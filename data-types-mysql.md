# Storage Requirements
| Data Type                   | Storage Required                                                                                                           |
|:--------------------------- |:-------------------------------------------------------------------------------------------------------------------------- |
| TINYINT                     | 1 byte                                                                                                                     |
| SMALLINT                    | 2 bytes                                                                                                                    |
| MEDIUMINT                   | 3 bytes                                                                                                                    |
| INT, INTEGER                | 4 bytes                                                                                                                    |
| BIGINT                      | 8 bytes                                                                                                                    |
| FLOAT(p)                    | 4 bytes if 0 <= p <= 24, 8 bytes if 25 <= p <= 53                                                                          |
| FLOAT                       | 4 bytes                                                                                                                    |
| DOUBLE [PRECISION], REAL    | 8 bytes                                                                                                                    |
| DECIMAL(M,D), NUMERIC(M,D)  | Varies; see following discussion                                                                                           |
| BIT(M)                      | approximately (M+7)/8 bytes                                                                                                |
|                             |                                                                                                                            |
| YEAR                        | 1 byte                                                                                                                     |
| DATE                        | 3 bytes                                                                                                                    |
| TIME                        | 3 bytes + fractional seconds storage                                                                                       |
| DATETIME                    | 5 bytes + fractional seconds storage                                                                                       |
| TIMESTAMP                   | 4 bytes + fractional seconds storage                                                                                       |
|                             |                                                                                                                            |
| CHAR(M)                     | M × w bytes, 0 <= M <= 255, where w is the number of bytes required for the maximum-length character in the character set. |
| BINARY(M)                   | M bytes, 0 <= M <= 255                                                                                                     |
| VARCHAR(M), VARBINARY(M)    | L + 1 bytes if column values require 0 − 255 bytes, L + 2 bytes if values may require more than 255 bytes                  |
| TINYBLOB, TINYTEXT          | L + 1 bytes, where L < 28                                                                                                  |
| BLOB, TEXT                  | L + 2 bytes, where L < 216                                                                                                 |
| MEDIUMBLOB, MEDIUMTEXT      | L + 3 bytes, where L < 224                                                                                                 |
| LONGBLOB, LONGTEXT          | L + 4 bytes, where L < 232                                                                                                 |
| ENUM('value1','value2',...) | 1 or 2 bytes, depending on the number of enumeration values (65,535 values maximum)                                        |
| SET('value1','value2',...)  | 1, 2, 3, 4, or 8 bytes, depending on the number of set members (64 members maximum)                                        |
|                             |                                                                                                                            |

# Data Types
| Type      | Storage | Minimum Value        | Maximum Value        | Note               |
| --------- | ------- | -------------------- | -------------------- | ------------------ |
|           | (Bytes) | (Signed/Unsigned)    | (Signed/Unsigned)    |                    |
| --------- | ------- | -------------------- | -------------------- | ----               |
| TINYINT   | 1       | -128                 | 127                  |                    |
|           |         | 0                    | 255                  |                    |
| SMALLINT  | 2       | -32768               | 32767                |                    |
|           |         | 0                    | 65535                |                    |
| MEDIUMINT | 3       | -8388608             | 8388607              |                    |
|           |         | 0                    | 16777215             |                    |
| INT       | 4       | -2147483648          | 2147483647           |                    |
|           |         | 0                    | 4294967295           |                    |
| BIGINT    | 8       | -9223372036854775808 | 9223372036854775807  |                    |
|           |         | 0                    | 18446744073709551615 |                    |
| DECIMAL   |         |                      |                      | max digits 65      |
| NUMERIC   |         |                      |                      | max digits 65      |
| DATE      |         | 1000-01-01           | 9999-12-31           |                    |
| DATETIME  |         | 1000-01-01 00:00:00  | 9999-12-31 23:59:59  | YYY-MM-DD HH:MM:SS |
| TIMESTAMP |         | 1970-01-01 00:00:01  | 2038-01-19 03:14:07  | in UTC             |
|           |         |                      |                      |                    |


- `YYYY-MM-DD HH:MM:SS[.fraction]`
- TIMESTAMP
	- CURRENT_TIMESTAMP
	- To specify automatic properties, use the DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses in column definitions
	- CURRENT_TIMESTAMP(), NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, and LOCALTIMESTAMP().
	- With both DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP, the column has the current timestamp for its default value and is automatically updated to the current timestamp.
		```sql
		CREATE TABLE t1 (
		  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		  dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
		);
		```
	- `CREATE TABLE fractest( c1 TIME(2), c2 DATETIME(2), c3 TIMESTAMP(2) );`


## String Types
### CHAR and VARCHAR Types
- The length of a CHAR column is fixed to the length that you declare when you create the table. The length can be any value from 0 to 255.
- Values in VARCHAR columns are variable-length strings. The length can be specified as a value from 0 to 65,535.
### BINARY and VARBINARY Types
- The BINARY and VARBINARY types are similar to CHAR and VARCHAR, except that they contain binary strings rather than nonbinary strings.
### BLOB and TEXT Types
- A BLOB is a binary large object that can hold a variable amount of data.
- The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.
### ENUM Type
