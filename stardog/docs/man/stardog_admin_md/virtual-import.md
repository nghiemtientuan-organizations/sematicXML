---
layout: default
title: virtual import
grand_parent: Stardog Admin CLI Reference
parent: virtual
description: 'Imports (aka materializes) data from a database or file (delimited or JSON) into Stardog.'
---

#  `stardog-admin virtual import` 
## Description
Imports (aka materializes) data from a database or file (delimited or JSON) into Stardog.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] virtual  import [ {-f | --format} <Mappings format> ] [ {-g | --named-graph} <named graph> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --remove-all ] [ --run-as <username> ] [ {-s | --data-source} <data source> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database name> <configFile> <mappingsFile> <inputFile>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <Mappings format>, --format <Mappings format>` | Format of the mappings; one of [STARDOG, R2RML, SMS2]. Use this command-line option instead of setting the mappings.syntax option in the options file.
`-g <named graph>, --named-graph <named graph>` | Target named graph. If no named graph is specified, the default graph will be used. This is the named graph where data will be imported into.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--remove-all` | Remove all flag. If this flag is set, all data in destination named graph will be removed before the import.
`--run-as <username>` | User to impersonate when running the command
`-s <data source>, --data-source <data source>` | The data source for this import. Data sources can be added with stardog-admin data-source commands.
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database name> <configFile> <mappingsFile> <inputFile>` | The name of the database to import the data followed by a configuration file, a mappings file and an input file. When importing from an RDBMS the configuration file is required, the mappings file is optional (when absent direct mapping is used), and input file argument is not used. When importing CSV, the configuration file is optional, the mappings file and the input file (should be a valid CSV file) are required.

## Examples
Import all of the contents of a virtual graph with direct mappings into database myDB
```bash
    $ stardog-admin virtual import myDB source.properties
```
Import all of the contents of a virtual graph with the mappings written in Stardog mappings syntax
```bash
    $ stardog-admin virtual import myDB source.properties source.ttl
```
Import all of the contents of a virtual graph with the mappings written in standard R2RML Turtle syntax
```bash
    $ stardog-admin virtual import --format r2rml myDB source.properties source.ttl
```
Import the contents of a CSV file with the given mappings
```bash
    $ stardog-admin virtual import myDB mappings.ttl input.csv
```
Import the contents of a JSON file with the given mappings
```bash
    $ stardog-admin virtual import --format sms2 myDB mappings.sms input.json
```

