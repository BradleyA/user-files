#!/bin/bash
# 	find-code.sh  1.5.26  2018-08-22_09:57:26_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 1.4-1-g0130c6e  
# 	   design script to check remote & local systems for clones from remote repositories 
###
###
DEBUG=0                 # 0 = debug off, 1 = debug on
#	set -x
#	set -v
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
###
display_help() {
echo -e "\n${NORMAL}${0} - "
echo -e "\nUSAGE\n   ${0} "
echo    "   ${0} [--help | -help | help | -h | h | -? | ?]"
echo    "   ${0} [--version | -version | -v]"
echo -e "\nDESCRIPTION\n"
echo    "xxx"
echo -e "\nOPTIONS\n"
echo    "   yyy       xxxx"
echo -e "\nDOCUMENTATION\n"
echo -e "\nEXAMPLES\n   ${0}\n\n   what does it do\n"
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
if [ "${DEBUG}" == "1" ] ; then echo -e "> DEBUG ${LINENO}  >${0}<  >${1}<" 1>&2 ; fi
#	
#
echo -e "${NORMAL}\n${0} ${LINENO} [${BOLD}INFO${NORMAL}]:	Done.\n"	1>&2
###
