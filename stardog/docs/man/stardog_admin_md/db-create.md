---
layout: default
title: db create
grand_parent: Stardog Admin CLI Reference
parent: db
description: 'Creates a new database.'
---

#  `stardog-admin db create` 
## Description
Creates a new database.<br>
## Usage
`stardog-admin [ --krb5 ] [ --krb5-disable-rdns ] [ --server <server url> ] db  create [ {-c | --config} <config> ] [ --copy-server-side ] [ {-n | --name} <name> ] [ {-o | --options} <options>... ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ --run-as <username> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] [ <file>... ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-c <config>, --config <config>` | Database configuration file. This file specifies the name and options to use when creating the database. Options specified explicitly on the command line override those in the configuration file.
`--copy-server-side` | Flag to specify whether or not files to be bulk loaded should be copied to the remote machine. By default, files are not copied, only the specified paths are sent to the machine with the expectation that they exist on the server.  So to transfer the files to be bulk loaded, you must specify this option.
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-n <name>, --name <name>` | Database name. The first letter must be an alpha character. Subsequent characters may be alphanumeric, underscore, or dash. The name is a required property of a database, but it can be omitted on the command line if it is specified in a configuration file via the -c/--config flag.
`-o <options>, --options <options>` | Database configuration options. Each option is a 'key=value' pair; multiple options are separated by whitespaces, e.g., '-o "option1=value1 option2=value2"'. When used as the last option, values should be followed by '--'.
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`--run-as <username>` | User to impersonate when running the command
`--server <server url>` | URL of Stardog Server. If this option isn't specified, it will be read from JVM argument 'stardog.default.cli.server'. If the JVM arg isn't set, the default value 'http://localhost:5820' is used. If server URL has no explicit port value, the default port value '5820' is used.  Example: 'stardog-admin --server http://12.34.56.78:5820 server stop' 
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<file>` | The list of files to bulk load into the database when it is created, and, optionally, the named graph(s) into which to load them.

## Discussion
The new database will be persisted to the Stardog home directory and set online. Files to be added to the database may be passed as final arguments. If a directory is passed as one of the final arguments, all the files in that directory and its child directories will be recursively loaded to the database. Additionally, zip files will be uncompressed and the RDF files they contain will be loaded. Files with unrecognized extensions, or that produce parse errors, will be (silently) ignored. Named graphs can be specified with an @ sign preceding the graph iri. All files after that graph will be loaded into that graph until another @graph is encountered. A single @ can be used to switch back to the default graph. By default, files are not copied to the remote server; only the paths are sent.  If the files do not exist on the remote server, the '--copy-server-side' flag should be specified in order to copy them before creating the database and bulk loading the information.

## Examples
Create a new database with the default options by providing a name and a set of initial datasets to load:
```bash
    $ stardog-admin db create -n my-database input.ttl another_file.rdf moredata.rdf.gz
```
Create an empty database from a configuration file:
```bash
    $ stardog-admin db create -c database.properties
```
Create a database with initial input to be bulk loaded and some other options:
```bash
    $ stardog-admin db create -n db1 -o icv.enabled=true icv.reasoning.enabled=true -- input.ttl
```
Create a database loading separate files into separate named graphs:
```bash
    $ stardog-admin db create -n myDb input0.ttl @http://stardog.com/graph/1 input1.ttl input2.ttl @urn:stardog:graph:2 input3.ttl @ input4.ttl
```

