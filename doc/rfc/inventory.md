# Inventory

The inventory (all the servers rex knows) should be extendable. So that it is possible to query different systems to get it.
Also it should be possible to generate inventory from any external programm.


## Format

The format of the output of inventory commands should be a json string or just a plain ini file.

### INI File
```ini
[groupname]
server1 auth_method=password auth_user=s0meuser auth_password=s0mep4ss
server2 auth_method.0=password auth_user.0=s0meuser auth_password.0=s0mep4ss auth_method.1=key auth_user.1=s0meuser auth_private_key.1=/path/to/key
```

### JSON Output

```json
{
    "groupname": [
        {
            "hostname": "server1",
            "display_name": "my server",
            "auth": [
                {
                    "method": "password",
                    "user": "s0meuser",
                    "password": "s0mep4ss",
                },
                // if above method doesn't work, try next
                {
                    "method": "key",
                    "user": "s0meuser",
                    "private_key": "/path/to/private/key",
                    "passphrase": "if-needed",
                    "sudo": 0|1,
                    "sudo_password": "if-needed",
                },
            ]
        },
        // next server
    ],
    "next-group": [...]
}
```

