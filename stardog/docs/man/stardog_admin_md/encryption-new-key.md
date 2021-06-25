---
layout: default
title: encryption new-key
grand_parent: Stardog Admin CLI Reference
parent: encryption
description: 'Create a new key to be used for encryption.'
---

#  `stardog-admin encryption new-key` 
## Description
Create a new key to be used for encryption.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] encryption  new-key [ {-E | --enc-password} <password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-R | --read-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <keyname>`
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
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<keyname>` | Key name.

## Discussion
This command instructs Stardog to create a new encryption key.  This key will be used to encrypt all newly added data.  Previously added data will not be encrypted with the new key.  They key itself is managed by Stardog and not available for the user to read.  When creating the key the user must give it a unique name.  If an encryption password is in place it must be provided with this command and it will be used to encrypt the new key beforeit is stored.

## Examples
Create a new encryption key
```bash
$ stardog-admin encryption new-key -E <password> <name>
```

