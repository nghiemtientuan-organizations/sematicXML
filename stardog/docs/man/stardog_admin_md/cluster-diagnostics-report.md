---
layout: default
title: cluster diagnostics-report
grand_parent: Stardog Admin CLI Reference
parent: cluster
description: 'Generate cluster diagnostic report zip'
---

#  `stardog-admin cluster diagnostics-report` 
## Description
Generate cluster diagnostic report zip<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] cluster  diagnostics-report [ {-i | --include} <Additional files to include in the report.>... ] [ {-o | --output} <The file location where the zip file containing the report will be written.> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-s | --no-system} ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [ {-x | --exclude} <Specific files to exclude from the report.>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-i <Additional files to include in the report.>, --include <Additional files to include in the report.>` | This option allows you to include a list of additional specific files. By default, the command includes any .log files in $STARDOG_HOME, including stardog.log, zookeeper.log and starrocks.log, as well as audit.log and access.log if have them. It will also include stardog.properties. In some cases the default set (which can be seen with the --dry-run option) will not include all the needed information for a specific system. If you know of something relevant that should be included in the zip file, this option can be used to include it. This option can be specified multiple times.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <The file location where the zip file containing the report will be written.>, --output <The file location where the zip file containing the report will be written.>` | The path to the report output file. By default, the command will create a file called stardog-report_YYYY-MM-DD_hh-mm-ss.zip in your current directory. When using this parameter, you must specify a full file path.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`-s, --no-system` | This switch prevents system data like /var/log/kern.log from being included in the report. For a complete list of what is included in the report file use the --dry-run option.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`-x <Specific files to exclude from the report.>, --exclude <Specific files to exclude from the report.>` | This option allows you to black list files from the report.  It can be handy if you have secrets in your stardog.properties file. It can be specified multiple times.

