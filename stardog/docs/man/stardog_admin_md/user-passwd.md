---
layout: default
title: user passwd
grand_parent: Stardog Admin CLI Reference
parent: user
description: 'Changes user password.'
---

#  `stardog-admin user passwd` 
## Description
Changes user password.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] user  passwd [ {-N | --new-password} <new password> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <target user> ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-N <new password>, --new-password <new password>` | New password for user. If not provided, the user will be prompted to enter it.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<target user>` | User whose password is to be changed, if different from current user.

## Discussion
Sets a new password for a user, either the current user or a user as specified on the command line. Passwords must be at least four (4) and at most twenty (20) characters long and cannot contain whitespaces.

## Examples
Change the password of the current user, john:
```bash
    $ stardog-admin user passwd --username john
```
Change the password of a specific user, bob:
```bash
    $ stardog-admin user passwd --username admin bob
```

