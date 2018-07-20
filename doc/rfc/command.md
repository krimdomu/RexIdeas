# Commands Interface

The Commands Interface defines all commands a Rex 2 Server needs to know. The commands are just the basic stuff so the resources (server side) can be executed.


## Interface

### upload($remote_file)

upload a resource which should be executed on the remote side to the server into a temporary directory so that it can be executed.

Returns: Filehandle

## execute_res($remote_file, $remote_resource, %parameter)

execute a remote resource.

Returns: [ExecuteStruct](execute_struct.md)

## execute_func($func, @params)

execute a function on the server side.

Returns: Free struct

## remove($remote_file)

removes remote file.

Returns: 0|1


