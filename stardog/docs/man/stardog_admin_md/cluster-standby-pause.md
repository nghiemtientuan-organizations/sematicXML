---
layout: default
title: cluster standby-pause
grand_parent: Stardog Admin CLI Reference
parent: cluster
description: 'Pause a standby node'
---

#  `stardog-admin cluster standby-pause` 
## Description
Pause a standby node<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] cluster  standby-pause [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-t | --wait-time} <wait time> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [ {-w | --wait} ]`
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
`-t <wait time>, --wait-time <wait time>` | The maximum amount of time to wait
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`-w, --wait` | Block until the standby node is paused.

