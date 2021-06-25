---
layout: default
title: icv report
grand_parent: Stardog CLI Reference
parent: icv
description: 'Integrity Constraint Validation command that validates SHACL constraints and generates a SHACL validation report as defined in the SHACL specification. Note that if there are other constraints in the database they will not be validated by this command.'
---

#  `stardog icv report` 
## Description
Integrity Constraint Validation command that validates SHACL constraints and generates a SHACL validation report as defined in the SHACL specification. Note that if there are other constraints in the database they will not be validated by this command.<br>
## Usage
`stardog [ --krb5 ] [ --krb5-disable-rdns ] icv  report [ {-f | --format} <format> ] [ {-g | --named-graph | --named-graphs} <named graph(s)>... ] [ {-l | --limit} <limit> ] [ --nodes <nodes>... ] [ --output-format <Output Format> ] [ {-p | --passwd} <password> ] [ {-P | --ask-password} ] [ {-r | --reasoning} ] [ --run-as <username> ] [ --schema <mSchema> ] [ --shapes <shapes>... ] [ --simple-target ] [ --skip-cache ] [ {-u | --username} <username> ] [ {-v | --verbose} ] [--] <dbname> <constraint_files>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <format>, --format <format>` | RDF Format [N-TRIPLES, RDF/XML, TURTLE, TRIG] for the constraints or [SPARQL] for constraints specified as SPARQL queries.
`-g <named graph(s)>, --named-graph <named graph(s)>, --named-graphs <named graph(s)>` | The list of contexts which should be validated, if none are specified, the entire database is validated wrt to the provided constraint(s).
`--krb5` | Use the Kerberos environment.
`--krb5-disable-rdns` | Disable reverse DNS lookup for Kerberos clients.
`-l <limit>, --limit <limit>` | Limits the number of validation results returned. The default limit is 100. Note that, each validation result will be serialized using multiple triples so the number of triples in the report might be higher than this limit. If a limit of '-1' is specified, all validation results will be returned.
`--nodes <nodes>` | The list of node IRIs that should be validated, if none are specified, all the nodes in the database are validated.
`--output-format <Output Format>` | Output RDF Format for the validation report. One of [NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD]
`-p <password>, --passwd <password>` | Password.
`-P, --ask-password` | Prompt for password.
`-r, --reasoning` | Turn reasoning on with the default schema.
`--run-as <username>` | User to impersonate when running the command
`--schema <mSchema>` | Turn reasoning on with the specified schema.
`--shapes <shapes>` | The list of shape IRIs that should be validated, if none are specified, all the SHACL shapes will be validated.
`--simple-target` | If true, sh:targetClass will be evaluated based on rdf:type triples only, without following rdfs:subClassOf relations.
`--skip-cache` | If true, do not check if there's a cache node containing the graph to be validated. Takes effect only if a named graph has been specified with the -g/--named-graph option.
`-u <username>, --username <username>` | User name.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<dbname> <constraint_files>` | The name of the database or the full connection string of the database to connect to. If only the name is provided, the default server URL will be pre-pended to the name of the database in order to construct the connection string. Connection parameters such as ';reasoning=true' can be included in the provided database name. Connection parameters specified like this can be overridden by specific options on the command. The default server URL will be read from the JVM argument 'stardog.default.cli.server'. If the JVM argument is not set, the default value 'http://localhost:5820' is used. If the server URL has no explicit port value, the default port value '5820' is used.  To use a secure connection, you should specify the full connection string and postfix 's' to the protocol, e.g. https. Then optionally the list of files which contain SHACL Constraints.

## Examples
Validate the SHACL constraints already loaded to the database:
```bash
    $ stardog icv report myDb
```
Validate only the specified named graphs:
```bash
    $ stardog icv report --named-graphs http://example.org/graph1 http://example.org/graph2 -- myDb
```

