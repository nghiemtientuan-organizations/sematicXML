---
layout: default
title: license info
grand_parent: Stardog Admin CLI Reference
parent: license
description: 'Prints information about a Stardog license'
---

#  `stardog-admin license info` 
## Description
Prints information about a Stardog license<br>
## Usage
`stardog-admin  license  info [ {-v | --verbose} ] [--] <license file>`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<license file>` | The license file to check

## Examples
Print information about a license
```bash
    $ stardog-admin license info /path/to/my/stardog-license-key.bin
```

