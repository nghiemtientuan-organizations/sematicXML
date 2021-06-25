---
layout: default
title: encryption change-password
grand_parent: Stardog Admin CLI Reference
parent: encryption
description: 'Change the user managed password for encryption.'
---

#  `stardog-admin encryption change-password` 
## Description
Change the user managed password for encryption.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] encryption  change-password [ {-E | --enc-password} <password> ] [ {-N | --new-enc-password} <password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-E <password>, --enc-password <password>` | The current encryption password.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-N <password>, --new-enc-password <password>` | The new password to use for encrypting the keys that will be used fro encryption.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.

## Discussion
Stardog will not store this password nor maintain the ability to reset it,  it is a secret only known to the administrator of the server. Stardog will require the new password when the server is started.

## Examples
Change the user managed password for encryption:
```bash
$ stardog-admin encryption change-password -E <current password> -N <new password>
```

