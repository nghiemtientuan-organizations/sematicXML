---
layout: default
title: file obfuscate
grand_parent: Stardog CLI Reference
parent: file
description: 'Obfuscates the contents of the given RDF file'
---

#  `stardog file obfuscate` 
## Description
Obfuscates the contents of the given RDF file<br>
## Usage
`stardog  file  obfuscate [ {-c | --config} <obfuscation configuration> ] [ {-f | --format} <rdf format> ] [--] <inputFile>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-c <obfuscation configuration>, --config <obfuscation configuration>` | Configuration file for obfuscation
`-f <rdf format>, --format <rdf format>` | RDF Format for the output. The supported formats are NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD. By default output files will have the same format as the first input file.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<inputFile>` | Input file to obfuscate.

## Discussion
Obfuscates the contents of the file by replacing all URIs, bnodes, and string literals using a message digest algorithm. Non-string typed literals (integers, floats, dates, etc.) are left unchanged. The obfuscation is guided by a configuration file. Configurations can specify which URIs and strings will be obfuscated by defining inclusion and exclusion filters.

## Examples
Obfuscate input file.
```bash
    $ stardog file obfuscate input.rdf
```
Obfuscate input file using a custom configuration and output in TURTLE format:
```bash
    $ stardog file obfuscate --config my_config.ttl --format turtle input.rdf
```

