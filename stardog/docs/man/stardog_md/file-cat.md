---
layout: default
title: file cat
grand_parent: Stardog CLI Reference
parent: file
description: 'Concatenate and print RDF files in desired format'
---

#  `stardog file cat` 
## Description
Concatenate and print RDF files in desired format<br>
## Usage
`stardog  file  cat [ {-f | --format} <rdf format> ] [--] <inputFile>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-f <rdf format>, --format <rdf format>` | RDF Format for the output. The supported formats are NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD. By default output files will have the same format as the first input file.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<inputFile>` | Input files to concatenate.

## Examples
Concatenate input files and output in Turtle format.
```bash
    $ stardog file cat input1.ttl input2.nt input3.rdf
```
Concatenate input files and output in RDF/XML format.
```bash
    $ stardog file cat -f rdf/xml input1.ttl input2.nt input3.rdf
```
Concatenate input files and output in gzipped Turtle format.
```bash
    $ stardog file cat -f rdf/xml input1.ttl.gz input2.ttl.gz > output.ttl.gz
```

