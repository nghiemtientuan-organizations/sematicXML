---
layout: default
title: rocks ldb
grand_parent: Stardog Admin CLI Reference
parent: rocks
description: 'Low-Level Administration and Data Access Tool'
---

#  `stardog-admin rocks ldb` 
## Description
Low-Level Administration and Data Access Tool<br>
## Usage
`stardog-admin  rocks  ldb [ --home <home> ] [ -s <encryption passphrase> ] [ {-v | --verbose} ] [--] [ <mArgs>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--home <home>` | Stardog home directory location.
`-s <encryption passphrase>` | passphrase to access encrypted databases
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<mArgs>` | Remaining LDB options

## Discussion
The ldb command line tool offers multiple data access and database admin commands see https://github.com/facebook/rocksdb/wiki/Administration-and-Data-Access-Tool

## Examples
Print detailed help
```bash
$ stardog-admin rocks ldb --help
```
List the column families
```bash
$ stardog-admin rocks ldb --home /stardog_home/ list_column_families
```
Dump the manifest file contents
```bash
$ stardog-admin rocks ldb --home /stardog_home/ manifest_dump
```
Compact the database
```bash
$ stardog-admin rocks ldb --home /stardog_home/ compact
```
Get a key
```bash
$ stardog-admin rocks ldb --home /stardog_home/ get <key>
```

