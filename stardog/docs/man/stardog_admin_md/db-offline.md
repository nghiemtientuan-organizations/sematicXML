---
layout: default
title: db offline
grand_parent: Stardog Admin CLI Reference
parent: db
description: 'Takes a database offline.'
---

#  `stardog-admin db offline` 
## Description
Takes a database offline.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] db  offline [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ --timeout <timeout> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
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
`--timeout <timeout>` | Timeout in ms to wait before database is put offline. An optional time unit can be specified by the suffix 'h' (for hours), 'm' (for minutes), or 's' (for seconds). If no timeout is specified, the  default timeout of 5 seconds is used.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database for the operation

## Discussion
Initiates the offlining of a database. The offline operation optionally takes a timeout which, when specified, provides a window where the database is not yet offline. While in this window, no new connections will be accepted but all open connections will be allowed to complete their actions. Once the timeout has been reached, any remaining connections are closed, open transactions are rolled back, and the database is put offline.

## Examples
Take a database 'foo' offline:
```bash
    $ stardog-admin db offline foo
```
Take the database 'foo' offline, but wait 15 minutes for open connections to complete their actions:
```bash
    $ stardog-admin db offline --timeout 15m foo 
```
Take the database 'foo' offline immediately:
```bash
    $ stardog-admin db offline --timeout 0 foo 
```

