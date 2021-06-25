---
layout: default
title: server migrate
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Migrates the contents of a Stardog home directory from an old version to the current version.'
---

#  `stardog-admin server migrate` 
## Description
Migrates the contents of a Stardog home directory from an old version to the current version.<br>
## Usage
`stardog-admin  server  migrate [ {-v | --verbose} ] [--] <old-stardog-home> <new-stardog-home>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<old-stardog-home> <new-stardog-home>` | Location of the old Stardog home directory followed by the location of new Stardog home directory.

## Discussion
Migrates the contents of a Stardog home directory from an old version to the current version. The new home directory should exist and contain nothing but the license file.Migration is not needed for most version upgrades but sometimes there are backward-incompatible changes between two versions (e.g. from version 6 to version 7) that requires manual migration. This command migrates the contents of the each database along with the system database that contains users, roles, permissions and other metadata. The stardog.properties file will NOT be copied automatically. Please consult the migration guide in Stardog documentation for any possible changes in the configuration options.

## Examples
Migrate the home directory from version 6 to version 7
```bash
    $ stardog-admin migrate /data/stardog/home6 /data/stardog/home7
```

