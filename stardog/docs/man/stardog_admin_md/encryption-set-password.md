---
layout: default
title: encryption set-password
grand_parent: Stardog Admin CLI Reference
parent: encryption
description: 'Set a user managed password for encryption.'
---

#  `stardog-admin encryption set-password` 
## Description
Set a user managed password for encryption.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] encryption  set-password [ {-E | --enc-password} <password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-E <password>, --enc-password <password>` | The password to use for encrypting the keys that will be used for encryption.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.

## Discussion
When using Stardog to encrypt data at rest it is recommended that the admin manage a password that must be used to unlock the encrypted data.  Stardog will not store this password nor maintain the ability to reset it,  it is a secret only known to the administrator of the server.  This command will set that password.

Once set it must be provided to Stardog when the server is started.

Note that data encryption will not occur until Stardog has been told to create a new key.  See the new-key command.

## Examples
Set a user managed password for encryption:
```bash
$ stardog-admin encryption set-password -E <password>
```

