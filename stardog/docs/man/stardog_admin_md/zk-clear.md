---
layout: default
title: zk clear
grand_parent: Stardog Admin CLI Reference
parent: zk
description: 'Clears the data stored in ZooKeeper by the Stardog cluster.'
---

#  `stardog-admin zk clear` 
## Description
Clears the data stored in ZooKeeper by the Stardog cluster.<br>
## Usage
`stardog-admin  zk  clear [ --force ] [ --home <home> ] [ --path <zkPath> ] [ {-v | --verbose} ] [ --zkauth <auth> ] [--] [ <zkAddress> ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--force` | Force flag. *WARNING* If this flag is set, all Stardog data in the Zookeeper will be deleted even if it  looks like there are active Stardog nodes in the cluster. This option is extremely dangerous and should not be used unless there is a fatal error with Zookeeper.
`--home <home>` | Stardog home directory location. This is where the stardog.properties file is located at.
`--path <zkPath>` | Zookeeper path to delete relative to Stardog root directory. By default the root Stardog directory is deleted along with its subdirectories.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--zkauth <auth>` | Zookeeper authentication string. If this value is not provided the value for the configuration option 'pack.zookeeper.auth' from stardog.properties is used. If that value is not set either then the default value 'admin:admin' will be used.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<zkAddress>` | Zookeeper connection string. If this value is not provided the value for the configuration option 'pack.zookeeper.auth' from stardog.properties is used.

## Discussion
This command connects to a Zookeeper cluster and clears the data stored by Stardog. Any other data stored in Zookeeper by other applications will remain intact.                                                                                                                                         *WARNING:* This command is extremely dangerous and should not be used while Stardog cluster is running or it might cause unpredictable problems. This command is intended to be used when a new Stardog cluster is being deployed but the Zookeeper stores Stardog state from a previous deployment. After this command is executed, the first Stardog node that starts will recreate the Zookeeper data using its local state. 

## Examples
Connects to a Zookeeper at the given address and clears all the data:
```bash
    $ stardog-admin zk clear 127.0.0.1:2180
```
Connects to a Zookeeper at the given address with the given authentication string and prints the data:
```bash
    $ stardog-admin zk clear --zkauth my_secret_key 127.0.0.1:2180
```
Read the Zookeeper address and the authentication string from stardog.properties in the specified home directory:
```bash
    $ stardog-admin zk clear --home stardog_home_path
```
Read the Zookeeper address and the authentication string from stardog.properties in $STARDOG_HOME:
```bash
    $ stardog-admin zk clear
```

