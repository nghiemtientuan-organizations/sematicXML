---
layout: default
title: data-source refresh-counts
grand_parent: Stardog Admin CLI Reference
parent: data-source
description: 'Refresh the row-count estimates for one or all tables that are accessible to a data source. When a virtual graph is loaded, it queries the data source for approximate table and index sizes. If the size of one or more tables change after the virtual graph is loaded, these estimates become stale, potentially leading to suboptimal query plans. Use this command to refresh these estimates.'
---

#  `stardog-admin data-source refresh-counts` 
## Description
Refresh the row-count estimates for one or all tables that are accessible to a data source. When a virtual graph is loaded, it queries the data source for approximate table and index sizes. If the size of one or more tables change after the virtual graph is loaded, these estimates become stale, potentially leading to suboptimal query plans. Use this command to refresh these estimates.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] data-source  refresh-counts [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <name> <[table]>... ]`
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
`<name> <[table]>` | The name of the data source and optionally the name of the table to refresh counts for. If table is not provided, estimates for all tables accessible to the data source are refreshed. Example table formats (case-sensitive): catalog.schema.table, schema.table, table

## Examples
Refresh counts for table myTable in schema mySchema for data source myDataSource
```bash
    $ stardog-admin data-source refresh-counts myDataSource mySchema.myTable
```
Refresh counts for all tables accessed through myDataSource
```bash
    $ stardog-admin data-source refresh-counts myDataSource
```

