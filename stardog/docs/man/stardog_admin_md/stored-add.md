---
layout: default
title: stored add
grand_parent: Stardog Admin CLI Reference
parent: stored
description: 'Adds a new stored query'
---

#  `stardog-admin stored add` 
## Description
Adds a new stored query<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] stored  add [ {-d | --database} <db> ] [ --description <description> ] [ {-n | --name} <name> ] [ --overwrite ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --reasoning ] [ --run-as <username> ] [ --schema <mSchema> ] [ --shared ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <query>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d <db>, --database <db>` | The database the query will be associated with. By default, '*' will be used which means the query can be executed over any database.
`--description <description>` | A human readable description of the query.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-n <name>, --name <name>` | Unique name for the stored query. This name is used to retrieve the stored query later. If no name is given but a query file is provided the name of the file without the extension will be used. The first letter must be an alpha character. Subsequent characters may be alphanumeric, underscore, or dash.
`--overwrite` | Overwrite an existing stored query with the same name.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--reasoning` | Enable reasoning for this stored query. If this flag is set then the stored query will always be executed with reasoning even if the reasoning is not enabled for the connection explicitly. The stored query will use the default reasoning schema. 
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Specify the reasoning schema that will be used for this query. If this flag is set then the stored query  will always be executed with the specified schema even if the reasoning is not enabled for the connection explicitly or the connection has another schema specified.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`--shared` | Share this query with other users. By default, only the user who stores the query can access it.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<query>` | The SPARQL query string to store. This can either be a file name or a SPARQL query string.

## Discussion
Adds a new stored query. Stored queries can be executed directly by using their name. Shared queries can be executed by any user. Private queries can only be executed by their creator or super users. Stored queries can be executed over the database associated with the query. The special value `*` can be used to indicate a query can be executed over any database.

## Examples
Adds a new stored query over all databases:
```bash
    $ stardog-admin stored add listProperties.sparql
```
Adds a new shared stored query with a custom name and for database myDb:
```bash
    $ stardog-admin stored add --shared -d myDb -n listProperties query.sparql
```
Adds a new stored query overwriting previous query with same name:
```bash
    $ stardog-admin stored add --overwrite -d myDb -n listProperties query.sparql
```

