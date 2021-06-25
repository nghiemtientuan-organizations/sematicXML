---
layout: default
title: role remove
grand_parent: Stardog Admin CLI Reference
parent: role
description: 'Removes an existing user role.'
---

#  `stardog-admin role remove` 
## Description
Removes an existing user role.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] role  remove [ {--force | -f} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <role name>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--force, -f` | Force removal flag. If this flag is set, the role and all role assignments concerning it will be removed.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<role name>` | Role to remove.

## Discussion
A role cannot be removed if it is in use by one or more users of the system. If a role to be dropped is in use, you must either manually remove all existing role assignments or use the force '--force' flag, which will automatically remove all role assignments before deleting the role.

