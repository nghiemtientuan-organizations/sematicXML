---
layout: default
title: user add
grand_parent: Stardog Admin CLI Reference
parent: user
description: 'Adds a new user.'
---

#  `stardog-admin user add` 
## Description
Adds a new user.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] user  add [ {-N | --new-password} <password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-s | --superuser} ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <username>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-N <password>, --new-password <password>` | Password for new user. If not provided, the user will be prompted to enter it.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-s, --superuser` | Superuser flag. If this flag is set, the new user will be a super user.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<username>` | User name.

## Discussion
Create a new user with the specified user name and add them to the system.

## Examples
Add a new user and prompt for new password
```bash
    $ stardog-admin user add newUser
```

