---
layout: default
title: test run
grand_parent: Stardog CLI Reference
parent: test
description: 'Run the specified tests.'
---

#  `stardog test run` 
## Description
Run the specified tests.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] test  run [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --repeat-update-queries ] [ --run-as <username> ] [ --show-plans ] [ --stop-at-first-failure ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--repeat-update-queries` | Run update queries as many times as specified in the test definition. By default,update queries are run only once regardless of test settings.
`--run-as <username>` | User to impersonate when running the command
`--show-plans` | Print query plan before running each query.
`--stop-at-first-failure` | Stop at first failure.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<files>` | Test definitions to run. Test definition is an RDF file containing the definitions for the 

