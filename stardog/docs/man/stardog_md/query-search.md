---
layout: default
title: query search
grand_parent: Stardog CLI Reference
parent: query
description: 'Performs a full-text search over the database; prints results on STDOUT.'
---

#  `stardog query search` 
## Description
Performs a full-text search over the database; prints results on STDOUT.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] query  search [ {-g | --named-graph | --named-graphs} <named graphs>... ] [ {-l | --limit} <limit> ] [ {-o | --offset} <offset> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] {-q | --query} <query> [ --run-as <username> ] [ {-t | --threshold} <threshold> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-g <named graphs>, --named-graph <named graphs>, --named-graphs <named graphs>` | Named graph(s) to search.  Multiple graphs are separated by whitespaces, e.g., '-g "urn:context1 urn:context2"'. The keyword 'ALL' can be used to denote the entire database, 'NAMED' for only the named graphs, and 'DEFAULT' for the default graph. By default, searches are only over the default graph.  When used as the last option, values should be followed by '--' to denote the end of the named graphs.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Max number of search results; default: 50.
`-o <offset>, --offset <offset>` | Offset search results; default 0.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-q <query>, --query <query>` | Search query in standard Lucene query syntax.  More information about Lucene query syntax at http://bit.ly/Z02mfV
`--run-as <username>` | User to impersonate when running the command
`-t <threshold>, --threshold <threshold>` | Minimum score threshold for results
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https.

## Discussion
Uses Waldo, the Stardog Lucene integration, to perform a full-text search over the contents of the database.  This will return all individuals which have a literal whose value which matches the input search term.  Because the search is over the literal values, but this function returns individuals, you can see repeated individuals when an one has multiple values which match the search term.  If you want to retrieve the literals instead, or want to perform more sophisticated filtering, you can use the SPARQL search syntax which is explained in more detail at http://docs.stardog.com/#_searching.

## Examples
Perform the default search
```bash
    $ stardog query search -q 'the search string' myDb
```
Perform a search with a minimum threshold and maximum number of results
```bash
    $ stardog query search -q 'the search string' -l 100 -t 5 myDb
```

