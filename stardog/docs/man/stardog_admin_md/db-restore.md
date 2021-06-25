---
layout: default
title: db restore
grand_parent: Stardog Admin CLI Reference
parent: db
description: 'Restore a database from a backup.'
---

#  `stardog-admin db restore` 
## Description
Restore a database from a backup.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] db  restore [ {-n | --name} <new name> ] [ {-o | --overwrite} ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <backup location>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-n <new name>, --name <new name>` | Specify a new name for the restored database
`-o, --overwrite` | If the database being restored already exists, overwrite the existing copy with the restored version
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<backup location>` | The full path on disk or the URL of the backup to restore

## Discussion
Restores a database from its backup.  The location of the backup should be the full path to the backup, not the location of the backup directory as specified in your Stardog configuration. By default, the name of a database is saved in its backup, so there is no need to specify a name for the restored database.  However, if you wish to restore the backup to a different database, a new name can be provided, which must be unique.  A backup will not be restored over an existing database of the same name, to force an overwrite using the restored database, use the -o/--overwrite flag.  You cannot overwrite and specify a new name. If overwrite is not specified, and a new name is not provided, and a database with the name of the database to be restored already exists, the restore operation will not succeed.

## Examples
Restore a database from its backup:
```bash
    $ stardog-admin db restore $STARDOG_HOME/.backup/myDb/2012-06-21
```
Restore a database to a new copy:
```bash
    $ stardog-admin db restore --name restoredMyDb $STARDOG_HOME/.backup/myDb/2012-06-21
```

