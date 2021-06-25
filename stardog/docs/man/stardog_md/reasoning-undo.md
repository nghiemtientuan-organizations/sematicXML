---
layout: default
title: reasoning undo
grand_parent: Stardog CLI Reference
parent: reasoning
description: '*WARNING:* This command has been deprecated and will be removed in the next major release.Generate an update plan that will undo an inference. There might be multiple different explanations for a statement to be inferred. We need to remove at least one statement from each explanation to remove an inference. This command can generate multiple different plans showing different possibilities but executing only one plan will undo the specified inference.

The generated plans are output as SPARQL update sequences and can be executed with the query command that will apply the suggested changes. You can also use the --execute option to this command to execute the update directly.

This command can fix the inconsistency of a database as well.'
---

#  `stardog reasoning undo` 
## Description
*WARNING:* This command has been deprecated and will be removed in the next major release.Generate an update plan that will undo an inference. There might be multiple different explanations for a statement to be inferred. We need to remove at least one statement from each explanation to remove an inference. This command can generate multiple different plans showing different possibilities but executing only one plan will undo the specified inference.

The generated plans are output as SPARQL update sequences and can be executed with the query command that will apply the suggested changes. You can also use the --execute option to this command to execute the update directly.

This command can fix the inconsistency of a database as well.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] reasoning  undo [ --execute ] [ {-f | --format} <format> ] [ {-i | --inconsistency} ] [ {-l | --limit} <limit> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ --update-schema ] [ {-v | --verbose} ] [--] <database> <input>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--execute` | Executes the first update plan generated
`-f <format>, --format <format>` | Input data format: NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD
`-i, --inconsistency` | Fix inconsistency of the database
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Limits the number of update plans returned. The default limit is 1. Each plan may contain more than one update operation.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`--update-schema` | Includes schema axioms in the update plans
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <input>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the inference to undo. This can either be a file name or an RDF string. When Turtle string is given as an argument the prefixes stored in the database can be omitted.

## Examples
Generate a plan that will fix all the constraint violations in the db
```bash
    $ stardog reasoning undo db
```

