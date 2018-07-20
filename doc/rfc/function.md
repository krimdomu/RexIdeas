# Functions

Functions are code that enhance [command](command.md) part of Rex 2. They also consist of 2 parts. One for the client side to enhance the syntax of Rex 2. And one on the remote side to enhance the interface of the server.

These lower level functions must be written in perl.

## Example

```
if( is_file("/etc/motd") ) {
    # do something
}
```