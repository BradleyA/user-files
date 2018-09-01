#!/usr/bin/env python
# 	template.py  2.03.37  2018-08-31_22:00:17_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.02  
# 	   move --version to a different line from --help 
# 	template.py  2.02.36  2018-08-29_15:10:02_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.01-2-gaa4ae32  
# 	   first pass at py template 
###
import subprocess
import sys
import time
import os
###
class color:
   BOLD = '\033[1m'
   END = '\033[0m'
###
def display_help():
   LANGUAGE = os.getenv("LANG")
   print "\n", __file__, "- <one line description>"
   print "\nUSAGE\n  ", __file__, "[xxx | yyy | zzz]"
   print "  ", __file__, "[--help | -help | help | -h | h | -? | ?]"
   print "  ", __file__, "[--version | -version | -v]"
   print "\nDESCRIPTION\n<<your help output goes here>>"
   print "\nOPTIONS\n   <<your options go here>>"
   print "\nDOCUMENTATION\n   <<URL to GITHUB README>>"
   print "\nEXAMPLES\n   <<your code examples go here>>"
   print "      <<line two of first example>>"
#       After displaying help in english check for other languages
   if LANGUAGE != "en_US.UTF-8" :
      print color.END,__file__,get_line_no(),color.BOLD,"[WARNING]",color.END,"Your language,", LANGUAGE, "is not supported, Would you like to help?"
   return
#
from inspect import currentframe
def get_line_no():
    cf = currentframe()
    return cf.f_back.f_lineno
#
no_arguments =  int(len(sys.argv))
if no_arguments == 2 :
   if sys.argv[1] == '--help' or sys.argv[1] == '-help' or sys.argv[1] == 'help' or sys.argv[1] == '-h' or sys.argv[1] == 'h' or sys.argv[1] == '-?' or sys.argv[1] == '?' :
      display_help()
      sys.exit()
   if sys.argv[1] == '--version' or sys.argv[1] == '-version' or sys.argv[1] == 'version' or sys.argv[1] == '-v' :
      with open(__file__) as f:
         f.readline()
         line2 = f.readline()
         line2 = line2.split()
         print line2[1], line2[2]
      sys.exit()
###
SSHPORT=22
#       Check argument 1 for non-default ______
if no_arguments == 2 :
   LINE_ARG1 = sys.argv[1]
else :
#	set default MESSAGE file with path
   LINE_ARG1 = "/usr/local/data/us-tx-cluster-1/MESSAGE"
   print "\n",color.END,__file__,get_line_no(),color.BOLD,"[INFO]",color.END,"Using MESSAGE file",LINE_ARG1
#       Check argument 2 for non-default SSHPORT number
if no_arguments == 3 :
   SSHPORT = sys.argv[2]
   print "\n",color.END,__file__,get_line_no(),color.BOLD,"[INFO]",color.END,"Using PORT number",SSHPORT
#
#	
#	echo -e "${NORMAL}${0} ${LINENO} [${BOLD}ERROR${NORMAL}]: ${USER} does NOT have write permission\n\tin local Git repository directory `pwd`"      1>&2
print "\n",color.END,__file__,get_line_no(),color.BOLD,"[ERROR]",color.END,"USER don't do that!\n"
###
#	
print "command with path =", __file__
print "module =", __name__
#	
from os import getcwd
print "pwd =", getcwd()
#	
print "\nNumber of arguments:", len(sys.argv), "arguments."
print "Argument List:", str(sys.argv)
