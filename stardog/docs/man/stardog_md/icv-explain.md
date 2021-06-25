---
layout: default
title: icv explain
grand_parent: Stardog CLI Reference
parent: icv
description: '*WARNING:* This command has been deprecated and will be removed in the next major release.Explains Integrity Constraint violations command that supports validating the database (or a subset of it via named graphs) with existing or new constraints. New constraints should be specified as arguments passed at the end. If no new constraints are given then the constraints stored in the database will be used.'
---

#  `stardog icv explain` 
## Description
*WARNING:* This command has been deprecated and will be removed in the next major release.Explains Integrity Constraint violations command that supports validating the database (or a subset of it via named graphs) with existing or new constraints. New constraints should be specified as arguments passed at the end. If no new constraints are given then the constraints stored in the database will be used.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] icv  explain [ {-f | --format} <format> ] [ {-g | --named-graph | --named-graphs} <named graph(s)>... ] [ {-l | --limit} <limit> ] [ {-m | --merge} ] [ {-o | --output-format} <format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --print-named-graphs ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <constraint_files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <format>, --format <format>` | RDF Format [N-TRIPLES, RDF/XML, TURTLE, TRIG] for the constraints or [SPARQL] for constraints specified as SPARQL queries.
`-g <named graph(s)>, --named-graph <named graph(s)>, --named-graphs <named graph(s)>` | The list of contexts which should be validated, if none are specified, the entire database is validated wrt to the provided constraint(s).
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Limits the number of explanation returned. The default limit is 1. Note that, when a RDF output format is selected and the limit is set to higher than 1, there is no way to distinguish which triple in the output belongs to which explanation. In TEXT and TREE outputs there will be an empty line separating different explanations.
`-m, --merge` | Merge proof trees with common nodes. This works only with TREE format and when the limit is is set higher than 1.
`-o <format>, --output-format <format>` | Output format for the explanation: [TEXT, TREE, NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD]. The default format is 'TEXT' where the explanation is rendered in a concise, human-readable format.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--print-named-graphs` | Retrieves and prints the source named graphs for triples in the explanation. If this option is enabled, the output format should support named graphs too.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <constraint_files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Then optionally the list of files which contain Integrity Constraints.

## Examples
Show one constraint violation explanation:
```bash
    $ stardog icv explain myDb
```
Show up to 10 constraint violation explanations, merging explanations with common elements:
```bash
    $ stardog icv explain --merge -l 10 myDb constraint.rdf
```

