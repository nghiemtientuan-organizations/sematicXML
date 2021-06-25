---
layout: default
title: data add
grand_parent: Stardog CLI Reference
parent: data
description: 'Adds RDF data to a database; prints status on STDOUT.'
---

#  `stardog data add` 
## Description
Adds RDF data to a database; prints status on STDOUT.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] data  add [ --compression <Compression> ] [ {-f | --format} <rdf format> ] [ {-g | --named-graph} <named graph> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --remove-all ] [ --run-as <username> ] [ --server-side ] [ --tx <txID> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database name> <files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--compression <Compression>` | Compression format [GZIP, BZ2, ZIP] for the input data.
`-f <rdf format>, --format <rdf format>` | Data format. The supported formats are NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD. If no format is specified, the file name will be used to guess the required format.
`-g <named graph>, --named-graph <named graph>` | Target named graph. If no named graph is specified, the default graph will be used. This is the named graph where data will be modified. If a graph format that specifies context is used, such as TRIG, this will override the context specified in the by the format.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--remove-all` | Remove all flag. If this flag is set, all data in the database will be removed before additions.
`--run-as <username>` | User to impersonate when running the command
`--server-side` | Server-side file IO. If this flag is set, it will be assumed that the input files passed reside on the server and the client will just send the file path to the server.
`--tx <txID>` | Transaction ID this update will be part of. This should be the ID of an existing transaction for the given database. If there is a value provided for this option then the transaction will NOT be committed automatically when the command finishes and an explicit `tx commit` will be needed.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database name> <files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Subsequent arguments are the list of files whose contents should be added to or removed from the database and, optionally, the named graph(s) for the files. The named graphs are denoted with a @ prefix and all the files specified after a named graph (and before the next graph) are added into or removed from that named graph.

## Discussion
Adds data to the database in a single commit; the add operation is atomic: if multiple files are being added to the database and there is an error adding one or more of the files, the entire operation will be rolled back.

## Examples
Add data to the default graph:
```bash
    $ stardog data add myDb file.rdf
```
Add data to a specific named graph:
```bash
    $ stardog data add --named-graph http://example.org/context myDb file.rdf
```
First clear the database and then add the data:
```bash
    $ stardog data add --remove-all myDb file.rdf
```
Add a data file by specifying the format and compression:
```bash
    $ stardog data add -f turtle --compression gzip myDb file.bin
```
Add separate files into separate named graphs:
```bash
    $ stardog data add myDb input0.ttl @http://stardog.com/graph/1 input1.ttl input2.ttl @urn:stardog:graph:2 input3.ttl @ input4.ttl
```

