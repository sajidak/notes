# Go Language - Notes
`30 Jan 2018`

# Buffer
> Buffer to manage content till it is organized <br>

## 01 Mar 2018
### doc.go
- https://godoc.org/github.com/fluhus/godoc-tricks

### time + reflect
- Code Sample
```go
package main

import (
	"encoding/binary"
	"encoding/hex"
	"fmt"
	"reflect"
	"strings"
	"time"
)

func main() {
	fmt.Println("The time is ", time.Now())
	fmt.Println(time.Now().Unix())
	fmt.Println(time.Now().UnixNano())

	durUnix := time.Now().Unix()
	durNano := time.Now().UnixNano()
	fmt.Println(reflect.TypeOf(durUnix), ", ", reflect.TypeOf(durNano))

	fmt.Println("\nInt64 to Byte")
	buf := make([]byte, binary.MaxVarintLen64)
	fmt.Println("BEFORE = Len:", len(buf), ", Contents:", buf)
	n := binary.PutVarint(buf, durNano)
	fmt.Println("ATFER  = Size/Write:", len(buf), "/", n, ", Contents:", buf)

	fmt.Println("\nXOR Test")
	hexSTR := runTestXOR(buf[:5], buf[5:])
	fmt.Println("runTestXOR = ", hexSTR)

	fmt.Println("\nGenerating bulk codes, for duplication")
	for i := 0; i < 21; i++ {
		fmt.Println(fmt.Sprintf("%4d - %v", i, getCodeShort()))
		time.Sleep(11 * time.Nanosecond)
	}

}

func getCodeShort() string {
	buf := make([]byte, binary.MaxVarintLen64)
	binary.PutVarint(buf, time.Now().UnixNano())
	xba := make([]byte, 5)
	for i := 0; i < 5; i++ {
		xba[i] = buf[i] ^ buf[i+5]
	}
	// return fmt.Sprintf("%X-%X-%X", xba[0:2], xba[2:3], xba[3:])	// Upper
	return fmt.Sprintf("%x-%x-%x", xba[0:2], xba[2:3], xba[3:])     // Lower
}

func runTestXOR(a []byte, b []byte) string {
	fmt.Println("Running XOR Test")
	fmt.Println("A = Len:", len(a), ", Contents:", a)
	fmt.Println("B = Len:", len(b), ", Contents:", b)

	xba := make([]byte, 5)
	for i := 0; i < 5; i++ {
		xba[i] = a[i] ^ b[i]
	}
	fmt.Println("XBA = Len:", len(xba), ", Contents:", xba)
	hexStr := hex.EncodeToString(xba)
	fmt.Println("XOR string", hexStr)

	fmtStr := fmt.Sprintf("%X-%X-%X", xba[0:2], xba[2:3], xba[3:])
	// fmt.Println("FMT string", fmtStr)

	return strings.ToUpper(fmtStr)
}
```
- Output
	```text
	The time is  2009-11-10 23:00:00 +0000 UTC m=+0.000000001
	1257894000
	1257894000000000000
	int64 ,  int64

	Int64 to Byte
	BEFORE = Len: 10 , Contents: [0 0 0 0 0 0 0 0 0 0]
	ATFER  = Size/Write: 10 / 9 , Contents: [128 128 195 177 181 251 247 244 34 0]

	XOR Test
	Running XOR Test
	A = Len: 5 , Contents: [128 128 195 177 181]
	B = Len: 5 , Contents: [251 247 244 34 0]
	XBA = Len: 5 , Contents: [123 119 55 147 181]
	XOR string 7b773793b5
	runTestXOR =  7B77-37-93B5

	Generating bulk codes, for duplication
	 0 - 7b77-37-93b5
	 1 - 6d77-37-93b5
	 2 - 5777-37-93b5
	 3 - 3977-37-93b5
	 4 - 2377-37-93b5
	 5 - 1577-37-93b5
	 6 - 7f76-37-93b5
	 7 - 6176-37-93b5
	 8 - 4b76-37-93b5
	 9 - 3d76-37-93b5
	 ... truncated for space
	```

## 27 Feb 2018
### Print Formatting
- `return fmt.Sprintf("at %v, %s", e.When, e.What)`
- https://golang.org/pkg/fmt/
- see [**Table: Print Formatting Flags**] below

#### Also
- https://golang.org/pkg/text/template/
- https://golang.org/pkg/html/template/


### Base64
https://golang.org/pkg/encoding/base64/

#### EncodeToString
`func (enc *Encoding) EncodeToString(src []byte) string`
```go {.numberLines}
package main
import (
	"encoding/base64"
	"fmt"
)

func main() {
	data := []byte("any + old & data")
	str := base64.StdEncoding.EncodeToString(data)
	fmt.Println(str)
}
```

#### DecodeString
`func (enc *Encoding) DecodeString(s string) ([]byte, error)`
```go {.numberLines}
package main
import (
	"encoding/base64"
	"fmt"
)

func main() {
	str := "c29tZSBkYXRhIHdpdGggACBhbmQg77u/"
	data, err := base64.StdEncoding.DecodeString(str)
	if err != nil {
		fmt.Println("error:", err)
		return
	}
	fmt.Printf("%q\n", data)
}
```

## 25 Feb 2018
### Operators
| OPR  | Function                                                                                                                |
| :---- | :----------------------------------------------------------------------------------------------------------------------- |
| `%`  | Modulus operator; gives the remainder after an integer division.                                                        |
| `++` | Increment operator. It increases the integer value by one.                                                              |
| `^`  | Binary XOR Operator                                                                                                     |
| `<<` | Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand. |
| `&`  | Returns the address of a variable                                                                                       |
| `*`  | Pointer to a variable                                                                                                   |

### Slices
- The type specification for a slice is `[]T`, where T is the type of the elements of the slice.
- Unlike an array type, a slice type has no specified length.
- A slice literal is declared just like an array literal, except you leave out the element count:
- `letters := []string{"a", "b", "c", "d"}`
- A slice can be created with the built-in function called make, which has the signature,
	```go
	// func make([]T, len, cap) []T
	s := make([]byte, 5)

	// alternate syntax
	var s []byte
	s = make([]byte, 5, 5)
	// s == []byte{0, 0, 0, 0, 0}
	```
- length and capacity of a slice can be inspected using the built-in len and cap functions.
	- len(s) == 5
	- cap(s) == 5

### String to-from Bytes
- Sample 1
	```go
	// each conversion creates a copy of the value
	s := "some string"
	b := []byte(s) // convert string -> []byte
	s2 := string(b) // convert []byte -> string
	```
- Sample 2:
	```go
	fmt.Println([]byte("abc日")) // [97 98 99 230 151 165]
	```

## 23 Feb 2018
### Mongo Drivers
In order of preference
- https://github.com/globalsign/mgo

### UUIDs
- https://github.com/google/uuid
	- go get github.com/google/uuid
	- based on RFC 4122 and DCE 1.1: Authentication and Security Services
	- type UUID [16]byte
	- func New() UUID // v1
	- func NewRandom() (UUID, error) // v4
	- func (uuid UUID) Version() Version
- github.com/satori/go.uuid
	- 8 bytes of time (milliseconds) + 9 random bytes
	- `-Kmdih_fs4ZZccpx2Hl1`
	- type UUID [Size]byte
	- func NewV4() (UUID, error)
	- func (u UUID) String() string
		- `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`
	- func (u UUID) Version() byte
- github.com/chilts/sid
	- 8 bytes of time (ns) + 8 random bytes
	- generate sortable identifiers
	- go get github.com/chilts/sid
	- `1JADkqpWxPx-4qaWY47~FqI`
- github.com/kjk/betterguid
	- UUIDv4 from RFC 4112 for comparison
	- `5b52d72c-82b3-4f8e-beb5-437a974842c`

### Byte to Hex
- https://golang.org/pkg/encoding/hex/
	- `func EncodeToString(src []byte) string`
	- EncodeToString returns the hexadecimal encoding of src.
	- `func DecodeString(s string) ([]byte, error)`
	- DecodeString returns the bytes represented by the hexadecimal string s.

### XOR
- https://homerl.github.io/2016/03/29/golang-bitwise-operators/
- https://github.com/golang/go/blob/master/src/crypto/cipher/xor.go
- https://github.com/KyleBanks/XOREncryption.git

### mgo.dial

`func Dial(url string) (*Session, error)`

- Dial establishes a new session to the cluster identified by the given seed server(s). The session will enable communication with all of the servers in the cluster, so the seed servers are used only to find out about the cluster topology.

- Dial will timeout after 10 seconds if a server isn't reached. The returned session will timeout operations after one minute by default if servers aren't available. To customize the timeout, see DialWithTimeout, SetSyncTimeout, and SetSocketTimeout.

- This method is generally called just once for a given cluster. Further sessions to the same cluster are then established using the New or Copy methods on the obtained session. This will make them share the underlying cluster, and manage the pool of connections appropriately.

- Once the session is not useful anymore, Close must be called to release the resources appropriately.



## 30 Jan 2018

### Structs
- You can name the fields when initializing a struct.
- Omitted fields will be zero-valued.
- An `&` prefix yields a pointer to the struct.
- Access struct fields with a dot.
- You can also use dots with struct pointers - the pointers are automatically dereferenced.
- Structs are mutable.

- Go supports methods defined on struct types.
```go
type rect struct {
    width, height int
}
func (r *rect) area() int {
    return r.width * r.height
}
r := rect{width: 10, height: 5}
fmt.Println("area: ", r.area())
```

### Interfaces
https://gobyexample.com/interfaces
- Interfaces are named collections of method signatures.


## Appendices

## Table: Print Formatting Flags

| Flag                                                                   | Descriotion                                                                                                                                                                                                                                                                                                                                                                                          |
|:---------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **General:**                                                           |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %v                                                                     | the value in a default format <br> when printing structs, the plus flag (%+v) adds field names                                                                                                                                                                                                                                                                                                       |
| %#v                                                                    | a Go-syntax representation of the value                                                                                                                                                                                                                                                                                                                                                              |
| %T                                                                     | a Go-syntax representation of the type of the value                                                                                                                                                                                                                                                                                                                                                  |
| %%                                                                     | a literal percent sign; consumes no value                                                                                                                                                                                                                                                                                                                                                            |
| **Boolean:**                                                           |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %t                                                                     | the word true or false                                                                                                                                                                                                                                                                                                                                                                               |
| **Integer:**                                                           |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %b                                                                     | base 2                                                                                                                                                                                                                                                                                                                                                                                               |
| %c                                                                     | the character represented by the corresponding Unicode code point                                                                                                                                                                                                                                                                                                                                    |
| %d                                                                     | base 10                                                                                                                                                                                                                                                                                                                                                                                              |
| %o                                                                     | base 8                                                                                                                                                                                                                                                                                                                                                                                               |
| %q                                                                     | a single-quoted character literal safely escaped with Go syntax.                                                                                                                                                                                                                                                                                                                                     |
| %x                                                                     | base 16, with lower-case letters for a-f                                                                                                                                                                                                                                                                                                                                                             |
| %X                                                                     | base 16, with upper-case letters for A-F                                                                                                                                                                                                                                                                                                                                                             |
| %U                                                                     | Unicode format: U+1234; same as "U+%04X"                                                                                                                                                                                                                                                                                                                                                             |
| **Floating-point and complex constituents:**                           |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %b                                                                     | decimalless scientific notation with exponent a power of two, <br> in the manner of strconv.FormatFloat with the 'b' format, <br> e.g. -123456p-78                                                                                                                                                                                                                                                   |
| %e                                                                     | scientific notation, e.g. -1.234456e+78                                                                                                                                                                                                                                                                                                                                                              |
| %E                                                                     | scientific notation, e.g. -1.234456E+78                                                                                                                                                                                                                                                                                                                                                              |
| %f                                                                     | decimal point but no exponent, e.g. 123.456                                                                                                                                                                                                                                                                                                                                                          |
| %F                                                                     | synonym for %f                                                                                                                                                                                                                                                                                                                                                                                       |
| %g                                                                     | %e for large exponents, %f otherwise. Precision is discussed below.                                                                                                                                                                                                                                                                                                                                  |
| %G                                                                     | %E for large exponents, %F otherwise                                                                                                                                                                                                                                                                                                                                                                 |
| **String and slice of bytes (treated equivalently with these verbs):** |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %s                                                                     | the uninterpreted bytes of the string or slice                                                                                                                                                                                                                                                                                                                                                       |
| %q                                                                     | a double-quoted string safely escaped with Go syntax                                                                                                                                                                                                                                                                                                                                                 |
| %x                                                                     | base 16, lower-case, two characters per byte                                                                                                                                                                                                                                                                                                                                                         |
| %X                                                                     | base 16, upper-case, two characters per byte                                                                                                                                                                                                                                                                                                                                                         |
| **Pointer:**                                                           |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %p                                                                     | base 16 notation, with leading 0x <br> The %b, %d, %o, %x and %X verbs also work with pointers, <br> formatting the value exactly as if it were an integer. <br> The default format for %v is:                                                                                                                                                                                                       |
| %t                                                                     | bool:                                                                                                                                                                                                                                                                                                                                                                                                |
| %d                                                                     | int, int8 etc.: <br> %d, %#x if printed with %#v <br>uint, uint8 etc.:                                                                                                                                                                                                                                                                                                                               |
| %g                                                                     | float32, complex64, etc:                                                                                                                                                                                                                                                                                                                                                                             |
| %s                                                                     | string:                                                                                                                                                                                                                                                                                                                                                                                              |
| %p                                                                     | chan:                                                                                                                                                                                                                                                                                                                                                                                                |
| %p                                                                     | pointer:                                                                                                                                                                                                                                                                                                                                                                                             |
| **Number Options:**                                                    |                                                                                                                                                                                                                                                                                                                                                                                                      |
| %f                                                                     | default width, default precision                                                                                                                                                                                                                                                                                                                                                                     |
| %9f                                                                    | width 9, default precision                                                                                                                                                                                                                                                                                                                                                                           |
| %.2f                                                                   | default width, precision 2                                                                                                                                                                                                                                                                                                                                                                           |
| %9.2f                                                                  | width 9, precision 2                                                                                                                                                                                                                                                                                                                                                                                 |
| %9.f                                                                   | width 9, precision 0                                                                                                                                                                                                                                                                                                                                                                                 |
| **Other flags:**                                                       |                                                                                                                                                                                                                                                                                                                                                                                                      |
| +                                                                      | always print a sign for numeric values; guarantee ASCII-only output for %q (%+q)                                                                                                                                                                                                                                                                                                                     |
| -                                                                      | pad with spaces on the right rather than the left (left-justify the field)                                                                                                                                                                                                                                                                                                                           |
| #                                                                      | alternate format: add leading 0 for octal (%#o), 0x for hex (%#x); <br> 0X for hex (%#X); suppress 0x for %p (%#p); <br> for %q, print a raw (backquoted) string if strconv.CanBackquote <br> returns true; <br> always print a decimal point for %e, %E, %f, %F, %g and %G; <br> do not remove trailing zeros for %g and %G; <br> write e.g. U+0078 'x' if the character is printable for %U (%#U). |
| ' '                                                                    | (space) leave a space for elided sign in numbers (% d); <br> put spaces between bytes printing strings or slices in hex (% x, % X)                                                                                                                                                                                                                                                                   |
| 0                                                                      | pad with leading zeros rather than spaces; <br> for numbers, this moves the padding after the sign                                                                                                                                                                                                                                                                                                   |
