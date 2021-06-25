---
layout: default
title: user addrole
grand_parent: Stardog Admin CLI Reference
parent: user
description: 'Assigns a role to a user.'
---

#  `stardog-admin user addrole` 
## Description
Assigns a role to a user.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] user  addrole [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] {-R | --role} <role> [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <username>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-R <role>, --role <role>` | Role to be associated with the user.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<username>` | User to be associated with the role.

## Discussion
Associates a role with a user which will grant the user all the permissions explicitly assigned to the role.

## Examples
Give the user 'bob' the role 'writer':
```bash
    $ stardog-admin user addrole --role writer bob
```

