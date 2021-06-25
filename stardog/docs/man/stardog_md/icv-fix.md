---
layout: default
title: icv fix
grand_parent: Stardog CLI Reference
parent: icv
description: 'Generate an update plan that will fix one or more Integrity Constraint violations command with existing or new constraints. The command can generate multiple different plans showing different possibilities but executing only one plan will fix all the violations for the specified constraints.

The generated plans are output as SPARQL update sequences and can be executed with the query command that will apply the suggested changes. You can use the --execute option to this command to execute the update directly.

By default this command will fix the violations of all the constraints stored in the database. If you would like to fix violations for a specific set of constraints, you can provide the constraints as an additional argument at the end.n
Note that, a possible fix to a constraint violation is removing the constraint but this command does not suggest such changes and only creates update plans.'
---

#  `stardog icv fix` 
## Description
Generate an update plan that will fix one or more Integrity Constraint violations command with existing or new constraints. The command can generate multiple different plans showing different possibilities but executing only one plan will fix all the violations for the specified constraints.

The generated plans are output as SPARQL update sequences and can be executed with the query command that will apply the suggested changes. You can use the --execute option to this command to execute the update directly.

By default this command will fix the violations of all the constraints stored in the database. If you would like to fix violations for a specific set of constraints, you can provide the constraints as an additional argument at the end.n
Note that, a possible fix to a constraint violation is removing the constraint but this command does not suggest such changes and only creates update plans.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] icv  fix [ --execute ] [ {-f | --format} <format> ] [ {-g | --named-graph | --named-graphs} <named graph(s)>... ] [ {-l | --limit} <limit> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ --update-schema ] [ {-v | --verbose} ] [--] <dbname> <constraint_files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--execute` | Executes the first update plan generated
`-f <format>, --format <format>` | RDF Format [N-TRIPLES, RDF/XML, TURTLE, TRIG] for the constraints or [SPARQL] for constraints specified as SPARQL queries.
`-g <named graph(s)>, --named-graph <named graph(s)>, --named-graphs <named graph(s)>` | The list of contexts which should be validated, if none are specified, the entire database is validated wrt to the provided constraint(s).
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Limits the number of update plans returned. The default limit is 1. Each plan may contain more than one update operation.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`--update-schema` | Includes schema axioms in the update plans
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <constraint_files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Then optionally the list of files which contain Integrity Constraints.

## Examples
Generate a plan that will fix all the constraint violations in the db
```bash
    $ stardog icv fix db
```

