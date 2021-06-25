---
layout: default
title: server stop
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Issues a shutdown request to a single Stardog server.'
---

#  `stardog-admin server stop` 
## Description
Issues a shutdown request to a single Stardog server.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] server  stop [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ]`
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

## Discussion
Initiates the shutdown of a Stardog server. All pending jobs are cancelled, but running jobs are allowed to complete. Databases are taken offline immediately, rolling back all pending transactions.

## Examples
Stop the database running at the default location:
```bash
    $ stardog-admin server stop
```
Stop a database running remotely:
```bash
    $ stardog-admin --server http://12.34.56.78:5820 server stop
```

