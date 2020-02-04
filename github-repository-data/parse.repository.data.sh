#!/bin/bash
# 	github-repository-data/parse.repository.data.sh  3.571.881  2020-02-04T16:45:43.172349-06:00 (CST)  https://github.com/BradleyA/user-files.git  master  uadmin  one-rpi3b.cptx86.com 3.570  
# 	   github-repository-data/parse.repository.data.sh   begin adding production standards #32 
# 	github-repository/parse.repository.data.sh  2.98.370  2019-08-08T23:47:37.538761-05:00 (CDT)  https://github.com/BradleyA/Linux-admin  uadmin  two-rpi3b.cptx86.com 2.97  
# 	   github-repository/parse.repository.data.sh design complete, ready to create test cases 
###
#               push files to images/clone.table.md images/view.table.md to github owner/repository/images/(clones,views, NOT popular.referrers.list, popular.paths.list)
#               link *.table.md to README.md badges
#        .... NOTE to self need data first and dont want to waste time creating test data
#
#	column -t -s' ' filename
#	soffice --convert-to png ./clones
#	display ./clones.png
#
#       <img alt="Steam Views" src="https://img.shields.io/steam/views/100">
#
#       cd ~/github/BradleyA/automate/:repo
#       git pull
#       git commit -m '$DATE: automation the update of README table' README.md
#       git push README.md

#86# github-repository-data/parse.repository.data.sh
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 1.3.550 DEBUG variable                                             # 3.550
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
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.0 Default variable value
DEFAULT_DATA_GITHUB_DIR="/usr/local/data/github/"
DEFAULT_DATA_YEAR=$(date +%G)

###  Production standard 8.3.541 --usage
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')                                               # 3.541
display_usage() {
echo -e "\n${NORMAL}${COMMAND_NAME}\n   Parse relevant data out of cron job data files"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo    "   ${YELLOW}Positional Arguments${NORMAL}"
echo -e "   ${COMMAND_NAME}  <FILE_ORG_NAME>\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}

###  Production standard 0.3.571 --help                                                     # 3.571
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8, en.UTF-8, C.UTF-8                  # 3.550
echo -e "\n${BOLD}DESCRIPTION${NORMAL}"
echo -e "\n<your help goes here>"
echo    ">>> NEED TO COMPLETE THIS SOON, ONCE I KNOW HOW IT IS GOING TO WORK :-) <<<    |"

echo -e "\n<<Paragraph two>>"

###  Production standard 4.3.550 Documentation Language                                     # 3.550
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<votre aide va ici>" # your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ||  "${LANG}" == "en.UTF-8" || "${LANG}" == "C.UTF-8" ]] ; then  # 3.550
  new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi

echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."

###  Production standard 1.3.550 DEBUG variable                                             # 3.550
echo    "   DEBUG           (default off '0')  The DEBUG environment variable can be set"   # 3.550
echo    "                   to 0, 1, 2, 3, 4 or 5.  The setting '' or 0 will turn off"      # 3.550
echo    "                   all DEBUG messages during execution of this script.  The"       # 3.550
echo    "                   setting 1 will print all DEBUG messages during execution."      # 3.550
echo    "                   Setting 2 (set -x) will print a trace of simple commands"       # 3.550
echo    "                   before they are executed.  Setting 3 (set -v) will print"       # 3.550
echo    "                   shell input lines as they are read.  Setting 4 (set -e) will"   # 3.550
echo    "                   exit immediately if non-zero exit status is recieved with"      # 3.550
echo    "                   some exceptions.  Setting 5 (set -e -o pipefail) will do"       # 3.550
echo    "                   setting 4 and exit if any command in a pipeline errors.  For"   # 3.550
echo    "                   more information about the set options, see man bash."          # 3.550
#
DEFAULT_DATA_GITHUB_DIR="/usr/local/data/github/"
DEFAULT_DATA_YEAR=$(date +%G)
echo    "   CLONE_FILE_NAME Cron job data file (/usr/local/data/github/<GITHUB_OWNER>/<REPOSITORY>)"

echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default value.\n"     # 3.571
echo    "   --help, -help, help, -h, h, -?"                                            # 3.571
echo -e "\tOn-line brief reference manual\n"                                           # 3.571
echo    "   --usage, -usage, -u"                                                       # 3.571
echo -e "\tOn-line command usage\n"                                                    # 3.571
echo    "   --version, -version, -v]"                                                  # 3.571
echo -e "\tOn-line command version\n"                                                  # 3.571
#

###  Production standard 6.3.547  Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION
echo    "/usr/local/data/                           <-- <DATA_DIR>"
echo    "└── github                                 <-- GitHub repository traffic"
echo    "    ├── clone.heading                      <-- Clone table headings"
echo    "    ├── github.repository.list             <-- GitHub repository names"
echo    "    ├── owner.repository                   <-- Default cron job for repositpry"
echo    "    │                                          download of clone and views data"
echo    "    ├── parse.repository.data.sh           <-- Parse relevant data out of cron"
echo    "    │                                          job data files"
echo    "    ├── setup.github.repository.sh         <-- Setup github repository data"
echo    "    │                                          tools"
echo    "    ├── view.heading                       <-- View table headings"
echo -e "    └── <GITHUB_OWNER>                     <-- GitHub repository traffic data\n"


#       Order of precedence: CLI argument, environment variable
if [ $# -ge  1 ]  ; then FILE_ORG_NAME=${1} ; elif [ "${FILE_ORG_NAME}" == "" ] ; then
        echo -e "\n\t<OWNER>.<REPO> is required to make this work.  Either as the first argument on the command line or defined as FILE_ORG_NAME environment variable << BUT I HAVE NOT coded that yet >>>.  Try again."
        exit 1
fi

#	Parse relevant data out of ${FILE_ORG_NAME}
grep -e clones -e timestamp -e count -e uniques -e views -e /popular/paths -e path -e title -e /popular/referrers -e '\]' -e '\['  ${FILE_ORG_NAME} | sed -e 's/"//g' -e 's/,//g' -e 's/T.*Z//' -e 's/[ \t]*//g' > ${FILE_ORG_NAME}.no-headers

#	Parse clones data from ${FILE_ORG_NAME}.no-headers
cat  ${FILE_ORG_NAME}.no-headers | sed -e '1,/views>>>/!d' -e '1,/clones:\[/d' -e '/^\]/,$d'  > ${FILE_ORG_NAME}.tmp
#	Loop through ${FILE_ORG_NAME}.tmp and create clone.data.$timestamp files
while read line; do
	FIRST_WORD=$(echo ${line} | cut -d: -f 1)
	if [ "${FIRST_WORD}" == "timestamp" ] ;  then
		SECOND_WORD=$(echo ${line} | cut -d: -f 2)
		CLONE_FILE_NAME="clone.data.${SECOND_WORD}"
                tmp=$(echo ${line} | cut -d: -f 2 | cut -d\- -f 2-3)
                echo "| ${tmp}" > ${CLONE_FILE_NAME}
                echo "|:---:" >> ${CLONE_FILE_NAME}
	else
                AMOUNT=$(echo ${line} | cut -d: -f 2)
                echo "| ${AMOUNT}" >> ${CLONE_FILE_NAME}
	fi
done < ${FILE_ORG_NAME}.tmp
rm  ${FILE_ORG_NAME}.tmp
CLONE_TOTAL=0
#	Do clone.data.* files exists and size greater than zero
# >>>	need to test this create an empty file in a repository that has many data file ????
if ls clone.data.* 1>/dev/null 2>&1 ; then
#	Total third line of clone.data.* files
	CLONE_TOTAL=$(awk 'FNR == 3 {total+=$2} END {print total}'  clone.data.*)
	echo ${CLONE_TOTAL}  > clone.total
	paste -d ' ' ../../clone.heading clone.data.* | column -t -s' ' > clone.table.md
	sed -i '1 i\#### Git clones' clone.table.md
fi
echo -e "\nTotal clones: ${CLONE_TOTAL}\n###### Updated: $(date +%Y-%m-%d)"  >> clone.table.md

#	Parse vistors (views) data from ${FILE_ORG_NAME}.no-headers
cat  ${FILE_ORG_NAME}.no-headers | sed -e '1,/\/popular\/paths>>>/!d' -e '1,/views:\[/d' -e '/^\]/,$d'  > ${FILE_ORG_NAME}.tmp 
#	Loop through ${FILE_ORG_NAME}.tmp and create clone.data.$timestamp files
while read line; do
	FIRST_WORD=$(echo ${line} | cut -d: -f 1)
	if [ "${FIRST_WORD}" == "timestamp" ] ;  then
		SECOND_WORD=$(echo ${line} | cut -d: -f 2)
		VIEW_FILE_NAME="view.data.${SECOND_WORD}"
                tmp=$(echo ${line} | cut -d: -f 2 | cut -d\- -f 2-3)
                echo "| ${tmp}" > ${VIEW_FILE_NAME}
                echo "|:---:" >> ${VIEW_FILE_NAME}
	else
                AMOUNT=$(echo ${line} | cut -d: -f 2)
                echo "| ${AMOUNT}" >> ${VIEW_FILE_NAME}
	fi
done < ${FILE_ORG_NAME}.tmp
rm  ${FILE_ORG_NAME}.tmp
VIEW_TOTAL=0
#	Do view.data.* files exists and size greater than zero
# >>>   need to test this create an empty file in a repository that has many data file ????
if ls view.data.* 1>/dev/null 2>&1 ; then
#       Total third line of view.data.* files
	VIEW_TOTAL=$(awk 'FNR == 3 {total+=$2} END {print total}'  view.data.*)
	echo ${VIEW_TOTAL}  > view.total
	paste -d ' ' ../../view.heading view.data.* | column -t -s' ' > view.table.md
	sed -i '1 i\#### Visitors' view.table.md
fi
echo -e "\nTotal views: ${VIEW_TOTAL}\n###### Updated: $(date +%Y-%m-%d)"  >> view.table.md

rm  ${FILE_ORG_NAME}.no-headers

###
