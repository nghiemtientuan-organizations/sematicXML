---
layout: default
title: metadata set
grand_parent: Stardog Admin CLI Reference
parent: metadata
description: 'Sets one or more configuration options for database.'
---

#  `stardog-admin metadata set` 
## Description
Sets one or more configuration options for database.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] metadata  set {-o | --option} <options>... [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-o <options>, --option <options>` | One or more configuration options to set for a database. Each option is a 'key=value' pair; multiple options are separated by whitespaces, e.g., '-o "option1=value1 option2=value2"'. 
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database for the operation

## Examples
Set a specific property of myDB:
```bash
    $ stardog-admin metadata set -o virtual.transparency=true -- myDB
```

