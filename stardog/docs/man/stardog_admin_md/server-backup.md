---
layout: default
title: server backup
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Creates a backup of all databases in the given Stardog instance'
---

#  `stardog-admin server backup` 
## Description
Creates a backup of all databases in the given Stardog instance<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] server  backup [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <Backup location> ]`
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
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<Backup location>` | Provide a specific location to save the backup on the server side; overrides the default location.

## Discussion
Creates a backup of all databases in the given Stardog instance. By default, backups are stored in the '.backup' directory in your Stardog home, but you can use the 'backup.dir' property in your 'stardog.configuration' file to specify a different location for backups or you can override any default.

## Examples
Create a backup of all databases in the default backup directory:
```bash
    $ stardog-admin server backup
```
Create a backup of all databases and save it in the given location
```bash
$stardog-admin server backup /path/to/backup/dir/on/server
```

