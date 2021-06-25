---
layout: default
title: data-source online
grand_parent: Stardog Admin CLI Reference
parent: data-source
description: 'Online a data source. When Stardog restarts, data sources that cannot be loaded will be listed (stardog-admin data-source list) as offline. Use this command to retry loading an offline data source. If successful, all virtual graphs that use the data source will be brought online as well.'
---

#  `stardog-admin data-source online` 
## Description
Online a data source. When Stardog restarts, data sources that cannot be loaded will be listed (stardog-admin data-source list) as offline. Use this command to retry loading an offline data source. If successful, all virtual graphs that use the data source will be brought online as well.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] data-source  online [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <name>`
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
`<name>` | Name of the data source to online

## Examples
Online an data source named myDataSource
```bash
    $ stardog-admin data-source online myDataSource
```

