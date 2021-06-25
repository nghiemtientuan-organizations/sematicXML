---
layout: default
title: virtual source_metadata
grand_parent: Stardog Admin CLI Reference
parent: virtual
description: 'Query source database metadata used by virtual graphs. Useful for troubleshooting virtual graph behavior.'
---

#  `stardog-admin virtual source_metadata` 
## Description
Query source database metadata used by virtual graphs. Useful for troubleshooting virtual graph behavior.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] virtual  source_metadata [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <options> <[schema name]> <[table name]>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<options> <[schema name]> <[table name]>` | The configuration file for the virtual graph, a schema name and optionally a table name.

## Examples
Query JDBC metadata for available schemas and catalogs
```bash
    $ stardog-admin virtual source_metadata source.properties
```
$ stardog-admin virtual source_metadata source.properties source_schema
```bash
* Query JDBC metadata for fields and constraints in the given schema-qualified table
```

