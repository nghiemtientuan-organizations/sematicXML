---
layout: default
title: server profile
grand_parent: Stardog Admin CLI Reference
parent: server
description: 'Profile server (CPU, heap allocations, locks). Stardog server must have `profiler.enabled=true` set in the server configuration file. It must be started with a remotely accessible JMX agent, eg: -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=5833 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false options in STARDOG_SERVER_JAVA_ARGS property.'
---

#  `stardog-admin server profile` 
## Description
Profile server (CPU, heap allocations, locks). Stardog server must have `profiler.enabled=true` set in the server configuration file. It must be started with a remotely accessible JMX agent, eg: -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=5833 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false options in STARDOG_SERVER_JAVA_ARGS property.<br>
## Usage
`stardog-admin  server  profile [ {-b | --bufsize} <framebuf> ] [ {-d | --duration} <duration> ] [ {-e | --event} <event> ] [ {-f | --file} <outputFile> ] [ {-h | --host} <Database Host> ] [ {-i | --interval} <interval> ] [ {-le | --listAvailableEvents} ] [ {-p | --port} <JMX Port> ] [ {-r | --reverse-flamegraph} ] [ {-s | --stop} ]`
{: .fs-5}
## Options

Name, shorthand | Description 
---|---
`-b <framebuf>, --bufsize <framebuf>` | The number of Java method ids that should fit in the buffer. Increase if receiving Frame buffer overflowed. Default is 1,000,000.
`-d <duration>, --duration <duration>` | Profiling duration, in seconds. Default is 30 seconds.
`-e <event>, --event <event>` | Profiling event, one of cpu, alloc, lock, etc. The default is cpu. To list all available options use --listAvailableEvents option
`-f <outputFile>, --file <outputFile>` | Result output file. If not provided, the result is dumped in console. If the provided file name has .svg extension, flamegraph is written out, otherwise (and also when the file is not provided) plain text summary+stacks output.
`-h <Database Host>, --host <Database Host>` | Stardog database host. Default is localhost.
`-i <interval>, --interval <interval>` | Polling interval, in nanoseconds. Default is 10,000,000 ns (10 ms).
`-le, --listAvailableEvents` | An option to list all available profiling events, to specify one with --event option.
`-p <JMX Port>, --port <JMX Port>` | Stardog database JMX port. The default is 5833
`-r, --reverse-flamegraph` | If the output format is .svg (see -f option), a reserved flamegraph is generated. It's useful to visualize profiling results when some hot 'leaf' methods are called from many different places. Default: false.
`-s, --stop` | Stop profiling and generate output. Must follow a call with duration {-d, --duration} set to 0.

