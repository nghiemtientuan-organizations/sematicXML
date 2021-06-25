---
layout: default
title: zk info
grand_parent: Stardog Admin CLI Reference
parent: zk
description: 'Prints the data Stardog stores in a ZooKeeper cluster.'
---

#  `stardog-admin zk info` 
## Description
Prints the data Stardog stores in a ZooKeeper cluster.<br>
## Usage
`stardog-admin  zk  info [ --home <home> ] [ {-v | --verbose} ] [ --zkauth <auth> ] [--] [ <zkAddress> ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--home <home>` | Stardog home directory location. This is where the stardog.properties file is located at.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--zkauth <auth>` | Zookeeper authentication string. If this value is not provided the value for the configuration option 'pack.zookeeper.auth' from stardog.properties is used. If that value is not set either then the default value 'admin:admin' will be used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<zkAddress>` | Zookeeper connection string. If this value is not provided the value for the configuration option 'pack.zookeeper.auth' from stardog.properties is used.

## Discussion
This command connects to a Zookeeper cluster and prints the data stored by Stardog.

## Examples
Connects to a Zookeeper at the given address and prints the data:
```bash
    $ stardog-admin zk info 127.0.0.1:2180
```
Connects to a Zookeeper at the given address with the given authentication string and prints the data:
```bash
    $ stardog-admin zk info --zkauth my_secret_key 127.0.0.1:2180
```
Read the Zookeeper address and the authentication string from stardog.properties in the specified home directory:
```bash
    $ stardog-admin zk info --home stardog_home_path
```
Read the Zookeeper address and the authentication string from stardog.properties in $STARDOG_HOME:
```bash
    $ stardog-admin zk info
```

