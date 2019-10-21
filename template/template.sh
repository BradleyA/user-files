#!/bin/bash
# 	template/template.sh  3.534.806  2019-10-21T15:03:32.852528-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.533  
# 	   template/template.sh   add YELLOW to INFO upgrade   Production standard 4.3.534 Documentation Language 
# 	template/template.sh  3.533.805  2019-10-13T23:29:17.638287-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.532  
# 	   template/template.sh   updated Production standard 2.3.529 
# 	template/template.sh  3.532.804  2019-10-13T14:43:50.439425-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.531-2-ge439603  
# 	   template/template.sh #43   updated comment Production standard 8.3.530 --usage 
# 	template/template.sh  3.531.803  2019-10-13T13:51:59.127731-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.531-1-g804e5be  
# 	   remove comment in ###  Production standard 1.3.516 DEBUG variable 
# 	template/template.sh  3.531.802  2019-10-13T13:50:27.400705-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.531  
# 	   updated comment for Production standard 1.3.516 DEBUG variable 
# 	template/template.sh  3.531.801  2019-10-13T13:47:51.235310-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.530  
# 	   close #44   template/template.sh   Production standard 1.3.531 DEBUG variable 
# 	template/template.sh  3.530.800  2019-10-13T13:03:18.271740-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.529-1-ga27cd5e  
# 	   close #43   template/template.sh   Production standard 8.3.530  --usage 
# 	template/template.sh  3.529.799  2019-10-13T09:44:12.507351-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.529  
# 	   close #42   template/template.sh   Production standard 2.3.529 log format 
# 	template/template.sh  3.513.776  2019-09-08T20:28:10.251481-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.512  
# 	   close #24  template/template.sh  Production standard 9.3.513 Parse CLI options, arguments, and new_message 
# 	template/template.sh  3.512.775  2019-09-08T13:01:15.338262-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.511  
# 	   close #12  template/template.sh   create function for Production standard 2.3.512 log format 
#86# template/template.sh - shell script template containing my collection of shorthand functions and pre-written code
###  Production standard 3.0 shellcheck
###  Production standard 5.1.160 Copyright
#    Copyright (c) 2019 Bradley Allen
#    MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###  Production standard 1.3.531 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
GREEN=$(tput  setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput   setaf 4)
PURPLE=$(tput setaf 5)
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.0 Default variable value
DEFAULT_ADM_TLS_USER="${USER}"
DEFAULT_CLUSTER="us-tx-cluster-1/"
DEFAULT_CA_CERT="ca.pem"
DEFAULT_CA_PRIVATE_CERT="ca-priv-key.pem"
DEFAULT_CERT_DIR="${HOME}/.docker"
DEFAULT_CERT_DAEMON_DIR="/etc/docker/certs.d/daemon/"
DEFAULT_DATA_DIR="/usr/local/data/"
DEFAULT_FQDN="$(hostname -f)"  # local host
DEFAULT_NUMBER_DAYS="730"
DEFAULT_REGISTRY_HOST="$(hostname -f)"  # local host
DEFAULT_REGISTRY_PORT="5000"
DEFAULT_REMOTE_COMMAND=""
DEFAULT_REMOTE_COMMAND_OPTION=""
DEFAULT_REMOTE_HOST="$(hostname -f)"    # local host
DEFAULT_SCRIPT_PATH="$( cd "$( dirname "${0}" )" && pwd )"
DEFAULT_SSH_USER="${USER}"
DEFAULT_SYSTEMS_FILE="SYSTEMS"
DEFAULT_TLS_USER="${USER}"
DEFAULT_USER="${USER}"
DEFAULT_USER_HOME=$(dirname "${HOME}")
DEFAULT_WORKING_DIRECTORY=~/.docker/docker-ca

###  Production standard 8.3.530 --usage
display_usage() {
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')
echo -e "\n${NORMAL}${COMMAND_NAME}\n   brief description . . ."
echo -e "\n${BOLD}USAGE${NORMAL}"
echo -e "   ${COMMAND_NAME} [-c <CLUSTER>] [-d <DATA_DIR>] [-a <ADMUSER>] [-f <PATH>/<FILE_NAME>]\n"
echo    "   ${YELLOW}Positional Arguments${NORMAL}"
echo    "   ${COMMAND_NAME} [<REGISTRY_HOST>]"
echo    "   ${COMMAND_NAME}  <REGISTRY_HOST> [<REGISTRY_PORT>]"
echo    "   ${COMMAND_NAME}  <REGISTRY_HOST>  <REGISTRY_PORT> [<CLUSTER>]"
echo -e "   ${COMMAND_NAME}  <REGISTRY_HOST>  <REGISTRY_PORT>  <CLUSTER> [<DATA_DIR>]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}

###  Production standard 0.3.214 --help
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8
echo -e "\n${BOLD}DESCRIPTION${NORMAL}"
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

###  Production standard 1.3.531 DEBUG variable
echo -e "\nThe DEBUG environment variable can be set to '', '0', '1', '2', '3', '4' or"
echo    "'5'.  The setting '' or '0' will turn off all DEBUG messages during execution of"
echo    "this script.  The setting '1' will print all DEBUG messages during execution of"
echo    "this script.  The setting '2' (set -x) will print a trace of simple commands"
echo    "before they are executed in this script.  The setting '3' (set -v) will print"
echo    "shell input lines as they are read.  The setting '4' (set -e) will exit"
echo    "immediately if non-zero exit status is recieved with some exceptions.  The"
echo    "setting '5' (set -e -o pipefail) will do setting '4' and exit if any command in"
echo    "a pipeline errors.  For more information about any of the set options, see"
echo    "man bash."

###  Production standard 4.3.534 Documentation Language
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<votre aide va ici>" # your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ]] ; then
  new_message "${LINENO}" "${BOLD}${YELLOW}INFO${NORMAL}" "  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi

echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."
echo    "   DEBUG           (default off '0')"
echo    "   CLUSTER         Cluster name (default '${DEFAULT_CLUSTER}')"
echo    "   DATA_DIR        Data directory (default '${DEFAULT_DATA_DIR}')"
echo    "   SYSTEMS_FILE    Name of file that includes hosts in cluster"
echo    "                   (default '${DEFAULT_SYSTEMS_FILE}')"

echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default code.\n"
echo    "   -c, --cluster, -c=, --cluster=<CLUSTER>"
echo -e "\tCluster name (default '${DEFAULT_CLUSTER}')\n"
echo    "   -d, --datadir, -d=, --datadir=<DATA_DIR>"
echo -e "\tData directory (default '${DEFAULT_DATA_DIR}')\n"
echo    "   -a, --admuser, -a=, --admuser=<ADMUSER>"
echo -e "\tSite SRE administrator, default is user running script\n"
echo    "   -f, --file, -f=, --filename=<FILENAME>"
echo -e "\tPath and file on system '<path>/<file_name>'\n"
echo    "   -S, --ssh_user, -S=, --ssh_user=<SSH_USER>"
echo -e "\tLocation of user home directory (default ${DEFAULT_USER_HOME})\n"
echo    "   -U, --user_home, -U=, --user_home=<USER_HOME>"
echo -e "   "

###  Production standard 6.1.177 Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION
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
echo    "│   │   │   │   │                              "
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
echo    "│   ├── ssh_known_hosts                    <-- OpenSSH systemwide list of known"
echo    "│   │                                          public host keys"
echo    "│   └── keys                               <-- Support SSH remote login when"
echo    "│       │                                      user home directory encrypted"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"
echo    "│       ├── <USER-1>/                      <-- User SSH authorized_keys directory 755"
echo    "│       │   └── authorized_keys            <-- SSH user public keys for login 644"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"
echo    "│       └── <USER-2>/                      <-- User systemwide SSH directory"
echo -e "└── hosts.equiv                            <-- host-based authentication\n"
echo    "/var/"
echo    "├── lib/docker/                            <-- Root directory of persistent"
echo    "│                                              Docker state files; (images)"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"
echo    "│                                              changed to symbolic link pointing"
echo    "│                                              to <DATA_DIR>/<CLUSTER>/docker"
echo    "└── run/"
echo    "    ├── docker/                            <-- Root directory for Docker"
echo    "    │                                          execution state files"
echo    "    ├── docker.pid                         <-- Docker daemon PID file"
echo    "    └── docker.######.######/              <-- Root directory for Docker"
echo    "                                               execution state files using"
echo    "                                               user namespace"

echo -e "\n${BOLD}DOCUMENTATION${NORMAL}"
echo    "   https://github.com/BradleyA/   <<URL to online repository README>>"

echo -e "\n${BOLD}EXAMPLES${NORMAL}"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${COMMAND_NAME} <<code example goes here>>${NORMAL}"
echo -e "   <<your code examples description goes here>>\n\t${BOLD}${COMMAND_NAME}${NORMAL}"
}

#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
#    Assumptions for the next two lines of code:  The second line in this script includes the script path & name as the second item and
#    the script version as the third item separated with space(s).  The tool I use is called 'markit'. See example line below:
# 	template/template.sh  3.517.783  2019-09-13T18:20:42.144356-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.516  
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')  #  Different from ${COMMAND_NAME}=$(echo "${0}" | sed 's/^.*\///'), SCRIPT_NAME = Git repository directory / COMMAND_NAME (for dev, test teams)
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    GID
GROUP_ID=$(id -g)

###  Production standard 2.3.529 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${SCRIPT_VERSION} ${1} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
new_message "${LINENO}" "${BOLD}${YELLOW}INFO${NORMAL}" "  Started..." 1>&2
#    Or
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${BOLD}${YELLOW}INFO${NORMAL}" "  Started..." 1>&2 ; fi

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Name_of_command >${SCRIPT_NAME}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###  Production standard 9.3.513 Parse CLI options and arguments
while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
    -a|--all)   if [[ "${CLI_OPTION}" != "" ]] ; then
        new_message "${LINENO}" "ERROR" "  Only one of these option -a, --all, -c, --clean, --none, or -n can be selected." 1>&2 ; exit 1
      else
        CLI_OPTION="a" ; shift
      fi ;;
    -c|--clean) if [[ "${CLI_OPTION}" != "" ]] ; then
        new_message "${LINENO}" "ERROR" "  Only one of these option -a, --all, -c, --clean, --none, or -n can be selected." 1>&2 ; exit 1
      else
        CLI_OPTION="c" ; shift
      fi ;;
    -f|--filename) CLI_OPTION="f" ; if [[ "${2}" == "" ]] ; then
        display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1
      fi ; FILE_NAME=${2} ; shift 2 ;;
    --hooks|-hooks) ALL_TEST_CASES="YES" ; shift ;;
    -c|--cluster)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; CLUSTER=${2} ; shift 2 ;;
    -c=*|--cluster=*)  CLUSTER=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    -d|--datadir)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; DATA_DIR=${2} ; shift 2 ;;
    -d=*|--datadir=*)  DATA_DIR=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    -f|--filename)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; FILE_NAME=${2} ; shift 2 ;;
    -f=*|--filename=*)  FILE_NAME=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    -S|--ssh_user)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; SSH_USER=${2} ; shift 2 ;;
    -S=*|--ssh_user=*)  SSH_USER=$(echo "${1}" | cut -d '=' -f 2) ; shift   ;;
    -U|--user_home)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "ERROR" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; USER_HOME=${2} ; shift 2 ;;
    -U=*|--user_home=*)  USER_HOME=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
#    *)  new_message "${LINENO}" "ERROR" "  Option, ${BOLD}${YELLOW}${1}${NORMAL}, entered on the command line is not supported." 1>&2 ; display_usage ; exit 1 ; ;;
# OR
    *) break ;;
  esac
done
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Variable... ADMUSER >${ADMUSER}< CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< FILE_NAME >${FILE_NAME}< SSH_USER >${SSH_USER}< USER_HOME >${USER_HOME}<" 1>&2 ; fi

#    Root is required to copy certs
if ! [[ "${UID}"  = 0 ]] ; then
  display_help | more
  new_message "${LINENO}" "ERROR" "  Use sudo ${COMMAND_NAME}" 1>&2
#    Help hint
  echo -e "\n\t${BOLD}>>   SCRIPT MUST BE RUN AS ROOT   <<\n${NORMAL}"  1>&2
  exit 1
fi

###

#    Test <REGISTRY_PORT> for integer
if ! [[ "${REGISTRY_PORT}" =~ ^[0-9]+$ ]] ; then       #  requires [[   ]] or  [: =~: binary operator expected
   new_message "${LINENO}" "ERROR" "  <REGISTRY_PORT> is not an interger.  <REGISTRY_PORT> is set to '${REGISTRY_PORT}'" 1>&2
   exit 1
fi

###  Example arguments (1)
###  Production standard 7.0 Default variable value
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${CLUSTER}" == "" ]] ; then CLUSTER=${DEFAULT_CLUSTER} ; fi
#    Order of precedence: CLI argument, default code
ADMUSER=${DEFAULT_USER}
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${DATA_DIR}" == "" ]] ; then DATA_DIR=${DEFAULT_DATA_DIR} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Variable... CLUSTER >${CLUSTER}< ADMUSER >${ADMUSER}< DATA_DIR >${DATA_DIR}<" 1>&2 ; fi

###  Example arguments (2)
#    Order of precedence: CLI argument, default code
OPTION1=${1:-default_value1}
OPTION2=${2:-${DEFAULT_VALUE2}}
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Variable... OPTION1 >${OPTION1}< OPTION2 >${OPTION2}<" 1>&2 ; fi

###  Example arguments (3)
###  production standard 7.0 Default variable value
#    The order of argument options matters.
#    Order of precedence: CLI argument, environment variable, default code
if [[ $# -ge  1 ]]  ; then CLUSTER=${1} ; elif [[ "${CLUSTER}" == "" ]] ; then CLUSTER=${DEFAULT_CLUSTER} ; fi
#    Order of precedence: CLI argument, default code
ADMUSER=${2:-${DEFAULT_USER}}
#    Order of precedence: CLI argument, environment variable, default code
if [[ $# -ge  3 ]]  ; then DATA_DIR=${3} ; elif [[ "${DATA_DIR}" == "" ]] ; then DATA_DIR=${DEFAULT_DATA_DIR} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Variable... CLUSTER >${CLUSTER}< ADMUSER >${ADMUSER}< DATA_DIR >${DATA_DIR}<" 1>&2 ; fi

###  Example arguments (4)
#    Check arguement 1 xxx
if [[ "$1" != "no" ]] && [[ "$1" != "normal" ]] && [[ "$1" != "all" ]] && [[ "$1" != "" ]] ; then
  display_help | more
  new_message "${LINENO}" "ERROR" "  First arguement, ${1}, is NOT no, normal, all." 1>&2
  exit 2
fi

#
new_message "${LINENO}" "${BOLD}${YELLOW}INFO${NORMAL}" "  Operation finished..." 1>&2
#    Or
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
#    DO NOT USE CODE BELOW THIS LINE:
#    This is here to stop shellcheck warnings: "appears unused. Verify it or export it."
echo "${RED}"
echo "${GREEN}"
echo "${BLUE}"
echo "${PURPLE}"
echo "${CYAN}"
echo "${WHITE}"
echo "${DEFAULT_SSH_USER}"
echo "${DEFAULT_TLS_USER}"
echo "${DEFAULT_ADM_TLS_USER}"
echo "${DEFAULT_CERT_DIR}"
echo "${DEFAULT_CERT_DAEMON_DIR}"
echo "${DEFAULT_CA_CERT}"
echo "${DEFAULT_CA_PRIVATE_CERT}"
echo "${DEFAULT_NUMBER_DAYS}"
echo "${DEFAULT_REMOTE_COMMAND}"
echo "${DEFAULT_REMOTE_COMMAND_OPTION}"
echo "${DEFAULT_WORKING_DIRECTORY}"
echo "${DEFAULT_FQDN}"
echo "${DEFAULT_REMOTE_HOST}"
echo "${DEFAULT_REGISTRY_HOST}"
echo "${DEFAULT_REGISTRY_PORT}"
echo "${SSH_USER}"
echo "${USER_HOME}"
echo "${DEFAULT_SCRIPT_PATH}"
echo "${ALL_TEST_CASES}"
