---
layout: default
title: db backup
grand_parent: Stardog Admin CLI Reference
parent: db
description: 'Create a backup of an existing database.'
---

#  `stardog-admin db backup` 
## Description
Create a backup of an existing database.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] db  backup [ --index <index order> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --partial ] [ --repair ] [ --run-as <username> ] [ {-t | --to} <backup location> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <db>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--index <index order>` | Specify an index order to be used for creating the backup. Each index order contains thesame data so this option has no effect under normal conditions. But if an index corruption is detected via the 'db verify' command then this option can be used to select a specific index order. Allowed values are {SPO, PSO, POS, OSP, SPOC, PSOC, POSC, OSPC}
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--partial` | When a repairing backup is being generated the operation will fail even if a single triple cannot be repaired. Enabling this option will create the backup with as many triples as possible.
`--repair` | Repair the backup. If an index is corrupted then creating a backup would preserve the corruption. This option enables an additional processing step that will create a clean backup without the corruption. The index will stay corrupted so the clean backup should be restored to fix the corruption. The 'db verify' command should be used prior to this option to check if repair is necessary and possible.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-t <backup location>, --to <backup location>` | Provide a specific location to save the backup; overrides the default location.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<db>` | The database which should be backed up

## Discussion
Create a complete backup copy of a database.  As opposed to export, which is a logical copy and only provides a snapshot of the contents of the database, a backup is a physical copy and preserves database metadata in addition to the contents so an exact copy can be made during a restore.  By default, backups are stored in the '.backup' directory in your Stardog home, but you can use the 'backup.dir' property in your 'stardog.configuration' file to specify a different location for backups or you can override any default using the -t/--to option.  Within the backup directory, backups are stored by database, and for each database, in date-versioned directories.

Your typical backup directory would have a layout similar to this:
.backup/myDb/2013-10-02
.backup/myDb/2013-10-11
.backup/myOtherDb/2013-06-21

Within each of those directories are the actual backups themselves.  If you want to restore a database from
one of those backups, you will have to use the complete path to the backup, not just the path to the top
level directory as specified by this property, ie, `db restore $STARDOG_HOME/.backup/myDb/2013-10-02`

## Examples
Create a backup of the 'myDatabase' database in the default backup directory:
```bash
    $ stardog-admin db backup myDatabase
```
Save the backup of the database 'myDatabase' to a specific directory:
```bash
    $ stardog-admin db backup --to /my/backup/dir myDatabase
```
Create a backup using the PSOC index and repairing corruption issues:
```bash
    $ stardog-admin db backup --repair --index PSOC /my/backup/dir myDatabase
```

