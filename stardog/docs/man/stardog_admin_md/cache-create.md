---
layout: default
title: cache create
grand_parent: Stardog Admin CLI Reference
parent: cache
description: 'Create a new cached dataset. A cached dataset can be created from either an existing named or virtual graph or from a query. A cached graph duplicates the entire contents of the graph in the cache. A cached query stores the results of query execution in the cache. A cached query must be associated with a database. The cached results will only be considered for use in queries against the associated database.'
---

#  `stardog-admin cache create` 
## Description
Create a new cached dataset. A cached dataset can be created from either an existing named or virtual graph or from a query. A cached graph duplicates the entire contents of the graph in the cache. A cached query stores the results of query execution in the cache. A cached query must be associated with a database. The cached results will only be considered for use in queries against the associated database.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] cache  create [ {-d | --database} <database> ] [ {-g | --graph} <graphName> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-q | --query} <query> ] [ --refresh-script <refresh script> ] [ --register-only ] [ --run-as <username> ] [ {-t | --target} <target> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <name>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d <database>, --database <database>` | Database associated with the cached dataset.
`-g <graphName>, --graph <graphName>` | Caches a graph with the given name.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-q <query>, --query <query>` | *Experimental* caches a query.
`--refresh-script <refresh script>` | Refresh script used to refresh the cached dataset. (Cached graph only)
`--register-only` | Register a cached dataset without loading data for cache targets with existing cache databases.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-t <target>, --target <target>` | Cache target on which to store the cached dataset.The name 'localhost' can be used to cache locally.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | The IRI used to identify the created cached dataset.

## Examples
Created a cached graph containing the contents of a virtual graph (assuming node1 is a registered cache target)
```bash
    $ stardog-admin cache create cache://virtual-name --graph virtual://name --target node1
```
Create a cached graph but do not load the contents
```bash
    $ stardog-admin cache create cache://virtual-name --graph virtual://name --target node1 --register-only
```
*Experimental*: Created a cached query containing the results of a query on database 'db'
```bash
    $ stardog-admin cache create cache://query_file --query query_file.rq --target node1 --database db
```

