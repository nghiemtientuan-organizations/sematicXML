---
layout: default
title: file split
grand_parent: Stardog CLI Reference
parent: file
description: 'Splits a given RDF file to multiple files'
---

#  `stardog file split` 
## Description
Splits a given RDF file to multiple files<br>
## Usage
`stardog  file  split [ -b <byteCount[k|m]> ] [ --compression <Compression> ] [ {-f | --format} <rdf format> ] [ --prefix <prefix> ] [ --suffix <suffix> ] [ -t <tripleCount> ] [--] <inputFile>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-b <byteCount[k|m]>` | Create smaller files byteCount bytes in length. Suffix 'k', 'm', or 'g' can be used after the byteCount to indicate kilobyte, megabyte, or gigabyte respectively.
`--compression <Compression>` | Compression format [GZIP, BZ2, ZIP] for the exported data.
`-f <rdf format>, --format <rdf format>` | RDF Format for the output. The supported formats are NTRIPLES, RDF/XML, TURTLE, PRETTY_TURTLE, TRIG, TRIX, N3, NQUADS, JSONLD. By default output files will have same format as input file.
`--prefix <prefix>` | Prefix for the output file names. By default the name of the input file is used as the prefix.
`--suffix <suffix>` | Number of letters to form the suffix of the file name.
`-t <tripleCount>` | Create smaller files with tripleCount triples
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<inputFile>` | Input file to split.

## Examples
Splits input file into files with 10K triples each.
```bash
    $ stardog file split -t 10K input.rdf
```
Splits input file to 2MB files. The output files will be gzip-compressed Turtle files.
```bash
    $ stardog file split -b 2M input.ttl.gz
```
Splits input file to 1M triples. The output files will be in bzip-compressed N-Triples format and named out001.nt.bz2, out002.nt.bz2, and so on
```bash
    $ stardog file split -t 1M --prefix out --suffix 3 --format nt --compressed bz2 input.ttl
```

