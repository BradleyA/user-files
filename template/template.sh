#!/bin/bash
# 	template/template.sh  3.208.264  2019-07-25T22:11:03.789319-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.207  
# 	   remove example code 
# 	template/template.sh  3.207.263  2019-07-25T22:09:10.164673-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.206  
# 	   move function  Test <REGISTRY_PORT> for integer 
# 	template/template.sh  3.206.262  2019-07-25T22:06:17.399950-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.205  
# 	   update display_help OPTIONS section to match USAGE section 
# 	template/template.sh  3.205.261  2019-07-25T22:01:19.915446-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.204  
# 	   template.sh remove $0 from display_help sections to ${COMMAND_NAME} to help with CI/CD & CT #22 #23 
# 	template/template.sh  3.199.257  2019-07-21T10:20:31.711059-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.198  
# 	   update ARCHITECTURE TREE ~user/.docker/ca.pem 
# 	template/template.sh  3.194.252  2019-06-07T22:26:55.250843-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.193  
# 	   minor updates, update ARCHITECTURE TREE with ssh design 
# 	template/template.sh  3.193.251  2019-05-31T11:03:32.153161-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.192  
# 	   template[sh-py] --> production standard 8 --usage close #22 
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
### production standard 8.3.204 --usage
display_usage() {
COMMAND_NAME=$(echo $0 | sed 's/^.*\///')
echo -e "\n${NORMAL}${0}\n   brief description . . ."
echo -e "\nUSAGE"
echo -e "   ${COMMAND_NAME} [-c <CLUSTER>] [-d <DATA_DIR>] [-a <ADMUSER>] [-f <PATH>/<FILE_NAME>]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}
### production standard 0.1.166 --help
display_help() {
display_usage
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
echo -e "Order of precedence: CLI options, environment variable, default code.\n"
echo    "   -c, --cluster, -c=, --cluster=<CLUSTER>"
echo -e "\tCluster name (default '${DEFAULT_CLUSTER}')\n"
echo    "   -d, --datadir, -d=, --datadir=<DATA_DIR>"
echo -e "\tData directory (default '${DEFAULT_DATA_DIR}')\n"
echo    "   -a, --admuser, -a=, --admuser=<ADMUSER>"
echo -e "\tSite SRE administrator, default is user running script\n"
echo    "   -f, --file, -f=, --filename=<FILENAME>"
echo -e "\tPath and file on system '<path>/<file_name>'"
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
echo    "│   │   │   ├── ssh/"
echo    "│   │   │   │   ├── AllowUsers             <-- User name patterns allowed"
echo    "│   │   │   │   ├── ssh_host_ed25519_fingerprint <-- XXXX think about only having one finger print file for all called fingerprint keytype"
echo    "│   │   │   │   ├── ssh_host_rsa_fingerprint <-- "
echo    "│   │   │   │   ├── ssh_known_hosts        <-- Host public keys for all"
echo    "│   │   │   │   │                              known hosts in cluster"
echo    "│   │   │   │   ├── shosts.equiv           <-- "
echo    "│   │   │   │   ├── ssh_host_rsa_key       <-- OpenSSH host private key"
echo    "│   │   │   │   ├── ssh_host_rsa_key.pub   <-- OpenSSH host public key"
echo    "│   │   │   │   ├── ssh_host_ed25519_key   <-- OpenSSH host private key"
echo    "│   │   │   │   ├── ssh_host_ed25519_key.pub <-- OpenSSH host public key"
echo    "│   │   │   │   └── keys/"
echo    "│   │   │   │       ├── <USER-1>/"
echo    "│   │   │   │       │   └── authorized_keys"
echo    "│   │   │   │       └── <USER-2>/"
echo    "│   │   │   ├── <USER-1>/                  <-- User TLS certs directory"
echo    "│   │   │   │   ├── docker         FUTURE  <-- User tlscacert"
echo    "│   │   │   │   │   ├── ca.pem     FUTURE  <-- User tlscacert"
echo    "│   │   │   │   │   ├── cert.pem   FUTURE  <-- User tlscert"
echo    "│   │   │   │   │   ├── key.pem    FUTURE  <-- User tlskey"
echo    "│   │   │   │   │   └── trust/             <-- Backup of Docker Content Trust"
echo    "│   │   │   │   │                              (DCT) keys"
echo    "│   │   │   │   └── ssh/"
echo    "│   │   │   │       ├── authorized_keys    <-- SSH user public keys for login 644"
echo    "│   │   │   │       └── inventory/ FUTURE  <-- SSH user inventory"
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
echo    "│   ├── ca.pem                             <-- User tlscacert or symbolic link"
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
echo    "    ├── config                             <-- SSH user configuration file"
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
echo    "│   └── openssl.cnf                        <-- OpenSSL configuration file"
echo    "├── ssh/"
echo    "│   ├── moduli                             <-- Diffie-Hellman moduli"
echo    "│   ├── shosts.equiv                       <-- host-based authentication"
echo    "│   ├── ssh_config                         <-- OpenSSH systemwide configuration"
echo    "│   │                                          file"
echo    "│   ├── sshd_config                        <-- OpenSSH daemon configuration"
echo    "│   │                                          file"
echo    "│   ├── ssh_host_rsa_key                   <-- OpenSSH host private key"
echo    "│   ├── ssh_host_rsa_key.pub               <-- OpenSSH host public key"
echo    "│   ├── ssh_host_ed25519_key               <-- OpenSSH host private key"
echo    "│   ├── ssh_host_ed25519_key.pub           <-- OpenSSH host public key"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"
echo    "│   ├── ssh_known_hosts                    <-- OpenSSH systemwide list of known"
echo    "│   │                                          public host keys"
echo    "│   └── keys                               <-- Support SSH remote login when"
echo    "│       │                                      user home directory encrypted"
echo    "│       ├── <USER-1>/                      <-- User SSH authorized_keys directory 755"
echo    "│       │   └── authorized_keys            <-- SSH user public keys for login 644"
echo    "│       └── <USER-2>/                      <-- User systemwide SSH directory"
echo -e "└── hosts.equiv                            <-- host-based authentication\n"
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

#	Default help, usage, and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] ; then
	display_help | more
	exit 0
fi
if [ "$1" == "--usage" ] || [ "$1" == "-usage" ] || [ "$1" == "usage" ] || [ "$1" == "-u" ] ; then
        display_usage
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

###
#       Test <REGISTRY_PORT> for integer
if ! [[ "${REGISTRY_PORT}" =~ ^[0-9]+$ ]] ; then        # requires [[   ]] or  [: =~: binary operator expected
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  <REGISTRY_PORT> is not an interger.  <REGISTRY_PORT> is set to '${REGISTRY_PORT}'" 1>&2
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
