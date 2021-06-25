---
layout: default
title: graphql explain
grand_parent: Stardog CLI Reference
parent: graphql
description: 'Explains a GraphQL query. The output shows the SPARQL translation and the query plan for the SPARQL query.'
---

#  `stardog graphql explain` 
## Description
Explains a GraphQL query. The output shows the SPARQL translation and the query plan for the SPARQL query.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] graphql  explain [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <schema> ] [ --timeout <N[h|m|s]> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database> <query>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on.
`--run-as <username>` | User to impersonate when running the command
`--schema <schema>` | Specify the name of the GraphQL schema that will be used for the query. If no schema is specified the query will use the automated translation rules and will not validate the query.
`--timeout <N[h|m|s]>` | Timeout for the query in ms. An optional time unit can be specified by the suffix 'h' (for hours), 'm' (for minutes), or 's' (for seconds). Timeout value of 0 results in no timeout
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database> <query>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. The subsequent argument is the GraphQL query to execute. This can either be a file name or a GraphQL query string.

## Examples
Show the SPARQL translation for an inline GraphQL query:
```bash
    $ stardog graphql explain myDb "{ Human { name } }"
```
Show the SPARQL translation for a GraphQL query from a file:
```bash
    $ stardog graphql explain myDb query.file
```

