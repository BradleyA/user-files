#!/bin/bash
# 	hooks/bin/TEST/find-testcase.sh/SAST-setup.sh  3.342.581  2019-08-19T14:34:23.248874-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.341  
# 	   hooks/bin/TEST/find-testcase.sh/SAST-setup.sh copied to . 
###
#	SAST-setup.sh -  This script is optional.  It runs before test cases are run, if SAST-setup.sh is found in TEST/<file_name>/
#	   Static Analysis Software Testing (SAST) - examination of the code prior to the program’s execution
#	   SAST is code analysis, syntax, permission, code inspection, code review, data flow analysis, and
#	   walkthrough (manually reviewing algorithms as well as documents to find any errors).
#### production standard 3.0 shellcheck
#### production standard 5.1.160 Copyright
##       Copyright (c) 2019 Bradley Allen
##       MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###
#       Remove output from previous run of test cases
rm -f SAST-*.test-case-output
#
### production standard 10.0 TESTing 
REPOSITORY_DIR=$(git rev-parse --show-toplevel)
#       Add shared TEST cases with command
#          uncomment the test case to be tested
#       SAST
#       ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-644-001 SAST-permission-644-001
#       ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-755-001 SAST-permission-755-001
ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-permission-775-001 SAST-permission-775-001
ln -fs ${REPOSITORY_DIR}/hooks/EXAMPLES/SAST-shellcheck-001 SAST-shellcheck-001
###		