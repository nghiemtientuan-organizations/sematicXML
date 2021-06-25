---
layout: default
title: data-source remove
grand_parent: Stardog Admin CLI Reference
parent: data-source
description: 'Removes a registered data source.'
---

#  `stardog-admin data-source remove` 
## Description
Removes a registered data source.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] data-source  remove [ {-f | --force} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <name>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f, --force` | Whether to remove any virtual graphs that use the data source
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | Name of the data source to remove

## Examples
Remove a registered data source named myDataSource
```bash
    $ stardog-admin data-source remove myDataSource
```
Remove a registered data source named myDataSource and all the virtual graphs that use it
```bash
    $ stardog-admin data-source remove --force myDataSource
```

