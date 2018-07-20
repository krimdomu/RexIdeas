# Resource

A resource is a thing that describes a part of a server on the remote side. For example a file, a package, a service and so on.

## Example

```perl
file "/etc/motd",
    content => "Hello world\n",
    owner   => "root",
    group   => "root",
    mode    => "0644";

pkg "httpd",
    ensure => "latest";

service "httpd",
    ensure  => "running",
    enabled => TRUE;
```

## Code

A resource consists of 2 parts. One local part which registers the resource to Rex. (ex. so that it knows the `file` command.) This must be perl. (To be tested: maybe also possible in any language).

And a script that runs on the remote host which executes all the needed things (for example installs package, start service, ...). 
This script can be written in any language. The output of the script must be compatible to [ExecuteStruct](execute_struct.md).



