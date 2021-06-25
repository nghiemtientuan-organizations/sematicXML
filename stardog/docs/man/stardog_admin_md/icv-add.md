---
layout: default
title: icv add
grand_parent: Stardog Admin CLI Reference
parent: icv
description: '*WARNING:* This command has been deprecated and will be removed in the next major release.Use data add command instead to add your SHACL constraints into the database. Integrity Constraint Validation command that supports adding constraints to a database.'
---

#  `stardog-admin icv add` 
## Description
*WARNING:* This command has been deprecated and will be removed in the next major release.Use 'data add' command instead to add your SHACL constraints into the database. Integrity Constraint Validation command that supports adding constraints to a database.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] icv  add [ {-f | --format} <format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <constraint_files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <format>, --format <format>` | RDF Format [N-TRIPLES, RDF/XML, TURTLE, TRIG] for the constraints or [SPARQL] for constraints specified as SPARQL queries.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <constraint_files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Then the list of files which contain Integrity Constraints to add to the provided database.

## Examples
Add constraints to 'myDB'
```bash
    $ stardog-admin icv add myDb constraints.rdf
```

