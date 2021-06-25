---
layout: default
title: function remove
grand_parent: Stardog Admin CLI Reference
parent: function
description: 'Removes a stored function'
---

#  `stardog-admin function remove` 
## Description
Removes a stored function<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] function  remove [ {-a | --all} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <name> ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a, --all` | Remove all flag. If this flag is set, all stored functions will be removed.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | Name of the stored function to delete.

## Discussion
Removes a new stored function from the system. If there is another stored function that uses the removed function it will NOT be removed. The functions that depend on the removed function will trigger an error during runtime when they are used next time.

## Examples
Removes a stored function:
```bash
    $ stardog-admin function remove permutation
```

