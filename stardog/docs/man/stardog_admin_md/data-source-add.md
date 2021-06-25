---
layout: default
title: data-source add
grand_parent: Stardog Admin CLI Reference
parent: data-source
description: 'Registers a new data source.'
---

#  `stardog-admin data-source add` 
## Description
Registers a new data source.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] data-source  add [ {-f | --force} ] [ {-n | --name} <data source name> ] [ {-o | --overwrite} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <options>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f, --force` | Whether to proceed if this data source has dependent virtual graphs
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-n <data source name>, --name <data source name>` | Optional override of the data source name
`-o, --overwrite` | If the data source being added already exists, overwrite the existing copy with the new version
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<options>` | The configuration file for the data source. If no --name option is provided, the name of the configuration file without the extension will be the name of the data source.

## Examples
Register a new data source named 'myDataSource', taking the name from the name of the properties file
```bash
    $ stardog-admin data-source add myDataSource.properties
```
Register a new data source named 'myDataSource', providing the name as an option
```bash
    $ stardog-admin data-source add --name myDataSource myProperties.properties
```
Update an existing data source that has no dependent virtual graphs
```bash
    $ stardog-admin data-source add --overwrite myDataSource.properties
```
Update an existing data source, refreshing all the dependent virtual graphs
```bash
    $ stardog-admin data-source add --overwrite --force myDataSource.properties
```

