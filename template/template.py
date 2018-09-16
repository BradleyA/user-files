#!/usr/bin/env python
# 	template.py  2.21.59  2018-09-15_21:26:41_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 2.20  
# 	   typos 
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
      print ("{}{} {} {}[WARNING]{}  {}  Your language, {} is not supported, Would you like to help?".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_time_stamp(), LANGUAGE))
#  elif LANGUAGE != "fr_CA.UTF-8" :
#     print display_help in french
#  else :
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
#  Default help output  
   if sys.argv[1] == '--help' or sys.argv[1] == '-help' or sys.argv[1] == 'help' or sys.argv[1] == '-h' or sys.argv[1] == 'h' or sys.argv[1] == '-?' or sys.argv[1] == '?' :
      display_help()
      sys.exit()
#  Default version output  
   if sys.argv[1] == '--version' or sys.argv[1] == '-version' or sys.argv[1] == 'version' or sys.argv[1] == '-v' :
      with open(__file__) as f:
         f.readline()
         line2 = f.readline()
         line2 = line2.split()
         print ("{} {}".format(line2[1], line2[2]))
      sys.exit()

#  DEBUG example
if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Name_of_command >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), __file__))

###	#  Examples -->

#  Check if there is an argument after command if TRUE use the argument to replace MESSAGE filename else use default MESSAGE
# >>>	needs testing
if no_arguments == 2 :
#  Set non-default MESSAGE file with path
   LINE_ARG1 = sys.argv[1]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), LINE_ARG1))
else :
#  Set default MESSAGE file with path
   LINE_ARG1 = "/usr/local/data/us-tx-cluster-1/MESSAGE"
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), LINE_ARG1))

#  Check if two arguments after command if TRUE save second argument 
# >>>	needs testing
if no_arguments == 3 :
   if sys.argv[1] = "-f" :
#     Set FILE_NAME to second argument
      FILE_NAME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -f FILE_NAME >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), FILE_NAME))
   elif sys.argv[1] = "-h" :
#     Set USERHOME to second argument
      USERHOME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -h USERHOME >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), USERHOME))
   else :
#     Unknow option print ERROR
      print ("\n{}{} {} {}[ERROR]{}  {}  Unsupported option >{}<".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_time_stamp(), sys.argv[1]))
      sys.exit()

#  Check for argument 2 and save
if no_arguments == 3 :
   OPTION1 = sys.argv[1]
   OPTION2 = sys.argv[2]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using OPTION1 >{}<  OPTION2 >{}<".format(color.BOLD, color.END, get_line_no(), get_time_stamp(), OPTION1, OPTION2))

#  Examples
print ("\nNumber of arguments: {} arguments.".format(len(sys.argv)))
print ("Argument List: {}".format(str(sys.argv)))
print ("command = {}".format(sys.argv[0]))

#  Read MESSAGEHD_file contents and return contents
def get_msg():
   with open(MESSAGEHD_file,"r") as file:
      temp = file.read().splitlines()
      if DEBUG == 1 : print ("> {}DEBUG{} {}  File contents >{}<".format(color.BOLD,color.END,get_line_no(),temp))
   return temp
#
lines = get_msg()
#

#  ERROR example		
print ("\n{}{} {} {}[ERROR]{}  {}  USER don't do that!".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_time_stamp()))

#  INFO example
print ("\n{}{} {} {}[INFO]{}  {}  Using OPTION >{}<".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_time_stamp(), OPTION3))

#  Examples	
print ("\ncommand with path = {}".format(__file__))
print ("module = {}".format(__name__))
print ("name = {}".format(__name__))

#  Examples pwd - Print Working Directory
from os import getcwd
print ("pwd = {}".format(getcwd()))

#  Example Done
print ("\n{}{} {} {}[INFO]{}  {}  Done.\n".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_time_stamp()))
###
