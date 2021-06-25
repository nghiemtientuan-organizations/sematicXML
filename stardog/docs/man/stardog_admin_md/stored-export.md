---
layout: default
title: stored export
grand_parent: Stardog Admin CLI Reference
parent: stored
description: 'Exports the stored queries in RDF format'
---

#  `stardog-admin stored export` 
## Description
Exports the stored queries in RDF format<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] stored  export [ --compression <Compression> ] [ {-f | --format} <RDF Format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <export file> ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--compression <Compression>` | Compression format [GZIP, BZ2, ZIP] for the exported data.
`-f <RDF Format>, --format <RDF Format>` | RDF Format [NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD] for the exported data.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<export file>` | The file to write the output to; if not specified, the output is written to STDOUT. 

## Discussion
Exports the queries currently stored in the system in RDF format.

## Examples
Export the stored queries:
```bash
    $ stardog-admin stored export
```
Export the stored queries to a file:
```bash
    $ stardog-admin stored export export.ttl
```

