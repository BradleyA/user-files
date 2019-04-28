#!/bin/bash
# 	template/template.sh  1.183.241  2019-04-28T18:35:25.573376-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 1.182  
# 	   add Host two 
# 	template/template.sh  1.182.240  2019-04-27T23:31:27.008294-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 1.181  
# 	   added ssh/sshd_config to ARCHITECTURE TREE 
### production standard 3.0 shellcheck
### production standard 5.1.160 Copyright
#	Copyright (c) 2019 Bradley Allen
#	MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
### production standard 1.0 DEBUG variable
#       Order of precedence: environment variable, default code
if [ "${DEBUG}" == "" ] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
#	set -x
#	set -v
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
### production standard 7.0 Default variable value
DEFAULT_CLUSTER="us-tx-cluster-1/"
DEFAULT_USER=${USER}
DEFAULT_DATA_DIR="/usr/local/data/"
### production standard 0.1.166 --help
display_help() {
echo -e "\n${NORMAL}${0} - brief description"
echo -e "\nUSAGE"
echo    "   ${0} [XX | YY | ZZ]"
echo    "   ${0} [--file <PATH>/<FILE_NAME> | -f <PATH>/<FILE_NAME>]"
echo    "   ${0} [<REGISTRY_HOST>]"
echo    "   ${0}  <REGISTRY_HOST> [<REGISTRY_PORT>]"
echo    "   ${0}  <REGISTRY_HOST>  <REGISTRY_PORT> [<CLUSTER>]"
echo    "   ${0}  <REGISTRY_HOST>  <REGISTRY_PORT>  <CLUSTER> [<DATA_DIR>]"
echo    "   ${0}  <REGISTRY_HOST>  <REGISTRY_PORT>  <CLUSTER>  <DATA_DIR> [<SYSTEMS_FILE>]"
echo    "   ${0} [--help | -help | help | -h | h | -?]"
echo    "   ${0} [--version | -version | -v]"
#	Displaying help DESCRIPTION in English en_US.UTF-8
echo -e "\nDESCRIPTION"
echo    "<your help goes here>"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"
echo -e "\n<<Paragraph two>>"

echo -e "\nThe <DATA_DIR>/<CLUSTER>/<SYSTEMS_FILE> includes one FQDN or IP address per"
echo    "line for all hosts in the cluster.  Lines in <SYSTEMS_FILE> that begin with a"
echo    "'#' are comments.  The <SYSTEMS_FILE> is used by markit/find-code.sh,"
echo    "Linux-admin/cluster-command/cluster-command.sh, docker-TLS/copy-registry-tls.sh,"
echo    "pi-display/create-message/create-display-message.sh, and other scripts.  A"
echo    "different <SYSTEMS_FILE> can be entered on the command line or environment"
echo    "variable."

echo -e "\nThis script works for the local host only.  To use check-host-tls.sh on a"
echo    "remote hosts (one-rpi3b.cptx86.com) with ssh port of 12323 as uadmin user;"
echo -e "\t${BOLD}ssh -tp 12323 uadmin@one-rpi3b.cptx86.com 'sudo check-host-tls.sh'${NORMAL}"

echo    "To loop through a list of hosts in the cluster use,"
echo    "https://github.com/BradleyA/Linux-admin/tree/master/cluster-command"
echo -e "\t${BOLD}cluster-command.sh special 'sudo check-host-tls.sh'${NORMAL}"

echo -e "\nThe administration user may receive password and/or passphrase prompts from a"
echo    "remote systen; running the following may stop the prompts in your cluster."
echo -e "\t${BOLD}ssh-copy-id <TLS_USER>@<REMOTE_HOST>${NORMAL}"
echo    "or"
echo -e "\t${BOLD}ssh-copy-id <TLS_USER>@<192.168.x.x>${NORMAL}"
echo    "If that does not resolve the prompting challenge then review the man pages for"
echo    "ssh-agent and ssh-add before entering the following in a terminal window."
echo -e "\t${BOLD}eval \$(ssh-agent)${NORMAL}"
echo -e "\t${BOLD}ssh-add${NORMAL}"

### production standard 4.0 Documentation Language
#	Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [ "${LANG}" == "fr_CA.UTF-8" ] || [ "${LANG}" == "fr_FR.UTF-8" ] || [ "${LANG}" == "fr_CH.UTF-8" ] ; then
	echo -e "\n--> ${LANG}"
	echo    "<votre aide va ici>" # your help goes here
	echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [ "${LANG}" == "en_US.UTF-8" ] ; then
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi
echo -e "\nENVIRONMENT VARIABLES"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the DEBUG environment variable to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the DEBUG"
echo    "environment variable.  You are on your own defining environment variables if"
echo    "you are using other shells."
echo    "   DEBUG           (default off '0')"
echo    "   CLUSTER         Cluster name (default '${DEFAULT_CLUSTER}')"
echo    "   DATA_DIR        Data directory (default '${DEFAULT_DATA_DIR}')"
echo    "   SYSTEMS_FILE    Hosts in cluster (default '${DEFAULT_SYSTEMS_FILE}')"
echo -e "\nOPTIONS"
echo    "   -f, --file      path and file on system '<path>/<file_name>'"
echo -e "\nOPTIONS"
echo    "Order of precedence: CLI options, environment variable, default code."
echo -e "   <<your environment variables information goes here>>"
echo    "   CLUSTER         Cluster name (default '${DEFAULT_CLUSTER}')"
echo    "   DATA_DIR        Data directory (default '${DEFAULT_DATA_DIR}')"
echo    "   SYSTEMS_FILE    Hosts in cluster (default '${DEFAULT_SYSTEMS_FILE}')"
### production standard 6.1.177 Architecture tree
echo -e "\nARCHITECTURE TREE"	# STORAGE & CERTIFICATION
echo    "/usr/local/data/                           <-- <DATA_DIR>"
echo    "├── <CLUSTER>/                             <-- <CLUSTER>"
echo    "│   ├── docker/                            <-- Root directory of persistent"
echo    "│   │   │                                      Docker state files; (images)"
echo    "│   │   └── ######.######/                 <-- Root directory of persistent"
echo    "│   │                                          Docker state files; (images)"
echo    "│   │                                          when using user namespace"
echo    "│   ├── SYSTEMS                            <-- List of hosts in cluster"
echo    "│   ├── log/                               <-- Host log directory"
echo    "│   ├── logrotate/                         <-- Host logrotate directory"
echo    "│   ├── docker-accounts/                   <-- Docker TLS certs"
echo    "│   │   ├── <HOST-1>/                      <-- Host in cluster"
echo    "│   │   │   ├── <USER-1>/                  <-- User TLS certs directory"
echo    "│   │   │   │   ├── ca.pem       FUTURE    <-- User tlscacert"
echo    "│   │   │   │   ├── cert.pem     FUTURE    <-- User tlscert"
echo    "│   │   │   │   ├── key.pem      FUTURE    <-- User tlskey"
echo    "│   │   │   │   └── trust/                 <-- Backup of Docker Content Trust"
echo    "│   │   │   │                                  (DCT) keys"
echo    "│   │   │   └── <USER-2>/                  <-- User TLS certs directory"
echo    "│   │   └── <HOST-2>/                      <-- Host in cluster"
echo    "│   └── docker-registry/                   <-- Docker registry directory"
echo    "│       ├── <REGISTRY_HOST>-<REGISTRY_PORT>/ < Registry container mount"
echo    "│       │   ├── certs/                     <-- Registry cert directory"
echo    "│       │   │   ├── domain.crt             <-- Registry cert"
echo    "│       │   │   └── domain.key             <-- Registry private key"
echo    "│       │   └── docker/                    <-- Registry storage directory"
echo    "│       ├── <REGISTRY_HOST>-<REGISTRY_PORT>/ < Registry container mount"
echo    "│       └── <REGISTRY_HOST>-<REGISTRY_PORT>/ < Registry container mount"
echo    "└── <STANDALONE>/                          <-- <STANDALONE> Architecture tree"
echo    "                                               is the same as <CLUSTER> TREE but"
echo -e "                                               the systems are not in a cluster\n"
echo    "<USER_HOME>/                               <-- Location of user home directory"
echo    "├── <USER-1>/.docker/                      <-- User docker cert directory"
echo    "│   ├── ca.pem                             <-- Symbolic link to user tlscacert"
echo    "│   ├── cert.pem                           <-- Symbolic link to user tlscert"
echo    "│   ├── key.pem                            <-- Symbolic link to user tlskey"
echo    "│   ├── docker-ca/                         <-- Working directory to create certs"
echo    "│   ├── trust/                             <-- Docker Content Trust (DCT)"
echo    "│   │   ├── private/                       <-- Notary Canonical Root Key ID"
echo    "│   │   │                                      (DCT Root Key)"
echo    "│   │   ├── trusted_certificates/          <-- Docker Content Trust (DCT) keys"
echo    "│   │   └── tuf/                           <-- Update Framework (TUF)"
echo    "│   ├── registry-certs-<REGISTRY_HOST>-<REGISTRY_PORT>/ <-- Working directory"
echo    "│   │   │                                      to create registory certs"
echo    "│   │   ├── ca.crt                         <-- Daemon registry domain cert"
echo    "│   │   ├── domain.crt                     <-- Registry cert"
echo    "│   │   └── domain.key                     <-- Registry private key"
echo    "│   ├── registry-certs-<REGISTRY_HOST>-<REGISTRY_PORT>/ <-- Working directory"
echo    "│   │                                          to create registory certs"
echo    "│   └── registry-certs-<REGISTRY_HOST>-<REGISTRY_PORT>/ <-- Working directory"
echo    "│                                              to create registory certs"
echo    "└── <USER-1>/.ssh/                         <-- Secure Socket Shell directory"
echo    "    ├── authorized_keys                    <-- SSH keys for logging into account"
echo    "    ├── config                             <-- SSH client configuration file"
echo    "    ├── id_rsa                             <-- SSH private key"
echo    "    ├── id_rsa.pub                         <-- SSH public key"
echo -e "    └── known_hosts                        <-- Systems previously connected to\n"
echo    "/etc/ "
echo    "├── docker/ "
echo    "│   ├── certs.d/                           <-- Host docker cert directory"
echo    "│   │   ├── daemon/                        <-- Daemon cert directory"
echo    "│   │   │   ├── ca.pem                     <-- Daemon tlscacert"
echo    "│   │   │   ├── cert.pem                   <-- Daemon tlscert"
echo    "│   │   │   └── key.pem                    <-- Daemon tlskey"
echo    "│   │   ├── <REGISTRY_HOST>:<REGISTRY_PORT>/ < Registry cert directory"
echo    "│   │   │   └── ca.crt                     <-- Daemon registry domain cert"
echo    "│   │   ├── <REGISTRY_HOST>:<REGISTRY_PORT>/ < Registry cert directory"
echo    "│   │   └── <REGISTRY_HOST>:<REGISTRY_PORT>/ < Registry cert directory"
echo    "│   ├── daemon.json                        <-- Daemon configuration file"
echo    "│   ├── key.json                           <-- Automatically generated dockerd"
echo    "│   │                                          key for TLS connections to other"
echo    "│   │                                          TLS servers"
echo    "│   ├── 10-override.begin                  <-- docker.service.d default lines"
echo    "│   ├── dockerd-configuration-file         <-- Daemon configuration"
echo    "│   ├── dockerd-configuration-file.service <- runs start-dockerd-with-systemd.sh"
echo    "│   │                                          during boot"
echo    "│   ├── docker.org                         <-- Copy of /etc/default/docker"
echo    "│   ├── README.md"
echo    "│   ├── setup-dockerd.sh                   <-- moves and creates files"
echo    "│   ├── start-dockerd-with-systemd.begin   <-- Beginning default lines"
echo    "│   ├── start-dockerd-with-systemd.end     <-- Ending default lines"
echo    "│   ├── start-dockerd-with-systemd.sh"
echo    "│   └── uninstall-dockerd-scripts.sh       <-- Removes files and scripts"
echo    "├── systemd/system/                        <-- Local systemd configurations"
echo    "│   ├── dockerd-configuration-file.service <-- Runs start-dockerd-with-systemd.sh"
echo    "│   ├── docker.service.d/"
echo    "│   │   └── 10-override.conf               <-- Override configutation file"
echo    "│   └── docker.service.wants/              <-- Dependencies"
echo    "├── default/"
echo    "│   └── docker                             <-- Docker daemon Upstart and"
echo    "│                                              SysVinit configuration file"
echo    "├── ssl/"
echo    "│    └── openssl.cnf                       <-- OpenSSL configuration file"
echo    "└── ssh/"
echo    "    ├── ssh_known_hosts                    <-- man ssh"
echo    "    ├── shosts.equiv                       <-- man ssh"
echo -e "    └── sshd_config                        <-- OpenSSH configuration file\n"

echo    "/var/"
echo    "├── lib/docker/                            <-- Root directory of persistent"
echo    "│                                              Docker state files; (images)"
echo    "│                                              changed to symbolic link pointing"
echo    "│                                              to <DATA_DIR>/<CLUSTER>/docker"
echo    "└── run/"
echo    "    ├── docker/                            <-- Root directory for Docker"
echo    "    │                                          execution state files"
echo    "    ├── docker.pid                         <-- Docker daemon PID file"
echo    "    └── docker.######.######/              <-- Root directory for Docker"
echo    "                                               execution state files using"
echo    "                                               user namespace"
echo -e "\nDOCUMENTATION"
echo    "   https://github.com/BradleyA/   <<URL to online repository README>>"
echo -e "\nEXAMPLES"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${0} <<code example goes here>>${NORMAL}"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${0}${NORMAL}"
}

#	Date and time function ISO 8601
get_date_stamp() {
DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
TEMP=$(date +%Z)
DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#	Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#	Version
SCRIPT_NAME=$(head -2 "${0}" | awk {'printf $2'})
SCRIPT_VERSION=$(head -2 "${0}" | awk {'printf $3'})

#	UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

#       Added line because USER is not defined in crobtab jobs
if ! [ "${USER}" == "${LOGNAME}" ] ; then  USER=${LOGNAME} ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#	Default help and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] ; then
	display_help | more
	exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
	echo "${SCRIPT_NAME} ${SCRIPT_VERSION}"
	exit 0
fi

### production standard 2.0 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
#	INFO
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Started..." 1>&2

#	DEBUG
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Name_of_command >${0}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###
#	Root is required to copy certs
if ! [ $(id -u) = 0 ] ; then
	display_help | more
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  Use sudo ${0}" 1>&2
#       Help hint
	echo -e "\n\t${BOLD}>>   SCRIPT MUST BE RUN AS ROOT   <<\n${NORMAL}"	1>&2
	exit 1
fi

#	Example arguments

#	Order of precedence: CLI argument, default code
OPTION1=${1:-default_value1}
OPTION2=${2:-${DEFAULT_VALUE2}}

### production standard 7.0 Default variable value
#	Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  1 ]  ; then CLUSTER=${1} ; elif [ "${CLUSTER}" == "" ] ; then CLUSTER=${DEFAULT_CLUSTER} ; fi
#	Order of precedence: CLI argument, default code
ADMUSER=${2:-${DEFAULT_USER}}
#	Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  3 ]  ; then DATA_DIR=${3} ; elif [ "${DATA_DIR}" == "" ] ; then DATA_DIR=${DEFAULT_DATA_DIR} ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Variable... CLUSTER >${CLUSTER}< ADMUSER >${ADMUSER}< DATA_DIR >${DATA_DIR}<" 1>&2 ; fi

#       Test <REGISTRY_PORT> for integer
if ! [[ "${REGISTRY_PORT}" =~ ^[0-9]+$ ]] ; then	# requires [[   ]] or  [: =~: binary operator expected
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  <REGISTRY_PORT> is not an interger.  <REGISTRY_PORT> is set to '${REGISTRY_PORT}'" 1>&2
        exit 1
fi

###	EXAMPLE ONE
#
#	Example code is a template, it will not work until chnaged
#
#	Check if argument 1 is blank
if [ "${1}" == "" ] ; then
	display_help | more
#       Help hint
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  File not found on command line" 1>&2
	exit 0
fi
#	Check if argument 1 is -f or --file
if [ "${1}" == "--file" ] || [ "${1}" == "-f" ] ; then
	#	Check if argument 2 is blank
	if [ "${2}" == "" ] ; then
		display_help | more
#       	Help hint
		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  File name not found; --file <path>/<file_name> or -f <path>/<file_name> option" 1>&2
		exit 0
	fi
	OPTION2=${2}
else
	#	Locate file in the PATH
	TEMP=$(whereis "${1}")
	MARKIT_FILE=$(echo "${TEMP}" | awk {'print $2'} )
	if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Locate file in the PATH... MARKIT_FILE >${MARKIT_FILE}<" 1>&2 ; fi
	#	Check if MARKIT_FILE is blank
	if [ "${MARKIT_FILE}" == "" ] ; then
		display_help | more
#       	Help hint
		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  ${1} not found; use --file <path>/<file_name> or -f <path>/<file_name> option" 1>&2
		exit 0
	fi
fi

#
###	EXAMPLE TWO
#	Check arguement 1 xxx
if [ "$1" != "no" ] && [ "$1" != "normal" ] && [ "$1" != "all" ] && [ "$1" != "" ] ; then
	display_help | more
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  First arguement, ${1}, is NOT no, normal, all." 1>&2
	exit 0
fi

#
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Operation finished." 1>&2
###
# >>>	FUTURE updates for example code 
# >>>	Need to determine if I want to again make a design change for string input
# >>>	# FIXME: this shouldn't be ordered
# >>>	rootdir=
# >>>	if [ "$1" = "--rootdir" ] && [ -s "$2" ]; then
# >>>	    rootdir="$2/" # ensure trailing slash
# >>>	    shift 2
# >>>	fi
# >>>	datadir=
# >>>	if [ "$1" = "--datadir" ] && [ -s "$2" ]; then
# >>>	    datadir="$2/" # ensure trailing slash
# >>>	    shift 2
# >>>	fi
# >>>	export DATA_DIR="$datadir"
# >>>	# >>>	then this 
# >>>	case "$1" in
# >>>	start)
# >>>	    # process multiple error strings
# >>>	    ret=0
# >>>	    output=`ufw_start` || ret="$?"
# >>>	    test -n "$output" && echo "$output" | while read line ; do
# >>>	        if [ "$2" = "quiet" ] || [ "$QUIET" = "yes" ]; then
# >>>	            echo "$line" | grep -q "Skip starting" && continue
# >>>	        fi
# >>>	        echo "$line"
# >>>	    done
# >>>	    exit "$ret"
# >>>	    ;;
# >>>	stop)
# >>>	    ufw_stop || exit "$?"
# >>>	    ;;
# >>>	force-stop)
# >>>	    ufw_stop --force || exit "$?"
# >>>	    ;;
# >>>	restart|force-reload)
# >>>	    ufw_reload || exit "$?"
# >>>	    ;;
# >>>	status)
# >>>	    ufw_status || exit "$?"
# >>>	    # If before.init and after.init support 'status', just display them after
# >>>	    # ufw_status() so it is prettier
# >>>	    if [ -x "$RULES_PATH/before.init" ]; then
# >>>	        "$RULES_PATH/before.init" status || exit "$?"
# >>>	    fi
# >>>	    if [ -x "$RULES_PATH/after.init" ]; then
# >>>	        "$RULES_PATH/after.init" status || exit "$?"
# >>>	    fi
# >>>	    ;;
# >>>	flush-all)
# >>>	    # Use sparingly. It flushes the built-in chains, deletes all non-builtin
# >>>	    # chains and resets the policy to ACCEPT
# >>>	    if [ -x "$RULES_PATH/before.init" ]; then
# >>>	        "$RULES_PATH/before.init" flush-all || exit "$?"
# >>>	    fi
# >>>	    flush_builtins || exit "$?"
# >>>	    if [ -x "$RULES_PATH/after.init" ]; then
# >>>	        "$RULES_PATH/after.init" flush-all || exit "$?"
# >>>	    fi
# >>>	    ;;
# >>>	*)
# >>>	    echo "Usage: /lib/ufw/ufw-init {start|stop|restart|force-reload|force-stop|flush-all|status}"
# >>>	    exit 1
# >>>	    ;;
# >>>	esac
# >>>	# >>>	
