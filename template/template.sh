#!/bin/bash
# 	template/template.sh  3.92.134  2018-11-10T12:45:10.764559-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.91-2-ga5ceeeb  
# 	   template.sh change log format and order #12 
# 	template/template.sh  3.90.130  2018-10-30T23:48:56.734851-05:00 (CDT)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.89  
# 	   add environment variable for DEBUG variable close #10 
#
###	template.sh - brief description
#       Order of precedence: environment variable (export DEBUG=1), default code
if [ "${DEBUG}" == "" ] ; then DEBUG="0" ; fi	# 0 = debug off, 1 = debug on, 'unset DEBUG' to unset environment variable (bash)
#	set -x
#	set -v
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
###
display_help() {
echo -e "\n${NORMAL}${0} - brief description"
echo -e "\nUSAGE\n   ${0} [XX | YY | ZZ]"
echo    "   ${0} [--file <PATH>/<FILE_NAME> | -f <PATH>/<FILE_NAME>]"
echo    "   ${0} [--help | -help | help | -h | h | -?]"
echo    "   ${0} [--version | -version | -v]"
echo -e "\nDESCRIPTION\nxxx xxx xxx ..."
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<"
echo -e "\nParagraph two xxx xxx xxxxxxx"
echo -e "\nEnvironment Variables\n   <<your variables go here>>"
echo -e "\nOPTIONS\n   -f, --file\n      path and file on system '<path>/<file_name>'"
echo -e "\nOPTIONS\n   Option one - description"
echo    "   XX       xxx xxxxxxx xxx"
echo    "   YY       xxx xxxxx xxx "
echo    "   zz       xx xxxxxxx xx"
echo -e "\nDOCUMENTATION\n   https://github.com/BradleyA/REPOSITORY"
echo -e "\nEXAMPLES\n   <<your code examples description goes here>>\n\n${0} <<code example goes here>>\n"
#	After displaying help in english check for other languages
if ! [ "${LANG}" == "en_US.UTF-8" ] ; then
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  ${LANG}, is not supported, Would you like to help translate?" 1>&2
#       elif [ "${LANG}" == "fr_CA.UTF-8" ] ; then
#		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  Display help in ${LANG}" 1>&2
#       else
#		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  Your language, ${LANG}, is not supported.  Would you like to translate?" 1>&2
fi
}

#	Date and time function ISO 8601
get_date_stamp() {
DATE_STAMP=`date +%Y-%m-%dT%H:%M:%S.%6N%:z`
TEMP=`date +%Z`
DATE_STAMP=`echo "${DATE_STAMP} (${TEMP})"`
}

#	Fully qualified domain name FQDN hostname
LOCALHOST=`hostname -f`

#	Version
SCRIPT_NAME=`head -2 ${0} | awk {'printf$2'}`
SCRIPT_VERSION=`head -2 ${0} | awk {'printf$3'}`

#       Added line because USER is not defined in crobtab jobs
if ! [ "${USER}" == "${LOGNAME}" ] ; then  USER=${LOGNAME} ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#	UID and GID
USER_ID=`id -u`
GROUP_ID=`id -g`

#	Default help and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] ; then
	display_help
	exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
	echo "${SCRIPT_NAME} ${SCRIPT_VERSION}"
	exit 0
fi

#	INFO
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Begin..." 1>&2

#	DEBUG
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0} ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Name_of_command >${0}< Name_of_arg1 >${1}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###
#	Example arguments

#       Order of precedence: CLI argument, default code
OPTION1=${1:-default_value1}
OPTION2=${2:-default_value2}

#	Example arguments
#       Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  1 ]  ; then CLUSTER=${1} ; elif [ "${CLUSTER}" == "" ] ; then CLUSTER="us-tx-cluster-1/" ; fi
#       Order of precedence: CLI argument, default code
ADMUSER=${2:-${USER}}
#       Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  3 ]  ; then DATA_DIR=${1} ; elif [ "${DATA_DIR}" == "" ] ; then DATA_DIR="/usr/local/data/" ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[DEBUG]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  CLUSTER >${CLUSTER}< ADMUSER >${ADMUSER}< DATA_DIR >${DATA_DIR}<" 1>&2 ; fi

###	EXAMPLE ONE
#

#	Example code is a template, it will not work until chnaged
#
#       Check if argument 1 is blank
if [ "${1}" == "" ] ; then
        display_help
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  File not found on command line" 1>&2
        exit 0
fi
#       Check if argument 1 is -f or --file
if [ "${1}" == "--file" ] || [ "${1}" == "-f" ] ; then
        #       Check if argument 2 is blank
        if [ "${2}" == "" ] ; then
                display_help
		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  File name not found; --file <path>/<file_name> or -f <path>/<file_name> option" 1>&2
                exit 0
        fi
        OPTION2=${2}
else
        if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  VAR >${VAR}<" 1>&2 ; fi
        #       Check if blank
        if [ "${VAR}" == "" ] ; then
                display_help
		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  ${1} not found; use --file <path>/<file_name> or -f <path>/<file_name> option" 1>&2
                exit 0
        fi
fi

#
###	EXAMPLE TWO
#	Check arguement 1 xxx
if [ "$1" != "no" ] && [ "$1" != "normal" ] && [ "$1" != "all" ] && [ "$1" != "" ] ; then
	display_help
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  First arguement, ${1}, is NOT no, normal, all." 1>&2
	exit 0
fi

#
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[INFO]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Done." 1>&2
###
