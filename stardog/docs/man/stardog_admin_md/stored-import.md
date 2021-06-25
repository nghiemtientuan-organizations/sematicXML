---
layout: default
title: stored import
grand_parent: Stardog Admin CLI Reference
parent: stored
description: 'Imports the stored queries from the given RDF file'
---

#  `stardog-admin stored import` 
## Description
Imports the stored queries from the given RDF file<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] stored  import [ --compression <Compression> ] [ {-f | --format} <rdf format> ] [ --overwrite ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <file>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--compression <Compression>` | Compression format [GZIP, BZ2, ZIP] for the input data.
`-f <rdf format>, --format <rdf format>` | Data format. The supported formats are NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD. If no format is specified, the file name will be used to guess the required format.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--overwrite` | If set existing stored queries with the same name will be overwritten.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<file>` | The file containing the RDF serialization of the stored queries.

## Discussion
Reads stored queries from an RDF file and adds them to the Stardog server. This action is not atomic so if an error occurs at some point only some of the stored queries might be added as a result.

## Examples
Adds new stored queries:
```bash
    $ stardog-admin stored import storedQueries.ttl
```
Adds stored queries overwriting any existing :
```bash
    $ stardog-admin stored import --overwrite storedQueries.ttl
```

