---
layout: default
title: cache status
grand_parent: Stardog Admin CLI Reference
parent: cache
description: 'Query the status of a cached dataset.'
---

#  `stardog-admin cache status` 
## Description
Query the status of a cached dataset.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] cache  status [ {-a | --all} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <name>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a, --all` | Return status of all cached datasets
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<name>` | The IRI used to identify the cached dataset for which to return the status.

## Examples
Print the status of a cached dataset by name
```bash
    $ stardog-admin cache status cache://virtual-name
```
Print the status of all cached datasets
```bash
    $ stardog-admin cache status -a
```

