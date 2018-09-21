#!/bin/bash
# 	template.sh  3.37.76  2018-09-21_11:43:32_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.36  
# 	   complete DEBUG & ERROR etc with get_date_stamp 
# 	template.sh  3.36.75  2018-09-21_11:06:51_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.35  
# 	   change design of DEBUG statement to include date 
# 	template.sh  2.05.39  2018-09-01_23:42:46_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.04  
# 	   display-help, comments, setup example with correct date-stamp 
###
DEBUG=1                 # 0 = debug off, 1 = debug on
#	set -x
#	set -v
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
###
display_help() {
echo -e "\n${NORMAL}${0} - brief description"
echo -e "\nUSAGE\n   ${0} [XX | YY | ZZ]"
echo    "   ${0} [--file <PATH>/<FILE_NAME> | -f <PATH>/<FILE_NAME>]"
echo    "   ${0} [--help | -help | help | -h | h | -? | ?]"
echo    "   ${0} [--version | -version | -v]"
echo -e "\nDESCRIPTION\nxxx xxx xxx ..."
echo    "xxx xxxxxxx xxx xxxxxxx"
echo -e "\nParagraph two xxx xxx xxxxxxx"
echo    "\nEnvironment Variables\n   <<your variables go here>>"
echo -e "\nOPTIONS\n   -f, --file\n      path and file on system '<path>/<file_name>'"
echo -e "\nOPTIONS\n   Option one - description"
echo    "   XX       xxx xxxxxxx xxx"
echo    "   YY       xxx xxxxx xxx "
echo    "   zz       xx xxxxxxx xx"
echo -e "\nDOCUMENTATION\n   https://github.com/BradleyA/REPOSITORY"
echo -e "\nEXAMPLES\n   <<your code examples description goes here>>\n\n${0} <<code example goes here>>\n"
#	After displaying help in english check for other languages
if ! [ "${LANG}" == "en_US.UTF-8" ] ; then
	get_date_stamp ; echo -e "${NORMAL}${0} ${LINENO} ${BOLD}[WARNING]${NORMAL}  ${DATE_STAMP}  Your language, ${LANG}, is not supported.\n\tWould you like to help?\n"	1>&2
#       elif [ "${LANG}" == "fr_CA.UTF-8" ] ; then
#               get_date_stamp ; echo -e "${NORMAL}${0} ${LINENO} ${BOLD}[WARNING]${NORMAL}  ${DATE_STAMP}  Display help in ${LANG}"        1>&2
#       else
#               get_date_stamp ; echo -e "${NORMAL}${0} ${LINENO} ${BOLD}[WARNING]${NORMAL}  ${DATE_STAMP}  Your language, ${LANG}, is not supported.\n\tWould you like to help?\n" 1>&2
fi
}

#	Date and time function
get_date_stamp() {
DATE_STAMP=`date +%Y-%m-%d-%H-%M-%S-%Z`
}

#	Default help and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] || [ "$1" == "?" ] ; then
	display_help
	exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
	head -2 ${0} | awk {'print$2"\t"$3'}
	exit 0
fi

###
OPTION1=${1:-default_value1}
OPTION2=${2:-default_value2}

#	DEBUG example
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "> ${BOLD}DEBUG${NORMAL} ${LINENO}  ${DATE_STAMP}  Name_of_command >${0}< Name_of_arg1 >${1}<" 1>&2 ; fi

#
###	EXAMPLE ONE
#	Example code is a template, it will not work until chnaged
#
#       Check if argument 1 is blank
if [ "${1}" == "" ] ; then
        display_help
        get_date_stamp ; echo -e "\n${NORMAL}${0} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${DATE_STAMP}  File not found on command line\n" 1>&2
        exit 0
fi
#       Check if argument 1 is -f or --file
if [ "${1}" == "--file" ] || [ "${1}" == "-f" ] ; then
        #       Check if argument 2 is blank
        if [ "${2}" == "" ] ; then
                display_help
                get_date_stamp ; echo -e "\n${NORMAL}${0} ${LINENO} ${BOLD}[ERROR]${NORMAL}  ${DATE_STAMP}  File name not found; --file <path>/<file_name> or -f <path>/<file_name> option\n" 1>&2
                exit 0
        fi
        OPTION2=${2}
else
        if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "> ${BOLD}DEBUG${NORMAL} ${LINENO}  ${DATE_STAMP}  VAR >${VAR}<" 1>&2 ; fi
        #       Check if blank
        if [ "${VAR}" == "" ] ; then
                display_help
                get_date_stamp ; echo -e "\n${NORMAL}${0} ${LINENO} ${BOLD}[ERROR]${NORMAL} ${LINENO}  ${DATE_STAMP}  ${1} not found; use --file <path>/<file_name> or -f <path>/<file_name> option\n" 1>&2
                exit 0
        fi
fi
#
###	EXAMPLE TWO
#	Check arguement 1 xxx
if [ "$1" != "no" ] && [ "$1" != "normal" ] && [ "$1" != "all" ] && [ "$1" != "" ] ; then
	display_help
	get_date_stamp ; echo -e "${NORMAL}${0} ${LINENO} ${BOLD}[ERROR]${NORMAL} ${LINENO}  ${DATE_STAMP}  First arguement, ${1}, is NOT no, normal, all.\n"	1>&2
	exit 0
fi
###
