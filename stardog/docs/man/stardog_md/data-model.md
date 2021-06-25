---
layout: default
title: data model
grand_parent: Stardog CLI Reference
parent: data
description: 'Generates a data model from the specified input and outputs the model in the desired format.'
---

#  `stardog data model` 
## Description
Generates a data model from the specified input and outputs the model in the desired format.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] data  model [ {-f | --format} <RDF Format> ] [ --include-provenance ] [ --input <input> ] [ --output <output> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <database>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <RDF Format>, --format <RDF Format>` | RDF format for outputs that are serialized in RDF. Allowed RDF formats are [NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD].
`--include-provenance` | Whether to include provenance metadata with the model.
`--input <input>` | The input source that will be used to generate the data model. Valid values are [OWL, SHACL, VIRTUAL].
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`--output <output>` | The output format for serializing the data model. Valid values are [GraphQL, SHACL, SQL, TEXT].
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<database>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https.

## Examples
Generate a data model from the RDFS/OWL schema into a GraphQL schema:
```bash
    $ stardog data model --input OWL --output GraphQL myDb > schema.graphqls
```
Convert the SHACL schema into SQL table mappings that can be used by Stardog's BI/SQL server:
```bash
    $ stardog data model --input SHACL --output SQL myDb > tableMappings.ttl
```

