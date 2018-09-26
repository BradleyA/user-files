#!/usr/bin/env python3
# 	template.py  3.48.86  2018-09-26_14:06:29_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.47  
# 	   update import for DEBUG example 
# 	template.py  3.47.85  2018-09-24_21:53:49_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.46  
# 	   Example Return a fully qualified domain name 
# 	template.py  3.46.84  2018-09-24_21:42:02_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.44  
# 	   order of precedence: CLI argument, environment variable, default code 
# 	template.py  3.43.82  2018-09-23_21:07:32_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.42  
# 	   change -h to -home 
# 	template.py  3.42.81  2018-09-23_20:48:03_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.41  
# 	   remove ? as an argument because the shell is using it as a wildcard 
# 	template.py  3.35.74  2018-09-20_22:47:07_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.34  
# 	   cleanup 
###
DEBUG = 1       # 0 = debug off, 1 = debug on
#
import subprocess
import sys
import time
import os
###
class color :
   BOLD = '\033[1m'
   END = '\033[0m'
###
LANGUAGE = os.getenv("LANG")
def display_help() :
   print ("\n{} - <one line description>".format( __file__))
   print ("\nUSAGE\n   {} [xxx | yyy | zzz]".format(__file__))
   print ("   {} [--help | -help | help | -h | h | -? | ?]".format(__file__))
   print ("   {} [--version | -version | -v]".format(__file__))
   print ("\nDESCRIPTION\n<<your help output goes here>>")
   print ("\nEnvironment Variables\n   <<your variables go here>>")
   print ("\nOPTIONS\n   <<your options go here>>")
   print ("\nDOCUMENTATION\n   <<URL to GITHUB README>>")
   print ("\nEXAMPLES\n   <<your code examples description goes here>>")
   print ("   {} <<code example goes here>>\n".format(__file__))
#  After displaying help in english check for other languages
   if LANGUAGE != "en_US.UTF-8" :
      print ("{}{} {} {}[WARNING]{}  {}  Your language, {} is not supported, Would you like to help?".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp(), LANGUAGE))
#  elif LANGUAGE != "fr_CA.UTF-8" :
#     print display_help in french
#  else :
   return

#  Line number function
from inspect import currentframe
def get_line_no() :
   cf = currentframe()
   return cf.f_back.f_lineno

#  Date and time function
def get_date_stamp() :
   return time.strftime("%Y-%m-%d-%H-%M-%S-%Z")

#  Default help and version arguments
no_arguments =  int(len(sys.argv))
if no_arguments == 2 :
#  Default help output  
   if sys.argv[1] == '--help' or sys.argv[1] == '-help' or sys.argv[1] == 'help' or sys.argv[1] == '-h' or sys.argv[1] == 'h' or sys.argv[1] == '-?' :
      display_help()
      sys.exit()
#  Default version output  
   if sys.argv[1] == '--version' or sys.argv[1] == '-version' or sys.argv[1] == 'version' or sys.argv[1] == '-v' :
      with open(__file__) as f :
         f.readline()
         line2 = f.readline()
         line2 = line2.split()
         print ("{} {}".format(line2[1], line2[2]))
      sys.exit()

#  DEBUG example
from platform import python_version
#
if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Name of command >{}<  Version of python >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), __file__, python_version()))

###	#  Examples -->
#  if argument; use argument -> do not use default or environment variables for MESSAGE
#  # NOTE: MESSAGE is absolute path and filename else use environment variables or default to build absolute path and filename
if no_arguments == 2 :
#  Set non-default MESSAGE file including path
   MESSAGE = sys.argv[1]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), MESSAGE))
else :
#  if no argument; -> use default if environment variables not defined
   #  Check DATA_DIR; set using os environment variable
   if "DATA_DIR" in os.environ :
      DATA_DIR = os.getenv("DATA_DIR")
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using environment variable DATA_DIR >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), DATA_DIR))
   else :
   #  Set DATA_DIR with default
      DATA_DIR = "/usr/local/data/"
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Environment variable DATA_DIR NOT set, using default >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), DATA_DIR))
   if "CLUSTER" in os.environ :
   #  Check CLUSTER; set using os environment variable
      CLUSTER = os.getenv("CLUSTER")
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using environment variable CLUSTER >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), CLUSTER))
   else :
   #  Set CLUSTER with default
      CLUSTER = "us-tx-cluster-1/"
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Environment variable CLUSTER NOT set, using default >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), CLUSTER))
   if "MESSAGE_FILE" in os.environ :
   #  Check MESSAGE_FILE; set using os environment variable
      MESSAGE_FILE = os.getenv("MESSAGE_FILE")
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using environment variable MESSAGE_FILE >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), MESSAGE_FILE))
   else :
   #  Set MESSAGE_FILE with default
      MESSAGE_FILE = "MESSAGE"
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Environment variable MESSAGE_FILE NOT set, using default >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), MESSAGE_FILE))
   #  Set MESSAGE with absolute path
   MESSAGE = DATA_DIR + CLUSTER + MESSAGE_FILE
if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), MESSAGE))
###

#  if argument; use argument -> do not use environment variables or default for CLUSTER
#  order of precedence: CLI argument, environment variable, default code
if no_arguments >= 2 :
   CLUSTER = sys.argv[1]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using 1 argument CLUSTER >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), CLUSTER))
elif "CLUSTER" in os.environ :
   #  Check CLUSTER; set using os environment variable
   CLUSTER = os.getenv("CLUSTER")
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using environment variable CLUSTER >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), CLUSTER))
else :
   #  Set CLUSTER with default
   CLUSTER = "us-tx-cluster-1/"
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Environment variable CLUSTER NOT set, using default >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), CLUSTER))

#  if argument; use argument -> do not use environment variables or default for DATA_DIR
#  order of precedence: CLI argument, environment variable, default code
if no_arguments == 3 :
   DATA_DIR = sys.argv[2]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using 2 argument DATA_DIR >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), DATA_DIR))
elif "DATA_DIR" in os.environ :
   #  Check DATA_DIR; set using os environment variable
   DATA_DIR = os.getenv("DATA_DIR")
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using environment variable DATA_DIR >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), DATA_DIR))
else :
   #  Set DATA_DIR with default
   DATA_DIR = "/usr/local/data/"
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Environment variable DATA_DIR NOT set, using default >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), DATA_DIR))

#  Check if two arguments after command if TRUE save second argument 
# >>>	needs testing
if no_arguments == 3 :
   if sys.argv[1] = "-f" :
#     Set FILE_NAME to second argument
      FILE_NAME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -f FILE_NAME >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), FILE_NAME))
   elif sys.argv[1] = "-home" :
#     Set USERHOME to second argument
      USERHOME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -home USERHOME >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), USERHOME))
   else :
#     Unknow option print ERROR
      print ("\n{}{} {} {}[ERROR]{}  {}  Unsupported option >{}<".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp(), sys.argv[1]))
      sys.exit()

#  Check for argument 2 and save
if no_arguments == 3 :
   OPTION1 = sys.argv[1]
   OPTION2 = sys.argv[2]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using OPTION1 >{}<  OPTION2 >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), OPTION1, OPTION2))

#  Examples
print ("\nNumber of arguments: {} arguments.".format(len(sys.argv)))
print ("Argument List: {}".format(str(sys.argv)))
print ("command = {}".format(sys.argv[0]))

#  Read TEMP_FILE contents and return contents
def get_msg(TEMP_FILE) :
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Reading MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), TEMP_FILE))
   file = open(TEMP_FILE,"r")
   CONTENT = file.read()
   file.close()
   CONTENT = CONTENT.rstrip('\n')
   return CONTENT
#
lines = get_msg(MESSAGE)
#

#  ERROR example		
print ("\n{}{} {} {}[ERROR]{}  {}  USER don't do that!".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

#  INFO example
print ("\n{}{} {} {}[INFO]{}  {}  Using OPTION >{}<".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp(), OPTION3))

#  Examples	
print ("\ncommand with path = {}".format(__file__))
print ("module = {}".format(__name__))
print ("name = {}".format(__name__))

#  Examples pwd - Print Working Directory
from os import getcwd
print ("pwd = {}".format(getcwd()))

#  Example Return a fully qualified domain name
import socket
LOCALHOST = socket.getfqdn()

#  Example import scrollphat and check if scrollphat installed 
try :
   import scrollphat
except ImportError :
   if sys.version_info[0] < 3 :
      sys.exit("\n{}{} {} {}[ERROR]{}  {}  Library scrollphat required. To install:\n\tsudo apt-get install python-scrollphat".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))
   elif sys.version_info[0] == 3 :
      sys.exit("\n{}{} {} {}[ERROR]{}  {}  Library scrollphat required. To install:\n\tsudo apt-get install python3-scrollphat".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))
except IOError :
      sys.exit("\n{}{} {} {}[ERROR]{}  {}  No such file or directory.  Is scrollphat installed on raspberry pi?".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

#  Example Done
print ("\n{}{} {} {}[INFO]{}  {}  Done.\n".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

# >>>	CUT line ---

###
