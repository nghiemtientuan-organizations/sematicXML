---
layout: default
title: metadata get
grand_parent: Stardog Admin CLI Reference
parent: metadata
description: 'Gets the value of one or more database configuration options.'
---

#  `stardog-admin metadata get` 
## Description
Gets the value of one or more database configuration options.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] metadata  get [ {-o | --option} <options>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <options>, --option <options>` | Gets the value of one or more database configuration options. If no arguments are provided, all known configuration options will be printed to STDOUT. Only the option names should be provided. Multiple configuration options should be space separated: '-o option1 option2'.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database for the operation

## Examples
Get a specific property of myDB:
```bash
    $ stardog-admin metadata get -o virtual.transparency myDB
```
Get all properties of myDB:
```bash
    $ stardog-admin metadata get myDB
```

