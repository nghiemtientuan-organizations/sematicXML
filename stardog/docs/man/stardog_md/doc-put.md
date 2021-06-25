---
layout: default
title: doc put
grand_parent: Stardog CLI Reference
parent: doc
description: 'Add/modify a document in the document store.'
---

#  `stardog doc put` 
## Description
Add/modify a document in the document store.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] doc  put [ {-k | --keep-assertions} ] [ --name <name> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --rdf-extractors} <RDF extractors> ] [ --run-as <username> ] [ {-t | --text-extractors} <text extractors> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database name> <files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-k, --keep-assertions` | Keep existent assertions about document.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--name <name>` | Override the document name when adding a single document.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r <RDF extractors>, --rdf-extractors <RDF extractors>` | Choose the RDF extractors to be used for this `put' request.
`--run-as <username>` | User to impersonate when running the command
`-t <text extractors>, --text-extractors <text extractors>` | Choose the text extractors to be used for this `put' request.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database name> <files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Subsequent arguments are the list of files to be updated in the document store.

## Examples
Add a document to the store with the name given by the filename
```bash
    $ stardog doc put myDb aDocument.pdf
```
Add a document to the store with the name provided explicitly
```bash
    $ stardog doc put myDb --name aSpecificDocument.pdf aDocument.pdf
```
Add a sequence of documents to the store with names given by respective filenames
```bash
    $ stardog doc put myDb doc*.pdf
```

