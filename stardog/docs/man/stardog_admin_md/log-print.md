---
layout: default
title: log print
grand_parent: Stardog Admin CLI Reference
parent: log
description: 'Prints the contents of an access or audit log. A log is a sequence of events where each event has a type, timestamp, user, ip, flags, and an optional value.'
---

#  `stardog-admin log print` 
## Description
Prints the contents of an access or audit log. A log is a sequence of events where each event has a type, timestamp, user, ip, flags, and an optional value.<br>
## Usage
`stardog-admin  log  print [ {-d | --delimeter} <delimeter> ] [ {-f | --field} <field>... ] [ --filter <filter>... ] [ --json ] [ {-n | --lines} <lines> ] [ --tail ] [ --text ] [--] <log file>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d <delimeter>, --delimeter <delimeter>` | Delimeter to use for separating fields in the output. By default the output is printed in a tabular format but this option can be used to output in CSV or TSV format.
`-f <field>, --field <field>` | Fields to include in the output. Allowed values are: {Time, Event, Database, User, IP, Value, Flags}
`--filter <filter>` | Filter expressions to hide certain events. A filter expression is in the form 'field op value' where field is one of the fields defined in --field option, op is one of '=', '<', '<=', '>', '>=', or '~', and value should be a valid value for the field. For example,filter expression for time field should use xsd:date or xsd:dateTime values. The op '~' represents regular expression matching where value should be a valid Java regular expression and should match the entire value of the given field. Valid values for event field are: { AddRole, AddUser, AddUserRole, Authentication, Backup, ChangePassword, ChangeUserEnabled, ConnectionClose, ConnectionOpen, Copy, CreateDatabase, DataAdd, DataRemove, DataRemoveAll, DataRemoveContext, DeleteRole, DeleteUser, DeleteUserRole, DropDatabase, GetEffectiveUserPermissions, GetEnabledStatus, GetOption, GetRolePermissions, GetSuperStatus, GetUserPermissions, GetUserRoles, GetUsersWithRole, ListRoles, ListUsers, Migrate, Offline, Online, Optimize, Query, QueryEnd, Repair, Restore, RolePermissionGrant, RolePermissionRevoke, SetEnabledStatus, SetOption, SetSuperStatus, SetUserRoles, Shutdown, Startup, StoredQueryAdded, StoredQueryRemoved, StoredQueryUpdated, TxBegin, TxCommit, TxRollback, UserPermissionGrant, UserPermissionRevoke, WildcardPermissionRevoke }
`--json` | Display results in JSON.
`-n <lines>, --lines <lines>` | The number of lines to output from the bottom of the file.  -1 is the default and means every line.
`--tail` | Wait for new events to be logged and print them as they are logged.
`--text` | Used to indicate that the log file is in text format. Otherwise log will be assumed to be in binary format.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<log file>` | The log file to print

## Examples
Print all the events in the log file
```bash
    $ stardog-admin log print access.log
```
Print all the events but show only the specified fields
```bash
    $ stardog-admin log print --field time user database query -- access.log
```
Print only query events for the databases matching the regular expression that occurred in a specific time interval
```bash
    $ stardog-admin log print --filter event=query database~customer.* time>=2014-01-06 time<=2014-01-07 -- audit.log
```

