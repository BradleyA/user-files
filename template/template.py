#!/usr/bin/env python
# 	template.py  2.07.41  2018-09-02_12:23:34_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 2.06  
# 	   typo 
# 	template.py  2.06.40  2018-09-02_11:09:24_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 2.05  
# 	   changed print statements to python 3 
# 	template.py  2.05.39  2018-09-01_23:42:46_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.04  
# 	   display-help, comments, setup example with correct date-stamp 
# 	template.py  2.04.38  2018-08-31_22:19:21_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.03  
# 	   test display_help 
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
   print ("\n{} - <one line description>".format( __file__))
   print ("\nUSAGE\n   {} [xxx | yyy | zzz]".format(__file__))
   print ("   {} [--help | -help | help | -h | h | -? | ?]".format(__file__))
   print ("   {} [--version | -version | -v]".format(__file__))
   print ("\nDESCRIPTION\n<<your help output goes here>>")
   print ("\nOPTIONS\n   <<your options go here>>")
   print ("\nDOCUMENTATION\n   <<URL to GITHUB README>>")
   print ("\nEXAMPLES\n   <<your code examples description goes here>>")
   print ("   {} <<code example goes here>>\n".format(__file__))
#       After displaying help in english check for other languages
   if LANGUAGE != "en_US.UTF-8" :
      print ("{}{} {} {}[WARNING]{} Your language, {} is not supported, Would you like to help?".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LANGUAGE))
   return
#	line number function
from inspect import currentframe
def get_line_no():
    cf = currentframe()
    return cf.f_back.f_lineno
#	default help and version arguments
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
         print ("{} {}".format(line2[1], line2[2]))
      sys.exit()
#       Check argument 1 for non-default ______
if no_arguments == 2 :
   LINE_ARG1 = sys.argv[1]
   print ("\n{}{} {} {}[INFO]{} Using MESSAGE file {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LINE_ARG1))
else :
#	set default MESSAGE file with path
   LINE_ARG1 = "/usr/local/data/us-tx-cluster-1/MESSAGE"
   print ("\n{}{} {} {}[INFO]{} Using MESSAGE file {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LINE_ARG1))
#       Check argument 2 for non-default SSHPORT number
if no_arguments == 3 :
   SSHPORT = sys.argv[2]
   print ("\n{}{} {} {}[INFO]{} Using PORT number {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,SSHPORT))
#		
#	echo -e "${NORMAL}${0} ${LINENO} [${BOLD}ERROR${NORMAL}]: ${USER} does NOT have write permission\n\tin local Git repository directory `pwd`"      1>&2
print ("\n{}{} {} {}[ERROR]{} USER don't do that!".format(color.END,__file__,get_line_no(),color.BOLD,color.END))
#	
print ("\ncommand with path = {}".format(__file__))
print ("module = {}".format(__name__))
print ("name = {}".format(__name__))
#	
from os import getcwd
print ("pwd = {}".format(getcwd()))
#	
print ("\nNumber of arguments: {} arguments.".format(len(sys.argv)))
print ("Argument List: {}".format(str(sys.argv)))
print ("command = {}".format(sys.argv[0]))
#	print date 2018-09-01-17-08-42-CDT
print ("\nprint date 2018-09-01-17-08-42-CDT")
print ("{}".format(time.strftime("%Y-%m-%d-%H-%M-%S-%Z")))
TIME_STAMP = time.strftime("%Y-%m-%d-%H-%M-%S-%Z")
print ("TIME_STAMP = {}".format(TIME_STAMP))
###
