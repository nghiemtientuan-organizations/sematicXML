---
layout: default
title: server restore
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Restore a Stardog home from a full backup created using the "server backup" command'
---

#  `stardog-admin server restore` 
## Description
Restore a Stardog home from a full backup created using the "server backup" command<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] server  restore [ {-b | --backupId} <backup id> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <backup location>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-b <backup id>, --backupId <backup id>` | The backupId whould be used for restore
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<backup location>` | The full path on the server to the backup created using the "server backup" command

## Discussion
Restores all backed up databases into the current home. Note: Stardog server should not be running on that home.The command should be executed on the server sideNote that STARDOG_HOME target directory should be empty, if this doesn't exist it will be created automatically

## Examples
Restore the server and all the databases from the latest backup:
```bash
$stardog-admin server restore /path/to/backup/dir/on/server
```
Restore the server and all the databases from a specific backup:
```bash
$stardog-admin server restore -b 3 /path/to/backup/dir/on/server
```

