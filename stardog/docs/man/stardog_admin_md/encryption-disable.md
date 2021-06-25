---
layout: default
title: encryption disable
grand_parent: Stardog Admin CLI Reference
parent: encryption
description: 'Disable encryption for data added in the future.'
---

#  `stardog-admin encryption disable` 
## Description
Disable encryption for data added in the future.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] encryption  disable [ {-E | --enc-password} <password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-R | --read-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-E <password>, --enc-password <password>` | The current encryption password.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-R, --read-password` | Read the encryption password from the console.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.

## Discussion
This command will stop Stardog from encrypting newly inserted data.  All previously added data will remain encrypted.  If an encryption password has been set it must be used with this command.  This command will not disable or change the encryption password.

## Examples
Disable encryption:
```bash
$ stardog-admin encryption disable -E <current password>
```

