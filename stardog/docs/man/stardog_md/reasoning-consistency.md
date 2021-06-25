---
layout: default
title: reasoning consistency
grand_parent: Stardog CLI Reference
parent: reasoning
description: 'Checks the logical consistency of database.'
---

#  `stardog reasoning consistency` 
## Description
Checks the logical consistency of database.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] reasoning  consistency [ {-g | --named-graph | --named-graphs} <contexts>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-g <contexts>, --named-graph <contexts>, --named-graphs <contexts>` | The list of named graphs to check the consistency of; if none are specified, consistency of the entire database is checked.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https.

## Examples
Check the consistency of the database:
```bash
    $ stardog reasoning consistency myDb
```
Check the consistency of a set of specific named graphs:
```bash
    $ stardog reasoning consistency --named-graphs http://example.org/graph1 http://example.org/graph2 -- myDB
```

