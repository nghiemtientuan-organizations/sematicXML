---
layout: default
title: role revoke
grand_parent: Stardog Admin CLI Reference
parent: role
description: 'Revokes a permission associated to a role.'
---

#  `stardog-admin role revoke` 
## Description
Revokes a permission associated to a role.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] role  revoke {-a | --action} <action> {-o | --object} <obj> [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <role name>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a <action>, --action <action>` | Action to be revoked: [read,write,create,delete,grant,revoke,execute,all].
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <obj>, --object <obj>` | Target resource (user:username, database:databasename).
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<role name>` | Role whose permission is to be revoked.

