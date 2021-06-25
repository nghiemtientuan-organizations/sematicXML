#!/usr/bin/env bash

####################################
# Set up environment variables
####################################

cygwinify() {
  if [[ $(uname -s) == CYGWIN* || $(uname -s) == MINGW* ]]; then
    echo $(cygpath -w "$1")
  else
    echo $1
  fi
}

absolute_path() {
    local dir=$(dirname "$1")
    local base=$(basename "$1")
    if [ -d "$1" ]; then
	dir="$1"
	base=""
    fi
    local normalized=$(cd "${dir}"; pwd)
    echo "${normalized}/${base}"
}

# if not set, set $STARDOG to the parent of the folder in which this script is stored
if [ -z "$STARDOG" ]; then
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    STARDOG="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$STARDOG/$SOURCE"
  done
  STARDOG=$(cygwinify "$( cd -P "$( dirname "$SOURCE" )" && pwd )/..")
fi

if [[ $(uname -s) == CYGWIN* || $(uname -s) == MINGW* ]]; then
  PATHDELIM=";"
else
  PATHDELIM=":"
fi

if [ -n "${JAVA_HOME}" -a -x "${JAVA_HOME}/bin/java" ]; then
 java="${JAVA_HOME}/bin/java"
else
 java=java
fi

DEFAULT_JAVA_ARGS="-Djavax.xml.datatype.DatatypeFactory=org.apache.xerces.jaxp.datatype.DatatypeFactoryImpl -Dapple.awt.UIElement=true -Dfile.encoding=UTF-8"

version=$("java" -version 2>&1 | awk -F '"' '/version/ {print $2}')

# The "default" java arguments for Stardog.  These should not be edited.  For providing custom arguments to the JVM,
# STARDOG_SERVER_JAVA_ARGS should be used for the server and STARDOG_JAVA_ARGS for everything else.
case "$version" in
   *"1.4"* )  ;;
   *"1.5"* )  ;;
   *"1.6"* )  ;;
   *"1.7"* )  ;;
   *"1.8"* )  ;;
   * )
    DEFAULT_JAVA_ARGS="$DEFAULT_JAVA_ARGS --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED  --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED   --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens=java.base/jdk.internal.ref=ALL-UNNAMED --add-opens=java.base/jdk.internal.misc=ALL-UNNAMED --add-opens=java.security.jgss/sun.security.krb5.internal.ktab=ALL-UNNAMED -Djdk.tls.client.protocols=TLSv1.2"
esac

# Performance related java arguments for things like GC tuning.  Default values are reasonable defaults for the system
# across platforms, but these can be tweaked for your current environment.
if [ -z "${STARDOG_PERF_JAVA_ARGS}" ]; then
 STARDOG_PERF_JAVA_ARGS="-XX:SoftRefLRUPolicyMSPerMB=1 -XX:+UseParallelOldGC -XX:+UseCompressedOops"
fi

# Default Stardog client and server arguments, providing the memory settings.
if [ -z "${STARDOG_JAVA_ARGS}" ]; then
 STARDOG_JAVA_ARGS="-Xmx512m"
 if [ -z "${STARDOG_SERVER_JAVA_ARGS}" ]; then
  STARDOG_SERVER_JAVA_ARGS="-Xmx2g -Xms2g -XX:MaxDirectMemorySize=1500m"
 fi
else
 if [ -z "${STARDOG_SERVER_JAVA_ARGS}" ]; then
  STARDOG_SERVER_JAVA_ARGS="${STARDOG_JAVA_ARGS}"
 fi
fi

FOUND=false
for var in "${!STARDOG_ARGS[@]}"
do
     if [ "${STARDOG_ARGS[$var]}" = "--home" ]; then
        FOUND=true
     elif [ "${FOUND}" = true ]; then
         STARDOG_HOME="${STARDOG_ARGS[$var]}"
	 # The admin CLI.java references the '--home' argument, rather than the stardog.home property or STARDOG_HOME
	 # environment variable. We modify that command line arg now to ensure it gets passed correctly later.
	 STARDOG_ARGS[$var]=$(absolute_path "$STARDOG_HOME")
        break;
     fi
done

if [ ! "${FOUND}" = true ]; then
    if [ ! -z "${STARDOG_SERVER_JAVA_ARGS}" ]; then
        for arg in ${STARDOG_SERVER_JAVA_ARGS}; do
            s="-Dstardog.home"
            if [[ "${arg:0:${#s}}" == "${s}" ]] ; then
              FOUND=true
              STARDOG_HOME=$(echo ${arg} | cut -d '=' -f 2)
            fi
        done
    fi

    if [ ! "${FOUND}" = true ]; then
      if [ -z "${STARDOG_HOME}" ]; then
        STARDOG_HOME=$(pwd)
      fi
    fi
fi
STARDOG_HOME=$(absolute_path "$STARDOG_HOME")

STARDOG_JAVA_ARGS="-Dstardog.home=$(cygwinify $STARDOG_HOME) ${STARDOG_JAVA_ARGS}"
STARDOG_SERVER_JAVA_ARGS="-Dstardog.home=$(cygwinify $STARDOG_HOME) ${STARDOG_SERVER_JAVA_ARGS}"

####################################
# Helper functions
####################################

build_classpath() {
  local dirs="
/client/ext/
/client/api/
/client/cli/
/client/http/
/client/pack/
"
  if [ -n "$1" -a "$1" = "admin" ]; then
    is_admin=true
    dirs="
${dirs}
/server/ext/
/server/dbms/"
  fi
  CLASSPATH=
  for _dir in $dirs; do
    if [ -z "${CLASSPATH}" ]; then
      CLASSPATH="${STARDOG}${_dir}*"
    else
      CLASSPATH="${CLASSPATH}${PATHDELIM}${STARDOG}${_dir}*"
    fi
  done
  if [ -z "$is_admin" ]; then
    SLF4J_JARS=$(find "${STARDOG}/server/dbms/" -name '*slf4j*.jar' -print0 | xargs -0 echo  | tr ' ' "${PATHDELIM}")
    CLASSPATH="${CLASSPATH}${PATHDELIM}${SLF4J_JARS}"
  fi
}

signal_handler_first_stage() {
  if [ -z "$HANDLER_EXECUTED" ]; then
    HANDLER_EXECUTED=1
    kill $PID
  fi
  exit
}

process_exists() {
  kill -s 0 $1 > /dev/null 2>&1
  return $?
}

is_foreground() {
  FOREGROUND=
  if [ -z "$APP_START" ]; then
    return 0
  fi
  for it in "$@"; do
    if [ "$it" = "--foreground" ]; then
      FOREGROUND=true
      break
    fi
  done
}

is_daemon() {
  DAEMON=
  if [ -z "$APP_START" ]; then
    return 0
  fi
  for it in "$@"; do
    if [ "$it" = "--daemon" ]; then
      DAEMON=true
      break
    fi
  done
}

is_appstart() {
  APP_START=
  if [ "$1" = "server" -a "$2" = "start" ]; then
    APP_START=true
  fi
  if [ "$1" = "cluster" -a "$2" = "zkstart" ]; then
    APP_START=true
  fi
}

handle_zk() {
  IS_ZK=

  if [ "$1" = "zk" -a "$2" = "start" -o "$1" = "cluster" -a "$2" = "zkstart" ]; then
    if [ -z "${SD_ZOO_JAVA_ARGS}" ]; then
      SD_ZOO_JAVA_ARGS="-Xmx1g -Xms1g -XX:MaxDirectMemorySize=128m -Dzookeeper.jmx.log4j.disable=true"
	fi
	STARDOG_JAVA_ARGS="-Dstardog.home=$(cygwinify $STARDOG_HOME) ${SD_ZOO_JAVA_ARGS}"
	IS_ZK=true
  fi

  if [ "$1" = "zk" -a "$2" = "stop" -o "$1" = "cluster" -a "$2" = "zkstop" ]; then
    jps -m | grep -e "zk\( \)\?start" | awk '{ print $1 }' | xargs kill -15
    STARDOG_ARGS+=('--is-successful' "$?")
  fi
}

check_log4j_config() {
  local log4j_location=
  if [ -n "$APP_START" ]; then
      if [ -n "${STARDOG_HOME}" ]; then
        local extensions=("yaml" "yml" "json" "jsn" "xml")
        local has_log4j=
        local actual_ext=
        for ext in ${extensions[*]}; do
          if [ -e "${STARDOG_HOME}/log4j2.${ext}" ]; then
            has_log4j=true
            actual_ext=${ext}
            break;
          fi
        done
        if [ -n "${has_log4j}" ]; then
          log4j_location="${STARDOG_HOME}/log4j2.${actual_ext}"
        fi
      fi
      if [ -z "${log4j_location}" ]; then
        log4j_location="${STARDOG}/server/dbms/log4j2.xml"
      fi
  else
    log4j_location="${STARDOG}/client/cli/log4j2.xml"
  fi

  DEFAULT_JAVA_ARGS="${DEFAULT_JAVA_ARGS} -Dlog4j.configurationFile=$(cygwinify $log4j_location)"
}

check_home() {
  if [ ! -e "$1" ]; then
    echo STARDOG_HOME directory \'$1\' does not exist
    exit 1
  fi

  if [ ! -d "$1" ]; then
    echo STARDOG_HOME \'$1\' is not a directory
    exit 1
  fi

  if [ ! -r "$1" ]; then
    echo STARDOG_HOME \'$1\' is not readable by the current user
    exit 1
  fi

  if [ ! -w "$1" ]; then
    echo STARDOG_HOME \'$1\' is not writeable by the current user
    exit 1
  fi

  if [ ! -x "$1" ]; then
    echo The current user does not have execute permission to STARDOG_HOME \'$1\'
    exit 1
  fi

  return 0
}

function quote_cmdline {
  local quoted=()
  for token; do
    quoted+=( "$(printf '%q' "$token")" )
  done
  printf '%s\n' "${quoted[*]}"
}
