---
layout: default
title: diagnostics report
grand_parent: Stardog Admin CLI Reference
parent: diagnostics
description: 'Gathers information for bug reports'
---

#  `stardog-admin diagnostics report` 
## Description
Gathers information for bug reports<br>
## Usage
`stardog-admin  diagnostics  report [ {-d | --databases} ] [ {-i | --include} <Additional files to include in the report.>... ] [ {-n | --dry-run} ] [ {-o | --output} <The file location where the zip file containing the report will be written.> ] [ {-s | --no-system} ] [ {-x | --exclude} <Specific files to exclude from the report.>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d, --databases` | Include everything under STARDOG_HOME in the report
`-i <Additional files to include in the report.>, --include <Additional files to include in the report.>` | This option allows you to include a list of additional specific files. By default, the command includes any .log files in $STARDOG_HOME, including stardog.log, zookeeper.log and starrocks.log, as well as audit.log and access.log if have them. It will also include stardog.properties. In some cases the default set (which can be seen with the --dry-run option) will not include all the needed information for a specific system. If you know of something relevant that should be included in the zip file, this option can be used to include it. This option can be specified multiple times.
`-n, --dry-run` | This option will scan your system for relevant data but not actually create a zip file. It is useful for trying to audit what files will be copied into the final report. 
`-o <The file location where the zip file containing the report will be written.>, --output <The file location where the zip file containing the report will be written.>` | The path to the report output file. By default, the command will create a file called stardog-report_YYYY-MM-DD_hh-mm-ss.zip in your current directory. When using this parameter, you must specify a full file path.
`-s, --no-system` | This switch prevents system data like /var/log/kern.log from being included in the report. For a complete list of what is included in the report file use the --dry-run option.
`-x <Specific files to exclude from the report.>, --exclude <Specific files to exclude from the report.>` | This option allows you to black list files from the report. It can be handy if you have secrets in your stardog.properties file. It can be specified multiple times.

## Examples
Gather up information from the system and create a zip file that can be used for debugging.
```bash
    $ stardog-admin diagnostics report
```
Do a dry run and include the properties file for <myDB>.
```bash
    $ stardog-admin diagnostics report -n -i $STARDOG_HOME/<myDB>/index.metadata
```
Exclude stardog.log and create a file with a specific file name in $STARDOG_HOME
```bash
    $ stardog-admin diagnostics report -x $STARDOG_HOME/stardog.log -o $STARDOG_HOME/filesForStardog.zip
```

