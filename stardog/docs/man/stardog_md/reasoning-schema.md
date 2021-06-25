---
layout: default
title: reasoning schema
grand_parent: Stardog CLI Reference
parent: reasoning
description: 'Management of reasoning schemas.'
---

#  `stardog reasoning schema` 
## Description
Management of reasoning schemas.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] reasoning  schema [ {-a | --add} <schemaName> ] [ {-f | --format} <resultFormat> ] [ {-g | --graphs | --named-graphs} <named graph(s)>... ] [ {-l | --list} ] [ --no-color ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --remove} <schemaName> ] [ --run-as <username> ] [ {-s | --show} <schemaName> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a <schemaName>, --add <schemaName>` | Adds a new reasoning schema with the given name. The named graphs for the schema should be provided with the {-g, --grsphs} option. If the schema already exists its named graph setting wil lbe overridden.
`-f <resultFormat>, --format <resultFormat>` | Result format for output [NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD]
`-g <named graph(s)>, --graphs <named graph(s)>, --named-graphs <named graph(s)>` | Named graph(s) to associate with a schema. Only valid with --add option
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l, --list` | Lists the names of all schemas in this database
`--no-color` | Do not use ANSI syntax highlighting in the output. Note that syntax highlighting is used only when an output format is not provided so this option is not needed if you specify an output format.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r <schemaName>, --remove <schemaName>` | Removes the reasoning schema with the given name.
`--run-as <username>` | User to impersonate when running the command
`-s <schemaName>, --show <schemaName>` | Exports the contents of the specified schema with the given name.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https.

## Examples
Export the default schema of the database in human-friendly format:
```bash
    $ stardog reasoning schema myDB
```
Export the default schema of the database without syntax highlighting:
```bash
    $ stardog reasoning schema --no-color myDB
```
Export the default schema of the database in turtle format:
```bash
    $ stardog reasoning schema -f turtle myDB
```
Export the given named schema:
```bash
    $ stardog reasoning schema --show mySchema myDB
```
Set the named graphs for the default schema:
```bash
    $ stardog reasoning schema --add default --graphs :myGraph http://example.com/anotherGraph -- myDB
```
Add a new named schema to the database for the given named graphs:
```bash
    $ stardog reasoning schema --add mySchema --graphs :myGraph http://example.com/anotherGraph -- myDB
```
Remove a named schema from the database:
```bash
    $ stardog reasoning schema --remove mySchema myDB :myGraph
```
List all the named schemas:
```bash
    $ stardog reasoning schema --list myDB
```

