---
layout: default
title: test create
grand_parent: Stardog CLI Reference
parent: test
description: 'Create test definitions from a set of queries in a directory. The command will recursively traverse the directory, find query files matching the provided glob expression (default: *.{sparql,rq}), execute the query against the provided database and generate one test definition file for each directory. Test definition file will contain one test for each query file found. The expected time for the query will be computed by running the query first as many as {@code --runs} times taking the average. The query is run as many as {@code --warmups} times first but execution times for warmups are disregarded. The expected results for the queries are saved into a file in the same directory as the query. If queries return too many results or results change at every execution (e.g. due to {@code UUID} or {@code RAND} functions) then {@code --only-counts} option can be used to record the number of results expected instead of actual query results.'
---

#  `stardog test create` 
## Description
Create test definitions from a set of queries in a directory. The command will recursively traverse the directory, find query files matching the provided glob expression (default: *.{sparql,rq}), execute the query against the provided database and generate one test definition file for each directory. Test definition file will contain one test for each query file found. The expected time for the query will be computed by running the query first as many as {@code --runs} times taking the average. The query is run as many as {@code --warmups} times first but execution times for warmups are disregarded. The expected results for the queries are saved into a file in the same directory as the query. If queries return too many results or results change at every execution (e.g. due to {@code UUID} or {@code RAND} functions) then {@code --only-counts} option can be used to record the number of results expected instead of actual query results.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] test  create [ --glob <glob> ] [ --no-timings ] [ --only-counts ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --runs} <runs> ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [ {-w | --warmups} <warmups> ] [--] <directory>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--glob <glob>` | The glob expression to use for finding files in the directory. The default is looking for fileswith extension ,sparql or .rq.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--no-timings` | Do not include expected times for queries in the test definition..
`--only-counts` | Include only expected number of results in the test definition and not the actual results. .
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r <runs>, --runs <runs>` | The number of test runs to execute. Each query will be executed these many times and the expected query execution time will be computed as the average of these runs. The default is two (2).
`--run-as <username>` | User to impersonate when running the command
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`-w <warmups>, --warmups <warmups>` | The number of warmups to run. Each query in the test suite will be run these many timesbefore average query execution times are computed. The default is three (3).
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<directory>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Subsequent argument is a directory that contains a set of SPARQL queries. The directory will be traversed recursively and a test manifest filewill be created under each

## Examples
Creates a test definition file for myDb using default settings:
```bash
    $ stardog test create myDb path/to/queryDir
```

