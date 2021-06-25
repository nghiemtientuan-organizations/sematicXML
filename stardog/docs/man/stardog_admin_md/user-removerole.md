---
layout: default
title: user removerole
grand_parent: Stardog Admin CLI Reference
parent: user
description: 'Removes a role from a user.'
---

#  `stardog-admin user removerole` 
## Description
Removes a role from a user.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] user  removerole [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] {-R | --role} <role> [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <username>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-R <role>, --role <role>` | Role to be removed.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<username>` | User whose role is to be removed.

## Discussion
Removes a role from a user effectively removing all permissions granted to the user via the role.

## Examples
Remove the 'writer' role from the user 'bob':
```bash
    $ stardog-admin user removerole --role writer bob
```

