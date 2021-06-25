---
layout: default
title: role grant
grand_parent: Stardog Admin CLI Reference
parent: role
description: 'Grants a permission to a role.'
---

#  `stardog-admin role grant` 
## Description
Grants a permission to a role.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] role  grant {-a | --action} <action>... {-o | --object} <obj> [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <role name>`
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
`<role name>` | Role to which the permission is to be added.

## Discussion
Grants the specified permission to the role.  Only one action (-a/--action) can be specified per role grant.

## Examples
Grant the 'aRoleName' role the 'create' permission over db:*, ie, the permission to create databases
```bash
    $ stardog-admin role grant -n aRoleName -a create -o db:*
```

