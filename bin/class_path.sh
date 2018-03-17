# reset CLASSPATH
unset CLASSPATH

# add the current path or library pathes to CLASSPATH
function cpath(){
	if [ $# -eq 0 ]; then
		export CLASSPATH="$(pwd):${CLASSPATH}"
	elif [ $# -gt 1 ]; then
		for p in $@
		do
			export CLASSPATH="${cp_lib}/${p}:${CLASSPATH}"
		done
	fi
}

# add the current directory
export CLASSPATH="."

# lib path
export CLASSPATH_LIB="$HOME/lib"