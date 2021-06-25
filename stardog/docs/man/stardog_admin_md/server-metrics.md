---
layout: default
title: server metrics
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Retrieves server metrics'
---

#  `stardog-admin server metrics` 
## Description
Retrieves server metrics<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] server  metrics [ --locks ] [ --no-databases ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ --samples ] [ --threads ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <space-separated metric name regex patterns> (see command examples)`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--locks` | locked monitors and locked synchronizers in the thread dump. Takes effect only if --threads is provided.
`--no-databases` | Do not include database-specific metrics and instead only return server-wide metrics. By defaultdatabase details will be shown.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--samples` | Include detailed sample information for each meter and histogram.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`--threads` | Include the thread dump from the server.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<space-separated metric name regex patterns> (see command examples)` | Display only metrics, matching the specified patterns.

## Discussion
Reports server metrics. Metrics are organized using a dot-delimited namespace system. Top-level namespaces include: admin.threads (thread management for admin HTTP operations), com.stardog.http.server.<port> (HTTP statistics), user.threads (thread management for user HTTP operations), databases.<dbname> (metrics for specific databases), dbms (process and memory metrics), system (system info). See https://www.stardog.com/docs/#_metrics_in_stardog_7 for descriptions of specific metrics.

## Examples
Display all metrics:
```bash
$ stardog-admin server metrics
```
Display dbms.credentials.cache.size metric:
```bash
$ stardog-admin server metrics dbms.credentials.cache.size
```
Display dbms.credentials.cache.size metric and metrics matching the pattern dbms.mem.*:
```bash
$ stardog-admin server metrics dbms.credentials.cache.size "dbms.mem.*"
```
Display metrics matching dbms.mem.* and dbms.memory.*:
```bash
$ stardog-admin server metrics "dbms.mem.*" "dbms.memory.*"
```
Get the thread dump from the server:
```bash
$ stardog-admin server metrics --threads "jvm.threads"
```

