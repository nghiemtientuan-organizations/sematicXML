---
layout: default
title: doc get
grand_parent: Stardog CLI Reference
parent: doc
description: 'Retrieve a document from the document store.'
---

#  `stardog doc get` 
## Description
Retrieve a document from the document store.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] doc  get [ --file <file> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database name> <docs>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--file <file>` | Override the file name when retrieving a single document.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database name> <docs>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Subsequent arguments are the list of documents to be retrieved from the document store.

## Examples
Retrieve a document from the document store and write the contents to the file named the same as the document
```bash
    $ stardog doc get myDb aDocument.pdf
```
Retrieve a document from the document store and write the contents to a file named separately
```bash
    $ stardog doc get myDb --file aRetrievedDocument.pdf aDocument.pdf
```
Retrieve multiple documents from the document store
```bash
    $ stardog doc get myDb docA.pdf docB.pdf docC.pdf
```

