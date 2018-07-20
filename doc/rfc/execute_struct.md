# ExecuteStruct

Defined input and output of resource execution.

## IN

Input is always a hash.

```
{
    test    => 0|1,             # mandatory: defines if the module should do nothing,
                                # just dry-run
    name    => "/etc/motd",     # mandatory: the name of the resource. usually the package name, filename, ...
                                # rest depends on the resource.
                                # this example is for the file resource.
    content => "Hello world\n",
    owner   => "root",
    group   => "root",
    mode    => "0755",
}
```

## OUT

Output is always a hash.

```
{
    error?  => "error string",
    result  => CREATED|REMOVED|UPDATED|UNCHANGED|ERROR
}
```