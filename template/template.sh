#!/bin/bash
# 	template.sh  2.05.39  2018-09-01_23:42:46_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.04  
# 	   display-help, comments, setup example with correct date-stamp 
# 	template.sh  2.01.33  2018-08-29_15:02:34_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 1.8-3-gf319f0f  
# 	   first pass at sh template 
###
DEBUG=0                 # 0 = debug off, 1 = debug on
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
echo -e "\nOPTIONS\n   -f, --file\n      path and file on system '<path>/<file_name>'"
echo -e "\nOPTIONS\n   Option one - description"
echo    "   XX       xxx xxxxxxx xxx"
echo    "   YY       xxx xxxxx xxx "
echo    "   zz       xx xxxxxxx xx"
echo -e "\nDOCUMENTATION\n   https://github.com/BradleyA/REPOSITORY"
echo -e "\nEXAMPLES\n   <<your code examples description goes here>>\n\n${0} <<code example goes here>>\n"
#
if ! [ "${LANG}" == "en_US.UTF-8" ] ; then
	echo -e "${NORMAL}${0} ${LINENO} [${BOLD}WARNING${NORMAL}]:	Your language, ${LANG}, is not supported.\n\tWould you like to help?\n"	1>&2
fi
}
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
TIME_STAMP=`date +%Y-%m-%d-%H-%M-%S-%Z`
###
if [ "${DEBUG}" == "1" ] ; then echo -e "> DEBUG ${LINENO} Name_of_command >${0}< Name_of_arg1 >${1}<" 1>&2 ; fi
#
###	EXAMPLE ONE
#	Example code is a template, it will not work until chnaged
#
#       Check if argument 1 is blank
if [ "${1}" == "" ] ; then
        display_help
        echo -e "${NORMAL}\n${0} ${LINENO} [${BOLD}ERROR${NORMAL}]:  File not found on command line\n" 1>&2
        exit 0
fi
#       Check if argument 1 is -f or --file
if [ "${1}" == "--file" ] || [ "${1}" == "-f" ] ; then
        #       Check if argument 2 is blank
        if [ "${2}" == "" ] ; then
                display_help
                echo -e "${NORMAL}\n${0} ${LINENO} [${BOLD}ERROR${NORMAL}]:  File name not found; --file <path>/<file_name> or -f <path>/<file_name> option\n" 1>&2
                exit 0
        fi
        OPTION2=${2}
else
        if [ "${DEBUG}" == "1" ] ; then echo -e "> DEBUG ${LINENO}  VAR  >${VAR}<" 1>&2 ; fi
        #       Check if blank
        if [ "${VAR}" == "" ] ; then
                display_help
                echo -e "${NORMAL}\n${0} ${LINENO} [${BOLD}ERROR${NORMAL}]:  ${1} not found; use --file <path>/<file_name> or -f <path>/<file_name> option\n" 1>&2
                exit 0
        fi
fi
#
###	EXAMPLE TWO
#	Check arguement 1 xxx
if [ "$1" != "no" ] && [ "$1" != "normal" ] && [ "$1" != "all" ] && [ "$1" != "" ] ; then
	display_help
	echo -e "${NORMAL}${0} ${LINENO} [${BOLD}ERROR${NORMAL}]:	First arguement, ${1}, is NOT no, normal, all.\n"	1>&2
	exit 0
fi
###
