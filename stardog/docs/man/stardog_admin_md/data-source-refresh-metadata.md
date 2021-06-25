---
layout: default
title: data-source refresh-metadata
grand_parent: Stardog Admin CLI Reference
parent: data-source
description: 'Refresh the metadata for one or all tables that are accessible to a data source. As a data source is used by virtual graphs, the data source retains (caches) metadata on the tables that are accessed. This metadata includes the set of accessible tables as well as column-level metadata such as column names and types and constraints such as primary and foreign keys. If this metadata changes after a data source has been accessed, it may not be visible to the data source, even after a server restart (though it would be visible to new data sources). Use this command to cause the metadata to be refreshed and all the dependent virtual graphs to be reloaded.'
---

#  `stardog-admin data-source refresh-metadata` 
## Description
Refresh the metadata for one or all tables that are accessible to a data source. As a data source is used by virtual graphs, the data source retains (caches) metadata on the tables that are accessed. This metadata includes the set of accessible tables as well as column-level metadata such as column names and types and constraints such as primary and foreign keys. If this metadata changes after a data source has been accessed, it may not be visible to the data source, even after a server restart (though it would be visible to new data sources). Use this command to cause the metadata to be refreshed and all the dependent virtual graphs to be reloaded.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] data-source  refresh-metadata [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <name> <[table]>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name> <[table]>` | The name of the data source and optionally the name of the table to refresh metadata for. If table is not provided, metadata for all tables accessible to the data source are refreshed. Example table formats (case-sensitive): catalog.schema.table, schema.table, table

## Examples
Refresh metadata for table myTable in schema mySchema for data source myDataSource
```bash
    $ stardog-admin data-source refresh-metadata myDataSource mySchema.myTable
```
Refresh metadata for all tables accessed through myDataSource
```bash
    $ stardog-admin data-source refresh-metadata myDataSource
```

