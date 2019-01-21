#!/bin/bash
# 	template/template.sh  3.118.165  2019-01-21T10:27:20.908345-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.117  
# 	   production standard 5 include Copyright notice 
# 	template/template.sh  3.117.164  2019-01-19T23:34:09.613511-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.116  
# 	   update comment for production standard 4 Internationalizing display-help 
# 	template/template.sh  3.116.163  2019-01-17T23:14:15.099047-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.115  
# 	   added comments to french section 
# 	template/template.sh  3.115.162  2019-01-12T15:13:01.057817-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.114  
# 	   minor change template.[sh,py] production standard 4 change display_help of other LANG #16 
# 	template/template.sh  3.114.161  2019-01-12T14:45:10.474145-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.113-2-ga23e101  
# 	   template.[sh,py] production standard 4 change display_help of other LANG  close #16 
# 	template/template.sh  3.113.158  2019-01-12T13:47:47.476818-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.112  
# 	   template.[sh,py] production standard 4 change display_help of other LANG #16 
# 	template/template.sh  3.112.157  2019-01-05T08:04:52.016701-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.111-3-g85fafa8  
# 	   add #   production standard 3 comment 
# 	template/template.sh  3.110.152  2018-12-20T10:44:46.764269-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.109  
# 	   template.{sh,py} add more to display_help close #14 
#
### template.sh - brief description
#       Copyright (c) 2019 Bradley Allen
#       License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###
#   production standard 5
#       Order of precedence: environment variable, default code
if [ "${DEBUG}" == "" ] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
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
echo -e "\nDESCRIPTION"
#       Displaying help DESCRIPTION in English en_US.UTF-8
echo    "<your help goes here>" 
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<"
echo -e "\n<<Paragraph two>>"
#       Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [ "${LANG}" == "fr_CA.UTF-8" ] || [ "${LANG}" == "fr_FR.UTF-8" ] || [ "${LANG}" == "fr_CH.UTF-8" ] ; then
	echo -e "\n--> ${LANG}"
	echo    "<votre aide va ici>" # your help goes here
	echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [ "${LANG}" == "en_US.UTF-8" ] ; then
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi
echo -e "\nEnvironment Variables"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the DEBUG environment variable to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the DEBUG"
echo    "environment variable.  You are on your own defining environment variables if"
echo    "you are using other shells."
echo    "   DEBUG       (default '0')"
echo -e "\n   <<your environment variables information goes here>>"
echo -e "\nOPTIONS\n   -f, --file\n      path and file on system '<path>/<file_name>'"
echo -e "\nOPTIONS\n   Option one - description"
echo    "   XX       xxx xxxxxxx xxx"
echo    "   YY       xxx xxxxx xxx "
echo    "   zz       xx xxxxxxx xx"
echo -e "\nDOCUMENTATION\n   https://github.com/BradleyA/   <<URL to online repository README>>"
echo -e "\nEXAMPLES\n   <<your code examples description goes here>>\n\n${0} <<code example goes here>>\n"
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

#	INFO
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Started..." 1>&2

#	DEBUG
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Name_of_command >${0}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

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
if [ $# -ge  3 ]  ; then DATA_DIR=${3} ; elif [ "${DATA_DIR}" == "" ] ; then DATA_DIR="/usr/local/data/" ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Variable... CLUSTER >${CLUSTER}< ADMUSER >${ADMUSER}< DATA_DIR >${DATA_DIR}<" 1>&2 ; fi

###	EXAMPLE ONE
#

#	Example code is a template, it will not work until chnaged
#
#       Check if argument 1 is blank
if [ "${1}" == "" ] ; then
        display_help | more
	get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  File not found on command line" 1>&2
        exit 0
fi
#       Check if argument 1 is -f or --file
if [ "${1}" == "--file" ] || [ "${1}" == "-f" ] ; then
        #       Check if argument 2 is blank
        if [ "${2}" == "" ] ; then
                display_help | more
		get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[ERROR]${NORMAL}  File name not found; --file <path>/<file_name> or -f <path>/<file_name> option" 1>&2
                exit 0
        fi
        OPTION2=${2}
else
        #       Locate file in the PATH
        TEMP=$(whereis "${1}")
        MARKIT_FILE=$(echo "${TEMP}" | awk {'print $2'} )
        if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Locate file in the PATH... MARKIT_FILE >${MARKIT_FILE}<" 1>&2 ; fi
        #       Check if MARKIT_FILE is blank
        if [ "${MARKIT_FILE}" == "" ] ; then
                display_help | more
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
