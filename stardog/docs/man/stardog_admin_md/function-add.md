---
layout: default
title: function add
grand_parent: Stardog Admin CLI Reference
parent: function
description: 'Adds a new stored function'
---

#  `stardog-admin function add` 
## Description
Adds a new stored function<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] function  add [ --overwrite ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <function>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--overwrite` | Overwrite an existing stored function with the same name.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<function>` | The definition of the stored function in the format "FUNCTION name([parameter[, parameter]*]) { <SPARQL expression> }".

## Discussion
Adds a new stored function. Stored functions assign a name to a SPARQL function expression and allows the expression to be executed in a SPARQL query by using the name. Stored functions can be used to query any database.

## Examples
Adds a new stored function:
```bash
    $ stardog-admin function add "function permutation(?n, ?r) { factorial(?n) / factorial(?n - ?r) }"
```
Adds a new stored function overwriting previous function with same name:
```bash
    $ stardog-admin function add --overwrite "function combination(?n, ?r) { permutation(?n, ?r) / factorial(?r) }"
```
Adds multiple stored functions:
```bash
    $ stardog-admin function add "function permutation(?n, ?r) { factorial(?n) / factorial(?n - ?r) } \ 
                                   function combination(?n, ?r) { permutation(?n, ?r) / factorial(?r) }"
```

