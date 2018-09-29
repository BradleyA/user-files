#!/usr/bin/env python3
# 	template.py  3.54.94  2018-09-29_17:03:52_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.53  
# 	   update LANGUAGE WARNING #6 
# 	template.py  3.53.93  2018-09-29_14:41:18_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.52-2-gc62fddb  
# 	   begin working #4 #5 
# 	template.py  3.52.90  2018-09-29_12:42:42_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.50  
# 	   need to understand which get_msg is better example 1 or example 2 #42 
# 	template.py  3.50.89  2018-09-26_14:35:06_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.49  
# 	   remove \n from DEBUG and ERROR INFO WARNING 
# 	template.py  3.49.88  2018-09-26_14:15:10_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 3.29  
# 	   entered correct version number 3.49 not 3.29 
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
   END  = '\033[0m'
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
   if os.getenv("LANGUAGE") != "en_US.UTF-8" :
      print ("{}{} {} {} {} {}[WARNING]{}  {}  {}  {} {}  Your language, {} is not supported, Would you like to help translate?".format(color.END, get_date_stamp(), __file__, SCRIPT_VERSION, get_line_no(), color.BOLD, color.END, LOCALHOST, os.getlogin(), os.getuid(), os.getgid(), os.getenv("LANGUAGE"))) 
#     print ("{}{} {} {} {} {}[INFO   ]{}  {}  {}  {} {}  Begin"                                                                .format(color.END, get_date_stamp(), __file__, SCRIPT_VERSION, get_line_no(), color.BOLD, color.END, LOCALHOST, os.getlogin(), os.getuid(), os.getgid()))
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

#  Fully qualified domain name
from socket import getfqdn
#  FQDN hostname
LOCALHOST = getfqdn()

#  Version  
with open(__file__) as f :
   f.readline()
   line2 = f.readline()
   line2 = line2.split()
   SCRIPT_NAME = line2[1]
   SCRIPT_VERSION = line2[2]

#  Default help and version arguments
no_arguments =  int(len(sys.argv))
if no_arguments == 2 :
#  Default help output  
   if sys.argv[1] == '--help' or sys.argv[1] == '-help' or sys.argv[1] == 'help' or sys.argv[1] == '-h' or sys.argv[1] == 'h' or sys.argv[1] == '-?' :
      display_help()
      sys.exit()
#  Default version output  
   if sys.argv[1] == '--version' or sys.argv[1] == '-version' or sys.argv[1] == 'version' or sys.argv[1] == '-v' :
      print ("{} {}".format(SCRIPT_NAME, SCRIPT_VERSION))
      sys.exit()

#  Begin script INFO
print ("{}{} {} {} {} {}[INFO]{}  {}  {}  {} {}  Begin".format(color.END, get_date_stamp(), __file__, SCRIPT_VERSION, get_line_no(), color.BOLD, color.END, LOCALHOST, os.getlogin(), os.getuid(), os.getgid()))

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
   if sys.argv[1] == "-f" :
#     Set FILE_NAME to second argument
      FILE_NAME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -f FILE_NAME >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), FILE_NAME))
   elif sys.argv[1] == "-home" :
#     Set USERHOME to second argument
      USERHOME = sys.argv[2]
      if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Found -home USERHOME >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), USERHOME))
   else :
#     Unknow option print ERROR
      print ("{}{} {} {}[ERROR]{}  {}  Unsupported option >{}<".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp(), sys.argv[1]))
      sys.exit()

#  Check for argument 2 and save
if no_arguments == 3 :
   OPTION1 = sys.argv[1]
   OPTION2 = sys.argv[2]
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Using OPTION1 >{}<  OPTION2 >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), OPTION1, OPTION2))

#  Examples
print ("Number of arguments: {} arguments.".format(len(sys.argv)))
print ("Argument List: {}".format(str(sys.argv)))
print ("command = {}".format(sys.argv[0]))

#  >>>	DOES NOT WORK IN display-message-hd.py BUT IS USED IN display-message.py  Example 1 Read TEMP_FILE contents and return contents 
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

#  Example 2: Read TEMP_FILE contents and return contents
def get_msg(TEMP_FILE) :
   if DEBUG == 1 : print ("> {}DEBUG{} {}  {}  Reading MESSAGE file >{}<".format(color.BOLD, color.END, get_line_no(), get_date_stamp(), TEMP_FILE))
   file = open(TEMP_FILE,"r")
   CONTENT = file.read().splitlines()
   file.close()
   return CONTENT

#  ERROR example		
print ("{}{} {} {}[ERROR]{}  {}  USER don't do that!".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

#  INFO example
print ("{}{} {} {}[INFO]{}  {}  Information for user ".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

#  Examples	
print ("command with path = {}".format(__file__))
print ("module = {}".format(__name__))
print ("name = {}".format(__name__))

#  Examples pwd - Print Working Directory
from os import getcwd
print ("pwd = {}".format(getcwd()))

#  Example import scrollphat and check if scrollphat installed 
try :
   import scrollphat
except ImportError :
   if sys.version_info[0] < 3 :
      sys.exit("{}{} {} {}[ERROR]{}  {}  Library scrollphat required. To install:\n\tsudo apt-get install python-scrollphat".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))
   elif sys.version_info[0] == 3 :
      sys.exit("{}{} {} {}[ERROR]{}  {}  Library scrollphat required. To install:\n\tsudo apt-get install python3-scrollphat".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))
except IOError :
      sys.exit("{}{} {} {}[ERROR]{}  {}  No such file or directory.  Is scrollphat installed on raspberry pi?".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))

#  Example Done
print ("{}{} {} {}[INFO]{}  {}  Done.".format(color.END, __file__, get_line_no(), color.BOLD, color.END, get_date_stamp()))
#
#	print ("{}{} {} version {} {}[INFO]{}  {}  {}  Done.".format(color.END, get_date_stamp(), __file__, get_line_no(), color.BOLD, color.END, LOCALHOST, os.getuid())) #4 #5

# >>>	CUT line ---

###
