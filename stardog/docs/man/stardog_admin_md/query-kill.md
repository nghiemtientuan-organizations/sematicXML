---
layout: default
title: query kill
grand_parent: Stardog Admin CLI Reference
parent: query
description: 'Kills the execution of the given query.'
---

#  `stardog-admin query kill` 
## Description
Kills the execution of the given query.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] query  kill [ {-a | --all} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <queryIDs>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a, --all` | Kill all queries flag. If this flag is set, all running queries the user has permission to kill will be killed.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<queryIDs>` | List of query IDs to kill.

## Discussion
Stops the execution of the query with the given ID. Multiple queries can be killed by providing multiple query IDs. The user should have permission to kill the specified queries. Superusers can kill any query but ordinary users can only kill the queries they are running.

