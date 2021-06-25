---
layout: default
title: virtual mappings
grand_parent: Stardog Admin CLI Reference
parent: virtual
description: 'Prints the mappings of a registered virtual graph.'
---

#  `stardog-admin virtual mappings` 
## Description
Prints the mappings of a registered virtual graph.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] virtual  mappings [ {-f | --format} <Mappings format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <name>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <Mappings format>, --format <Mappings format>` | Format of the mappings; one of [STARDOG, R2RML, SMS2]
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | Name of the virtual graph

## Examples
Prints the mappings of a registered virtual graph in Stardog mappings syntax
```bash
    $ stardog-admin virtual mappings myGraph
```
Prints the mappings of a registered virtual graph in the standard R2RML Turtle syntax
```bash
    $ stardog-admin virtual mappings --format r2rml myGraph
```

