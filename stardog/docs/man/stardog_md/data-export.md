---
layout: default
title: data export
grand_parent: Stardog CLI Reference
parent: data
description: 'Exports the contents of a database in RDF.'
---

#  `stardog data export` 
## Description
Exports the contents of a database in RDF.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] data  export [ --compression <Compression> ] [ {-f | --format} <RDF Format> ] [ {-g | --named-graph | --named-graphs} <export named graph(s)>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-s | --server-side} ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <export file>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
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
Exports the database in the specified format to the specified output file, else to STDOUT. By default, only the default graph will be exported.  To export the entire database, or a specific set of named graphs, use the -g/--named-graph parameter to specify the graphs to export. If no format is specified, the format is determined from the output file name; otherwise, TURTLE is the default. Exports of large databases should be performed on the server using the --server-side flag.  This will save the RDF using the specified format in the export directory for the server.  The default server export directory is '.exports' in your $STARDOG_HOME but can be changed via 'export.dir' in the stardog.properties file.

## Examples
Export the database 'myDb' as NTRIPLES:
```bash
    $ stardog data export --format NTRIPLES myDb
```
Export the entire database 'myDb' to a file in TURTLE:
```bash
    $ stardog data export --named-graphs ALL -- myDb export.ttl
```
Export two named graphs of the database 'myDb' as TRIG:
```bash
    $ stardog data export --named-graphs http://examples.org/graph1 http://examples.org/graph2 --format TRIG myDb
```
Export the database 'myDb' to a file in TURTLE:
```bash
    $ stardog data export myDb export.ttl
```
Export the database 'myDb' to a gzipped file in TURTLE:
```bash
    $ stardog data export myDb export.ttl.gz
```
Export the entire database 'myDb' as TRIG to a file on the server
```bash
    $ stardog data export --named-graphs ALL --format TRIG --server-side myDb
```

