---
layout: default
title: icv convert
grand_parent: Stardog CLI Reference
parent: icv
description: '*WARNING:* This command has been deprecated and will be removed in the next major release.Converts existing or new constraints into SPARQL queries that, when executed, will return validation results.'
---

#  `stardog icv convert` 
## Description
*WARNING:* This command has been deprecated and will be removed in the next major release.Converts existing or new constraints into SPARQL queries that, when executed, will return validation results.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] icv  convert [ {-f | --format} <format> ] [ {-g | --named-graph | --named-graphs} <named graph(s)>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <[constraints_file]>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <format>, --format <format>` | RDF Format [N-TRIPLES, RDF/XML, TURTLE, TRIG] for the constraints or [SPARQL] for constraints specified as SPARQL queries.
`-g <named graph(s)>, --named-graph <named graph(s)>, --named-graphs <named graph(s)>` | The list of contexts which should be validated, if none are specified, the entire database is validated wrt to the provided constraint(s).
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <[constraints_file]>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Then optionally the list of files which contain Integrity Constraints to convert.

