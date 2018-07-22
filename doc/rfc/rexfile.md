# Rexfile

In Rex 1 the Rexfile is a file describing what tasks should run on which server or server-group. The Rexfile is written in perl.

## Thoughts

Do i need a Rexfile written in perl? Or is it enough to have a simple file (ex. yaml format) which describes which task should run on which server?

Do we loose flexibility with this approach?

## Example

### Rex Assemblies

In the Rex Assemblies one defines which modules should run on which server and in which order.

```yaml
---
- name: prepare system
  servers:
    - group1
    - system1
  modules:
    # run all tasks from Rex2::Module::BaseOS
    - name: Rex2::Module::BaseOS
    # run only listed tasks
    - name: Rex2::Module::Apache
      tasks:
        - install
        - start_on_boot

- name: prepare other systems
  servers:
    - group2
  modules:
    # run all tasks from Rex2::Module::BaseOS
    - name: Rex2::Module::BaseOS
```

### Rex modules

The Rex modules do the heavy lifting. These modules are Perl code.

```perl
package Rex2::Module::BaseOS;

use Rex2 -base;

sub setup_ntp {
    pkg "ntp", ensure => "present";
}

1;
```


```perl
package Rex2::Module::Apache;

use Rex2 -base;

sub install {}
sub start_on_boot {}

1;
```

## Advantages

Advantages by splitting the old Rexfile into 2 pieces, Rex modules (Code) and Rex Assemblies (Configuration), it is possible to split the responsibility between developers (which develop the Rex modules) and administrators (which write the assemblies).
