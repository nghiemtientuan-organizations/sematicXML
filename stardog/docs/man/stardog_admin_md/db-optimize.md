---
layout: default
title: db optimize
grand_parent: Stardog Admin CLI Reference
parent: db
description: 'Optimizes the indexes of a database for query answering and disk utilization'
---

#  `stardog-admin db optimize` 
## Description
Optimizes the indexes of a database for query answering and disk utilization<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] db  optimize [ {-o | --option} <options>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <options>, --option <options>` | One or more configuration options to be used for optimization. Each option is a 'key=value' pair; multiple options are separated by whitespaces and the string should be quoted, e.g., '-o "option1=value1 option2=value2"'. 
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database for the operation

## Discussion
Optimizes the indexes of a database for query answering and disk utilization after the database has been heavily modified. If a database has been modified with a large number of additions or removals, some internal structures may become less optimized for query answering. This utility will perform several operations that will help with query answering performance. Which operations are performed depends on the options given. Currently supported options:
 * optimize.statistics={true, false}: recomputes the selectivity statistics which is used for query optimization
 * optimize.compact={true, false}: compacts the index data structures after update operations
 * optimize.vacuum.data={true, false}: frees space by removing quads which have been previously deleted from the database
 * optimize.vacuum.dictionary={true, false}: optimizes internal encoding of RDF terms, removes terms which no longer appear in the data
 * optimize.search={true, false}: recomputes the full-text search index

## Examples
Optimize the database 'myDb':
```bash
    $ stardog-admin db optimize myDb
```

