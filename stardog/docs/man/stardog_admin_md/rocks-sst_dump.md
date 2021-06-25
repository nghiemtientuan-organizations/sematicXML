---
layout: default
title: rocks sst_dump
grand_parent: Stardog Admin CLI Reference
parent: rocks
description: 'Display information stored in SST file(s)'
---

#  `stardog-admin rocks sst_dump` 
## Description
Display information stored in SST file(s)<br>
## Usage
`stardog-admin  rocks  sst_dump --command <check|scan|raw|verify|identify> [ --compression_level_from <compression_level_from> ] [ --compression_level_to <compression_level_to> ] [ --compression_max_dict_bytes <uint32_t> ] [ --compression_types <comma-separated list of CompressionType members, e.g., kSnappyCompression> ] [ --compression_zstd_max_train_bytes <uint32_t> ] [ --file <data_dir_OR_sst_file> ] [ --from <user_key> ] [ --home <home> ] [ --input_key_hex ] [ --output_hex ] [ --prefix <user_key> ] [ --read_num <read_num> ] [ -s <encryption passphrase> ] [ --set_block_size <set_block_size> ] [ --show_properties ] [ --to <user_key> ] [ {-v | --verbose} ] [ --verify_checksum ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--command <check|scan|raw|verify|identify>` | check: Iterate over entries in files but don't print anything except if an error is encountered (default command)
scan: Iterate over entries in files and print them to screen
raw: Dump all the table contents to <file_name>_dump.txt
verify: Iterate all the blocks in files verifying checksum to detect possible corruption but don't print anything except if a corruption is encountered
recompress: reports the SST file size if recompressed with different compression types
identify: Reports a file is a valid SST file or lists all valid SST files under a directory
`--compression_level_from <compression_level_from>` | Compression level to start compressing when executing recompress. One compression type
      and compression_level_to must also be specified
`--compression_level_to <compression_level_to>` | Compression level to stop compressing when executing recompress. One compression type
      and compression_level_from must also be specified
`--compression_max_dict_bytes <uint32_t>` | Maximum size of dictionary used to prime the compression library
`--compression_types <comma-separated list of CompressionType members, e.g., kSnappyCompression>` | Can be combined with --command=recompress to run recompression for this
      list of compression types
`--compression_zstd_max_train_bytes <uint32_t>` | Maximum size of training data passed to zstd's dictionary trainer
`--file <data_dir_OR_sst_file>` | Path to SST file or directory containing SST files
`--from <user_key>` | Key to start reading from when executing check|scan
`--home <home>` | Stardog home directory location.
`--input_key_hex` | Can be combined with --from and --to to indicate that these values are encoded in Hex
`--output_hex` | Can be combined with scan command to print the keys and values in Hex

`--prefix <user_key>` | Returns all keys with this prefix when executing check|scan
Cannot be used in conjunction with --from
`--read_num <read_num>` | Maximum number of entries to read when executing check|scan
`-s <encryption passphrase>` | passphrase to access encrypted databases
`--set_block_size <set_block_size>` | Can be combined with --command=recompress to set the block size that will
      be used when trying different compression algorithms
`--show_properties` | Print table properties after iterating over the file when executing
      check|scan|raw|identify
`--to <user_key>` | Key to stop reading at when executing check|scan
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--verify_checksum` | Verify file checksum when executing check|scan

## Discussion
sst_dump tool can be used to gain insights about a specific SST file. There are multiple operations that sst_dump can execute on a SST file. See https://github.com/facebook/rocksdb/wiki/Administration-and-Data-Access-Tool

## Examples
Check the SST file format
```bash
$ stardog-admin rocks sst_dump --home /stardog_home/ --command=identify --verify_checksum
```
Print SST file contents
```bash
$ stardog-admin rocks sst_dump --file=/stardog_home/data/000100.sst --command=scan --read_num=100  --output_hex
```
Recompress the SST files
```bash
$ stardog-admin rocks sst_dump --file=/stardog_home/data/000100.sst --command=recompress --compression_types=kSnappyCompression
```

