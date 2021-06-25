---
layout: default
title: virtual online
grand_parent: Stardog Admin CLI Reference
parent: virtual
description: 'Online a virtual graph. When Stardog restarts, Virtual Graphs that cannot be loaded will be listed (stardog-admin virtual list) as offline. Use this command to retry loading an offline Virtual Graph.'
---

#  `stardog-admin virtual online` 
## Description
Online a virtual graph. When Stardog restarts, Virtual Graphs that cannot be loaded will be listed (stardog-admin virtual list) as offline. Use this command to retry loading an offline Virtual Graph.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] virtual  online [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <name>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | Name of the virtual graph to online

## Examples
Online an virtual graph named myGraph
```bash
    $ stardog-admin virtual online myGraph
```

