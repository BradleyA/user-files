#!/usr/bin/env python3
# 	template/template.py  3.108.150  2018-12-20T10:00:52.998012-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.107  
# 	   running pylint3 
# 	template/template.py  3.107.149  2018-12-19T15:27:35.565113-06:00 (CST)  https://github.com/BradleyA/user-work-files.git  uadmin  one-rpi3b.cptx86.com 3.106
# 	   correct typo
#
###	template.py - examples of default code standards for my scripts
#   production standard 2
import sys
import datetime
import time
import os
#       Order of precedence: environment variable (export DEBUG=1), default code
DEBUG = int(os.getenv("DEBUG", 0)) #  Set DEBUG,  0 = debug off, 1 = debug on, 'unset DEBUG' to unset environment variable (bash)
###
class color:
    BOLD = '\033[1m'
    END = '\033[0m'
###
LANGUAGE = os.getenv("LANG")
def display_help():
    print("\n{} - <one line description>".format(__file__))
    print("\nUSAGE\n   {} [xxx | yyy | zzz]".format(__file__))
    print("   {} [--help | -help | help | -h | h | -?]".format(__file__))
    print("   {} [--version | -version | -v]".format(__file__))
    print("\nDESCRIPTION\n<<your help output goes here>>")
    print("\n\n\n\n<<your help output goes here>>")
    print("\nEnvironment Variables\n   <<your variables go here>>")
    print("\nOPTIONS\n   <<your options go here>>")
    print("\nDOCUMENTATION\n   <<URL to GITHUB README>>")
    print("\nEXAMPLES\n   <<your code examples description goes here>>")
    print("   {} <<code example goes here>>\n".format(__file__))
#   After displaying help in english check for other languages
    if LANGUAGE != "en_US.UTF-8":
        print("{}{} {} {}[{}] {} {} {} {}:{} {}[INFO]{}  {} is not supported, Would you like to help translate?".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, LANGUAGE))
#   elif LANGUAGE == "fr_CA.UTF-8":
#       print display_help in french
#   else:
    return

#   Line number function
from inspect import currentframe
def get_line_no():
    cf = currentframe()
    return cf.f_back.f_lineno

#   Date and time function ISO 8601
def get_date_stamp():
    # calculate the offset taking into account daylight saving time
    utc_offset_sec = time.altzone if time.localtime().tm_isdst else time.timezone
    utc_offset = datetime.timedelta(seconds=-utc_offset_sec)
    ISO8601 = datetime.datetime.now().replace(tzinfo=datetime.timezone(offset=utc_offset)).isoformat()  + time.strftime(" (%Z)")
#   ISO8601 = time.strftime("%Y-%m-%dT%H:%M:%S%z") + time.strftime(" (%Z)") # previous solution
    return ISO8601

#   Fully qualified domain name
from socket import getfqdn
#   FQDN hostname
LOCALHOST = getfqdn()

#   Version
with open(__file__) as f:
    f.readline()
    line2 = f.readline()
    line2 = line2.split()
    SCRIPT_NAME = line2[1]
    SCRIPT_VERSION = line2[2]
    f.close()

#   Set user variables
if "LOGNAME" in os.environ: LOGNAME = os.getenv("LOGNAME") # Added three lines because USER is not defined in crobtab jobs
if "USER" in os.environ: USER = os.getenv("USER")
else: USER = LOGNAME
#
UID = os.getuid()
GID = os.getgid()
if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Setting USER to support crobtab...".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))

#   Default help and version arguments
no_arguments = int(len(sys.argv))
if no_arguments == 2:
#   Default help output
    if sys.argv[1] == '--help' or sys.argv[1] == '-help' or sys.argv[1] == 'help' or sys.argv[1] == '-h' or sys.argv[1] == 'h' or sys.argv[1] == '-?':
        display_help()
        sys.exit()
#   Default version output
    if sys.argv[1] == '--version' or sys.argv[1] == '-version' or sys.argv[1] == 'version' or sys.argv[1] == '-v':
        print("{} {}".format(SCRIPT_NAME, SCRIPT_VERSION))
        sys.exit()

#   Begin script INFO
print("{}{} {} {}[{}] {} {} {} {}:{} {}[INFO]{}  Started...".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))

#   DEBUG example
from platform import python_version
#
if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Version of python >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, python_version()))

###	#  Examples -->
#   if argument; use argument -> do not use default or environment variables for MESSAGE
#   # NOTE: MESSAGE is absolute path and filename else use environment variables or default to build absolute path and filename
if no_arguments == 2:
#   Set non-default MESSAGE file including path
    MESSAGE = sys.argv[1]
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using MESSAGE file >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, MESSAGE))
else:
#   if no argument; -> use default if environment variables not defined
    #  Check DATA_DIR; set using os environment variable
    if "DATA_DIR" in os.environ:
        DATA_DIR = os.getenv("DATA_DIR")
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using environment variable DATA_DIR >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, DATA_DIR))
    else:
    #  Set DATA_DIR with default
        DATA_DIR = "/usr/local/data/"
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Environment variable DATA_DIR NOT set, using default >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, DATA_DIR))
    if "CLUSTER" in os.environ:
    #  Check CLUSTER; set using os environment variable
        CLUSTER = os.getenv("CLUSTER")
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using environment variable CLUSTER >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, CLUSTER))
    else:
    #  Set CLUSTER with default
        CLUSTER = "us-tx-cluster-1/"
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Environment variable CLUSTER NOT set, using default >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, CLUSTER))
    if "MESSAGE_FILE" in os.environ:
    #  Check MESSAGE_FILE; set using os environment variable
        MESSAGE_FILE = os.getenv("MESSAGE_FILE")
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using environment variable MESSAGE_FILE >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, MESSAGE_FILE))
    else:
    #  Set MESSAGE_FILE with default
        MESSAGE_FILE = "MESSAGE"
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Environment variable MESSAGE_FILE NOT set, using default >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, MESSAGE_FILE))
    #  Set MESSAGE with absolute path
    MESSAGE = DATA_DIR + "/" + CLUSTER + "/" + MESSAGE_FILE
if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using MESSAGE file >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, MESSAGE))
###

#  if argument; use argument -> do not use environment variables or default for CLUSTER
#  order of precedence: CLI argument, environment variable, default code
if no_arguments >= 2:
    CLUSTER = sys.argv[1]
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using 1 argument CLUSTER >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, CLUSTER))
elif "CLUSTER" in os.environ:
    #  Check CLUSTER; set using os environment variable
    CLUSTER = os.getenv("CLUSTER")
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using environment variable CLUSTER >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, CLUSTER))
else:
    #  Set CLUSTER with default
    CLUSTER = "us-tx-cluster-1/"
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Environment variable CLUSTER NOT set, using default >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, CLUSTER))

#  if argument; use argument -> do not use environment variables or default for DATA_DIR
#  order of precedence: CLI argument, environment variable, default code
if no_arguments == 3:
    DATA_DIR = sys.argv[2]
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using 2 argument DATA_DIR >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, DATA_DIR))
elif "DATA_DIR" in os.environ:
    #  Check DATA_DIR; set using os environment variable
    DATA_DIR = os.getenv("DATA_DIR")
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using environment variable DATA_DIR >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, DATA_DIR))
else:
    #  Set DATA_DIR with default
    DATA_DIR = "/usr/local/data/"
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Environment variable DATA_DIR NOT set, using default >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, DATA_DIR))

#   Check if two arguments after command if TRUE save second argument
# >>>	needs testing
if no_arguments == 3:
    if sys.argv[1] == "-f":
#       Set FILE_NAME to second argument
        FILE_NAME = sys.argv[2]
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Found -f FILE_NAME >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, FILE_NAME))
    elif sys.argv[1] == "-home":
#       Set USERHOME to second argument
        USERHOME = sys.argv[2]
        if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Found -home USERHOME >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, USERHOME))
    else:
#       Unknow option print ERROR
        print("{}{} {} {}[{}] {} {} {} {}:{} {}[ERROR]{}  Unsupported option >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, sys.argv[1]))
        sys.exit()

#   Check for argument 2 and save
if no_arguments == 3:
    OPTION1 = sys.argv[1]
    OPTION2 = sys.argv[2]
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Using OPTION1 >{}<  OPTION2 >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, OPTION1, OPTION2))

#   Examples
print("Number of arguments: {} arguments.".format(len(sys.argv)))
print("Argument List: {}".format(str(sys.argv)))
print("command = {}".format(sys.argv[0]))

#   >>>	DOES NOT WORK IN display-message-hd.py BUT IS USED IN display-message.py
#	Example 1 Read TEMP_FILE contents and return contents
def get_msg(TEMP_FILE):
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Reading MESSAGE file >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, TEMP_FILE))
    file = open(TEMP_FILE, "r")
    CONTENT = file.read()
    file.close()
    CONTENT = CONTENT.rstrip('\n')
    return CONTENT
#
lines = get_msg(MESSAGE)
#

#   >>>	DOES NOT WORK IN display-message.py BUT IS USED IN display-message-hd.py
#   Example 2: Read TEMP_FILE contents and return contents
def get_msg(TEMP_FILE):
    if DEBUG == 1: print("{}{} {} {}[{}] {} {} {} {}:{} {}[DEBUG]{}  Reading MESSAGE file >{}<".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END, TEMP_FILE))
    file = open(TEMP_FILE, "r")
    CONTENT = file.read().splitlines()
    file.close()
    return CONTENT

#   ERROR example
print("{}{} {} {}[{}] {} {} {} {}:{} {}[ERROR]{}  USER don't do that!".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))

#   Example
print("command with path = {}".format(__file__))
print("module = {}".format(__name__))
print("name = {}".format(__name__))

#   Examples pwd - Print Working Directory
from os import getcwd
print("pwd = {}".format(getcwd()))

#   Example import scrollphat and check if scrollphat installed
try:
    import scrollphat
except ImportError:
    if sys.version_info[0] < 3:
        sys.exit("{}{} {} {}[{}] {} {} {} {}:{} {}[ERROR]{}  Library scrollphat required. To install:\tsudo apt-get install python-scrollphat".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))
    elif sys.version_info[0] == 3:
        sys.exit("{}{} {} {}[{}] {} {} {} {}:{} {}[ERROR]{}  Library scrollphat required. To install:\tsudo apt-get install python3-scrollphat".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))
except IOError:
    sys.exit("{}{} {} {}[{}] {} {} {} {}:{} {}[ERROR]{}  No such file or directory.  Is scrollphat installed on raspberry pi?".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))

#   Done
print("{}{} {} {}[{}] {} {} {} {}:{} {}[INFO]{}  Operation finished.".format(color.END, get_date_stamp(), LOCALHOST, __file__, os.getpid(), SCRIPT_VERSION, get_line_no(), USER, UID, GID, color.BOLD, color.END))
###
