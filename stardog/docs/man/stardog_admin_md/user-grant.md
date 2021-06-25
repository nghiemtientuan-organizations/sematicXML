---
layout: default
title: user grant
grand_parent: Stardog Admin CLI Reference
parent: user
description: 'Grants a permission to a user.'
---

#  `stardog-admin user grant` 
## Description
Grants a permission to a user.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] user  grant {-a | --action} <action> {-o | --object} <obj> [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <username>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-a <action>, --action <action>` | Action to be permitted: [read,write,create,delete,grant,revoke,execute,all].
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <obj>, --object <obj>` | Target resource (user:username, db:databasename).
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<username>` | User to be granted the permission.

## Discussion
Grants a user permission to perform a specific action against a resource within Stardog.

## Examples
Grant a user the read permission to a database
```bash
  $ stardog-admin user grant -a read -o db:myDb theUserName
```

