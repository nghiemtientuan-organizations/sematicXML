---
layout: default
title: reasoning explain
grand_parent: Stardog CLI Reference
parent: reasoning
description: 'Provide the explanation for an inference or inconsistency.'
---

#  `stardog reasoning explain` 
## Description
Provide the explanation for an inference or inconsistency.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] reasoning  explain [ {-f | --format} <format> ] [ {-i | --inconsistency} ] [ {-l | --limit} <limit> ] [ {-m | --merge} ] [ {-o | --output-format} <format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --print-named-graphs ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database> <input>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <format>, --format <format>` | Input data format: NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD
`-i, --inconsistency` | Explain inconsistency of the database
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Limits the number of explanation returned. The default limit is 1. Note that, when a RDF output format is selected and the limit is set to higher than 1, there is no way to distinguish which triple in the output belongs to which explanation. In TEXT and TREE outputs there will be an empty line separating different explanations.
`-m, --merge` | Merge proof trees with common nodes. This works only with TREE format and when the limit is is set higher than 1.
`-o <format>, --output-format <format>` | Output format for the explanation: [TEXT, TREE, NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD]. The default format is 'TEXT' where the explanation is rendered in a concise, human-readable format.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--print-named-graphs` | Retrieves and prints the source named graphs for triples in the explanation. If this option is enabled, the output format should support named graphs too.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <input>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the inference to explain. This can either be a file name or an RDF string. When Turtle string is given as an argument the prefixes stored in the database can be omitted.

## Discussion
Returns an explanation for the inference in the given file or for the inconsistency of the database. If provided, the input file should contain a single axiom. The explanation output is the minimal set of asserted statements in the database that are needed for the inference to hold. The statements in the explanation can be rendered in any RDF format but by default they will be rendered in a concise, human-readable, text format. There is also a proof tree format where the statements are rendered in hierarchical structure. Nodes in the proof tree are grouped under inferred statements that make it easier to understand the explanation.

## Examples
Show a single explanation of an inferred statement:
```bash
    $ stardog reasoning explain myDb "ex:JohnDoe a ont:Person"
```
Show up to 10 explanations along with named graph info and merge common explanations:
```bash
    $ stardog reasoning explain -l 10 --merge --print-named-graphs myDb ":Employee rdfs:subClassOf :Person"
```
Read axiom to explain from a file and output the explanation in Turtle format:
```bash
    $ stardog reasoning explain -o turtle myDb axiomToExplain.ttl
```

