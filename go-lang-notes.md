# Go Language - Notes
`30 Jan 2018`

# Buffer
> Buffer to manage content till it is organized
> from: https://gobyexample.com/

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
	- func EncodeToString(src []byte) string
	- EncodeToString returns the hexadecimal encoding of src.
	
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
