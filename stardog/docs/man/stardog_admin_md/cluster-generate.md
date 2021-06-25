---
layout: default
title: cluster generate
grand_parent: Stardog Admin CLI Reference
parent: cluster
description: 'Creates a set of files with the minimal configuration for deploying a Stardog cluster. Make sure that the hostnames or IP addresses, and ports are accessible between the nodes involved in the cluster. Keep in mind that there is a single zookeeper.properties since they are same contents for all nodes, but there is a stardog.properties file for each node.'
---

#  `stardog-admin cluster generate` 
## Description
Creates a set of files with the minimal configuration for deploying a Stardog cluster. Make sure that the hostnames or IP addresses, and ports are accessible between the nodes involved in the cluster. Keep in mind that there is a single 'zookeeper.properties' since they are same contents for all nodes, but there is a 'stardog.properties' file for each node.<br>
## Usage
`stardog-admin  cluster  generate [ {-d | --output-dir} <path> ] [ {-v | --verbose} ] [ --zk-data-dir <path> ] [ --zk-election-port <leader election port> ] [ --zk-leader-port <leader port> ] [ --zk-port <client port> ] [--] <nodes>...`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-d <path>, --output-dir <path>` | The directory where the config files are going to be generated. If nothing is specified they will be generated to the current directory.
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.
`--zk-data-dir <path>` | ZooKeeper's data directory
`--zk-election-port <leader election port>` | The port where ZooKeeper nodes are going to connect for electing a ZooKeeper leader node.
`--zk-leader-port <leader port>` | The port where ZooKeeper nodes are going to connect to the ZooKeeper leader node.
`--zk-port <client port>` | The port where ZooKeeper is going to serving clients' requests.
`--` | This option can be used to separate command-line options from the list of argument(s). (Useful when an argument might be mistaken for a command-line option)
`<nodes>` | The list of hostnames (or IP addresses) of the nodes in the cluster.

## Examples
Generating config files for three nodes:
```bash
    $ stardog-admin cluster generate --output-dir /home/stardog 10.0.0.1 10.0.0.2 10.0.0.3
```

