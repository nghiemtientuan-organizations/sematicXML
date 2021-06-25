#!/bin/sh

# Installing Bash Auto Complete
#
# First you'll need to make sure you have bash-completion installed:
#
# Homebrew:
#	$ brew install bash-completion
#	Then add to your .bash_profile:
#	if [ -f `brew --prefix`/etc/bash_completion ]; then
#. `brew --prefix`/etc/bash_completion
# fi
#
# MacPorts:
# $ sudo port install bash-completion
# Then add to your .bash_profile:
# if [ -f /opt/local/etc/bash_completion ]; then
#    . /opt/local/etc/bash_completion
# fi
#
# Ubuntu:
#	$ sudo apt-get install bash-completion
# Fedora:
#	$ sudo yum install bash-completion
#
# Then, place the script in your bash_completion.d folder, usually something like /etc/bash_completion.d, /usr/local/etc/bash_completion.d or ~/bash_completion.d.
# Or, copy it somewhere (e.g. ~/.stardog-completion.sh) and put the following in your .bash_profile::
#
# source ~/.stardog-completion.sh

_stardog() {
        word="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"

		# grab values for these from help directly
        cmds="data help namespace query reasoning version icv doc file graphql tx"
        cmds_no_help="data namespace query reasoning version icv doc file graphql tx"
        doc_cmds="count delete get put reindex"
        file_cmds="cat obfuscate split"
        graphql_cmds="execute explain schema"
        ns_cmds="add import export list remove"
        icv_cmds="convert validate export explain fix report"
        inf_cmds="consistency explain schema undo"
        data_cmds="add remove model size export obfuscate"
        query_cmds="execute search explain obfuscate"
        tx_cmds="begin commit list rollback"

        if [[ $prev == "namespace" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$ns_cmds" -- "$word"))
        elif [[ $prev == "reasoning" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$inf_cmds" -- "$word"))
        elif [[ $prev == "help" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cmds_no_help" -- "$word"))
        elif [[ $prev == "data" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$data_cmds" -- "$word"))
        elif [[ $prev == "query" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$query_cmds" -- "$word"))
        elif [[ $prev == "icv" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$icv_cmds" -- "$word"))
        elif [[ $prev == "doc" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$doc_cmds" -- "$word"))
        elif [[ $prev == "file" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$file_cmds" -- "$word"))
        elif [[ $prev == "graphql" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$graphql_cmds" -- "$word"))
        elif [[ $prev == "tx" ]]
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$tx_cmds" -- "$word"))
        elif [[ $prev == *stardog* ]] ;
        then
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cmds" -- "$word"))
        fi
}

_stardog_admin() {
        word="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"

        isUser=0
        isRole=0
        c=1
        while [ $c -lt $COMP_CWORD ]; do
        	curr="${COMP_WORDS[c]}"
            case "$curr" in
				user) isUser=1 ;;
            esac
            c=$((++c))
        done

		# grab values for these from help directly
        cmds="cluster db diagnostics help icv license metadata query role server user version virtual cache function stored zk log"
        cmds_no_help="cluster db icv license metadata query role server user version virtual cache function stored zk log"
        user_cmds="add addrole disable enable grant list passwd permission remove removerole revoke"
        role_cmds="add grant list permission remove revoke"
        server_cmds="start stop status backup restore metrics migrate profile"
        meta_cmds="get set"
        license_cmds="info request"
        icv_cmds="add remove drop"
        db_cmds="backup create drop list optimize online offline repair restore status"
        query_cmds="kill list status"
        cluster_cmds="info metrics generate status standby stop"
	      virtual_cmds="add import list mappings options online remove source_metadata"
	      cache_cmds="create drop refresh status target"
  	    function_cmds="add list remove"
	      log_cmds="print"
	      stored_cmds="add export import list remove"
	      zk_cmds="clear info"

        if [[ $prev == "user" ]]
        then
        	COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$user_cmds" -- "$word"))
        elif [[ $prev == "help" ]]
        then
          COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cmds_no_help" -- "$word"))
    		elif [[ $prev == "role" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$role_cmds" -- "$word"))
	    	elif [[ $prev == "db" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$db_cmds" -- "$word"))
		    elif [[ $prev == "server" ]]
		    then
		    	COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$server_cmds" -- "$word"))
		    elif [[ $prev == "metadata" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$meta_cmds" -- "$word"))
        elif [[ $prev == "query" ]]
        then
          COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$query_cmds" -- "$word"))
		    elif [[ $prev == "icv" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$icv_cmds" -- "$word"))
		    elif [[ $prev == "license" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$license_cmds" -- "$word"))
		    elif [[ $prev == "cluster" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cluster_cmds" -- "$word"))
		    elif [[ $prev == "virtual" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$virtual_cmds" -- "$word"))
		    elif [[ $prev == "cache" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cache_cmds" -- "$word"))
		    elif [[ $prev == "function" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$function_cmds" -- "$word"))
		    elif [[ $prev == "log" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$log_cmds" -- "$word"))
		    elif [[ $prev == "stored" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$stored_cmds" -- "$word"))
		    elif [[ $prev == "zk" ]]
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$zk_cmds" -- "$word"))
		    elif [[ $prev == *stardog-admin* ]] ;
		    then
			    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$cmds" -- "$word"))
	    	fi
}

complete -o default -F _stardog stardog
complete -o default -F _stardog_admin stardog-admin
