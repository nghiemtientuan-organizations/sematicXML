---
layout: default
title: data obfuscate
grand_parent: Stardog CLI Reference
parent: data
description: 'Exports the contents of a database in obfuscated RDF.'
---

#  `stardog data obfuscate` 
## Description
Exports the contents of a database in obfuscated RDF.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] data  obfuscate [ {-c | --config} <obfuscation configuration> ] [ --compression <Compression> ] [ {-f | --format} <RDF Format> ] [ {-g | --named-graph | --named-graphs} <export named graph(s)>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-s | --server-side} ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <export file>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-c <obfuscation configuration>, --config <obfuscation configuration>` | Configuration file for obfuscation. This file should exist on the client-side.
`--compression <Compression>` | Compression format [GZIP, BZ2, ZIP] for the exported data.
`-f <RDF Format>, --format <RDF Format>` | RDF Format [NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD] for the exported data.
`-g <export named graph(s)>, --named-graph <export named graph(s)>, --named-graphs <export named graph(s)>` | Named graph(s) to export.  Multiple options are separated by whitespaces, e.g., '-g "urn:context1 urn:context2"'. The keyword ALL can be used if all named graphs in the db are desired, and the keyword DEFAULT can be used to export the default graph. Virtual graphs can be exported by name, but are not included when ALL is specified. When used as the last option, values should be followed by '--' to denote the end of the named graphs."
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-s, --server-side` | Export the data to the server
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <export file>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The second argument is the file to write the output to; if not specified, the output is written to STDOUT. No file can be specified for server-side exports; the output will be written to a file under the STARDOG_HOME/.exports directory.

## Discussion
Exports RDF data from a database similar to the export command but obfuscates the contents of the RDF by replacing all URIs, bnodes, and string literals using a message digest algorithm. Non-string typed literals (integers, floats, dates, etc.) are left unchanged. The obfuscation is guided by a configuration file. Configurations can specify which URIs and strings will be obfuscated by defining inclusion and exclusion filters.

## Examples
Obfuscate the database 'myDb' using default configuration:
```bash
    $ stardog data obfuscate myDb
```
Obfuscate a named graph(s) of the database 'myDb' as TRIG:
```bash
    $ stardog data obfuscate --format TRIG --named-graphs http://mycontext.org/theContextid myDb
```
Obfuscate the database 'myDb' using a custom configuration and output to a file in TURTLE:
```bash
    $ stardog data obfuscate --config my_config.ttl myDb export.ttl
```

