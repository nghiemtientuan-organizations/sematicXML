---
layout: default
title: query explain
grand_parent: Stardog CLI Reference
parent: query
description: 'Returns an execution plan for the given query.'
---

#  `stardog query explain` 
## Description
Returns an execution plan for the given query.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] query  explain [ {-b | --bind} <variables to bind>... ] [ {-g | --named-graph} <Named graph> ] [ {-l | --limit} <N> ] [ {-o | --offset} <N> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database> <query>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-b <variables to bind>, --bind <variables to bind>` | Variable bindings. One or more variable bindings to apply before executing query. Each binding is provided as a 'var=value' pair; multiple bindings should be separated with whitespaces. Variables must exist in the query and the value should be a valid RDF term in Turtle syntax. Namespaces stored in the database can be used in the values; e.g. x=ex:name. Quotes are needed around IRIs to avoid special characters to be evaluated by the shell; e.g. y="<http://example.org/test>". In Turtle syntax literals have quotes which need to be escaped to differentiate them from shell quotes; e.g. z=\"value\". Finally, if a literal contains special characters or a space then additional quotes are needed for the shell; e.g. z="\"another value\"".
`-g <Named graph>, --named-graph <Named graph>` | Default graph to run the queries against.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <N>, --limit <N>` | Limit the number of results the query will return. Specifying the limit will override any limit specified in the original query string
`-o <N>, --offset <N>` | Skip the first N results the query will return. Specifying the offset will override any offset specified in the original query string
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <query>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the SPARQL query string to execute.  This can either be a file name, a SPARQL query string, or a stored query name.

## Discussion
Given a query, this command returns the optimized execution plan for the query against a database. If the connection uses reasoning, the resulting plan will take that into account.

## Examples
Return an execution plan for the specified query against the db 'myDb':
```bash
    $ stardog query explain myDb "SELECT ?title WHERE { <http://example.org/book/book1> <http://purl.org/dc/elements/1.1/title> ?title . }"
```

