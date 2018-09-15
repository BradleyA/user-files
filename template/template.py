#!/usr/bin/env python
# 	template.py  2.16.54  2018-09-15_12:34:34_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.15  
# 	   add get_time_stamp function 
###
DEBUG = 0       # 0 = debug off, 1 = debug on
#
import subprocess
import sys
import time
import os
###
class color:
   BOLD = '\033[1m'
   END = '\033[0m'
###
LANGUAGE = os.getenv("LANG")
def display_help():
   print ("\n{} - <one line description>".format( __file__))
   print ("\nUSAGE\n   {} [xxx | yyy | zzz]".format(__file__))
   print ("   {} [--help | -help | help | -h | h | -? | ?]".format(__file__))
   print ("   {} [--version | -version | -v]".format(__file__))
   print ("\nDESCRIPTION\n<<your help output goes here>>")
   print ("\nOPTIONS\n   <<your options go here>>")
   print ("\nDOCUMENTATION\n   <<URL to GITHUB README>>")
   print ("\nEXAMPLES\n   <<your code examples description goes here>>")
   print ("   {} <<code example goes here>>\n".format(__file__))
#  After displaying help in english check for other languages
   if LANGUAGE != "en_US.UTF-8" :
      print ("{}{} {} {}[WARNING]{} Your language, {} is not supported, Would you like to help?".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LANGUAGE))
   return
#  Line number function
from inspect import currentframe
def get_line_no():
   cf = currentframe()
   return cf.f_back.f_lineno
#  date and time function
def get_time_stamp():
   return time.strftime("%Y-%m-%d-%H-%M-%S-%Z")
#  Default help and version arguments
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
#  DEBUG example
if DEBUG == 1 : print (">{} DEBUG{} {} {}  Name_of_command >{}<".format(color.BOLD,color.END,get_line_no(),time.strftime("%Y-%m-%d-%H-%M-%S-%Z"),__file__))
###
#  Examples -->
#
#  Check argument 1 for non-default ______
if no_arguments == 2 :
   LINE_ARG1 = sys.argv[1]
   print ("\n{}{} {} {}[INFO]{} Using MESSAGE file {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LINE_ARG1))
else :
#  Set default MESSAGE file with path example
   LINE_ARG1 = "/usr/local/data/us-tx-cluster-1/MESSAGE"
   print ("\n{}{} {} {}[INFO]{} Using MESSAGE file {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,LINE_ARG1))
#  Check argument 2 for non-default SSHPORT number example
if no_arguments == 3 :
   SSHPORT = sys.argv[2]
   print ("\n{}{} {} {}[INFO]{} Using PORT number {}".format(color.END,__file__,get_line_no(),color.BOLD,color.END,SSHPORT))
#  ERROR example		
print ("\n{}{} {} {}[ERROR]{} USER don't do that!".format(color.END,__file__,get_line_no(),color.BOLD,color.END))
#  Examples	
print ("\ncommand with path = {}".format(__file__))
print ("module = {}".format(__name__))
print ("name = {}".format(__name__))
#  Examples
from os import getcwd
print ("pwd = {}".format(getcwd()))
#  Examples
print ("\nNumber of arguments: {} arguments.".format(len(sys.argv)))
print ("Argument List: {}".format(str(sys.argv)))
print ("command = {}".format(sys.argv[0]))
#  Example date time
print ("\nprint date 2018-09-01-17-08-42-CDT")
print (time.strftime("%Y-%m-%d-%H-%M-%S-%Z"))
TIME_STAMP = time.strftime("%Y-%m-%d-%H-%M-%S-%Z")
print ("TIME_STAMP = {}".format(TIME_STAMP))
###
