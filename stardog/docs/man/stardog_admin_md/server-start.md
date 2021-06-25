---
layout: default
title: server start
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Starts the Stardog Server.'
---

#  `stardog-admin server start` 
## Description
Starts the Stardog Server.<br>
## Usage
`stardog-admin  server  start [ --bind <network interface> ] [ --daemon ] [ --disable-security ] [ --enable-ssl ] [ --foreground ] [ --home <home> ] [ --no-cors ] [ --port <port> ] [ --require-ssl ] [ -s <encryption passphrase> ] [ --ssl-cert-required ] [ --ssl-port <ssl-port> ] [ --upgrade ] [ {-v | --verbose} ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`--bind <network interface>` | Specify the address of the network interface the Stardog server should bind to, the default is 0.0.0.0 Port should be specified separately with the --port option.
`--daemon` | Flag to start this application in the background without waiting for the server to start listening.
`--disable-security` | Disable security flag. If this flag is set, security for the server is completely disabled.
`--enable-ssl` | Enable SSL for the server; server will automatically enable SSL on a per-connection basis to support secure & unsecured clients.
`--foreground` | Flag to start this application in the foreground.
`--home <home>` | Stardog home directory location.
`--no-cors` | No CORS support flag. If this flag is set, CORS support in the HTTP server will be disabled.
`--port <port>` | Specify the port the server will bind to
`--require-ssl` | Require SSL for the server; client connections which do not use SSL will be immediately closed.
`-s <encryption passphrase>` | passphrase to access encrypted databases
`--ssl-cert-required` | Server requires clients to use a valid certificate when connecting via SSL; automatically enables SSL and requires its usage.
`--ssl-port <ssl-port>` | Specify the port the server will bind for SSL. Default is --port for --require-ssl, [--port + 1] for --enable-ssl 
`--upgrade` | Automatically upgrade any indexes which use an obsolete format
`-v, --verbose` | Flag that can cause more detailed information to be printed such as errors and status. Exact output depends upon the command and options used.

## Discussion
By default, the HTTP server listens on 0.0.0.0:5820. A different port for the server can be specified with the --port option and a different bind location using --bind.

## Examples
Start a Stardog server with the default options:
```bash
    $ stardog-admin server start
```
Start a Stardog server with security disabled:
```bash
    $ stardog-admin server start --disable-security
```
Run a Stardog server on localhost only with a different port
```bash
    $ stardog-admin server start --bind 127.0.0.1 --port 5804
```
Start a Stardog server which requires SSL connections from clients
```bash
    $ stardog-admin server start --require-ssl
```

