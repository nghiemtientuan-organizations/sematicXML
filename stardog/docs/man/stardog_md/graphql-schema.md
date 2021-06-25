---
layout: default
title: graphql schema
grand_parent: Stardog CLI Reference
parent: graphql
description: 'List, get, add or remove GraphQL schemas. The default action is listing existing schemas.'
---

#  `stardog graphql schema` 
## Description
List, get, add or remove GraphQL schemas. The default action is listing existing schemas.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] graphql  schema [ {-a | --add} <schemaName> ] [ {-l | --list} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --remove} <schemaName> ] [ --run-as <username> ] [ {-s | --show} <schemaName> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database> <schemaFile>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a <schemaName>, --add <schemaName>` | Adds a new GraphQL schema.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l, --list` | Lists the names of all GraphQL schemas in this database
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r <schemaName>, --remove <schemaName>` | Removes a GraphQL schema from this database.
`--run-as <username>` | User to impersonate when running the command
`-s <schemaName>, --show <schemaName>` | Prints the GraphQL schema with the given name.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <schemaFile>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the GraphQL schema file if --add option is used.

## Examples
Lists the existing GraphQL schemas in a database
```bash
    $ stardog graphql schema --list myDb
```
Adds the GraphQL schema to the database
```bash
    $ stardog graphql schema --add starwars myDb starwars.graphqls
```
Prints the GraphQL schema with given name
```bash
    $ stardog graphql schema --show starwars myDb
```
Remove the GraphQL schema with given name from the database
```bash
    $ stardog graphql schema --remove starwars myDb
```

