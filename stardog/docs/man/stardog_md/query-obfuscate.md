---
layout: default
title: query obfuscate
grand_parent: Stardog CLI Reference
parent: query
description: 'Obfuscates the given query'
---

#  `stardog query obfuscate` 
## Description
Obfuscates the given query<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] query  obfuscate [ {-c | --config} <obfuscation configuration> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database> <query>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-c <obfuscation configuration>, --config <obfuscation configuration>` | Configuration file for obfuscation. This file should exist on the client-side.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <query>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the SPARQL query string to execute.  This can either be a file name, a SPARQL query string, or a stored query name.

## Discussion
Obfuscates the given query by replacing all variables, URIs, bnodes, and string literals using a message digest algorithm. This command works in conjunction with the command 'data obfuscate' such that the queries obfuscated with this command can be executed over the obfuscated RDF provided that both commands use the same configuration.

## Examples
Obfuscates the given query:
```bash
    $ stardog query obfuscate myDb query.sparql
```

