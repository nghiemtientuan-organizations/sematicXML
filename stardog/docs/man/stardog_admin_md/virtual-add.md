---
layout: default
title: virtual add
grand_parent: Stardog Admin CLI Reference
parent: virtual
description: 'Registers a new virtual graph.'
---

#  `stardog-admin virtual add` 
## Description
Registers a new virtual graph.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] virtual  add [ {-d | --database} <db> ] [ {-f | --format} <mappings format> ] [ {-n | --name} <virtual graph name> ] [ {-o | --overwrite} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-s | --data-source} <data source> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <[options]> <[mappings]>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d <db>, --database <db>` | The database the virtual graph will be associated with. By default, '*' will be used which means the virtual graph can be accessed from any database.
`-f <mappings format>, --format <mappings format>` | Format of the mappings; one of [STARDOG, R2RML, SMS2]. Use this command-line option instead of setting the mappings.syntax option in the options file.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-n <virtual graph name>, --name <virtual graph name>` | Optional override of the virtual graph name
`-o, --overwrite` | If the virtual graph being added already exists, overwrite the existing copy with the new version
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-s <data source>, --data-source <data source>` | The data source for this virtual graph. Data sources can be added with stardog-admin data-source commands, and shared between virtual graphs.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<[options]> <[mappings]>` | The configuration file for the virtual graph and optionally a mappings file. If a --data-source option is not provided then the options argument is required. If the --name option is not provided, the name of the configuration file without the extension will be the name of the virtual graph.

## Examples
Register a new virtual graph named 'myGraph' with automatically generated (aka direct) mappings
```bash
    $ stardog-admin virtual add myGraph.properties
```
Register a new virtual graph with the mappings written in Stardog mappings syntax
```bash
    $ stardog-admin virtual add myGraph.properties myGraph.ttl
```
Register a new virtual graph using a registered data source
```bash
    $ stardog-admin virtual add --format r2rml --data-source myDataSource myGraph.properties myGraph.ttl
```
Register a new virtual graph using a registered data source, omitting the options file
```bash
    $ stardog-admin virtual add --format r2rml --name myGraph --data-source myDataSource myGraph.ttl
```
Update an already registered virtual graph with the given mappings
```bash
    $ stardog-admin virtual add --overwrite myGraph.properties myGraph.ttl
```

